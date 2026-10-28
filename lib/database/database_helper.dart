import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String nomBase = 'stock_facile.db';
  static const int versionBase = 1;

  DatabaseHelper._interne();

  static final DatabaseHelper _instance = DatabaseHelper._interne();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get database async {
    _db ??= await _ouvrirBase();
    return _db!;
  }

  Future<Database> _ouvrirBase() async {
    final dossier = await getDatabasesPath();
    final chemin = join(dossier, nomBase);

    debugPrint('Base SQLite : $chemin');

    return openDatabase(
      chemin,
      version: versionBase,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: _creerTables,
    );
  }

  Future<void> _creerTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nom TEXT NOT NULL UNIQUE,
        description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE produits (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nom TEXT NOT NULL,
        prix REAL NOT NULL CHECK (prix >= 0),
        quantite INTEGER NOT NULL DEFAULT 0
          CHECK (quantite >= 0),
        disponible INTEGER NOT NULL DEFAULT 1,
        date_ajout TEXT NOT NULL,
        categorie_id INTEGER NOT NULL,
        FOREIGN KEY (categorie_id)
          REFERENCES categories(id)
          ON DELETE RESTRICT
      )
    ''');

    const categories = [
      {'nom': 'Alimentation', 'description': 'Produits secs et conserves'},
      {'nom': 'Boissons', 'description': 'Eaux, jus et sodas'},
      {'nom': 'Hygiène', 'description': "Savons et produits d'entretien"},
      {'nom': 'Papeterie', 'description': 'Cahiers et fournitures'},
    ];

    for (final categorie in categories) {
      await db.insert('categories', categorie);
    }
    final resultat = await db.rawQuery(
      'SELECT COUNT(*) AS total FROM categories',
    );

    debugPrint('Nombre de catégories : ${resultat.first['total']}');
  }
}

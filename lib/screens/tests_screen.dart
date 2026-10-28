
import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  Future<void> _ouvrirBase(BuildContext context) async {
    try {
      final db = await DatabaseHelper().database;

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Base ouverte avec succès : ${db.isOpen}',
          ),
          backgroundColor: Colors.green,
        ),
      );

      debugPrint('Base de données ouverte : ${db.isOpen}');
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur : $e'),
          backgroundColor: Colors.red,
        ),
      );

      debugPrint('Erreur lors de l’ouverture : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banc d’essai SQLite'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton.icon(
            onPressed: () => _ouvrirBase(context),
            icon: const Icon(Icons.storage),
            label: const Text('Ouvrir la base'),
          ),
        ],
      ),
    );
  }
}

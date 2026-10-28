#Q1.3 
#1.Comment SQLite stocke-t-il disponible et date_ajout ?

disponible : SQLite ne possède pas de type BOOLEAN natif. On utilise un entier (INTEGER) pour représenter une valeur booléenne : 1 (True) ou 0 (False).

date_ajout : SQLite ne possède pas de type DATETIME. On peut stocker la date et l'heure sous forme de texte.

#2. Quel est le rôle de AUTOINCREMENT, de UNIQUE et de CHECK (prix >= 0) ?

AUTOINCREMENT : permet de générer automatiquement un identifiant entier non réutilisable pour chaque nouvel enregistrement.

UNIQUE sur nom : interdit les doublons dans la colonne nom.

CHECK (prix >= 0) : le prix est supérieur ou égal à zéro.

#3. Que signifie ON DELETE RESTRICT ?

ON DELETE RESTRICT empêche la suppression d'un enregistrement parent lorsqu'il est encore référencé par des enregistrements enfants.


#Q3.2
#1.Que se passe-t-il si on écrit deux fois DatabaseHelper() ? Combien d'objets sont créés ?

Le constructeur factory DatabaseHelper() retourne toujours la même instance _instance. Ainsi, même si on écrit deux fois DatabaseHelper(), un seul objet DatabaseHelper est créé et partagé dans toute l'application.

Le mot-clé factory permet de contrôler ce que retourne un constructeur.


#2.Que fait l'opérateur ??= ?
L'opérateur ??= affecte une valeur à une variable uniquement si celle-ci est égale à null.

#3.Pourquoi placer PRAGMA foreign_keys = ON dans onConfigure et non dans onCreate ?
Le placement PRAGMA foreign_keys = ON dans onConfigure garantit que les contraintes de clés étrangères sont activées pour chaque nouvelle connexion.
onConfigure est appelé lors de l'ouverture de la connexion à la base de données, avant les callbacks onCreate et onUpgrade.

#4.Combien de fois onCreate est-il appelé dans toute la vie de l'application ?
onCreate est appelé une seule fois pour une base de données donnée, lors de sa création initiale, si le fichier de base n'existe pas encore.
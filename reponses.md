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
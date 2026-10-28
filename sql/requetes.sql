
-- Q1.5.1 : tous les produits
SELECT * FROM produits;

-- Q1.5.2 : produits en rupture de stock
SELECT * FROM produits
WHERE quantite = 0;

-- Q1.5.3 : du plus cher au moins cher
SELECT * FROM produits
ORDER BY prix DESC;

-- Q1.5.4 : produits et catégories
SELECT p.nom, c.nom AS categorie
FROM produits p
INNER JOIN categories c
ON p.categorie_id = c.id;

-- Q1.5.5 : nombre de produits par catégorie
SELECT c.nom, COUNT(p.id) AS nombre_produits
FROM categories c
LEFT JOIN produits p
ON c.id = p.categorie_id
GROUP BY c.id, c.nom;

-- Q1.5.6 : valeur totale du stock
SELECT SUM(prix * quantite) AS valeur_stock
FROM produits;

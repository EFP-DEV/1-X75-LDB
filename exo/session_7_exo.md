
# SELECT: Exercices

## Objectifs
- Créer la base de données dans phpMyAdmin: [structure.sql](https://github.com/EFP-DEV/1-X75-Atelier/blob/main/assets/atelier_cms.sql)
- Import du script SQL préparé précédemment: [data.sql](https://github.com/EFP-DEV/1-X75-Atelier/blob/main/assets/atelier_cms_data.sql)
- Écrire les requêtes SQL de base pour les fonctionnalités CRUD  


## Plan détaillé

### Requêtes SQL pour les fonctionnalités CRUD 
- `SELECT` pour l'affichage des items avec leurs tags 

### Travail pratique
- Écrire et tester les requêtes SQL pour chaque fonctionnalité 
- Documenter les requêtes pour réutilisation dans le code PHP
- Rediger les `SELECT` pour les fonctionnalités CRUD et les fonctionnalités spécifiques

---

# Exercices de Requêtes SQL

## 1. Jeu de données
Utiliser IA pour generer un jeu de donnees de test pertinent

----

## 2. Requêtes pour les fonctionnalités spécifiques

### Exercice A: Recherche par mots-clés dans les titres et descriptions
Écrivez une requête pour rechercher tous les items contenant le mot-clé "sample" dans leur titre ou description.

<details>
  <summary>Solution</summary>
  
```sql
SELECT id, title, description 
FROM item 
WHERE title LIKE '%sample%' OR description LIKE '%sample%';
```
</details>

### Exercice B: Filtrage par tag
Écrivez une requête pour afficher tous les items associés au tag "Tag1".

<details>
  <summary>Solution</summary>
  
```sql
SELECT i.id, i.title, i.description 
FROM item i
JOIN item_tag it ON i.id = it.item_id
JOIN tag t ON it.tag_id = t.id
WHERE t.name = 'Tag1';
```
</details>

### Exercice C: Association et dissociation de tags aux items
Écrivez les requêtes pour:
1. Associer le tag "Tag3" à l'item avec l'id 1
2. Dissocier le tag "Tag2" de l'item avec l'id 1

<details>
  <summary>Solution</summary>
  
```sql
-- Associer un tag
INSERT INTO item_tag (item_id, tag_id)
SELECT 1, id FROM tag WHERE name = 'Tag3';

-- Dissocier un tag
DELETE FROM item_tag 
WHERE item_id = 1 AND tag_id = (SELECT id FROM tag WHERE name = 'Tag2');
```
</details>

--- 
## 3. Bases

### Exercice 1: Sélection Simple
Écrivez une requête pour sélectionner tous les opérateurs (administrateurs) actifs.

<details>
  <summary>Solution</summary>
  
```sql
SELECT * FROM operator WHERE is_active = TRUE;
```
</details>

### Exercice 2: Projection de Colonnes
Affichez uniquement les noms d'utilisateur et emails des opérateurs.

<details>
  <summary>Solution</summary>
  
```sql
SELECT username, email FROM operator;
```
</details>

### Exercice 3: Tri
Récupérez tous les tags triés par ordre alphabétique de leur nom.

<details>
  <summary>Solution</summary>
  
```sql
SELECT * FROM tag ORDER BY name ASC;
```
</details>

### Exercice 4: Filtrage avec WHERE
Récupérez tous les items dont le prix est supérieur à 15€.

<details>
  <summary>Solution</summary>
  
```sql
SELECT * FROM item WHERE price > 15;
```
</details>

### Exercice 5: Limitation de Résultats
Affichez les 5 messages les plus récents.

<details>
  <summary>Solution</summary>
  
```sql
SELECT * FROM message ORDER BY created_at DESC LIMIT 5;
```
</details>

--- 
## Niveau Intermédiaire

### Exercice 6: Jointures Simples
Récupérez tous les items avec le nom de leur opérateur (créateur).

<details>
  <summary>Solution</summary>
  
```sql
SELECT i.title, i.description, o.username AS creator
FROM item i
INNER JOIN operator o ON i.operator_id = o.id;
```
</details>

### Exercice 7: Agrégation
Comptez le nombre d'items publiés par statut.

<details>
  <summary>Solution</summary>
  
```sql
SELECT status, COUNT(*) AS item_count
FROM item
GROUP BY status;
```
</details>

### Exercice 8: Jointures Multiples
Récupérez tous les items qui possèdent le tag 'Tag1', avec le nom de leur créateur.

<details>
  <summary>Solution</summary>
  
```sql
SELECT i.title, o.username
FROM item i
INNER JOIN operator o ON i.operator_id = o.id
INNER JOIN item_tag it ON i.id = it.item_id
INNER JOIN tag t ON it.tag_id = t.id
WHERE t.name = 'Tag1';
```
</details>

### Exercice 9: LEFT JOIN
Affichez tous les visiteurs et leurs collections éventuelles.

<details>
  <summary>Solution</summary>
  
```sql
SELECT v.visitor_token, c.name AS collection_name
FROM visitor v
LEFT JOIN collection c ON v.id = c.visitor_id;
```
</details>

### Exercice 10: Sous-requêtes
Trouvez les items qui n'ont aucun tag associé.

<details>
  <summary>Solution</summary>
  
```sql
SELECT *
FROM item i
WHERE i.id NOT IN (
    SELECT item_id
    FROM item_tag
);
```
</details>


--- 

## Niveau Avancé

### Exercice 11: Jointure et Agrégation
Trouvez le nombre d'items dans chaque collection, incluant les collections vides.

<details>
  <summary>Solution</summary>
  
```sql
SELECT c.name AS collection_name, COUNT(ci.item_id) AS item_count
FROM collection c
LEFT JOIN collection_item ci ON c.id = ci.collection_id
GROUP BY c.id, c.name;
```
</details>

### Exercice 12: Recherche de Texte
Récupérez tous les items dont le titre ou la description contient le mot 'sample'.

<details>
  <summary>Solution</summary>
  
```sql
SELECT *
FROM item
WHERE title LIKE '%sample%' OR description LIKE '%sample%';
```
</details>

### Exercice 13: UNION
Affichez une liste combinée des noms des tags et des collections.

<details>
  <summary>Solution</summary>
  
```sql
SELECT name, 'tag' AS type FROM tag
UNION
SELECT name, 'collection' AS type FROM collection
ORDER BY name;
```
</details>

### Exercice 14: Requêtes avec HAVING
Trouvez les tags qui sont associés à plus d'un item.

<details>
  <summary>Solution</summary>
  
```sql
SELECT t.name, COUNT(it.item_id) AS item_count
FROM tag t
JOIN item_tag it ON t.id = it.tag_id
GROUP BY t.id, t.name
HAVING COUNT(it.item_id) > 1;
```
</details>

### Exercice 15: Statistiques et Agrégation
Calculez le prix moyen, minimum et maximum des items pour chaque statut.

<details>
  <summary>Solution</summary>
  
```sql
SELECT 
    status, 
    AVG(price) AS average_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM item
WHERE price IS NOT NULL
GROUP BY status;
```
</details>

---

## Niveau Expert

### Exercice 16: Recherches Complexes
Trouvez les visiteurs qui ont au moins une collection et au moins une recherche enregistrée.

<details>
  <summary>Solution</summary>
  
```sql
SELECT DISTINCT v.visitor_token
FROM visitor v
JOIN collection c ON v.id = c.visitor_id
WHERE v.id IN (
    SELECT visitor_id 
    FROM search 
    WHERE visitor_id IS NOT NULL
);
```
</details>

### Exercice 17: Analyse Temporelle
Affichez le nombre d'items créés par mois en 2023.

<details>
  <summary>Solution</summary>
  
```sql
SELECT 
    YEAR(created_at) AS year,
    MONTH(created_at) AS month,
    COUNT(*) AS items_created
FROM item
WHERE YEAR(created_at) = 2023
GROUP BY YEAR(created_at), MONTH(created_at)
ORDER BY year, month;
```
</details>


### Exercice 18: Les Jointures Complexes
Trouvez tous les items qui sont dans au moins deux collections différentes, avec le nombre de collections où ils apparaissent.

<details>
  <summary>Solution</summary>
  
```sql
SELECT 
    i.title, 
    COUNT(DISTINCT ci.collection_id) AS collection_count
FROM item i
JOIN collection_item ci ON i.id = ci.item_id
GROUP BY i.id, i.title
HAVING COUNT(DISTINCT ci.collection_id) >= 2
ORDER BY collection_count DESC;
```
</details>

## Exemples expert, cas pratique

### Exemple 1: Recherche de Produits
Écrivez une requête pour implémenter une fonction de recherche qui renvoie les items correspondant à un terme de recherche, trié par pertinence (présence dans le titre puis dans la description).

<details>
  <summary>Solution</summary>
  
```sql
SELECT 
    id, 
    title, 
    description,
    price,
    CASE 
        WHEN title LIKE '%search_term%' THEN 2
        WHEN description LIKE '%search_term%' THEN 1
        ELSE 0
    END AS relevance
FROM item
WHERE 
    status = 'published' AND
    (title LIKE '%search_term%' OR description LIKE '%search_term%')
ORDER BY relevance DESC, created_at DESC;
```
</details>

### Exemple 2: Analyse de Popularité
Identifiez les 5 tags les plus populaires en fonction du nombre d'items associés.

<details>
  <summary>Solution</summary>
  
```sql
SELECT 
    t.name AS tag_name,
    COUNT(it.item_id) AS item_count
FROM tag t
LEFT JOIN item_tag it ON t.id = it.tag_id
GROUP BY t.id, t.name
ORDER BY item_count DESC
LIMIT 5;
```
</details>

### Exemple 3: Détection d'Anomalies
Trouvez les items dont le prix est significativement supérieur à la moyenne (plus de 2 écarts-types).

<details>
  <summary>Solution</summary>
  
```sql
WITH price_stats AS (
    SELECT 
        AVG(price) AS avg_price,
        STDDEV(price) AS stddev_price
    FROM item
    WHERE price IS NOT NULL
)
SELECT 
    i.id,
    i.title,
    i.price
FROM item i, price_stats ps
WHERE 
    i.price IS NOT NULL AND
    i.price > ps.avg_price + (2 * ps.stddev_price)
ORDER BY i.price DESC;
```
</details>

### Exemple 4: Analyse des Messages Non Lus
Créez une requête pour afficher les messages non lus, groupés par jour, avec le pourcentage qu'ils représentent du total des messages de ce jour.

<details>
  <summary>Solution</summary>
  
```sql
WITH daily_messages AS (
    SELECT 
        DATE(created_at) AS message_date,
        COUNT(*) AS total_messages,
        SUM(CASE WHEN is_read = FALSE THEN 1 ELSE 0 END) AS unread_messages
    FROM message
    GROUP BY DATE(created_at)
)
SELECT 
    message_date,
    total_messages,
    unread_messages,
    (unread_messages / total_messages * 100) AS unread_percentage
FROM daily_messages
ORDER BY message_date DESC;
```
</details>



---
> Ce cours est distribué sous **licence Creative Commons**. Toute reproduction ou distribution à but commercial est interdite sans l’accord préalable de l’auteur.
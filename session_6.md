# Cours sur les Requêtes SQL SELECT

## Table des Matières
- [1. Fondamentaux (Niveau Débutant)](#1-fondamentaux-niveau-débutant)
  - [Syntaxe de Base](#syntaxe-de-base)
  - [Filtrage avec WHERE](#filtrage-avec-where)
  - [Tri avec ORDER BY](#tri-avec-order-by)
  - [Limitation des Résultats](#limitation-des-résultats)
- [2. Fonctions et Groupement (Niveau Intermédiaire)](#2-fonctions-et-groupement-niveau-intermédiaire)
  - [Regroupement avec GROUP BY](#regroupement-avec-group-by)
  - [Filtrage après Regroupement avec HAVING](#filtrage-après-regroupement-avec-having)
- [3. Jointures (Niveau Intermédiaire)](#3-jointures-niveau-intermédiaire)
  - [Structure du Modèle de Données](#structure-du-modèle-de-données)
  - [INNER JOIN](#inner-join)
  - [LEFT JOIN](#left-join)
  - [RIGHT JOIN](#right-join)
  - [FULL OUTER JOIN](#full-outer-join)
  - [SELF JOIN](#self-join)
- [4. Concepts Avancés](#4-concepts-avancés)
  - [Sous-requêtes](#sous-requêtes)
  - [Relations entre Cardinalités et Jointures](#relations-entre-cardinalités-et-jointures)
  - [Optimisation des Performances](#optimisation-des-performances)
- [5. Bonnes Pratiques](#6-bonnes-pratiques)

## 1. Fondamentaux (Niveau Débutant)

### Syntaxe de Base

La requête SELECT est utilisée pour extraire des données d'une base de données. Sa structure minimale est:

```sql
SELECT colonne1, colonne2 -- Colonnes à récupérer
FROM table;               -- Table source des données
```

Pour sélectionner toutes les colonnes, utilisez l'astérisque:

```sql
SELECT * -- Sélectionne toutes les colonnes
FROM utilisateurs;
```

**Pourquoi l'utiliser:** Permet d'extraire et de visualiser les données stockées dans vos tables.

### Filtrage avec WHERE

La clause WHERE permet de filtrer les résultats en fonction de conditions:

```sql
SELECT nom, prenom        -- Colonnes à afficher
FROM utilisateurs         -- Table source
WHERE age > 18;           -- Condition de filtrage
```

**Opérateurs de comparaison:**
- `=` (égal à)
- `<>` ou `!=` (différent de)
- `<` (inférieur à)
- `>` (supérieur à)
- `<=` (inférieur ou égal à)
- `>=` (supérieur ou égal à)

**Opérateurs logiques:**
- `AND` (et)
- `OR` (ou)
- `NOT` (négation)

Exemple avec plusieurs conditions:

```sql
SELECT nom, prenom
FROM utilisateurs
WHERE age >= 18 AND pays = 'France';
```

**Question métier résolue:** "Quels sont les utilisateurs majeurs résidant en France?"

### Tri avec ORDER BY

La clause ORDER BY trie les résultats selon une ou plusieurs colonnes:

```sql
SELECT nom, prenom
FROM utilisateurs
ORDER BY nom ASC,  -- Tri croissant sur le nom
         prenom DESC; -- Tri décroissant sur le prénom
```

- `ASC` = ordre croissant (par défaut)
- `DESC` = ordre décroissant

**Question métier résolue:** "Comment obtenir la liste des utilisateurs triée alphabétiquement par nom puis par prénom inversé?"

### Limitation des Résultats

La clause LIMIT restreint le nombre de résultats retournés:

```sql
SELECT *
FROM produits
ORDER BY prix           -- Tri par prix
LIMIT 10;               -- Seulement les 10 premiers résultats
```

Avec décalage (pagination):

```sql
SELECT *
FROM produits
ORDER BY prix
LIMIT 10 OFFSET 20;    -- 10 produits à partir du 21ème
```

**Question métier résolue:** "Comment afficher la deuxième page de résultats avec 10 produits par page?"

## 2. Fonctions et Groupement (Niveau Intermédiaire)

### Regroupement avec GROUP BY

La clause GROUP BY regroupe les lignes qui ont les mêmes valeurs:

```sql
SELECT departement,                 -- Colonne de regroupement
       COUNT(*) AS nombre_employes  -- Fonction d'agrégation
FROM employes
GROUP BY departement;               -- Regroupement
```

Fonctions d'agrégation courantes:
- `COUNT()` - nombre de lignes
- `SUM()` - somme des valeurs
- `AVG()` - moyenne des valeurs
- `MAX()` - valeur maximale
- `MIN()` - valeur minimale

**Question métier résolue:** "Combien d'employés travaillent dans chaque département?"

### Filtrage après Regroupement avec HAVING

La clause HAVING filtre les résultats après regroupement:

```sql
SELECT departement,
       AVG(salaire) AS salaire_moyen  -- Calcul de la moyenne
FROM employes
GROUP BY departement                  -- Regroupement par département
HAVING AVG(salaire) > 3000;           -- Filtre sur le résultat agrégé
```

**Différence avec WHERE:**
- `WHERE` filtre les lignes individuelles AVANT regroupement
- `HAVING` filtre les groupes APRÈS regroupement

**Question métier résolue:** "Quels départements ont un salaire moyen supérieur à 3000€?"

## 3. Jointures (Niveau Intermédiaire)

### Structure du Modèle de Données

Pour les exemples suivants, nous utiliserons un modèle simplifié de gestion de boutique:

```
┌─────────────┐       ┌──────────────┐
│   CLIENTS   │       │  COMMANDES   │
├─────────────┤       ├──────────────┤
│ id (PK)     │       │ id (PK)      │
│ nom         │◄──────┤ client_id(FK)│
│ email       │       │ date         │
└─────────────┘       │ montant      │
                      └──────────────┘
```

Définition des tables:

```sql
-- Structure des tables
CREATE TABLE clients (
    id INT PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE commandes (
    id INT PRIMARY KEY,
    client_id INT,
    date_commande DATE,
    montant DECIMAL(10,2),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- Données exemple
INSERT INTO clients VALUES 
    (1, 'Dupont', 'dupont@email.com'),
    (2, 'Martin', 'martin@email.com'),
    (3, 'Durand', 'durand@email.com');

INSERT INTO commandes VALUES 
    (101, 1, '2023-01-15', 150.50),
    (102, 1, '2023-02-20', 75.25),
    (103, 2, '2023-01-25', 220.00),
    (104, NULL, '2023-03-10', 45.99);  -- Commande sans client (orpheline)
```

### INNER JOIN

L'INNER JOIN retourne uniquement les lignes qui ont une correspondance dans les deux tables:

```sql
SELECT c.nom,                  -- Colonne de la table clients
       co.id AS commande_id,   -- Colonne de la table commandes
       co.date_commande,       -- Colonne de la table commandes
       co.montant              -- Colonne de la table commandes
FROM clients c                 -- Table principale avec alias 'c'
INNER JOIN commandes co        -- Table jointe avec alias 'co'
    ON c.id = co.client_id;    -- Condition de jointure
```

Résultat:
```
nom     | commande_id | date_commande | montant
--------|-------------|---------------|--------
Dupont  | 101         | 2023-01-15    | 150.50
Dupont  | 102         | 2023-02-20    | 75.25
Martin  | 103         | 2023-01-25    | 220.00
```

**Remarque:** Le client 'Durand' n'apparaît pas car il n'a aucune commande associée.

**Question métier résolue:** "Quels clients ont passé des commandes et quels sont les détails de ces commandes?"

### LEFT JOIN

Le LEFT JOIN retourne toutes les lignes de la table de gauche (première table) et les correspondances de la table de droite:

```sql
SELECT c.nom,
       co.id AS commande_id,
       co.date_commande,
       co.montant
FROM clients c                 -- Table de gauche (conservée entièrement)
LEFT JOIN commandes co         -- Table de droite (correspondances uniquement)
    ON c.id = co.client_id;
```

Résultat:
```
nom     | commande_id | date_commande | montant
--------|-------------|---------------|--------
Dupont  | 101         | 2023-01-15    | 150.50
Dupont  | 102         | 2023-02-20    | 75.25
Martin  | 103         | 2023-01-25    | 220.00
Durand  | NULL        | NULL          | NULL
```

**Remarque:** Le client 'Durand' apparaît cette fois avec des valeurs NULL pour les informations de commande.

**Question métier résolue:** "Quels sont tous nos clients, qu'ils aient passé des commandes ou non?"

### RIGHT JOIN

Le RIGHT JOIN est l'inverse du LEFT JOIN: il retourne toutes les lignes de la table de droite et les correspondances de la table de gauche:

```sql
SELECT c.nom,
       co.id AS commande_id,
       co.date_commande,
       co.montant
FROM clients c                 -- Table de gauche (correspondances uniquement)
RIGHT JOIN commandes co        -- Table de droite (conservée entièrement)
    ON c.id = co.client_id;
```

Résultat:
```
nom     | commande_id | date_commande | montant
--------|-------------|---------------|--------
Dupont  | 101         | 2023-01-15    | 150.50
Dupont  | 102         | 2023-02-20    | 75.25
Martin  | 103         | 2023-01-25    | 220.00
NULL    | 104         | 2023-03-10    | 45.99
```

**Remarque:** La commande 104 apparaît avec NULL pour le client car elle n'est associée à aucun client.

**Question métier résolue:** "Quelles sont toutes nos commandes, y compris celles sans client associé?"

### FULL OUTER JOIN

Le FULL OUTER JOIN combine LEFT et RIGHT JOIN, retournant toutes les lignes des deux tables:

```sql
SELECT c.nom,
       co.id AS commande_id,
       co.date_commande,
       co.montant
FROM clients c
FULL OUTER JOIN commandes co
    ON c.id = co.client_id;
```

Résultat:
```
nom     | commande_id | date_commande | montant
--------|-------------|---------------|--------
Dupont  | 101         | 2023-01-15    | 150.50
Dupont  | 102         | 2023-02-20    | 75.25
Martin  | 103         | 2023-01-25    | 220.00
Durand  | NULL        | NULL          | NULL
NULL    | 104         | 2023-03-10    | 45.99
```

**Remarque:** Affiche à la fois le client sans commande (Durand) et la commande sans client (104).

**Question métier résolue:** "Quelles sont toutes nos données de clients et commandes, même lorsqu'il n'y a pas de correspondance?"

### SELF JOIN

Le SELF JOIN permet de joindre une table avec elle-même:

```sql
-- Structure de la table
CREATE TABLE employes_hierarchie (
    id INT PRIMARY KEY,
    nom VARCHAR(100),
    manager_id INT,              -- Référence à un autre employé
    FOREIGN KEY (manager_id) REFERENCES employes_hierarchie(id)
);

-- Données exemple
INSERT INTO employes_hierarchie VALUES 
    (1, 'Jean Dupont', NULL),    -- CEO (sans manager)
    (2, 'Marie Martin', 1),      -- Rapporte au CEO
    (3, 'Pierre Dubois', 1),     -- Rapporte au CEO
    (4, 'Sophie Laurent', 2);    -- Rapporte à Marie
```

Requête pour obtenir chaque employé avec son manager:

```sql
SELECT e1.nom AS employe,        -- Nom de l'employé
       e2.nom AS manager         -- Nom du manager
FROM employes_hierarchie e1      -- Table des employés
LEFT JOIN employes_hierarchie e2 -- Même table pour les managers
    ON e1.manager_id = e2.id;    -- Relation hiérarchique
```

Résultat:
```
employe         | manager
----------------|-------------
Jean Dupont     | NULL
Marie Martin    | Jean Dupont
Pierre Dubois   | Jean Dupont
Sophie Laurent  | Marie Martin
```

**Question métier résolue:** "Quelle est la structure hiérarchique de l'entreprise?"

## 4. Concepts Avancés

### Sous-requêtes

Les sous-requêtes sont des requêtes imbriquées dans une autre requête:

```sql
-- Trouver les clients qui ont effectué des commandes supérieures à 100€
SELECT nom
FROM clients
WHERE id IN (                     -- Sous-requête pour filtrer les IDs
    SELECT client_id              -- Retourne une liste d'IDs
    FROM commandes 
    WHERE montant > 100
);
```

Types de sous-requêtes:
1. **Sous-requête scalaire**: retourne une seule valeur
2. **Sous-requête ligne**: retourne une ligne de valeurs
3. **Sous-requête table**: retourne plusieurs lignes et colonnes
4. **Sous-requête corrélée**: fait référence à la requête externe

**Question métier résolue:** "Quels clients ont passé des commandes d'un montant supérieur à 100€?"

### Relations entre Cardinalités et Jointures

La cardinalité définit le nombre d'occurrences d'une entité qui peuvent être associées à une autre entité:

**1:1 (un-à-un)** - Un enregistrement de la table A correspond à exactement un enregistrement de la table B
- Exemple: Un employé et son dossier administratif
- Jointure recommandée: `INNER JOIN` si tous les enregistrements ont une correspondance

**1:N (un-à-plusieurs)** - Un enregistrement de la table A correspond à plusieurs enregistrements de la table B
- Exemple: Un client et ses commandes
- Jointure recommandée: `LEFT JOIN` si vous voulez tous les enregistrements de la table "un"

**N:M (plusieurs-à-plusieurs)** - Plusieurs enregistrements de la table A correspondent à plusieurs enregistrements de la table B
- Exemple: Étudiants et cours (via une table de jonction)
- Jointure recommandée: Deux `INNER JOIN` avec la table de jonction

## 5. Bonnes Pratiques

1. **Nommage et lisibilité**
   - Utilisez des alias courts mais significatifs (`c` pour clients, `co` pour commandes)
   - Indentez votre code SQL pour une meilleure lisibilité
   - Placez chaque clause principale sur une nouvelle ligne

2. **Optimisation**
   - Sélectionnez uniquement les colonnes nécessaires (évitez `SELECT *` en production)
   - Limitez le nombre de jointures dans une requête
   - Utilisez des sous-requêtes avec parcimonie

3. **Sécurité**
   - Utilisez des requêtes paramétrées pour éviter les injections SQL
   - Limitez les privilèges d'accès aux tables sensibles

4. **Maintenance**
   - Commentez les requêtes complexes
   - Documentez la structure de la base de données
   - Créez des vues pour les requêtes fréquemment utilisées

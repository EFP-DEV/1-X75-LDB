## 1. Créer un nouvel employé
### Énoncé 
Quelle requête SQL permet d'ajouter un nouvel employé à la table *employee* ? Le nom du nouvel employé est John Doe, qui est un Ingénieur Logiciel dans le département IT.

```sql
INSERT INTO `employee` (`id`, `firstname`, `lastname`, `role`, `department`) 
VALUES (NULL, 'John', 'Doe', 'Ingénieur Logiciel', 'IT');
```

### Explication
- `INSERT INTO`: Commande pour ajouter des données dans une table
- `employee`: Nom de la table cible
- Les backticks (\`) entourent les identifiants pour éviter les conflits avec les mots réservés SQL
- `VALUES`: Définit les valeurs à insérer pour chaque colonne listée
- `NULL` pour l'ID car il est auto-incrémenté

#### Pourquoi preciser id pour utiliser NULL ?
Parceque la requête a été générée par un outil qui ne presume/verifie pas que l'ID est auto-incrémenté. En SQL, il est possible de spécifier NULL pour une colonne auto-incrémentée, mais ce n'est pas nécessaire.
Voici une version où l'ID est omis, ce qui est plus concis quand la colonne utilise l'auto-incrémentation :

```sql
INSERT INTO employee (firstname, lastname, role, department) 
VALUES ('John', 'Doe', 'Ingénieur Logiciel', 'IT');
```

Cette requête :
- Spécifie uniquement les colonnes nécessaires
- Omet l'ID auto-incrémenté
- Supprime les backticks non essentiels quand les noms de colonnes n'entrent pas en conflit avec des mots réservés SQL

## 2. Lire toutes les informations des employés
### Énoncé 
Quelle requête SQL permet de récupérer toutes les colonnes pour tous les employés de la table *employee* ?

```sql
SELECT * FROM `employee`;
```

### Explication
- `SELECT *`: Sélectionne toutes les colonnes
- `FROM`: Spécifie la table source

## 3. Lire les informations spécifiques d'un employé
### Énoncé 
Quelle requête SQL permet de sélectionner le *firstname* et le *lastname* de tous les employés qui travaillent dans le département 'HR' ?

```sql
SELECT `firstname`, `lastname` FROM `employee` WHERE `department` = 'HR';
```

### Explication
- `SELECT` avec noms de colonnes spécifiques: Récupère uniquement les colonnes listées
- `WHERE`: Filtre les résultats pour ne montrer que les employés du département 'HR'

## 4. Mettre à jour le rôle d'un employé
### Énoncé 
Quelle requête SQL permet de changer le rôle d'un employé ? Supposez que vous souhaitez promouvoir Clarice Starling au poste de Cannibal Love Interest.

```sql
UPDATE `employee` SET `role` = 'Cannibal Love Interest' WHERE `id` = 15;
```

### Explication
- `UPDATE`: Commande pour modifier des données existantes
- `SET`: Définit les nouvelles valeurs pour les colonnes spécifiées
- `WHERE`: Limite la mise à jour à l'employé avec l'id 15

## 5. Supprimer un enregistrement d'employé
### Énoncé 
Quelle requête SQL permet de supprimer un employé de la table *employee*, celui qui picole au boulot ?

```sql
DELETE FROM `employee` WHERE `id` = 15;
```

### Explication
- `DELETE FROM`: Commande pour supprimer des enregistrements
- `WHERE`: Limite la suppression à l'employé avec l'id 15

## 6. Lire les employés ordonnés par nom de famille
### Énoncé 
Quelle requête SQL permet de sélectionner toutes les informations des employés de la table *employee*, ordonnées par leur *lastname* dans l'ordre ascendant ?

```sql
SELECT * FROM `employee` ORDER BY `lastname` ASC;
```

### Explication
- `ORDER BY`: Trie les résultats selon la colonne spécifiée
- `ASC`: Précise le tri en ordre ascendant (A à Z)

## 7. Compter le nombre d'employés dans un département
### Énoncé 
Quelle requête SQL permet de compter combien d'employés travaillent dans le département IT ?

```sql
SELECT COUNT(*) FROM `employee` WHERE `department` = 'IT';
```

### Explication
- `COUNT(*)`: Fonction d'agrégation qui compte le nombre d'enregistrements
- `WHERE`: Filtre le comptage pour n'inclure que les employés du département 'IT'

## 8. Mettre à jour le département pour plusieurs employés
### Énoncé 
Quelle requête SQL permet de déplacer tous les employés du département 'Legal' au département 'Sales' ?

```sql
UPDATE `employee` SET `department` = 'Sales' WHERE `department` = 'Legal';
```

### Explication
- `UPDATE`: Modifie les données existantes
- `SET`: Définit la nouvelle valeur pour le département
- `WHERE`: Limite la mise à jour aux employés du département 'Legal'

## 9. Trouver les employés sans département
### Énoncé 
Quelle requête SQL permet de sélectionner tous les employés qui n'ont pas de département assigné (en supposant que *department* peut être null) ?

```sql
SELECT * FROM `employee` WHERE `department` IS NULL;
```

### Explication
- `IS NULL`: Opérateur spécial pour tester si une valeur est NULL
- NULL en SQL représente l'absence de valeur (différent d'une chaîne vide)

## 10. Insérer plusieurs nouveaux employés
### Énoncé 
Quelle requête SQL permet d'ajouter trois nouveaux employés en même temps dans la table *employee* ?

```sql
INSERT INTO `employee` 
    (`firstname`, `lastname`, `role`, `department`) 
VALUES
    ('Alice', 'Bob', 'cryptographe', 'Data Science'),
    ('Bono', NULL, 'Chef de Produit', 'Product'),
    ('Madonna', NULL, 'Virgin Airlines CEO', 'Health and Safety');
```

### Explication
- Insertion multiple avec plusieurs tuples de `VALUES`
- Chaque groupe de valeurs entre parenthèses correspond à un nouvel enregistrement
- `NULL` explicite pour les valeurs manquantes

## 11. Modifier le nom de famille d'un employé
### Énoncé 
Quelle requête SQL permet de mettre à jour le nom de famille de 'Doe' en 'Smith' pour tous les employés nommés 'John' ?

```sql
UPDATE `employee` SET `lastname` = 'Smith' WHERE `firstname` = 'John';
```

### Explication
- `UPDATE` avec `SET`: Modifie la valeur de `lastname`
- `WHERE`: Cible uniquement les employés dont le prénom est 'John'

## 12. Ajouter le salaire
### Énoncé 
Quelle requête SQL permet d'ajouter une colonne *salary*, obligatoire et, par défaut, représentant 10.000 ZNB ? Précisez la monnaie en commentaire.

```sql
ALTER TABLE `employee` ADD `salary` FLOAT NOT NULL DEFAULT '10000' COMMENT 'ZNB' AFTER `department`;
```

### Explication
- `ALTER TABLE`: Modifie la structure d'une table existante
- `ADD`: Ajoute une nouvelle colonne
- `FLOAT`: Type de données pour nombres à virgule flottante
- `NOT NULL`: Contrainte empêchant les valeurs NULL
- `DEFAULT`: Valeur par défaut si non spécifiée lors de l'insertion
- `COMMENT`: Métadonnée explicative sur la colonne
- `AFTER`: Positionne la nouvelle colonne après une colonne existante

## 13. Augmenter le salaire des employés d'un département
### Énoncé 
Quelle requête SQL permet d'augmenter de 10% le salaire de tous les employés du département 'Health and Wellness' ?

```sql
UPDATE `employee` 
SET `salary` = `salary` * 1.1
WHERE `department` = 'Health & Wellness';
```

### Explication
- `SET` avec expression arithmétique: Calcule la nouvelle valeur en fonction de l'ancienne
- Multiplication par 1.1 équivaut à une augmentation de 10%

## 14. Supprimer les employés d'un département spécifique
### Énoncé 
Quelle requête SQL permet de supprimer tous les employés qui travaillent dans le département des ressources humaines ?

```sql
DELETE FROM `employee` WHERE `department` = 'Human Resources' OR `department` = 'HR';
```

### Explication
- `DELETE FROM`: Supprime des enregistrements
- `WHERE` avec `OR`: Combine deux conditions (département 'Human Resources' OU 'HR')

## 15. Lister les employés par ordre alphabétique inverse
### Énoncé 
Quelle requête SQL permet de lister tous les employés par ordre alphabétique inverse de leur nom de famille ?

```sql
SELECT * FROM `employee` ORDER BY `lastname` DESC;
```

### Explication
- `ORDER BY`: Trie les résultats
- `DESC`: Ordre descendant (Z à A)

## 16. Sélectionner des employés sans nom de famille
### Énoncé 
Quelle requête SQL permet de sélectionner tous les employés qui n'ont pas de nom de famille enregistré (en supposant que *lastname* peut être null) ?

```sql
SELECT * FROM `employee` WHERE `lastname` IS NULL;
```

### Explication
- `IS NULL`: Teste l'absence de valeur dans la colonne `lastname`

## 17. Ajouter une colonne à la table
### Énoncé 
Quelle requête SQL permet d'ajouter une colonne 'modus' à la table 'employee' ?

### Explication

L'exercice impose une réflexion sur le choix du type et des contraintes (NULL/NOT NULL) afin d'optimiser la structure tout en préservant la flexibilité. 

En l'absence d'informations précises, l'analyse des options devient essentielle:
- Choisir le [type](more/entity_attribute_types.md) adéquat économise l'espace et améliore les performances
- Définir correctement la nullabilité évite les erreurs d'insertion et contraintes inutiles

Dans un contexte où l'on doit ajouter un champ sans connaître sa finalité précise `VARCHAR(255)` reste un choix sûr et flexible

- Si vous suspectez que le champ pourrait être un identifiant ou un indicateur numérique, `INT` serait à considérer

- La définition du mot "modus" (mode ou méthode en latin) suggère qu'il s'agit probablement d'un champ catégoriel avec un nombre limité de valeurs, `ENUM` serait plus approprié mais impossible sans connaître ses valeurs

```sql
ALTER TABLE `employee` ADD `modus` VARCHAR(255) NULL AFTER `salary`;
```

### Explication
- `ALTER TABLE` avec `ADD`: Ajoute une nouvelle colonne
- `VARCHAR(255)`: Type de données pour texte de longueur variable (max 255 caractères)
- `NULL` pour permettre l'absence de valeur initiale
- `AFTER`: Positionne la colonne après `salary`
---

## 18. Calculer le nombre total d'employés
### Énoncé 
Quelle requête SQL permet de calculer le nombre total d'employés dans la table ?

```sql
SELECT COUNT(*) FROM `employee`;
```

### Explication
- `COUNT(*)`: Fonction d'agrégation qui compte tous les enregistrements
- Sans clause `WHERE`, le comptage s'applique à toute la table

---

## 19. Trouver l'employé avec le plus ancien 'id'
### Énoncé 
Quelle requête SQL permet de trouver l'employé qui a le plus ancien 'id' ?

```sql
SELECT * FROM `employee` ORDER BY `id` ASC LIMIT 0,1;
```

### Explication
- `ORDER BY id ASC`: Trie par ID en ordre croissant (le plus petit, donc le plus ancien, en premier)
- `LIMIT 0,1`: Limite le résultat au premier enregistrement (position 0, quantité 1)

Je vais proposer deux variantes pour trouver l'employé avec l'ID le plus ancien.

### Variante 1
```sql
SELECT * FROM employee WHERE id = (SELECT MIN(id) FROM employee);
```
Cette approche utilise une sous-requête pour trouver la valeur minimale de l'ID, puis sélectionne l'enregistrement correspondant à cette valeur. Elle offre l'avantage d'être plus explicite dans son intention.

### Variante 2
```sql
SELECT * FROM employee ORDER BY id LIMIT 1;
```
- Le paramètre `0,` est facultatif dans la clause `LIMIT`, car `LIMIT 1` signifie déjà "commencer à la position 0 et retourner 1 enregistrement"
- Omettre le `ASC` est **pratiquement acceptable** mais pas **strictement correct**. En effet, la norme SQL ne précise pas explicitement un ordre par défaut pour `ORDER BY`. Cependant, dans la pratique, toutes les implémentations SQL majeures (MySQL, PostgreSQL, SQL Server, Oracle, etc.) utilisent `ASC` (ordre croissant) comme comportement par défaut lorsqu'aucun ordre n'est spécifié.


## 20. Mettre à jour le mode opératoire de tous les employés
### Énoncé 
Quelle requête SQL permet de mettre à jour les employés en 'Remote Work' ?

```sql
UPDATE `employee` SET `modus` = 'Remote Work';
```

### Explication
- `UPDATE` avec `SET`: Modifie la valeur de la colonne `modus`
- Sans clause `WHERE`: S'applique à tous les enregistrements de la table



---


# Annexe: Glossaire des concepts et termes techniques SQL

## Commandes SQL de base

### INSERT INTO
Commande permettant d'ajouter de nouvelles lignes de données dans une table. Syntaxe de base: `INSERT INTO table (colonne1, colonne2) VALUES (valeur1, valeur2)`.

### SELECT
Commande utilisée pour extraire des données d'une base de données. Syntaxe de base: `SELECT colonne1, colonne2 FROM table`.

### UPDATE
Commande permettant de modifier des enregistrements existants dans une table. Syntaxe de base: `UPDATE table SET colonne1 = valeur1 WHERE condition`.

### DELETE FROM
Commande servant à supprimer des enregistrements d'une table. Syntaxe de base: `DELETE FROM table WHERE condition`.

### ALTER TABLE
Commande utilisée pour modifier la structure d'une table existante, comme ajouter ou supprimer des colonnes. Syntaxe de base: `ALTER TABLE table ADD colonne type_donnees`.

---

## Concepts techniques

### Sous-requête (subquery)
Requête imbriquée à l'intérieur d'une autre requête, généralement dans la clause WHERE ou FROM.

### Fonction d'agrégation
Fonction qui effectue un calcul sur un ensemble de valeurs et renvoie une valeur unique (ex: COUNT, SUM, AVG).

### NULL
Représente l'absence de valeur dans SQL, différent d'une chaîne vide ou de zéro.

### Insertion multiple
Technique permettant d'insérer plusieurs enregistrements en une seule requête INSERT.

### Clause conditionnelle
Expression (comme WHERE) qui évalue des conditions pour déterminer quels enregistrements sont affectés par une requête.

---

## Clauses et opérateurs

### WHERE
Clause utilisée pour filtrer les enregistrements en fonction de conditions spécifiées.

### ORDER BY
Clause utilisée pour trier les résultats d'une requête selon une ou plusieurs colonnes.
- `ASC`: Tri en ordre ascendant (A à Z, 0 à 9).
- `DESC`: Tri en ordre descendant (Z à A, 9 à 0).

### LIMIT
Clause qui restreint le nombre de lignes retournées par une requête. Syntaxe: `LIMIT [offset,] quantité`.

### SET
Clause utilisée avec UPDATE pour spécifier les nouvelles valeurs à attribuer aux colonnes.

### IS NULL / IS NOT NULL
Opérateurs spéciaux pour tester si une valeur est NULL (absence de valeur) ou non.

### COUNT()
Fonction d'agrégation qui compte le nombre d'enregistrements correspondant à une requête.

---

## Contraintes

### NOT NULL
Contrainte imposant qu'une colonne ne peut pas contenir de valeur NULL.

### DEFAULT
Contrainte spécifiant une valeur par défaut pour une colonne si aucune valeur n'est explicitement fournie.

### AUTO_INCREMENT
Attribut permettant à une colonne numérique d'augmenter automatiquement sa valeur pour chaque nouvel enregistrement.

---

## Délimiteurs et syntaxe

### Backticks (`)
Délimiteurs utilisés pour entourer les noms de tables et de colonnes en **MySQL**, particulièrement utiles lorsque ces noms sont des mots réservés SQL. [|{ plus }](more/backtick.md)

### Apostrophes (')
Délimiteurs utilisés pour entourer les valeurs de type chaîne de caractères.

### Parenthèses ()
Utilisées pour grouper des valeurs, définir l'ordre d'évaluation dans les expressions ou délimiter des sous-requêtes.

### COMMENT
Attribut permettant d'ajouter des métadonnées explicatives à une colonne.

---

## Positions et modifications

### AFTER
Clause utilisée avec ALTER TABLE ADD pour spécifier la position d'une nouvelle colonne après une colonne existante.

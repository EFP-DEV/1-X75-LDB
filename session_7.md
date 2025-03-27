# Modélisation des Relations en SQL

## Foreign Keys, Index Uniques et Vérification de Structure

Après avoir maîtrisé les requêtes SELECT, il est essentiel de comprendre les aspects fondamentaux de la modélisation des données.

Dans la conception de bases de données relationnelles, une question revient fréquemment : pourquoi définir explicitement des contraintes de clé étrangère (FK) quand il semble suffisant de simplement stocker les identifiants de référence ? Cette interrogation légitime mérite d'être explorée à travers les fondements techniques qui justifient l'utilisation des clés étrangères au-delà du simple stockage de données relationnelles.

Les clés étrangères constituent un mécanisme fondamental des systèmes de gestion de bases de données relationnelles (SGBDR), offrant bien plus qu'une simple relation entre tables. Elles représentent un contrat d'intégrité que le moteur de base de données s'engage à faire respecter, assurant ainsi la cohérence des données indépendamment des applications qui y accèdent.

## Raisons essentielles pour définir des clés étrangères

### 1. Garantie de l'intégrité référentielle

Les clés étrangères empêchent l'existence d'enregistrements orphelins. Sans cette contrainte, il serait possible de supprimer un enregistrement parent alors que des enregistrements enfants y font toujours référence, créant ainsi des références invalides et compromettant l'intégrité des données.

```sql
CREATE TABLE commandes (
    id INT PRIMARY KEY,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES clients(id)
    -- Sans cette FK, rien n'empêche des valeurs client_id invalides
);
```

### 2. Validation automatique des contraintes

Le moteur de base de données valide automatiquement les relations, rejetant les opérations qui violeraient les contraintes d'intégrité sans nécessiter de validation au niveau applicatif. Cette délégation au niveau du SGBD assure une application uniforme des règles métier.

### 3. Optimisation des requêtes

De nombreux moteurs de bases de données utilisent les relations de clé étrangère pour optimiser les requêtes, élaborer des stratégies de jointure efficaces et générer des plans d'exécution performants. Ces informations structurelles permettent à l'optimiseur de requêtes de prendre des décisions plus éclairées.

### 4. Auto-documentation

Les contraintes de clé étrangère documentent naturellement le modèle de données et les relations dans le schéma de la base de données. Elles rendent explicites les dépendances entre entités, facilitant ainsi la compréhension et la maintenance du système.

### 5. Actions en cascade

Les clés étrangères permettent des opérations automatiques en cascade (ON DELETE CASCADE, ON UPDATE CASCADE) qui maintiennent l'intégrité référentielle lors des modifications de données.

## Conclusion

Bien que l'implémentation de ces vérifications soit possible au niveau applicatif, transférer cette responsabilité à la base de données offre une couche d'application cohérente qui fonctionne indépendamment de l'application ou du processus qui accède aux données. Les contraintes de base de données opèrent à un niveau inférieur avec de meilleures performances et une fiabilité supérieure à la validation au niveau applicatif.

En définitive, les clés étrangères ne sont pas une redondance mais un outil essentiel pour garantir la robustesse et la fiabilité d'un système de gestion de données relationnel.



---

## 1. Clés Étrangères (Foreign Keys)

Les clés étrangères définissent les relations entre les tables et garantissent l'intégrité référentielle de vos données.

### Types de Relations

#### Relation Un-à-Un (1:1)
Une relation où un enregistrement dans la table A correspond à exactement un enregistrement dans la table B.

```sql
-- Exemple: Un utilisateur a un profil unique
CREATE TABLE utilisateur (
    id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

CREATE TABLE profil_utilisateur (
    id INT PRIMARY KEY,
    utilisateur_id INT UNIQUE,
    bio TEXT,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id)
);
```

#### Relation Un-à-Plusieurs (1:N)
Une relation où un enregistrement dans la table A peut être lié à plusieurs enregistrements dans la table B.

```sql
-- Exemple: Un opérateur peut créer plusieurs items
CREATE TABLE operator (
    id INT PRIMARY KEY,
    username VARCHAR(50)
);

CREATE TABLE item (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    operator_id INT,
    FOREIGN KEY (operator_id) REFERENCES operator(id)
);
```

#### Relation Plusieurs-à-Plusieurs (N:M)
Une relation où plusieurs enregistrements dans la table A peuvent être liés à plusieurs enregistrements dans la table B, nécessitant une table de jonction.

```sql
-- Exemple: Des items peuvent avoir plusieurs tags et vice versa
CREATE TABLE item (
    id INT PRIMARY KEY,
    title VARCHAR(100)
);

CREATE TABLE tag (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE item_tag (
    item_id INT,
    tag_id INT,
    PRIMARY KEY (item_id, tag_id),
    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);
```

---
## 2. ON DELETE et ON UPDATE
Les actions à effectuer lors de la suppression ou de la mise à jour d'un enregistrement référencé.

[Voir le cours sur ON DELETE et ON UPDATE](more/FK_ON_DELETE_UPDATE.md)


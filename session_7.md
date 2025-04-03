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
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
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
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

CREATE TABLE profil_utilisateur (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
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
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50)
);

CREATE TABLE item (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    operator_id INT,
    FOREIGN KEY (operator_id) REFERENCES operator(id)
);
```
---
> **Remarque :**  
> Dans une relation 1–1 et une relation 1–n, la définition technique de la clé étrangère reste la même :  
> ```sql
> FOREIGN KEY (colonne_fille) REFERENCES table_parent(id)
> ```
> La différence réside plutôt dans la **contrainte** appliquée à la colonne qui porte cette clé étrangère :
>
> - **1–1** : la colonne est souvent déclarée comme **UNIQUE** (ou peut même servir de clé primaire). Cela empêche qu’un même enregistrement parent soit référencé plusieurs fois, imposant ainsi la correspondance un-à-un.
> - **1–n** : la colonne **n’est pas** unique. Plusieurs lignes de la table enfant peuvent alors faire référence à un même enregistrement parent, permettant la relation un-à-plusieurs.(ou peut même servir de clé primaire). Cela empêche qu’un même enregistrement parent soit référencé plusieurs fois, imposant ainsi la correspondance un-à-un.

---

#### Relation Plusieurs-à-Plusieurs (N:M)
Une relation où plusieurs enregistrements dans la table A peuvent être liés à plusieurs enregistrements dans la table B, nécessitant une table de jonction.

```sql
-- Exemple: Des items peuvent avoir plusieurs tags et vice versa
CREATE TABLE item (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100)
);

CREATE TABLE tag (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
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



## 3. UNSIGNED ?

> Définir une clé primaire auto-incrémentée (`AUTO_INCREMENT`) comme **UNSIGNED** (sous MySQL/MariaDB) permet de pratiquement **doubler la plage de valeurs** disponibles pour l’identifiant. Par exemple :
> - Un `INT` signé standard (32 bits) va de –2,147,483,648 à 2,147,483,647.
> - Un `INT UNSIGNED` (32 bits) va de 0 à 4,294,967,295.
>
> Puisqu’un identifiant n’a pas besoin de valeurs négatives, passer la colonne en `UNSIGNED` prolonge la durée de vie de l’auto-incrément avant d’atteindre la valeur maximale.


## 2. Index Uniques

Les index uniques garantissent l'unicité des valeurs dans une ou plusieurs colonnes.

### Types d'Index Uniques

#### Index sur une Colonne Unique

```sql
-- Lors de la création de table
CREATE TABLE operator (
    id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- Ou après la création de la table
ALTER TABLE operator
ADD UNIQUE INDEX idx_username (username);
```

#### Index sur Plusieurs Colonnes

```sql
-- Unicité sur la combinaison de colonnes
CREATE TABLE subscription (
    user_id INT,
    service_id INT,
    start_date DATE,
    UNIQUE INDEX idx_user_service (user_id, service_id)
);
```

### Avantages des Index Uniques

1. **Intégrité des données**: Garantit qu'aucune valeur ne sera dupliquée
2. **Performances de recherche**: Accélère les requêtes qui filtrent sur ces colonnes
3. **Optimisation de jointures**: Améliore les performances des jointures sur ces colonnes

### Exercice sur les Index Uniques

Ajoutez les index uniques appropriés à la base de données pour les cas suivants :
1. Assurer qu'un visiteur ne puisse pas avoir deux collections avec le même nom
2. Garantir que le slug d'un item soit unique mais seulement parmi les items publiés

<details>
  <summary>Solution</summary>
  
```sql
-- 1. Index unique sur le nom de collection par visiteur
ALTER TABLE collection
ADD UNIQUE INDEX idx_visitor_collection_name (visitor_id, name);

-- 2. Index unique partiel sur les slugs d'items publiés
-- Note: La syntaxe varie selon le SGBD
-- Pour MySQL 8.0+ avec fonctionnalités d'index fonctionnels:
ALTER TABLE item
ADD UNIQUE INDEX idx_published_slug ((CASE WHEN status = 'published' THEN slug END));

-- Pour PostgreSQL:
CREATE UNIQUE INDEX idx_published_slug ON item (slug) WHERE status = 'published';
```
</details>


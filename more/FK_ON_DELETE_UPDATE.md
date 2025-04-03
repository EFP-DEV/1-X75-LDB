# Intégrité référentielle dans une base de données relationnelle

Les foreign keys (clés étrangères) sont essentielles pour maintenir l'intégrité référentielle dans une base de données relationnelle. Elles définissent comment les relations entre tables sont gérées lors de la modification ou suppression des données. 

Ce document présente les différentes stratégies disponibles pour les clauses `ON DELETE` et `ON UPDATE`, illustrées par des exemples concrets.

## Types de contraintes

- **CASCADE**: Propage les modifications ou suppressions aux tables liées
- **RESTRICT**: Empêche les modifications ou suppressions si des références existent
- **SET NULL**: Met la clé étrangère à NULL quand la référence est modifiée ou supprimée
- **NO ACTION**: [Similaire à RESTRICT](FK_RESTRICT_NO_ACTION.md) mais vérifié à la fin de la transaction

Ces contraintes peuvent être configurées indépendamment pour les actions DELETE et UPDATE, permettant une gestion fine de l'intégrité des données selon les besoins spécifiques de l'application.


## Exemples ON DELETE

### CASCADE: Supprime les lignes qui référencent la ligne supprimée

**Exemple concret**: La relation entre `visitor` et `collection`

Dans votre schéma, lorsqu'un visiteur est supprimé, toutes ses collections devraient également être supprimées.

```sql
-- Définition de la contrainte
ALTER TABLE collection
ADD CONSTRAINT fk_collection_visitor
FOREIGN KEY (visitor_id) REFERENCES visitor(id) ON DELETE CASCADE;

-- Démonstration
-- 1. Avant suppression
SELECT v.visitor_token, c.name FROM visitor v
LEFT JOIN collection c ON v.id = c.visitor_id
WHERE v.id = 1;

-- 2. Suppression du visiteur
DELETE FROM visitor WHERE id = 1;

-- 3. Vérification après suppression
-- Les collections associées ont aussi été supprimées
SELECT * FROM collection WHERE visitor_id = 1; -- Retourne vide
```

### RESTRICT: Empêche la suppression s'il existe des références

**Exemple concret**: La relation entre `operator` et `tag`

Dans votre schéma, un opérateur ne devrait pas pouvoir être supprimé s'il a créé des tags (pour maintenir la référence au créateur).

```sql
-- Définition de la contrainte
ALTER TABLE tag
ADD CONSTRAINT fk_tag_operator
FOREIGN KEY (operator_id) REFERENCES operator(id) ON DELETE RESTRICT;

-- Démonstration
-- 1. Essayer de supprimer un opérateur qui a créé des tags
DELETE FROM operator WHERE id = 1; -- Erreur si des tags référencent cet opérateur

-- 2. Pour supprimer, il faut d'abord supprimer ou réassigner les tags
-- Suppression des tags
DELETE FROM tag WHERE operator_id = 1;
-- Maintenant l'opérateur peut être supprimé
DELETE FROM operator WHERE id = 1;
```

### SET NULL: Met la clé étrangère à NULL quand la référence est supprimée

**Exemple concret**: La relation entre `operator` et `message`

Dans votre schéma, quand un opérateur est supprimé, les messages qu'il a lus devraient conserver leur existence mais perdre la référence à l'opérateur.

```sql
-- Définition de la contrainte
ALTER TABLE message
ADD CONSTRAINT fk_message_operator
FOREIGN KEY (operator_id) REFERENCES operator(id) ON DELETE SET NULL;

-- Démonstration
-- 1. Avant suppression
SELECT id, subject, operator_id FROM message WHERE operator_id = 1;

-- 2. Suppression de l'opérateur
DELETE FROM operator WHERE id = 1;

-- 3. Vérification après suppression
-- Les messages existent toujours mais operator_id est NULL
SELECT id, subject, operator_id FROM message WHERE id IN (1, 2, 3);
```

### NO ACTION: Similaire à RESTRICT mais vérifié à la fin de la transaction

**Exemple concret**: Une relation hypothétique entre `item` et une nouvelle table `review`

```sql
-- Création d'une nouvelle table pour l'exemple
CREATE TABLE review (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    item_id INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    rating TINYINT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES item(id) ON DELETE NO ACTION
);

-- Démonstration dans une transaction
START TRANSACTION;
    -- 1. Ajout d'une review
    INSERT INTO review (item_id, content, rating) VALUES (1, 'Great product!', 5);
    
    -- 2. Tentative de suppression de l'item
    DELETE FROM item WHERE id = 1; -- Ne serait pas immédiatement vérifié
    
    -- 3. Autres opérations dans la transaction...
    
    -- 4. À la fin de la transaction, la contrainte serait vérifiée
    -- et provoquerait une erreur, annulant toute la transaction
COMMIT; -- Échouerait à cause de la contrainte NO ACTION
```

## Exemples ON UPDATE

### CASCADE: Propage les modifications aux références

**Exemple concret**: Mise à jour d'identifiants dans la relation entre `tag` et `item_tag`

```sql
-- Définition de la contrainte
ALTER TABLE item_tag
ADD CONSTRAINT fk_item_tag_tag
FOREIGN KEY (tag_id) REFERENCES tag(id) ON UPDATE CASCADE;

-- Démonstration
-- 1. État initial
SELECT it.item_id, t.id AS tag_id, t.name 
FROM item_tag it
JOIN tag t ON it.tag_id = t.id
WHERE t.id = 1;

-- 2. Mise à jour de l'ID du tag
UPDATE tag SET id = 100 WHERE id = 1;

-- 3. Vérification après mise à jour
-- Les références dans item_tag sont automatiquement mises à jour
SELECT it.item_id, t.id AS tag_id, t.name 
FROM item_tag it
JOIN tag t ON it.tag_id = t.id
WHERE t.id = 100; -- Maintenant à 100 au lieu de 1
```

## Cas d'usage pratiques dans votre schéma

1. **Collection_item** - Lorsqu'un item est supprimé, toutes ses références dans les collections devraient être supprimées :
```sql
ALTER TABLE collection_item
ADD CONSTRAINT fk_collection_item_item
FOREIGN KEY (item_id) REFERENCES item(id) ON DELETE CASCADE;
```

2. **Search** - Lorsqu'un visiteur est supprimé, ses recherches pourraient être conservées pour analyse mais sans référence au visiteur :
```sql
ALTER TABLE search
ADD CONSTRAINT fk_search_visitor
FOREIGN KEY (visitor_id) REFERENCES visitor(id) ON DELETE SET NULL;
```

3. **Item** - Pour protéger contre la suppression accidentelle d'un opérateur qui a créé du contenu important :
```sql
ALTER TABLE item
ADD CONSTRAINT fk_item_operator
FOREIGN KEY (operator_id) REFERENCES operator(id) ON DELETE RESTRICT;
```

Ces exemples illustrent comment les différentes options de contraintes de clé étrangère peuvent être utilisées pour maintenir l'intégrité des données tout en répondant aux besoins spécifiques de votre application.

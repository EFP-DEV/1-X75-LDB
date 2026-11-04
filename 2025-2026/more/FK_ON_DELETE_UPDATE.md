# Intégrité référentielle dans une base de données relationnelle

Les **foreign keys (clés étrangères)** sont essentielles pour garantir l’intégrité référentielle dans une base de données relationnelle. Elles définissent le comportement du système lorsque des lignes référencées sont **modifiées** ou **supprimées**.

Ce document présente les différentes stratégies disponibles pour les clauses `ON DELETE` et `ON UPDATE`, illustrées par des exemples concrets basés sur un schéma utilisant **une seule table `operator`** (regroupant utilisateurs et administrateurs).

---

## Types de contraintes

* **CASCADE**
  Propage automatiquement les suppressions ou mises à jour vers les tables liées.

* **RESTRICT**
  Empêche la suppression ou la modification si des références existent.

* **SET NULL**
  Met la clé étrangère à `NULL` lorsque la ligne référencée est supprimée ou modifiée.

* **NO ACTION**
  Similaire à `RESTRICT`, mais la vérification est effectuée **à la fin de la transaction**.

👉 Les contraintes `ON DELETE` et `ON UPDATE` peuvent être définies indépendamment pour chaque clé étrangère.

---

## Exemples `ON DELETE`

### CASCADE — Supprimer automatiquement les lignes dépendantes

**Cas d’usage** : un `operator` possède des collections.
Lorsqu’un operator est supprimé, toutes ses collections doivent l’être également.

```sql
ALTER TABLE collection
ADD CONSTRAINT fk_collection_operator
FOREIGN KEY (operator_id)
REFERENCES operator(id)
ON DELETE CASCADE;
```

```sql
-- Avant suppression
SELECT o.id, c.name
FROM operator o
LEFT JOIN collection c ON o.id = c.operator_id
WHERE o.id = 1;

-- Suppression
DELETE FROM operator WHERE id = 1;

-- Après suppression
SELECT * FROM collection WHERE operator_id = 1; -- résultat vide
```

---

### RESTRICT — Bloquer la suppression si des références existent

**Cas d’usage** : un operator a créé des tags.
On veut empêcher sa suppression tant que ces tags existent.

```sql
ALTER TABLE tag
ADD CONSTRAINT fk_tag_operator
FOREIGN KEY (operator_id)
REFERENCES operator(id)
ON DELETE RESTRICT;
```

```sql
-- Tentative de suppression
DELETE FROM operator WHERE id = 1; -- échoue si des tags existent

-- Pour supprimer l’operator
DELETE FROM tag WHERE operator_id = 1;
DELETE FROM operator WHERE id = 1;
```

---

### SET NULL — Conserver les données mais supprimer la référence

**Cas d’usage** : des messages sont associés à un operator.
Lorsqu’un operator est supprimé, les messages doivent rester, mais sans référence.

⚠️ La colonne `operator_id` doit être **NULLable**.

```sql
ALTER TABLE message
ADD CONSTRAINT fk_message_operator
FOREIGN KEY (operator_id)
REFERENCES operator(id)
ON DELETE SET NULL;
```

```sql
-- Avant
SELECT id, subject, operator_id FROM message WHERE operator_id = 1;

-- Suppression
DELETE FROM operator WHERE id = 1;

-- Après
SELECT id, subject, operator_id
FROM message
WHERE id IN (1, 2, 3); -- operator_id = NULL
```

---

### NO ACTION — Vérification différée à la fin de la transaction

**Cas d’usage** : des avis (`review`) sont liés à un item.
La suppression d’un item référencé doit invalider toute la transaction.

```sql
CREATE TABLE review (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    item_id INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    rating TINYINT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id)
        REFERENCES item(id)
        ON DELETE NO ACTION
);
```

```sql
START TRANSACTION;

INSERT INTO review (item_id, content, rating)
VALUES (1, 'Great product!', 5);

DELETE FROM item WHERE id = 1;

COMMIT; -- échec : contrainte NO ACTION violée
```

---

## Exemples `ON UPDATE`

### CASCADE — Propager une mise à jour de clé primaire

**Cas d’usage** : un `tag` est référencé dans `item_tag`.
Si l’identifiant du tag change, toutes les références doivent être mises à jour.

```sql
ALTER TABLE item_tag
ADD CONSTRAINT fk_item_tag_tag
FOREIGN KEY (tag_id)
REFERENCES tag(id)
ON UPDATE CASCADE;
```

```sql
-- Avant
SELECT it.item_id, t.id, t.name
FROM item_tag it
JOIN tag t ON it.tag_id = t.id
WHERE t.id = 1;

-- Mise à jour
UPDATE tag SET id = 100 WHERE id = 1;

-- Après
SELECT it.item_id, t.id, t.name
FROM item_tag it
JOIN tag t ON it.tag_id = t.id
WHERE t.id = 100;
```

---

## Cas d’usage pratiques dans le schéma

### 1. `collection_item` — suppression d’un item

```sql
ALTER TABLE collection_item
ADD CONSTRAINT fk_collection_item_item
FOREIGN KEY (item_id)
REFERENCES item(id)
ON DELETE CASCADE;
```

---

### 2. `search` — conservation des recherches après suppression d’un operator

```sql
ALTER TABLE search
ADD CONSTRAINT fk_search_operator
FOREIGN KEY (operator_id)
REFERENCES operator(id)
ON DELETE SET NULL;
```

---

### 3. `item` — protection contre la suppression d’un operator créateur

```sql
ALTER TABLE item
ADD CONSTRAINT fk_item_operator
FOREIGN KEY (operator_id)
REFERENCES operator(id)
ON DELETE RESTRICT;
```

---

## Conclusion

Le choix entre `CASCADE`, `RESTRICT`, `SET NULL` et `NO ACTION` dépend :

* de la **nature de la relation**
* de la **valeur métier** des données
* du **niveau de protection** souhaité

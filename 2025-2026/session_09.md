# Session 09 : Interroger la base de données avec SELECT

## Lecture, filtrage et relations

---

## Objectif de la séance

Comprendre comment interroger la base de données du projet afin de :

* lire des données
* filtrer les résultats
* relier les tables
* ordonner et limiter les résultats

Les requêtes présentées ici sont celles qui seront réellement utilisées dans le projet.

---

## Modèle de données utilisé

Les exemples s’appuient sur les tables suivantes :

* `item`
* `category`
* `theme`
* `tag`
* `item_tag`

Relations principales :

* `item.category_id` → `category.id`
* `item.theme_id` → `theme.id`
* `item` et `tag` via `item_tag`

---

## 1. SELECT — Lire des données

### Principe

`SELECT` permet de choisir quelles colonnes lire dans une table.

```sql
SELECT label
FROM item;
```
ou
```sql
SELECT label FROM item;
```

Cette requête lit la colonne `label` de la table `item`.

---

## 2. AS — Alias de colonnes

### Principe

`AS` permet de renommer une colonne dans le résultat, sans modifier la base.

```sql
SELECT label AS item_label
FROM item;
```

Le champ s’appelle toujours `label` dans la table, mais apparaît sous le nom `item_label` dans le résultat.

---

## 3. WHERE — Filtrer les lignes

### Principe

`WHERE` permet de restreindre les résultats selon une condition.

```sql
SELECT label
FROM item
WHERE status = 'published';
```

Seuls les items dont le statut est `published` sont retournés.

---

## 4. IN — Tester plusieurs valeurs

### Principe

`IN` permet de tester une valeur dans une liste.

```sql
SELECT label
FROM item
WHERE status IN ('draft', 'published');
```

Cette requête retourne les items dont le statut est soit `draft`, soit `published`.

---

## 5. LIKE — Recherche partielle

### Principe

`LIKE` permet d’effectuer une recherche par motif sur une colonne textuelle.

```sql
SELECT label
FROM item
WHERE label LIKE '%guide%';
```

Cette requête retourne les items dont le titre contient le mot `guide`.

---

### Caractères spéciaux utilisés avec LIKE

#### Le symbole `%` — suite de caractères

```sql
SELECT label
FROM item
WHERE label LIKE 'Guide%';
```

Titres qui commencent par `Guide`.

```sql
SELECT label
FROM item
WHERE label LIKE '%Guide';
```

Titres qui se terminent par `Guide`.

---

#### Le symbole `_` — un seul caractère

```sql
SELECT label
FROM item
WHERE label LIKE 'Chapitre _';
```

Correspond à `Chapitre 1`, `Chapitre A`, mais pas `Chapitre 10`.

---

#### Échapper un caractère spécial

Si le texte contient réellement `%` ou `_`, on peut utiliser `ESCAPE`.

```sql
SELECT label
FROM item
WHERE label LIKE '%\_%' ESCAPE '\';
```

Recherche les titres contenant réellement le caractère `_`.

---

## 6. INNER JOIN — Relier des tables (relations obligatoires)

### Principe

`INNER JOIN` retourne uniquement les lignes présentes dans les deux tables.

```sql
SELECT item.label, category.name
FROM item
INNER JOIN category
  ON item.category_id = category.id;
```

Un item sans catégorie n’apparaît pas dans le résultat.

---

## 7. INNER JOIN — Relation N..N (tags)

### Principe

Les relations N..N passent par une table associative.

```sql
SELECT item.label, tag.name
FROM item
INNER JOIN item_tag
  ON item.id = item_tag.item_id
INNER JOIN tag
  ON item_tag.tag_id = tag.id;
```

Cette requête relie `item` à `tag` via `item_tag`.

---

## 8. LEFT JOIN — Inclure les données absentes

### Principe

`LEFT JOIN` conserve toutes les lignes de la table de gauche, même sans correspondance.

```sql
SELECT item.label, tag.name
FROM item
LEFT JOIN item_tag
  ON item.id = item_tag.item_id
LEFT JOIN tag
  ON item_tag.tag_id = tag.id;
```

Les items sans tag apparaissent avec des valeurs `NULL`.

---

## 9. ORDER BY — Trier les résultats

### Principe

`ORDER BY` permet de trier les résultats.

```sql
SELECT label
FROM item
ORDER BY label ASC;
```

Trie les items par titre, par ordre alphabétique croissant.

```sql
SELECT label
FROM item
ORDER BY label DESC;
```

Trie les items par titre, par ordre décroissant.

---

## 10. LIMIT — Limiter le nombre de résultats

### Principe

`LIMIT` permet de restreindre le nombre de lignes retournées.

```sql
SELECT label
FROM item
ORDER BY label
LIMIT 5;
```

Retourne uniquement les 5 premiers résultats.

---

### LIMIT avec OFFSET

```sql
SELECT label
FROM item
ORDER BY label
LIMIT 5 OFFSET 5;
```

Retourne 5 résultats à partir du sixième.

---

## Synthèse conceptuelle

| Élément    | Rôle                     |
| ---------- | ------------------------ |
| SELECT     | Lire des données         |
| AS         | Clarifier l’affichage    |
| WHERE      | Filtrer les résultats    |
| IN         | Tester plusieurs valeurs |
| LIKE       | Recherche partielle      |
| INNER JOIN | Relations existantes     |
| LEFT JOIN  | Relations absentes       |
| ORDER BY   | Trier les résultats      |
| LIMIT      | Limiter l’affichage      |

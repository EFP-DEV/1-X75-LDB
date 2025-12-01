# Normalisation 1NF, 2NF, 3NF

## Pourquoi normaliser?

* Éliminer la redondance des données - Éviter de stocker les mêmes informations à plusieurs endroits
* Minimiser les anomalies - Prévenir les incohérences lors des opérations `INSERT`, `UPDATE` et `DELETE`
* Optimiser les performances - Réduire l'espace de stockage et améliorer la vitesse des requêtes
* Améliorer l'intégrité des données et assurer la cohérence des données

## Comment normaliser?

Nous allons suivre un algorithme de normalisation en trois étapes, en appliquant les formes normales 1NF, 2NF et 3NF. Chaque étape vise à résoudre des problèmes spécifiques de redondance et d'intégrité des données.

Nous allons aborder cette notion fondamentale par le biais d'un exemple pratique: imaginons que nous avons reçu un **fichier CSV** extrait du systeme de comptabilite que vous aller remplacer par votre solution. 

Ce fichier contient des informations sur les ventes d'un magasin de produits informatiques. 

Le but du jeu: eviter la repetition d'informations


## Données de départ


| sale_ID | sale_date | customer_ID | customer_name | customer_email | customer_phone | products | products_names | products_categories | unit_prices | quantities | seller_ID | seller_name | seller_department |
|----------|------------|-----------|------------|--------------|------------------|------------------|---------------|---------------------|----------------|-----------|------------|-------------|---------------------|
| 1 | 10/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P001, P002 | Ordinateur portable, Souris sans fil | Informatique, Périphériques | 500€, 50€ | 1, 2 | V001 | Lefebvre Alice | Informatique |
| 2 | 11/03/2025 | C002 | Durand Sophie | durand@email.com | 0234567890 | P002, P003, P004 | Souris sans fil, Casque audio, Clé USB | Périphériques, Audio, Stockage | 50€, 750€, 25€ | 1, 1, 3 | V002 | Moreau Jean | Audio |
| 3 | 11/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P001, P005 | Ordinateur portable, PC de bureau | Informatique, Informatique | 500€, 1200€ | 1, 1 | V001 | Lefebvre Alice | Informatique |

Cette table présente plusieurs problèmes :
- **Valeurs multiples** dans des colonnes (products, unit_prices, quantities)
- **Redondance** d'informations (informations client et vendeur répétées)
- **Dépendances transitives** (seller_ID détermine seller_name et seller_department)

---

## Première Forme Normale (1NF)

La 1NF exige l'**atomicité des données** (pas de valeurs multiples dans une colonne).

### Table sale (1NF)

| sale_ID | sale_date | customer_ID | customer_name | customer_email | customer_phone | product_ID | product_name | product_category | unit_price | quantity | seller_ID | seller_name | seller_department |
|----------|------------|-----------|------------|--------------|------------------|------------|-------------|-------------------|---------------|----------|------------|-------------|---------------------|
| 1 | 10/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P001 | Ordinateur portable | Informatique | 500€ | 1 | V001 | Lefebvre Alice | Informatique |
| 1 | 10/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P002 | Souris sans fil | Périphériques | 50€ | 2 | V001 | Lefebvre Alice | Informatique |
| 2 | 11/03/2025 | C002 | Durand Sophie | durand@email.com | 0234567890 | P002 | Souris sans fil | Périphériques | 50€ | 1 | V002 | Moreau Jean | Audio |
| 2 | 11/03/2025 | C002 | Durand Sophie | durand@email.com | 0234567890 | P003 | Casque audio | Audio | 750€ | 1 | V002 | Moreau Jean | Audio |
| 2 | 11/03/2025 | C002 | Durand Sophie | durand@email.com | 0234567890 | P004 | Clé USB | Stockage | 25€ | 3 | V002 | Moreau Jean | Audio |
| 3 | 11/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P001 | Ordinateur portable | Informatique | 500€ | 1 | V001 | Lefebvre Alice | Informatique |
| 3 | 11/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P005 | PC de bureau | Informatique | 1200€ | 1 | V001 | Lefebvre Alice | Informatique |

Nous avons éliminé les valeurs multiples, il y a maintenant **une ligne** par **produit vendu**, la clé primaire est donc maintenant **composée** : `(sale_ID, product_ID)`.

Les informations sur le client et le vendeur sont toujours redondantes.


**Note sur la clé primaire :**
---
customer_ID n'est pas inclus dans la clé primaire pour plusieurs raisons techniques et conceptuelles:

* Dépendance fonctionnelle - customer_ID est déterminé par sale_ID. Pour chaque sale_ID, il n'y a qu'un seul customer_ID possible. Cette dépendance fonctionnelle (sale_ID → customer_ID) signifie que customer_ID est un attribut déterminé par une partie de la clé primaire.
* Minimalité de la clé - Une bonne clé primaire doit être minimale. Si (sale_ID, product_ID) suffit déjà à identifier de façon unique chaque ligne, ajouter customer_ID serait redondant et violerait le principe de minimalité.
* Cohérence des données - Un même sale_ID ne peut être associé qu'à un seul client. Si on incluait customer_ID dans la clé, cela pourrait théoriquement permettre qu'une même vente soit associée à plusieurs clients, ce qui n'a pas de sens dans le modèle métier.
* Conception logique - La clé primaire (sale_ID, product_ID) reflète correctement que chaque ligne représente un produit spécifique dans une vente spécifique, et non pas un produit spécifique acheté par un client spécifique dans une vente spécifique.

En résumé, customer_ID est un attribut descriptif de la vente et non un identifiant de ligne dans le contexte de la 1NF.

---

## Deuxième Forme Normale (2NF)

La 2NF exige l'élimination des dépendances partielles dans les tables avec des clés primaires composées.

Dans notre cas, plusieurs attributs dépendent uniquement d'une partie de la clé composée `(sale_ID, product_ID)` :
- Les informations client (`customer_name`, `customer_email`, `customer_phone`) dépendent uniquement de `customer_ID`
- Les informations vente (`sale_date`, `customer_ID`, `seller_ID`) dépendent uniquement de sale_ID
- Les informations produit (`product_name`, `product_category`, `unit_price`) dépendent uniquement de `product_ID`

### Table Clients (2NF)

| customer_ID | customer_name | customer_email | customer_phone |
|-----------|------------|--------------|------------------|
| C001 | Dupont Martin | dupont@email.com | 0123456789 |
| C002 | Durand Sophie | durand@email.com | 0234567890 |

### Table sale (2NF)

| sale_ID | sale_date | customer_ID | seller_ID |
|----------|------------|-----------|------------|
| 1 | 10/03/2025 | C001 | V001 |
| 2 | 11/03/2025 | C002 | V002 |
| 3 | 11/03/2025 | C001 | V001 |

### Table product (2NF)

| product_ID | product_name | product_category | unit_price |
|------------|-------------|-------------------|---------------|
| P001 | Ordinateur portable | Informatique | 500€ |
| P002 | Souris sans fil | Périphériques | 50€ |
| P003 | Casque audio | Audio | 750€ |
| P004 | Clé USB | Stockage | 25€ |
| P005 | PC de bureau | Informatique | 1200€ |

### Table sale_detail (2NF)

| sale_ID | product_ID | quantity |
|----------|------------|----------|
| 1 | P001 | 1 |
| 1 | P002 | 2 |
| 2 | P002 | 1 |
| 2 | P003 | 1 |
| 2 | P004 | 3 |
| 3 | P001 | 1 |
| 3 | P005 | 1 |

### Table seller (2NF)

| seller_ID | seller_name | seller_department |
|------------|-------------|---------------------|
| V001 | Lefebvre Alice | Informatique |
| V002 | Moreau Jean | Audio |

Nous avons éliminé les dépendances partielles. Notez que les informations sur les produits (y compris le prix) ont été extraites dans leur propre table à cette étape, car elles dépendent uniquement de product_ID.

## Troisième Forme Normale (3NF)

La 3NF exige l'élimination des dépendances transitives. 

Dans notre schéma 2NF, nous avons déjà placé les informations produit dans une table séparée, donc une grande partie du travail de la 3NF est déjà accomplie. Cependant, nous devons encore examiner d'autres dépendances transitives potentielles.

Il existe une dépendance transitive dans la table seller : seller_department pourrait dépendre du département auquel appartient un vendeur, plutôt que directement de l'seller_ID. Pour une normalisation plus poussée, nous pourrions extraire cette information dans une table `department`.

### Table department (3NF)

| department_ID | Nom_Département |
|----------------|-----------------|
| D001 | Informatique |
| D002 | Audio |

### Table seller (3NF) - Modifiée

| seller_ID | seller_name | department_ID |
|------------|-------------|----------------|
| V001 | Lefebvre Alice | D001 |
| V002 | Moreau Jean | D002 |


De même, on retrouve une autre dépendance transitive dans la table product, où le product_category pourrait être séparé en une table distincte pour éviter la redondance.

On pourrait normaliser davantage les catégories de produits: 

### Table category (3NF)
| category_ID | category_name |
|----------------|----------------|
| C001 | Informatique |
| C002 | Périphériques |
| C003 | Audio |
| C004 | Stockage |

### Table product (3NF) - Modifiée
| product_ID | product_name | category_ID | unit_price |
|------------|-------------|---------------|---------------|
| P001 | Ordinateur portable | C001 | 500€ |
| P002 | Souris sans fil | C002 | 50€ |
| P003 | Casque audio | C003 | 750€ |
| P004 | Clé USB | C004 | 25€ |
| P005 | PC de bureau | C001 | 1200€ |


## Résumé des transformations

1. **Non normalisée → 1NF** : Élimination des valeurs multiples dans les colonnes
   - Chaque cellule contient une seule valeur atomique
   - Expansion des listes de valeurs en plusieurs lignes

2. **1NF → 2NF** : Élimination des dépendances partielles
   - Création de tables distinctes pour les clients, ventes, produits et vendeurs
   - Séparation des données qui dépendent uniquement d'une partie de la clé composée
   - Extraction des informations produit (product_name, product_category, unit_price) dans une table dédiée

3. **2NF → 3NF** : Élimination des dépendances transitives
   - Séparation des données qui dépendent d'attributs non-clés
   - Extraction des informations sur les départements dans une table dédiée
   - Création d'une table pour les catégories de produits
   - Élimination des dépendances transitives restantes

## Avantages progressifs obtenus

À chaque étape de normalisation, nous obtenons des améliorations:

1. **1NF**: Facilite les recherches et les calculs en rendant les données atomiques

2. **2NF**: 
   - Réduit la redondance (les noms de produits ne sont plus répétés pour chaque vente)
   - Facilite les mises à jour (changer le prix d'un produit se fait en un seul endroit)
   - Structure les données selon leur nature logique

3. **3NF**:
   - Élimine les dépendances transitives restantes
   - Maximise la cohérence des données
   - Optimise le stockage
   - Minimise les risques d'anomalies lors des opérations d'insertion, mise à jour et suppression

   - Facilite l'ajout de nouvelles catégories et de nouveaux départements sans affecter les autres tables

Chaque forme normale résout un type spécifique de problème de redondance et améliore l'intégrité des données.

---


## Consequences de la normalisation sur les requêtes SQL

Voici les requêtes SQL adaptées pour obtenir l'historique des achats du client C001 pour chaque version de notre schéma, avec leurs résultats respectifs :

### Version Non Normalisée

```sql
SELECT sale_ID, sale_date, products, products_names, products_categories, 
       unit_prices, quantities, seller_name
FROM sale
WHERE customer_ID = 'C001';
```

**Résultat :**
| sale_ID | sale_date | products | products_names                      | products_categories           | unit_prices | quantities | seller_name    |
|----------|------------|------------------|------------------------------------|---------------------------------|----------------|-----------|----------------|
| 1        | 10/03/2025 | P001, P002       | Ordinateur portable, Souris sans fil | Informatique, Périphériques    | 500€, 50€      | 1, 2      | Lefebvre Alice |
| 3        | 11/03/2025 | P001, P005       | Ordinateur portable, PC de bureau   | Informatique, Informatique     | 500€, 1200€    | 1, 1      | Lefebvre Alice |

### Version 1NF

```sql
SELECT sale_ID, sale_date, product_ID, product_name, product_category, unit_price, quantity, seller_name 
FROM sale 
WHERE customer_ID = 'C001';
```

**Résultat :**
| sale_ID | sale_date | product_ID | product_name         | product_category | unit_price | quantity | seller_name    |
|----------|------------|------------|---------------------|-------------------|---------------|----------|----------------|
| 1        | 10/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice |
| 1        | 10/03/2025 | P002       | Souris sans fil     | Périphériques     | 50€           | 2        | Lefebvre Alice |
| 3        | 11/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice |
| 3        | 11/03/2025 | P005       | PC de bureau        | Informatique      | 1200€         | 1        | Lefebvre Alice |

### Version 2NF

```sql
SELECT s.sale_ID, s.sale_date, dv.product_ID, p.product_name, p.product_category, 
       p.unit_price, dv.quantity, vend.seller_name
FROM sale s
JOIN sale_detail dv ON s.sale_ID = dv.sale_ID
JOIN product p ON dv.product_ID = p.product_ID
JOIN seller vend ON s.seller_ID = vend.seller_ID
WHERE s.customer_ID = 'C001';
```

**Résultat :**
| sale_ID | sale_date | product_ID | product_name         | product_category | unit_price | quantity | seller_name    |
|----------|------------|------------|---------------------|-------------------|---------------|----------|----------------|
| 1        | 10/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice |
| 1        | 10/03/2025 | P002       | Souris sans fil     | Périphériques     | 50€           | 2        | Lefebvre Alice |
| 3        | 11/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice |
| 3        | 11/03/2025 | P005       | PC de bureau        | Informatique      | 1200€         | 1        | Lefebvre Alice |

### Version 3NF

```sql
SELECT s.sale_ID, s.sale_date, dv.product_ID, p.product_name, c.category_name, 
       p.unit_price, dv.quantity, vend.seller_name, dept.department_name
FROM sale s
JOIN sale_detail dv ON s.sale_ID = dv.sale_ID
JOIN product p ON dv.product_ID = p.product_ID
JOIN seller vend ON s.seller_ID = vend.seller_ID
JOIN department dept ON vend.department_ID = dept.department_ID
JOIN category c ON p.category_ID = c.category_ID
WHERE s.customer_ID = 'C001';
```

**Résultat :**
| sale_ID | sale_date | product_ID | product_name         | category_name | unit_price | quantity | seller_name    | Nom_Département |
|----------|------------|------------|---------------------|-------------------|---------------|----------|----------------|-----------------|
| 1        | 10/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice | Informatique    |
| 1        | 10/03/2025 | P002       | Souris sans fil     | Périphériques     | 50€           | 2        | Lefebvre Alice | Informatique    |
| 3        | 11/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice | Informatique    |
| 3        | 11/03/2025 | P005       | PC de bureau        | Informatique      | 1200€         | 1        | Lefebvre Alice | Informatique    |

---
### Observations

1. Les **résultats finaux sont identiques visuellement** pour les versions 1NF, 2NF et 3NF, mais la **structure interne est fondamentalement différente**.

2. La complexité des requêtes augmente avec le niveau de normalisation (plus de jointures) mais offre des avantages en termes de:
   - Intégrité des données
   - Réduction de la redondance
   - Facilité de maintenance
   - Cohérence des informations

3. La version non normalisée est la seule qui présente un résultat vraiment différent, avec les données regroupées dans des chaînes de caractères.

Ces requêtes montrent comment accéder aux mêmes informations malgré des structures de données de plus en plus normalisées.

### Version 3NF, resultat initial


Cette requête SQL pour la version 3NF produit un résultat similaire à la version non normalisée (avec les valeurs regroupées en listes) :

```sql
SELECT 
    s.sale_ID,
    s.sale_date,
    GROUP_CONCAT(dv.product_ID ORDER BY dv.product_ID SEPARATOR ', ') AS products,
    GROUP_CONCAT(p.product_name ORDER BY dv.product_ID SEPARATOR ', ') AS products_names,
    GROUP_CONCAT(c.category_name ORDER BY dv.product_ID SEPARATOR ', ') AS products_categories,
    GROUP_CONCAT(CONCAT(p.unit_price, '€') ORDER BY dv.product_ID SEPARATOR ', ') AS unit_prices,
    GROUP_CONCAT(dv.quantity ORDER BY dv.product_ID SEPARATOR ', ') AS quantities,
    vend.seller_name
FROM sale s
JOIN sale_detail dv ON s.sale_ID = dv.sale_ID
JOIN product p ON dv.product_ID = p.product_ID
JOIN category c ON p.category_ID = c.category_ID
JOIN seller vend ON s.seller_ID = vend.seller_ID
WHERE s.customer_ID = 'C001'
GROUP BY s.sale_ID, s.sale_date, vend.seller_name;
```

**Résultat :**
| sale_ID | sale_date | products | products_names                      | products_categories         | unit_prices | quantities | seller_name    |
|----------|------------|------------------|------------------------------------|-----------------------------|----------------|-----------|----------------|
| 1        | 10/03/2025 | P001, P002       | Ordinateur portable, Souris sans fil | Informatique, Périphériques  | 500€, 50€      | 1, 2      | Lefebvre Alice |
| 3        | 11/03/2025 | P001, P005       | Ordinateur portable, PC de bureau   | Informatique, Informatique   | 500€, 1200€    | 1, 1      | Lefebvre Alice |

Cette requête démontre qu'une base de données normalisée peut toujours produire des résultats dans n'importe quel format souhaité, tout en conservant les avantages de structure d'une base normalisée.


---

## Fichier SQL

Voici le [code SQL complet](more/session_4.sql) pour créer la base de données, les tables et insérer les données, en tenant compte de la normalisation jusqu'à la 3NF.

Ce code est loin d'être pret pour la production, il ne couvre pas tous les aspects de la création de tables dans une base de données relationnelle. Il est simplifié pour des raisons pédagogiques et pour faciliter la compréhension des concepts abordés dans cette session.
---

Il est cependant suffisant pour illustrer les concepts de normalisation et de création de tables. Il peut être utilisé comme point de départ pour des exercices plus complexes.

---
> Ce cours est distribué sous **licence Creative Commons**. Toute reproduction ou distribution à but commercial est interdite sans l’accord préalable de l’auteur.

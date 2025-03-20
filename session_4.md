# Normalisation de Bases de Données: 1NF, 2NF, 3NF

## Pourquoi normaliser?

* Éliminer la redondance des données - Éviter de stocker les mêmes informations à plusieurs endroits
* Minimiser les anomalies - Prévenir les incohérences lors des opérations INSERT, UPDATE et DELETE
* Optimiser les performances - Réduire l'espace de stockage et améliorer la vitesse des requêtes
* Améliorer l'intégrité des données - Assurer la cohérence des données
# Exemple progressif de normalisation d'une base de données

## Table initiale non normalisée

Considérons une table `Ventes` pour un magasin qui vend des produits informatiques :

| ID_Vente | Date_Vente | ID_Client | Nom_Client | Email_Client | Téléphone_Client | Produits_Achetés | Noms_Produits | Catégories_Produits | Prix_Unitaires | Quantités | ID_Vendeur | Nom_Vendeur | Département_Vendeur |
|----------|------------|-----------|------------|--------------|------------------|------------------|---------------|---------------------|----------------|-----------|------------|-------------|---------------------|
| 1 | 10/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P001, P002 | Ordinateur portable, Souris sans fil | Informatique, Périphériques | 500€, 50€ | 1, 2 | V001 | Lefebvre Alice | Informatique |
| 2 | 11/03/2025 | C002 | Durand Sophie | durand@email.com | 0234567890 | P002, P003, P004 | Souris sans fil, Casque audio, Clé USB | Périphériques, Audio, Stockage | 50€, 750€, 25€ | 1, 1, 3 | V002 | Moreau Jean | Audio |
| 3 | 11/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P001, P005 | Ordinateur portable, PC de bureau | Informatique, Informatique | 500€, 1200€ | 1, 1 | V001 | Lefebvre Alice | Informatique |

Cette table présente plusieurs problèmes :
- Valeurs multiples dans des colonnes (Produits_Achetés, Prix_Unitaires, Quantités)
- Redondance d'informations (informations client et vendeur répétées)
- Dépendances transitives (ID_Vendeur détermine Nom_Vendeur et Département_Vendeur)

## Première Forme Normale (1NF)

La 1NF exige l'atomicité des données (pas de valeurs multiples dans une colonne).

### Table Ventes (1NF)

| ID_Vente | Date_Vente | ID_Client | Nom_Client | Email_Client | Téléphone_Client | ID_Produit | Nom_Produit | Catégorie_Produit | Prix_Unitaire | Quantité | ID_Vendeur | Nom_Vendeur | Département_Vendeur |
|----------|------------|-----------|------------|--------------|------------------|------------|-------------|-------------------|---------------|----------|------------|-------------|---------------------|
| 1 | 10/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P001 | Ordinateur portable | Informatique | 500€ | 1 | V001 | Lefebvre Alice | Informatique |
| 1 | 10/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P002 | Souris sans fil | Périphériques | 50€ | 2 | V001 | Lefebvre Alice | Informatique |
| 2 | 11/03/2025 | C002 | Durand Sophie | durand@email.com | 0234567890 | P002 | Souris sans fil | Périphériques | 50€ | 1 | V002 | Moreau Jean | Audio |
| 2 | 11/03/2025 | C002 | Durand Sophie | durand@email.com | 0234567890 | P003 | Casque audio | Audio | 750€ | 1 | V002 | Moreau Jean | Audio |
| 2 | 11/03/2025 | C002 | Durand Sophie | durand@email.com | 0234567890 | P004 | Clé USB | Stockage | 25€ | 3 | V002 | Moreau Jean | Audio |
| 3 | 11/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P001 | Ordinateur portable | Informatique | 500€ | 1 | V001 | Lefebvre Alice | Informatique |
| 3 | 11/03/2025 | C001 | Dupont Martin | dupont@email.com | 0123456789 | P005 | PC de bureau | Informatique | 1200€ | 1 | V001 | Lefebvre Alice | Informatique |

Nous avons éliminé les valeurs multiples, mais il reste des redondances. La clé primaire est maintenant composée : (ID_Vente, ID_Produit).

**Note sur la clé primaire :**
---
ID_Client n'est pas inclus dans la clé primaire pour plusieurs raisons techniques et conceptuelles:

* Dépendance fonctionnelle - ID_Client est déterminé par ID_Vente. Pour chaque ID_Vente, il n'y a qu'un seul ID_Client possible. Cette dépendance fonctionnelle (ID_Vente → ID_Client) signifie que ID_Client est un attribut déterminé par une partie de la clé primaire.
* Minimalité de la clé - Une bonne clé primaire doit être minimale. Si (ID_Vente, ID_Produit) suffit déjà à identifier de façon unique chaque ligne, ajouter ID_Client serait redondant et violerait le principe de minimalité.
* Cohérence des données - Un même ID_Vente ne peut être associé qu'à un seul client. Si on incluait ID_Client dans la clé, cela pourrait théoriquement permettre qu'une même vente soit associée à plusieurs clients, ce qui n'a pas de sens dans le modèle métier.
* Conception logique - La clé primaire (ID_Vente, ID_Produit) reflète correctement que chaque ligne représente un produit spécifique dans une vente spécifique, et non pas un produit spécifique acheté par un client spécifique dans une vente spécifique.

En résumé, ID_Client est un attribut descriptif de la vente et non un identifiant de ligne dans le contexte de la 1NF.

## Deuxième Forme Normale (2NF)

La 2NF exige l'élimination des dépendances partielles dans les tables avec des clés primaires composées.

Dans notre cas, plusieurs attributs dépendent uniquement d'une partie de la clé composée (ID_Vente, ID_Produit) :
- Les informations client (Nom_Client, Email_Client, Téléphone_Client) dépendent uniquement de ID_Client
- Les informations vente (Date_Vente, ID_Client, ID_Vendeur) dépendent uniquement de ID_Vente
- Les informations produit (Nom_Produit, Catégorie_Produit, Prix_Unitaire) dépendent uniquement de ID_Produit

### Table Clients (2NF)

| ID_Client | Nom_Client | Email_Client | Téléphone_Client |
|-----------|------------|--------------|------------------|
| C001 | Dupont Martin | dupont@email.com | 0123456789 |
| C002 | Durand Sophie | durand@email.com | 0234567890 |

### Table Ventes (2NF)

| ID_Vente | Date_Vente | ID_Client | ID_Vendeur |
|----------|------------|-----------|------------|
| 1 | 10/03/2025 | C001 | V001 |
| 2 | 11/03/2025 | C002 | V002 |
| 3 | 11/03/2025 | C001 | V001 |

### Table Produits (2NF)

| ID_Produit | Nom_Produit | Catégorie_Produit | Prix_Unitaire |
|------------|-------------|-------------------|---------------|
| P001 | Ordinateur portable | Informatique | 500€ |
| P002 | Souris sans fil | Périphériques | 50€ |
| P003 | Casque audio | Audio | 750€ |
| P004 | Clé USB | Stockage | 25€ |
| P005 | PC de bureau | Informatique | 1200€ |

### Table Détails_Ventes (2NF)

| ID_Vente | ID_Produit | Quantité |
|----------|------------|----------|
| 1 | P001 | 1 |
| 1 | P002 | 2 |
| 2 | P002 | 1 |
| 2 | P003 | 1 |
| 2 | P004 | 3 |
| 3 | P001 | 1 |
| 3 | P005 | 1 |

### Table Vendeurs (2NF)

| ID_Vendeur | Nom_Vendeur | Département_Vendeur |
|------------|-------------|---------------------|
| V001 | Lefebvre Alice | Informatique |
| V002 | Moreau Jean | Audio |

Nous avons éliminé les dépendances partielles. Notez que les informations sur les produits (y compris le prix) ont été extraites dans leur propre table à cette étape, car elles dépendent uniquement de ID_Produit.

## Troisième Forme Normale (3NF)

La 3NF exige l'élimination des dépendances transitives. 

Dans notre schéma 2NF, nous avons déjà placé les informations produit dans une table séparée, donc une grande partie du travail de la 3NF est déjà accomplie. Cependant, nous devons encore examiner d'autres dépendances transitives potentielles.

Il existe une dépendance transitive dans la table Vendeurs : Département_Vendeur pourrait dépendre du département auquel appartient un vendeur, plutôt que directement de l'ID_Vendeur. Pour une normalisation plus poussée, nous pourrions extraire cette information dans une table Départements.

### Table Départements (3NF)

| ID_Département | Nom_Département |
|----------------|-----------------|
| D001 | Informatique |
| D002 | Audio |

### Table Vendeurs (3NF) - Modifiée

| ID_Vendeur | Nom_Vendeur | ID_Département |
|------------|-------------|----------------|
| V001 | Lefebvre Alice | D001 |
| V002 | Moreau Jean | D002 |

### Table Produits (déjà en 3NF)

| ID_Produit | Nom_Produit | Catégorie_Produit | Prix_Unitaire |
|------------|-------------|-------------------|---------------|
| P001 | Ordinateur portable | Informatique | 500€ |
| P002 | Souris sans fil | Périphériques | 50€ |
| P003 | Casque audio | Audio | 750€ |
| P004 | Clé USB | Stockage | 25€ |
| P005 | PC de bureau | Informatique | 1200€ |

### Table Détails_Ventes (déjà en 3NF)

| ID_Vente | ID_Produit | Quantité |
|----------|------------|----------|
| 1 | P001 | 1 |
| 1 | P002 | 2 |
| 2 | P002 | 1 |
| 2 | P003 | 1 |
| 2 | P004 | 3 |
| 3 | P001 | 1 |
| 3 | P005 | 1 |

De même, on pourrait normaliser davantage les catégories de produits si nécessaire.

## Résumé des transformations

1. **Non normalisée → 1NF** : Élimination des valeurs multiples dans les colonnes
   - Chaque cellule contient une seule valeur atomique
   - Expansion des listes de valeurs en plusieurs lignes

2. **1NF → 2NF** : Élimination des dépendances partielles
   - Création de tables distinctes pour les clients, ventes, produits et vendeurs
   - Séparation des données qui dépendent uniquement d'une partie de la clé composée
   - Extraction des informations produit (Nom_Produit, Catégorie_Produit, Prix_Unitaire) dans une table dédiée

3. **2NF → 3NF** : Élimination des dépendances transitives
   - Séparation des données qui dépendent d'attributs non-clés
   - Extraction des informations sur les départements dans une table dédiée
   - Possibilité d'extraire d'autres entités comme les catégories de produits

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

Chaque forme normale résout un type spécifique de problème de redondance et améliore l'intégrité des données.

---
Voici les requêtes SQL adaptées pour obtenir l'historique des achats du client C001 pour chaque version de notre schéma, avec leurs résultats respectifs :

## Version Non Normalisée

```sql
SELECT ID_Vente, Date_Vente, Produits_Achetés, Noms_Produits, Catégories_Produits, 
       Prix_Unitaires, Quantités, Nom_Vendeur
FROM Ventes
WHERE ID_Client = 'C001';
```

**Résultat :**
```
| ID_Vente | Date_Vente | Produits_Achetés | Noms_Produits                      | Catégories_Produits           | Prix_Unitaires | Quantités | Nom_Vendeur    |
|----------|------------|------------------|------------------------------------|---------------------------------|----------------|-----------|----------------|
| 1        | 10/03/2025 | P001, P002       | Ordinateur portable, Souris sans fil | Informatique, Périphériques    | 500€, 50€      | 1, 2      | Lefebvre Alice |
| 3        | 11/03/2025 | P001, P005       | Ordinateur portable, PC de bureau   | Informatique, Informatique     | 500€, 1200€    | 1, 1      | Lefebvre Alice |
```

## Version 1NF

```sql
SELECT ID_Vente, Date_Vente, ID_Produit, Nom_Produit, Catégorie_Produit, Prix_Unitaire, Quantité, Nom_Vendeur 
FROM Ventes 
WHERE ID_Client = 'C001';
```

**Résultat :**
```
| ID_Vente | Date_Vente | ID_Produit | Nom_Produit         | Catégorie_Produit | Prix_Unitaire | Quantité | Nom_Vendeur    |
|----------|------------|------------|---------------------|-------------------|---------------|----------|----------------|
| 1        | 10/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice |
| 1        | 10/03/2025 | P002       | Souris sans fil     | Périphériques     | 50€           | 2        | Lefebvre Alice |
| 3        | 11/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice |
| 3        | 11/03/2025 | P005       | PC de bureau        | Informatique      | 1200€         | 1        | Lefebvre Alice |
```

## Version 2NF

```sql
SELECT v.ID_Vente, v.Date_Vente, dv.ID_Produit, p.Nom_Produit, p.Catégorie_Produit, 
       p.Prix_Unitaire, dv.Quantité, vend.Nom_Vendeur
FROM Ventes v
JOIN Détails_Ventes dv ON v.ID_Vente = dv.ID_Vente
JOIN Produits p ON dv.ID_Produit = p.ID_Produit
JOIN Vendeurs vend ON v.ID_Vendeur = vend.ID_Vendeur
WHERE v.ID_Client = 'C001';
```

**Résultat :**
```
| ID_Vente | Date_Vente | ID_Produit | Nom_Produit         | Catégorie_Produit | Prix_Unitaire | Quantité | Nom_Vendeur    |
|----------|------------|------------|---------------------|-------------------|---------------|----------|----------------|
| 1        | 10/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice |
| 1        | 10/03/2025 | P002       | Souris sans fil     | Périphériques     | 50€           | 2        | Lefebvre Alice |
| 3        | 11/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice |
| 3        | 11/03/2025 | P005       | PC de bureau        | Informatique      | 1200€         | 1        | Lefebvre Alice |
```

## Version 3NF

```sql
SELECT v.ID_Vente, v.Date_Vente, dv.ID_Produit, p.Nom_Produit, p.Catégorie_Produit, 
       p.Prix_Unitaire, dv.Quantité, vend.Nom_Vendeur, dept.Nom_Département
FROM Ventes v
JOIN Détails_Ventes dv ON v.ID_Vente = dv.ID_Vente
JOIN Produits p ON dv.ID_Produit = p.ID_Produit
JOIN Vendeurs vend ON v.ID_Vendeur = vend.ID_Vendeur
JOIN Départements dept ON vend.ID_Département = dept.ID_Département
WHERE v.ID_Client = 'C001';
```

**Résultat :**
```
| ID_Vente | Date_Vente | ID_Produit | Nom_Produit         | Catégorie_Produit | Prix_Unitaire | Quantité | Nom_Vendeur    | Nom_Département |
|----------|------------|------------|---------------------|-------------------|---------------|----------|----------------|-----------------|
| 1        | 10/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice | Informatique    |
| 1        | 10/03/2025 | P002       | Souris sans fil     | Périphériques     | 50€           | 2        | Lefebvre Alice | Informatique    |
| 3        | 11/03/2025 | P001       | Ordinateur portable | Informatique      | 500€          | 1        | Lefebvre Alice | Informatique    |
| 3        | 11/03/2025 | P005       | PC de bureau        | Informatique      | 1200€         | 1        | Lefebvre Alice | Informatique    |
```

**Observations importantes :**

1. Les résultats finaux sont identiques visuellement pour les versions 1NF, 2NF et 3NF, mais la structure interne des tables est fondamentalement différente.

2. La complexité des requêtes augmente avec le niveau de normalisation (plus de jointures) mais offre des avantages en termes de:
   - Intégrité des données
   - Réduction de la redondance
   - Facilité de maintenance
   - Cohérence des informations

3. La version non normalisée est la seule qui présente un résultat vraiment différent, avec les données regroupées dans des chaînes de caractères.

4. Dans la version 3NF, nous avons ajouté une information supplémentaire (Nom_Département) qui n'était pas disponible directement dans les versions précédentes.

Ces requêtes montrent comment accéder aux mêmes informations malgré des structures de données de plus en plus normalisées.

---

## Version 3NF, sous forme non normalisée

Voici la requête SQL pour la version 3NF qui produit un résultat similaire à la version non normalisée (avec les valeurs regroupées en listes) :

```sql
SELECT 
    MIN(v.ID_Vente) AS ID_Vente,
    MIN(v.Date_Vente) AS Date_Vente,
    GROUP_CONCAT(dv.ID_Produit ORDER BY dv.ID_Produit SEPARATOR ', ') AS Produits_Achetés,
    GROUP_CONCAT(p.Nom_Produit ORDER BY dv.ID_Produit SEPARATOR ', ') AS Noms_Produits,
    GROUP_CONCAT(p.Catégorie_Produit ORDER BY dv.ID_Produit SEPARATOR ', ') AS Catégories_Produits,
    GROUP_CONCAT(p.Prix_Unitaire ORDER BY dv.ID_Produit SEPARATOR ', ') AS Prix_Unitaires,
    GROUP_CONCAT(dv.Quantité ORDER BY dv.ID_Produit SEPARATOR ', ') AS Quantités,
    MIN(vend.Nom_Vendeur) AS Nom_Vendeur
FROM Ventes v
JOIN Détails_Ventes dv ON v.ID_Vente = dv.ID_Vente
JOIN Produits p ON dv.ID_Produit = p.ID_Produit
JOIN Vendeurs vend ON v.ID_Vendeur = vend.ID_Vendeur
JOIN Départements dept ON vend.ID_Département = dept.ID_Département
WHERE v.ID_Client = 'C001'
GROUP BY v.ID_Vente;
```

**Résultat :**
```
| ID_Vente | Date_Vente | Produits_Achetés | Noms_Produits                      | Catégories_Produits         | Prix_Unitaires | Quantités | Nom_Vendeur    |
|----------|------------|------------------|------------------------------------|-----------------------------|----------------|-----------|----------------|
| 1        | 10/03/2025 | P001, P002       | Ordinateur portable, Souris sans fil | Informatique, Périphériques  | 500€, 50€      | 1, 2      | Lefebvre Alice |
| 3        | 11/03/2025 | P001, P005       | Ordinateur portable, PC de bureau   | Informatique, Informatique   | 500€, 1200€    | 1, 1      | Lefebvre Alice |
```

**Explications :**

1. La fonction `GROUP_CONCAT()` (disponible dans MySQL, MariaDB et SQLite) est utilisée pour concaténer plusieurs valeurs en une seule chaîne de caractères séparées par des virgules

2. `GROUP BY v.ID_Vente` regroupe les résultats par vente

3. Pour les champs comme ID_Vente, Date_Vente et Nom_Vendeur qui ont la même valeur pour tous les produits d'une vente, j'utilise les fonctions d'agrégation MIN() ou MAX() - les deux donneraient le même résultat dans ce cas. 
(Lorsqu'on utilise une clause GROUP BY dans une requête SQL, toutes les colonnes sélectionnées doivent soit etre incluses dans la clause GROUP BY, soit etre agrégées par une fonction comme SUM(), COUNT(), AVG(), MIN(), MAX(), etc.)

4. `ORDER BY dv.ID_Produit` dans les GROUP_CONCAT assure que les produits sont toujours listés dans le même ordre

Cette requête démontre qu'une base de données normalisée peut toujours produire des résultats dans n'importe quel format souhaité, tout en conservant les avantages de structure d'une base normalisée.
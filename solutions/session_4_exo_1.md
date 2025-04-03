# Procédure pour convertir l'exercice 1 (Librairie) en 1NF

## Rappel des données initiales

| ID_Commande | Date_Commande | Client_Nom | Client_Email | Client_Téléphones | Livres_Commandés | Prix_Unitaires |
|-------------|---------------|------------|--------------|-------------------|------------------|----------------|
| C001 | 15/03/2025 | Dupont Jean | dupont@email.com | 0612345678, 0156789012 | "Le Petit Prince (ISBN: 978-2-07-040850-4), L'Étranger (ISBN: 978-2-07-036002-4)" | "12.50, 9.90" |
| C002 | 18/03/2025 | Martin Sophie | smartin@email.com | 0723456789 | "1984 (ISBN: 978-2-07-036822-8)" | "11.20" |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com | 0634567890, 0145678923 | "Harry Potter T1 (ISBN: 978-2-07-054090-1), Le Seigneur des Anneaux (ISBN: 978-2-266-28536-9), Dune (ISBN: 978-2-266-23336-1)" | "15.50, 25.90, 13.40" |

## Identification des violations de la 1NF

Pour être en 1NF, les valeurs des attributs doivent être atomiques (pas de valeurs multiples dans une cellule)

Dans notre table, nous avons trois attributs non-atomiques :
- `Client_Téléphones` contient plusieurs numéros de téléphone
- `Livres_Commandés` contient plusieurs livres
- `Prix_Unitaires` contient plusieurs prix

## Conversion en 1NF

La transformation des données initiales en Première Forme Normale (1NF) suit une logique précise basée sur les principes fondamentaux de normalisation des bases de données.

Dans les données originales, plusieurs colonnes contenaient des valeurs multiples :
- `Client_Téléphones` stockait plusieurs numéros séparés par des virgules
- `Livres_Commandés` contenait plusieurs titres de livres avec leurs ISBN
- `Prix_Unitaires` comportait plusieurs prix correspondant aux livres

Pour respecter la 1NF, chaque attribut doit être atomique, c'est-à-dire qu'il ne peut contenir qu'une seule valeur indivisible. J'ai donc :

1. Décomposé chaque valeur multiple en lignes individuelles, créant ainsi une entrée distincte pour chaque combinaison de téléphone et de livre.

2. Établi une clé primaire composite avec `ID_Commande`, `Client_Telephone` et `Livre_ISBN` pour garantir l'unicité de chaque ligne.

3. Préservé toutes les informations d'origine sans créer de tables supplémentaires, en acceptant une certaine redondance.

Cette transformation garantit que :
- Chaque intersection ligne-colonne contient exactement une valeur
- Toutes les colonnes contiennent des valeurs du même type
- Chaque ligne est unique grâce à la clé primaire composite
- Toutes les informations d'origine sont conservées

Cette approche permet de manipuler facilement les données avec des requêtes SQL standard sans avoir à gérer des opérations complexes sur des chaînes de caractères contenant des valeurs multiples.


## Resultat final en 1NF

| ID_Commande | Date_Commande | Client_Nom | Client_Email | Client_Telephone | Livre_ISBN | Livre_Titre | Prix_Unitaire |
|-------------|---------------|------------|--------------|-----------------|------------|-------------|---------------|
| C001 | 15/03/2025 | Dupont Jean | dupont@email.com | 0612345678 | 978-2-07-040850-4 | Le Petit Prince | 12.50 |
| C001 | 15/03/2025 | Dupont Jean | dupont@email.com | 0612345678 | 978-2-07-036002-4 | L'Étranger | 9.90 |
| C001 | 15/03/2025 | Dupont Jean | dupont@email.com | 0156789012 | 978-2-07-040850-4 | Le Petit Prince | 12.50 |
| C001 | 15/03/2025 | Dupont Jean | dupont@email.com | 0156789012 | 978-2-07-036002-4 | L'Étranger | 9.90 |
| C002 | 18/03/2025 | Martin Sophie | smartin@email.com | 0723456789 | 978-2-07-036822-8 | 1984 | 11.20 |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com | 0634567890 | 978-2-07-054090-1 | Harry Potter T1 | 15.50 |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com | 0634567890 | 978-2-266-28536-9 | Le Seigneur des Anneaux | 25.90 |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com | 0634567890 | 978-2-266-23336-1 | Dune | 13.40 |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com | 0145678923 | 978-2-07-054090-1 | Harry Potter T1 | 15.50 |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com | 0145678923 | 978-2-266-28536-9 | Le Seigneur des Anneaux | 25.90 |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com | 0145678923 | 978-2-266-23336-1 | Dune | 13.40 |



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


---

# Analyse complète de normalisation 2NF

## Violations de la 2NF

Pour être en 2NF, une relation doit:
1. Être en 1NF (déjà satisfait)
2. Ne pas avoir de dépendances partielles (attributs non-clés qui dépendent d'une partie seulement de la clé primaire)

La table originale a une clé primaire composite qui semble être (ID_Commande, Client_Email, Client_Telephone, Livre_ISBN).

Les violations 2NF identifiées sont:

1. **Date_Commande** dépend uniquement de **ID_Commande** (partie de la clé)
2. **Client_Nom** dépend uniquement de **Client_Email** (partie de la clé)
3. **Livre_Titre** et **Prix_Unitaire** dépendent uniquement de **Livre_ISBN** (partie de la clé)

---

## Solution: Décomposition en 2NF sans AIPK

Pour résoudre ces violations, nous décomposons la table en plusieurs tables en utilisant les clés naturelles existantes, sans introduire d'identifiants artificiels.

# Tables normalisées en 2NF

### Table Commandes
| ID_Commande (PK) | Date_Commande | Client_Email (FK) |
|------------------|---------------|-------------------|
| C001 | 15/03/2025 | dupont@email.com |
| C002 | 18/03/2025 | smartin@email.com |
| C003 | 20/03/2025 | mdubois@email.com |

### Table Clients
| Client_Email (PK) | Client_Nom |
|-------------------|------------|
| dupont@email.com | Dupont Jean |
| smartin@email.com | Martin Sophie |
| mdubois@email.com | Dubois Marie |

### Table Téléphones_Clients
| Client_Email (FK) | Client_Telephone |
|-------------------|-----------------|
| dupont@email.com | 0612345678 |
| dupont@email.com | 0156789012 |
| smartin@email.com | 0723456789 |
| mdubois@email.com | 0634567890 |
| mdubois@email.com | 0145678923 |

### Table Livres
| Livre_ISBN (PK) | Livre_Titre | Prix_Unitaire |
|-----------------|-------------|---------------|
| 978-2-07-040850-4 | Le Petit Prince | 12.50 |
| 978-2-07-036002-4 | L'Étranger | 9.90 |
| 978-2-07-036822-8 | 1984 | 11.20 |
| 978-2-07-054090-1 | Harry Potter T1 | 15.50 |
| 978-2-266-28536-9 | Le Seigneur des Anneaux | 25.90 |
| 978-2-266-23336-1 | Dune | 13.40 |

### Table Lignes_Commande
| ID_Commande (FK) | Livre_ISBN (FK) |
|------------------|----------------|
| C001 | 978-2-07-040850-4 |
| C001 | 978-2-07-036002-4 |
| C002 | 978-2-07-036822-8 |
| C003 | 978-2-07-054090-1 |
| C003 | 978-2-266-28536-9 |
| C003 | 978-2-266-23336-1 |


## Remarques
1. La clé primaire de la table Téléphones_Clients est la combinaison (Client_Email, Client_Telephone)
2. La clé primaire de la table Lignes_Commande est la combinaison (ID_Commande, Livre_ISBN)
3. Client_Email a été correctement déplacé vers la table Commandes pour éviter la violation 3NF précédemment identifiée
4. Toutes les dépendances partielles ont été éliminées, rendant les tables conformes à la 2NF

--- 

## Solution: Décomposition en 2NF avec AIPK

Pour résoudre ces violations, nous décomposons la table en plusieurs tables et introduisons un identifiant artificiel auto-incrémenté (AIPK) pour les clients.

### Table Commandes
| ID_Commande (PK) | Date_Commande |
|------------------|---------------|
| C001 | 15/03/2025 |
| C002 | 18/03/2025 |
| C003 | 20/03/2025 |

### Table Clients
| ID_Client (PK) | Client_Email | Client_Nom |
|----------------|--------------|------------|
| 1 | dupont@email.com | Dupont Jean |
| 2 | smartin@email.com | Martin Sophie |
| 3 | mdubois@email.com | Dubois Marie |

### Table Téléphones_Clients
| ID (PK) | ID_Client (FK) | Client_Telephone |
|---------|----------------|-----------------|
| 1 | 1 | 0612345678 |
| 2 | 1 | 0156789012 |
| 3 | 2 | 0723456789 |
| 4 | 3 | 0634567890 |
| 5 | 3 | 0145678923 |

### Table Livres
| Livre_ISBN (PK) | Livre_Titre | Prix_Unitaire |
|-----------------|-------------|---------------|
| 978-2-07-040850-4 | Le Petit Prince | 12.50 |
| 978-2-07-036002-4 | L'Étranger | 9.90 |
| 978-2-07-036822-8 | 1984 | 11.20 |
| 978-2-07-054090-1 | Harry Potter T1 | 15.50 |
| 978-2-266-28536-9 | Le Seigneur des Anneaux | 25.90 |
| 978-2-266-23336-1 | Dune | 13.40 |

### Table Lignes_Commande
| ID_Ligne (PK) | ID_Commande (FK) | ID_Client (FK) | Livre_ISBN (FK) |
|---------------|------------------|----------------|-----------------|
| 1 | C001 | 1 | 978-2-07-040850-4 |
| 2 | C001 | 1 | 978-2-07-036002-4 |
| 3 | C002 | 2 | 978-2-07-036822-8 |
| 4 | C003 | 3 | 978-2-07-054090-1 |
| 5 | C003 | 3 | 978-2-266-28536-9 |
| 6 | C003 | 3 | 978-2-266-23336-1 |

## Avantages de cette solution

1. **Élimination des dépendances partielles**: Chaque attribut dans chaque table dépend désormais de la clé complète de la table.

2. **Réduction de la redondance**: Les informations sur les clients, les livres et les commandes ne sont stockées qu'une seule fois.

3. **Intégrité référentielle**: L'utilisation d'un ID_Client comme clé primaire et étrangère renforce l'intégrité des données.

4. **Meilleure maintenance**: Les changements d'informations (comme l'email d'un client) n'ont besoin d'être effectués qu'à un seul endroit.

5. **Performances améliorées**: Les clés primaires numériques offrent de meilleures performances d'indexation que les longues chaînes de caractères comme les emails.

Cette structure satisfait pleinement les exigences de la 2NF tout en offrant une conception de base de données robuste et efficace.
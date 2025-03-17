# Procédure pour convertir l'exercice 1 (Librairie) en 1NF

## Rappel des données initiales

| ID_Commande | Date_Commande | Client_Nom | Client_Email | Client_Téléphones | Livres_Commandés | Prix_Unitaires |
|-------------|---------------|------------|--------------|-------------------|------------------|----------------|
| C001 | 15/03/2025 | Dupont Jean | dupont@email.com | 0612345678, 0156789012 | "Le Petit Prince (ISBN: 978-2-07-040850-4), L'Étranger (ISBN: 978-2-07-036002-4)" | "12.50, 9.90" |
| C002 | 18/03/2025 | Martin Sophie | smartin@email.com | 0723456789 | "1984 (ISBN: 978-2-07-036822-8)" | "11.20" |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com | 0634567890, 0145678923 | "Harry Potter T1 (ISBN: 978-2-07-054090-1), Le Seigneur des Anneaux (ISBN: 978-2-266-28536-9), Dune (ISBN: 978-2-266-23336-1)" | "15.50, 25.90, 13.40" |

## Identification des violations de la 1NF

Pour être en 1NF, une relation doit satisfaire ces conditions :
1. Les attributs doivent être atomiques (pas de valeurs multiples dans une cellule)
2. Chaque enregistrement doit être unique (identifiable par une clé)

Dans notre table, nous avons trois attributs non-atomiques :
- `Client_Téléphones` contient plusieurs numéros de téléphone
- `Livres_Commandés` contient plusieurs livres
- `Prix_Unitaires` contient plusieurs prix

## Procédure de conversion en 1NF

### Étape 1 : Éliminer l'attribut multivalué `Client_Téléphones`

Créons une table séparée pour les téléphones des clients :

**Table Commande**

| ID_Commande | Date_Commande | Client_Nom | Client_Email |
|-------------|---------------|------------|--------------|
| C001 | 15/03/2025 | Dupont Jean | dupont@email.com |
| C002 | 18/03/2025 | Martin Sophie | smartin@email.com |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com |

**Table Téléphone_Client**

| ID_Commande | Téléphone |
|-------------|-----------|
| C001 | 0612345678 |
| C001 | 0156789012 |
| C002 | 0723456789 |
| C003 | 0634567890 |
| C003 | 0145678923 |

### Étape 2 : Éliminer les attributs multivalués `Livres_Commandés` et `Prix_Unitaires`

Comme les livres et leurs prix correspondants sont liés, nous devons les traiter ensemble. Créons une table de détail pour les livres commandés :

**Table Détail_Commande**

| ID_Commande | ISBN | Titre_Livre | Prix_Unitaire |
|-------------|------|-------------|---------------|
| C001 | 978-2-07-040850-4 | Le Petit Prince | 12.50 |
| C001 | 978-2-07-036002-4 | L'Étranger | 9.90 |
| C002 | 978-2-07-036822-8 | 1984 | 11.20 |
| C003 | 978-2-07-054090-1 | Harry Potter T1 | 15.50 |
| C003 | 978-2-266-28536-9 | Le Seigneur des Anneaux | 25.90 |
| C003 | 978-2-266-23336-1 | Dune | 13.40 |

### Étape 3 : Définir les clés primaires

Pour finaliser notre conversion en 1NF, définissons clairement les clés primaires :

- Dans la table **Commande**, la clé primaire est `ID_Commande`
- Dans la table **Téléphone_Client**, la clé primaire est la combinaison (`ID_Commande`, `Téléphone`)
- Dans la table **Détail_Commande**, la clé primaire est la combinaison (`ID_Commande`, `ISBN`)

## Résultat final en 1NF

**Table Commande**

| ID_Commande (PK) | Date_Commande | Client_Nom | Client_Email |
|------------------|---------------|------------|--------------|
| C001 | 15/03/2025 | Dupont Jean | dupont@email.com |
| C002 | 18/03/2025 | Martin Sophie | smartin@email.com |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com |

**Table Téléphone_Client**

| ID_Commande (PK) | Téléphone (PK) |
|------------------|----------------|
| C001 | 0612345678 |
| C001 | 0156789012 |
| C002 | 0723456789 |
| C003 | 0634567890 |
| C003 | 0145678923 |

**Table Détail_Commande**

| ID_Commande (PK) | ISBN (PK) | Titre_Livre | Prix_Unitaire |
|------------------|------------|-------------|---------------|
| C001 | 978-2-07-040850-4 | Le Petit Prince | 12.50 |
| C001 | 978-2-07-036002-4 | L'Étranger | 9.90 |
| C002 | 978-2-07-036822-8 | 1984 | 11.20 |
| C003 | 978-2-07-054090-1 | Harry Potter T1 | 15.50 |
| C003 | 978-2-266-28536-9 | Le Seigneur des Anneaux | 25.90 |
| C003 | 978-2-266-23336-1 | Dune | 13.40 |

La structure est maintenant en 1NF car :
1. Tous les attributs sont atomiques (une seule valeur par cellule)
2. Chaque table a une clé primaire clairement définie
3. Il n'y a plus d'attributs multivalués




---


# Procédure pour convertir l'exercice 1 (Librairie) en 2NF


## Identification des violations de la 2NF

Pour être en 2NF, une relation doit :
1. Être en 1NF
2. Ne pas avoir de dépendances fonctionnelles partielles (c'est-à-dire qu'aucun attribut non-clé ne doit dépendre d'une partie seulement de la clé primaire)

Analysons nos tables pour identifier les dépendances partielles :

1. **Table Commande** : La clé primaire est simple (`ID_Commande`), donc elle est automatiquement en 2NF.

2. **Table Téléphone_Client** : La clé primaire est composite (`ID_Commande`, `Téléphone`), mais il n'y a pas d'autres attributs non-clés, donc elle est automatiquement en 2NF.

3. **Table Détail_Commande** : La clé primaire est composite (`ID_Commande`, `ISBN`), et nous avons deux attributs non-clés:
   - `Titre_Livre` dépend uniquement de `ISBN` (et non de la clé complète)
   - `Prix_Unitaire` dépend uniquement de `ISBN` (et non de la clé complète)
   
   Ces dépendances partielles violent les principes de la 2NF.

## Procédure de conversion en 2NF

### Étape 1 : Décomposer la table Détail_Commande

Pour éliminer les dépendances partielles dans la table Détail_Commande, nous allons la décomposer en deux tables :

**Table Livre**

| ISBN (PK) | Titre_Livre | Prix_Unitaire |
|-----------|-------------|---------------|
| 978-2-07-040850-4 | Le Petit Prince | 12.50 |
| 978-2-07-036002-4 | L'Étranger | 9.90 |
| 978-2-07-036822-8 | 1984 | 11.20 |
| 978-2-07-054090-1 | Harry Potter T1 | 15.50 |
| 978-2-266-28536-9 | Le Seigneur des Anneaux | 25.90 |
| 978-2-266-23336-1 | Dune | 13.40 |

**Table Commande_Livre** (relation entre commandes et livres)

| ID_Commande (PK) | ISBN (PK) |
|------------------|-----------|
| C001 | 978-2-07-040850-4 |
| C001 | 978-2-07-036002-4 |
| C002 | 978-2-07-036822-8 |
| C003 | 978-2-07-054090-1 |
| C003 | 978-2-266-28536-9 |
| C003 | 978-2-266-23336-1 |

### Étape 2 : Vérification des relations

Maintenant, vérifions que toutes nos tables sont en 2NF :

1. **Table Commande** : En 2NF (clé primaire simple)
2. **Table Téléphone_Client** : En 2NF (aucun attribut non-clé)
3. **Table Livre** : En 2NF (clé primaire simple)
4. **Table Commande_Livre** : En 2NF (aucun attribut non-clé)

## Résultat final en 2NF

**Table Commande**

| ID_Commande (PK) | Date_Commande | Client_Nom | Client_Email |
|------------------|---------------|------------|--------------|
| C001 | 15/03/2025 | Dupont Jean | dupont@email.com |
| C002 | 18/03/2025 | Martin Sophie | smartin@email.com |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com |

**Table Téléphone_Client**

| ID_Commande (PK) | Téléphone (PK) |
|------------------|----------------|
| C001 | 0612345678 |
| C001 | 0156789012 |
| C002 | 0723456789 |
| C003 | 0634567890 |
| C003 | 0145678923 |

**Table Livre**

| ISBN (PK) | Titre_Livre | Prix_Unitaire |
|-----------|-------------|---------------|
| 978-2-07-040850-4 | Le Petit Prince | 12.50 |
| 978-2-07-036002-4 | L'Étranger | 9.90 |
| 978-2-07-036822-8 | 1984 | 11.20 |
| 978-2-07-054090-1 | Harry Potter T1 | 15.50 |
| 978-2-266-28536-9 | Le Seigneur des Anneaux | 25.90 |
| 978-2-266-23336-1 | Dune | 13.40 |

**Table Commande_Livre**

| ID_Commande (PK, FK) | ISBN (PK, FK) |
|----------------------|---------------|
| C001 | 978-2-07-040850-4 |
| C001 | 978-2-07-036002-4 |
| C002 | 978-2-07-036822-8 |
| C003 | 978-2-07-054090-1 |
| C003 | 978-2-266-28536-9 |
| C003 | 978-2-266-23336-1 |

La structure est maintenant en 2NF car :
1. Toutes les tables sont en 1NF
2. Aucun attribut non-clé ne dépend d'une partie seulement de la clé primaire
3. Les dépendances fonctionnelles partielles ont été éliminées



---


# Procédure pour convertir l'exercice 1 (Librairie) en 3NF

## Identification des violations de la 3NF

Pour être en 3NF, une relation doit :
1. Être en 2NF
2. Ne pas avoir de dépendances transitives (c'est-à-dire qu'aucun attribut non-clé ne doit dépendre d'un autre attribut non-clé)

Analysons nos tables pour identifier les dépendances transitives :

1. **Table Commande** : Examinons les attributs non-clés :
   - `Date_Commande` dépend directement de `ID_Commande`
   - `Client_Nom` dépend directement de `ID_Commande`
   - `Client_Email` dépend directement de `ID_Commande`

   Cependant, il y a une dépendance fonctionnelle entre `Client_Nom` et `Client_Email` qui ne dépend pas directement de la clé. Ces informations client devraient être dans une table séparée.

2. **Table Téléphone_Client** : Pas d'attributs non-clés, donc pas de dépendances transitives.

3. **Table Livre** : Pas de dépendances transitives identifiables. Les attributs non-clés dépendent directement de la clé primaire `ISBN`.

4. **Table Commande_Livre** : Pas d'attributs non-clés, donc pas de dépendances transitives.

## Procédure de conversion en 3NF

La dépendance transitive:

Dans la table Commande en 2NF, nous avons identifié que Client_Email et Client_Nom dépendent du concept de client, plutôt que directement de la clé primaire ID_Commande
Cette structure crée une dépendance conceptuelle qui ne respecte pas la 3NF

Les problèmes causés:

- Redondance des données client à travers plusieurs commandes
- Risque d'incohérence lors des mises à jour
- Anomalies potentielles d'insertion et de suppression

La solution en 3NF:

- Création d'une table Client séparée (ID_Client, Nom_Client, Email_Client)
- Modification de la table Commande pour ne conserver que ID_Commande, Date_Commande et ID_Client (FK)
- Établissement d'une relation entre les tables via la clé étrangère ID_Client

### Étape 1 : Décomposer la table Commande pour éliminer les dépendances transitives

Nous allons séparer les informations du client de la table Commande :

**Table Client** (nouvelle)

| ID_Client (PK) | Nom_Client | Email_Client |
|----------------|------------|--------------|
| C001 | Dupont Jean | dupont@email.com |
| C002 | Martin Sophie | smartin@email.com |
| C003 | Dubois Marie | mdubois@email.com |

**Table Commande** (modifiée)

| ID_Commande (PK) | Date_Commande | ID_Client (FK) |
|------------------|---------------|----------------|
| C001 | 15/03/2025 | C001 |
| C002 | 18/03/2025 | C002 |
| C003 | 20/03/2025 | C003 |

### Étape 2 : Modifier la table Téléphone_Client pour référencer ID_Client

La table Téléphone_Client devrait maintenant être liée à la table Client plutôt qu'à la table Commande :

**Table Téléphone_Client** (modifiée)

| ID_Client (PK, FK) | Téléphone (PK) |
|--------------------|----------------|
| C001 | 0612345678 |
| C001 | 0156789012 |
| C002 | 0723456789 |
| C003 | 0634567890 |
| C003 | 0145678923 |

### Étape 3 : Vérification des relations

Maintenant, vérifions que toutes nos tables sont en 3NF :

1. **Table Client** : En 3NF (pas de dépendances transitives)
2. **Table Commande** : En 3NF (pas de dépendances transitives)
3. **Table Téléphone_Client** : En 3NF (aucun attribut non-clé)
4. **Table Livre** : En 3NF (pas de dépendances transitives)
5. **Table Commande_Livre** : En 3NF (aucun attribut non-clé)

## Résultat final en 3NF

**Table Client**

| ID_Client (PK) | Nom_Client | Email_Client |
|----------------|------------|--------------|
| C001 | Dupont Jean | dupont@email.com |
| C002 | Martin Sophie | smartin@email.com |
| C003 | Dubois Marie | mdubois@email.com |

**Table Téléphone_Client**

| ID_Client (PK, FK) | Téléphone (PK) |
|--------------------|----------------|
| C001 | 0612345678 |
| C001 | 0156789012 |
| C002 | 0723456789 |
| C003 | 0634567890 |
| C003 | 0145678923 |

**Table Commande**

| ID_Commande (PK) | Date_Commande | ID_Client (FK) |
|------------------|---------------|----------------|
| C001 | 15/03/2025 | C001 |
| C002 | 18/03/2025 | C002 |
| C003 | 20/03/2025 | C003 |

**Table Livre**

| ISBN (PK) | Titre_Livre | Prix_Unitaire |
|-----------|-------------|---------------|
| 978-2-07-040850-4 | Le Petit Prince | 12.50 |
| 978-2-07-036002-4 | L'Étranger | 9.90 |
| 978-2-07-036822-8 | 1984 | 11.20 |
| 978-2-07-054090-1 | Harry Potter T1 | 15.50 |
| 978-2-266-28536-9 | Le Seigneur des Anneaux | 25.90 |
| 978-2-266-23336-1 | Dune | 13.40 |

**Table Commande_Livre**

| ID_Commande (PK, FK) | ISBN (PK, FK) |
|----------------------|---------------|
| C001 | 978-2-07-040850-4 |
| C001 | 978-2-07-036002-4 |
| C002 | 978-2-07-036822-8 |
| C003 | 978-2-07-054090-1 |
| C003 | 978-2-266-28536-9 |
| C003 | 978-2-266-23336-1 |

## Schéma des relations entre tables

```
Client (ID_Client, Nom_Client, Email_Client)
    |
    |--- Téléphone_Client (ID_Client, Téléphone)
    |
    |--- Commande (ID_Commande, Date_Commande, ID_Client)
            |
            |--- Commande_Livre (ID_Commande, ISBN)
                      |
                      |--- Livre (ISBN, Titre_Livre, Prix_Unitaire)
```

La structure est maintenant en 3NF car :
1. Toutes les tables sont en 2NF
2. Aucun attribut non-clé ne dépend d'un autre attribut non-clé
3. Les dépendances transitives ont été éliminées
4. Chaque attribut non-clé dépend directement de la clé primaire de sa table
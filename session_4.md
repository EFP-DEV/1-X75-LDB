# Normalisation de Bases de Données: 1NF, 2NF, 3NF

## Pourquoi normaliser?

* Éliminer la redondance des données - Éviter de stocker les mêmes informations à plusieurs endroits
* Minimiser les anomalies - Prévenir les incohérences lors des opérations INSERT, UPDATE et DELETE
* Optimiser les performances - Réduire l'espace de stockage et améliorer la vitesse des requêtes
* Améliorer l'intégrité des données - Assurer la cohérence des données

## Exemple de données non normalisées

Voici les données pour la table non normalisée Films_Sessions_Ventes


| id_film | titre_film       | genre_film      | réalisateur_film                         | année_sortie | id_salle | nom_salle      | capacité_salle | adresse_salle                              | id_session | date_heure           | tarif_normal | nom_client     | email_client              | nombre_billets | prix_total |
|---------|------------------|-----------------|------------------------------------------|--------------|----------|----------------|----------------|-------------------------------------------|------------|----------------------|--------------|----------------|---------------------------|----------------|------------|
| F001    | Interstellar     | Science-Fiction | Christopher Nolan                        | 2014         | S01      | Grand Rex      | 500            | 1 Boulevard Poissonnière, 75002 Paris     | SESS0101   | 2023-05-15 20:00:00  | 12.50        | Martin Dupont  | martin.dupont@email.com   | 2              | 25.00      |
| F001    | Interstellar     | Science-Fiction | Christopher Nolan                        | 2014         | S01      | Grand Rex      | 500            | 1 Boulevard Poissonnière, 75002 Paris     | SESS0101   | 2023-05-15 20:00:00  | 12.50        | Sophie Durand  | sophie.durand@email.com   | 3              | 37.50      |
| F002    | Le Parrain       | Drame          | Francis Ford Coppola                     | 1972         | S01      | Grand Rex      | 500            | 1 Boulevard Poissonnière, 75002 Paris     | SESS0103   | 2023-05-17 18:45:00  | 12.50        | Paul Lefebvre  | paul.lefebvre@email.com   | 2              | 25.00      |
| F003    | Pulp Fiction     | Thriller       | Quentin Tarantino                        | 1994         | S02      | Cinéma Lumière | 300            | 20 Rue du Cinéma, 69002 Lyon              | SESS0202   | 2023-05-19 21:15:00  | 11.00        | Thomas Bernard | thomas.bernard@email.com  | 2              | 22.00      |
| F004    | Matrix           | Science-Fiction | Lana Wachowski, Lilly Wachowski         | 1999         | S03      | Ciné Palace    | 200            | 5 Avenue des Arts, 13001 Marseille        | SESS0303   | 2023-05-21 16:45:00  | 9.50         | Julie Robert   | julie.robert@email.com    | 2              | 19.00      |
| F005    | Cloud Atlas      | Science-Fiction | Tom Tykwer, Lana Wachowski, Lilly Wachowski | 2012      | S02      | Cinéma Lumière | 300            | 20 Rue du Cinéma, 69002 Lyon              | SESS0204   | 2023-05-22 18:30:00  | 11.00        | Marc Leblanc   | marc.leblanc@email.com    | 1              | 11.00      |
| F005    | Cloud Atlas      | Science-Fiction | Tom Tykwer, Lana Wachowski, Lilly Wachowski | 2012      | S01      | Grand Rex      | 500            | 1 Boulevard Poissonnière, 75002 Paris     | SESS0105   | 2023-05-23 20:15:00  | 12.50        | Céline Petit   | celine.petit@email.com    | 3              | 37.50      |
| F006    | Toy Story        | Animation      | John Lasseter                            | 1995         | S03      | Ciné Palace    | 200            | 5 Avenue des Arts, 13001 Marseille        | SESS0304   | 2023-05-24 14:00:00  | 9.50         | David Martin   | david.martin@email.com    | 4              | 38.00      |
| F007    | Good Omens       | Comédie, Fantastique | Douglas Mackinnon                  | 2019         | S01      | Grand Rex      | 500            | 1 Boulevard Poissonnière, 75002 Paris     | SESS0106   | 2023-05-25 19:30:00  | 12.50        | Marie Dumont   | marie.dumont@email.com    | 2              | 25.00      |


## Infractions à la première forme normale (1NF)

La table Films_Sessions_Ventes présente plusieurs infractions à la première forme normale (1NF):

1. Valeurs multiples dans une cellule:
   - La colonne "genre_film" contient des valeurs multiples séparées par des virgules (ex: "Comédie, Fantastique" pour "Good Omens").
   - La colonne "réalisateur_film" contient parfois plusieurs réalisateurs (ex: "Tom Tykwer, Lana Wachowski, Lilly Wachowski").

2. Données répétitives:
   - Les informations sur les films (titre, genre, réalisateur, année) sont répétées plusieurs fois.
   - Les informations sur les salles (nom, capacité, adresse) sont répétées.
   - Les informations sur les sessions (date_heure, tarif) sont répétées.

3. Dépendances partielles:
   - Les informations sur les films dépendent uniquement de id_film.
   - Les informations sur les salles dépendent uniquement de id_salle.
   - Les informations sur les sessions dépendent de id_session.

4. Les adresses ne sont pas atomiques


## Solutions 1NF# Résolution des infractions à la 1NF

Pour résoudre les infractions à la première forme normale (1NF), je vais décomposer la table `Films_Sessions_Ventes` en plusieurs tables avec des données atomiques.

## Procédure de normalisation

1. **Division de la table d'origine** en tables distinctes:
   - Table Films
   - Table Genres (pour gérer les valeurs multiples de genre)
   - Table Réalisateurs (pour gérer les valeurs multiples de réalisateurs)
   - Table Salles
   - Table Sessions
   - Table Ventes

2. **Décomposition des adresses** en composants atomiques

3. **Création de tables de liaison** pour gérer les relations many-to-many:
   - Table Film_Genre
   - Table Film_Réalisateur

## Tables résultantes

### Table Films
```markdown
| id_film | titre_film       | année_sortie |
|---------|------------------|--------------|
| F001    | Interstellar     | 2014         |
| F002    | Le Parrain       | 1972         |
| F003    | Pulp Fiction     | 1994         |
| F004    | Matrix           | 1999         |
| F005    | Cloud Atlas      | 2012         |
| F006    | Toy Story        | 1995         |
| F007    | Good Omens       | 2019         |
```

### Table Genres
```markdown
| id_genre | nom_genre      |
|----------|----------------|
| G01      | Science-Fiction|
| G02      | Drame          |
| G03      | Thriller       |
| G04      | Animation      |
| G05      | Comédie        |
| G06      | Fantastique    |
```

### Table Film_Genre (relation many-to-many)
```markdown
| id_film | id_genre |
|---------|----------|
| F001    | G01      |
| F002    | G02      |
| F003    | G03      |
| F004    | G01      |
| F005    | G01      |
| F006    | G04      |
| F007    | G05      |
| F007    | G06      |
```

### Table Réalisateurs
```markdown
| id_realisateur | nom_realisateur    |
|----------------|--------------------|
| R01            | Christopher Nolan  |
| R02            | Francis Ford Coppola|
| R03            | Quentin Tarantino  |
| R04            | Lana Wachowski     |
| R05            | Lilly Wachowski    |
| R06            | Tom Tykwer         |
| R07            | John Lasseter      |
| R08            | Douglas Mackinnon  |
```

### Table Film_Réalisateur (relation many-to-many)
```markdown
| id_film | id_realisateur |
|---------|----------------|
| F001    | R01            |
| F002    | R02            |
| F003    | R03            |
| F004    | R04            |
| F004    | R05            |
| F005    | R04            |
| F005    | R05            |
| F005    | R06            |
| F006    | R07            |
| F007    | R08            |
```

### Table Salles
```markdown
| id_salle | nom_salle      | capacité_salle | rue                   | numero | ville    | code_postal |
|----------|----------------|----------------|----------------------|--------|----------|------------|
| S01      | Grand Rex      | 500            | Boulevard Poissonnière| 1      | Paris    | 75002      |
| S02      | Cinéma Lumière | 300            | Rue du Cinéma        | 20     | Lyon     | 69002      |
| S03      | Ciné Palace    | 200            | Avenue des Arts      | 5      | Marseille| 13001      |
```

### Table Sessions
```markdown
| id_session | id_film | id_salle | date_heure           | tarif_normal |
|------------|---------|----------|----------------------|--------------|
| SESS0101   | F001    | S01      | 2023-05-15 20:00:00  | 12.50        |
| SESS0103   | F002    | S01      | 2023-05-17 18:45:00  | 12.50        |
| SESS0202   | F003    | S02      | 2023-05-19 21:15:00  | 11.00        |
| SESS0303   | F004    | S03      | 2023-05-21 16:45:00  | 9.50         |
| SESS0204   | F005    | S02      | 2023-05-22 18:30:00  | 11.00        |
| SESS0105   | F005    | S01      | 2023-05-23 20:15:00  | 12.50        |
| SESS0304   | F006    | S03      | 2023-05-24 14:00:00  | 9.50         |
| SESS0106   | F007    | S01      | 2023-05-25 19:30:00  | 12.50        |
```

### Table Ventes
```markdown
| id_vente | id_session | nom_client     | email_client              | nombre_billets | prix_total |
|----------|------------|----------------|---------------------------|----------------|------------|
| V001     | SESS0101   | Martin Dupont  | martin.dupont@email.com   | 2              | 25.00      |
| V002     | SESS0101   | Sophie Durand  | sophie.durand@email.com   | 3              | 37.50      |
| V003     | SESS0103   | Paul Lefebvre  | paul.lefebvre@email.com   | 2              | 25.00      |
| V004     | SESS0202   | Thomas Bernard | thomas.bernard@email.com  | 2              | 22.00      |
| V005     | SESS0303   | Julie Robert   | julie.robert@email.com    | 2              | 19.00      |
| V006     | SESS0204   | Marc Leblanc   | marc.leblanc@email.com    | 1              | 11.00      |
| V007     | SESS0105   | Céline Petit   | celine.petit@email.com    | 3              | 37.50      |
| V008     | SESS0304   | David Martin   | david.martin@email.com    | 4              | 38.00      |
| V009     | SESS0106   | Marie Dumont   | marie.dumont@email.com    | 2              | 25.00      |
```

Ces modifications résolvent toutes les infractions à la 1NF:
- Chaque cellule contient maintenant une valeur atomique
- Les valeurs multiples sont gérées par des tables de liaison
- Les données répétitives sont éliminées
- Les adresses sont décomposées en éléments atomiques
- Chaque table a une clé primaire appropriée


## Infractions 2NF

Pour analyser les infractions à la deuxième forme normale (2NF), je dois d'abord identifier les clés primaires de chaque table, puis vérifier si des attributs non-clés dépendent seulement d'une partie de la clé primaire (dépendance partielle).

Voici l'analyse des infractions 2NF dans les tables restructurées:

1. **Table Films**: Clé primaire = id_film
   - Pas d'infraction 2NF (tous les attributs dépendent de la clé complète)

2. **Table Genres**: Clé primaire = id_genre
   - Pas d'infraction 2NF (tous les attributs dépendent de la clé complète)

3. **Table Films_Genres**: Clé primaire composite = (id_film, id_genre)
   - Pas d'attributs non-clés, donc pas d'infraction 2NF

4. **Table Réalisateurs**: Clé primaire = id_realisateur
   - Pas d'infraction 2NF (tous les attributs dépendent de la clé complète)

5. **Table Films_Réalisateurs**: Clé primaire composite = (id_film, id_realisateur)
   - Pas d'attributs non-clés, donc pas d'infraction 2NF

6. **Table Salles**: Clé primaire = id_salle
   - Pas d'infraction 2NF (tous les attributs dépendent de la clé complète)

7. **Table Sessions**: Clé primaire = id_session
   - **Infraction 2NF détectée**: tarif_normal dépend seulement de id_salle et non de la clé primaire complète id_session. Le tarif est probablement une caractéristique de la salle de cinéma, pas de la session spécifique.

8. **Table Clients**: Clé primaire = id_client
   - Pas d'infraction 2NF (tous les attributs dépendent de la clé complète)

9. **Table Ventes**: Clé primaire = id_vente
   - **Infraction 2NF potentielle**: prix_total est calculé à partir de nombre_billets et du tarif_normal (qui lui-même provient de la table Sessions). Si on considère que la clé primaire est composite, le prix_total pourrait ne pas dépendre uniquement de id_vente mais être dérivé d'autres attributs.

Infractions 2NF identifiées:
1. Dans la table Sessions: tarif_normal dépend de id_salle et non de id_session
2. Dans la table Ventes: prix_total est calculé à partir d'autres attributs et pourrait être considéré comme une dépendance partielle si on utilise une clé composite

## Corrections 2NF
Voici les corrections pour résoudre les infractions à la 2NF identifiées:

**1. Correction pour tarif_normal dans Sessions**

Déplacer tarif_normal de la table Sessions vers la table Salles, puisque le tarif dépend de la salle et non de la session spécifique.

**2. Correction pour prix_total dans Ventes**

Supprimer prix_total de la table Ventes car il s'agit d'une donnée calculée qui peut être dérivée à partir du nombre de billets et du tarif normal de la salle:

Le prix_total pourra être calculé dynamiquement avec une requête SQL:

```sql
SELECT v.id_vente, v.id_session, v.id_client, v.nombre_billets, 
       (v.nombre_billets * s.tarif_normal) AS prix_total
FROM Ventes v
JOIN Sessions sess ON v.id_session = sess.id_session
JOIN Salles s ON sess.id_salle = s.id_salle
```


**Table Salles (corrigée)**
| id_salle | nom_salle      | capacité_salle | rue                  | numero | ville    | code_postal | tarif_normal |
|----------|----------------|----------------|----------------------|--------|----------|------------|--------------|
| S01      | Grand Rex      | 500            | Boulevard Poissonnière| 1      | Paris    | 75002      | 12.50        |
| S02      | Cinéma Lumière | 300            | Rue du Cinéma        | 20     | Lyon     | 69002      | 11.00        |
| S03      | Ciné Palace    | 200            | Avenue des Arts      | 5      | Marseille| 13001      | 9.50         |

**Table Sessions (corrigée)**
| id_session | id_film | id_salle | date_heure           |
|------------|---------|----------|----------------------|
| SESS0101   | F001    | S01      | 2023-05-15 20:00:00  |
| SESS0103   | F002    | S01      | 2023-05-17 18:45:00  |
| SESS0202   | F003    | S02      | 2023-05-19 21:15:00  |
| SESS0303   | F004    | S03      | 2023-05-21 16:45:00  |
| SESS0204   | F005    | S02      | 2023-05-22 18:30:00  |
| SESS0105   | F005    | S01      | 2023-05-23 20:15:00  |
| SESS0304   | F006    | S03      | 2023-05-24 14:00:00  |
| SESS0106   | F007    | S01      | 2023-05-25 19:30:00  |


Ces modifications corrigent les infractions à la 2NF en:
1. Déplaçant l'attribut tarif_normal vers la table Salles où il dépend pleinement de la clé primaire
2. Supprimant l'attribut prix_total qui est une donnée calculée et qui pourrait introduire des incohérences dans la base de données

Toutes les tables respectent maintenant à la fois la 1NF et la 2NF.

---

# Résolution des infractions à la 3NF

Pour identifier les infractions à la troisième forme normale (3NF), je dois analyser si nos tables normalisées en 2NF contiennent des dépendances transitives (où un attribut non-clé dépend d'un autre attribut non-clé).

## Infractions à la 3NF identifiées

Dans notre modèle normalisé en 2NF, les tables suivantes présentent des infractions à la 3NF:

1. **Table Ventes**: 
   - Les attributs `nom_client` et `email_client` dépendent l'un de l'autre et devraient être dans une table clients séparée
   
2. **Table Salles**:
   - L'adresse (composée de `rue`, `numero`, `ville`, `code_postal`) pourrait bénéficier d'une normalisation supplémentaire, car `code_postal` détermine partiellement `ville`

## Procédure de normalisation 3NF

1. **Création d'une table Clients**:
   - Extraire les informations de clients dans une table séparée
   - Ajouter une clé étrangère dans la table Ventes

2. **Normalisation des adresses**:
   - Créer une table Villes pour éliminer la dépendance transitive entre code postal et ville
   - Référencer la table Villes depuis la table Salles

## Tables résultantes après normalisation 3NF

### Table Films (inchangée)
```markdown
| id_film | titre_film       | année_sortie |
|---------|------------------|--------------|
| F001    | Interstellar     | 2014         |
| F002    | Le Parrain       | 1972         |
| F003    | Pulp Fiction     | 1994         |
| F004    | Matrix           | 1999         |
| F005    | Cloud Atlas      | 2012         |
| F006    | Toy Story        | 1995         |
| F007    | Good Omens       | 2019         |
```

### Table Genres (inchangée)
```markdown
| id_genre | nom_genre      |
|----------|----------------|
| G01      | Science-Fiction|
| G02      | Drame          |
| G03      | Thriller       |
| G04      | Animation      |
| G05      | Comédie        |
| G06      | Fantastique    |
```

### Table Film_Genre (inchangée)
```markdown
| id_film | id_genre |
|---------|----------|
| F001    | G01      |
| F002    | G02      |
| F003    | G03      |
| F004    | G01      |
| F005    | G01      |
| F006    | G04      |
| F007    | G05      |
| F007    | G06      |
```

### Table Réalisateurs (inchangée)
```markdown
| id_realisateur | nom_realisateur    |
|----------------|--------------------|
| R01            | Christopher Nolan  |
| R02            | Francis Ford Coppola|
| R03            | Quentin Tarantino  |
| R04            | Lana Wachowski     |
| R05            | Lilly Wachowski    |
| R06            | Tom Tykwer         |
| R07            | John Lasseter      |
| R08            | Douglas Mackinnon  |
```

### Table Film_Réalisateur (inchangée)
```markdown
| id_film | id_realisateur |
|---------|----------------|
| F001    | R01            |
| F002    | R02            |
| F003    | R03            |
| F004    | R04            |
| F004    | R05            |
| F005    | R04            |
| F005    | R05            |
| F005    | R06            |
| F006    | R07            |
| F007    | R08            |
```

### Table Villes (nouvelle table)
```markdown
| id_ville | code_postal | nom_ville |
|----------|-------------|-----------|
| V01      | 75002       | Paris     |
| V02      | 69002       | Lyon      |
| V03      | 13001       | Marseille |
```

### Table Salles (modifiée)
```markdown
| id_salle | nom_salle      | capacité_salle | rue                  | numero | id_ville | tarif_normal |
|----------|----------------|----------------|----------------------|--------|----------|--------------|
| S01      | Grand Rex      | 500            | Boulevard Poissonnière| 1      | V01      | 12.50        |
| S02      | Cinéma Lumière | 300            | Rue du Cinéma        | 20     | V02      | 11.00        |
| S03      | Ciné Palace    | 200            | Avenue des Arts      | 5      | V03      | 9.50         |
```

### Table Sessions (inchangée)
```markdown
| id_session | id_film | id_salle | date_heure           |
|------------|---------|----------|----------------------|
| SESS0101   | F001    | S01      | 2023-05-15 20:00:00  |
| SESS0103   | F002    | S01      | 2023-05-17 18:45:00  |
| SESS0202   | F003    | S02      | 2023-05-19 21:15:00  |
| SESS0303   | F004    | S03      | 2023-05-21 16:45:00  |
| SESS0204   | F005    | S02      | 2023-05-22 18:30:00  |
| SESS0105   | F005    | S01      | 2023-05-23 20:15:00  |
| SESS0304   | F006    | S03      | 2023-05-24 14:00:00  |
| SESS0106   | F007    | S01      | 2023-05-25 19:30:00  |
```

### Table Clients (nouvelle table)
```markdown
| id_client | nom_client     | email_client              |
|-----------|----------------|---------------------------|
| C01       | Martin Dupont  | martin.dupont@email.com   |
| C02       | Sophie Durand  | sophie.durand@email.com   |
| C03       | Paul Lefebvre  | paul.lefebvre@email.com   |
| C04       | Thomas Bernard | thomas.bernard@email.com  |
| C05       | Julie Robert   | julie.robert@email.com    |
| C06       | Marc Leblanc   | marc.leblanc@email.com    |
| C07       | Céline Petit   | celine.petit@email.com    |
| C08       | David Martin   | david.martin@email.com    |
| C09       | Marie Dumont   | marie.dumont@email.com    |
```

### Table Ventes (modifiée)
```markdown
| id_vente | id_session | id_client | nombre_billets |
|----------|------------|-----------|----------------|
| V001     | SESS0101   | C01       | 2              |
| V002     | SESS0101   | C02       | 3              |
| V003     | SESS0103   | C03       | 2              |
| V004     | SESS0202   | C04       | 2              |
| V005     | SESS0303   | C05       | 2              |
| V006     | SESS0204   | C06       | 1              |
| V007     | SESS0105   | C07       | 3              |
| V008     | SESS0304   | C08       | 4              |
| V009     | SESS0106   | C09       | 2              |
```

Ces modifications résolvent les infractions à la 3NF en:
1. Éliminant les dépendances transitives entre attributs non-clés
2. Séparant les informations des clients dans une table dédiée
3. Normalisant les informations géographiques (villes et codes postaux)
4. Supprimant les attributs calculés comme le prix_total

Le modèle est maintenant conforme à la 3NF, avec chaque attribut dépendant directement de la clé et uniquement de la clé.


---


# Requêtes pour retrouver les ventes d'un client dans chaque forme normale

Je vais présenter les requêtes SQL pour retrouver toutes les ventes d'un client spécifique (par exemple "Sophie Durand") dans chacune des formes normales.

## Requête sur la table non normalisée (avant 1NF)

```sql
SELECT *
FROM Films_Sessions_Ventes
WHERE nom_client = 'Sophie Durand';
```

## Requête sur la structure en 1NF

```sql
SELECT v.id_vente, s.id_session, f.titre_film, sa.nom_salle, 
       s.date_heure, v.nom_client, v.email_client, 
       v.nombre_billets, v.prix_total
FROM Ventes v
JOIN Sessions s ON v.id_session = s.id_session
JOIN Films f ON s.id_film = f.id_film
JOIN Salles sa ON s.id_salle = sa.id_salle
WHERE v.nom_client = 'Sophie Durand';
```

## Requête sur la structure en 2NF 

```sql
SELECT v.id_vente, s.id_session, f.titre_film, sa.nom_salle, 
       s.date_heure, v.nom_client, v.email_client, 
       v.nombre_billets, (v.nombre_billets * sa.tarif_normal) AS prix_total
FROM Ventes v
JOIN Sessions s ON v.id_session = s.id_session
JOIN Films f ON s.id_film = f.id_film
JOIN Salles sa ON s.id_salle = sa.id_salle
WHERE v.nom_client = 'Sophie Durand';
```

## Requête sur la structure en 3NF

```sql
SELECT v.id_vente, s.id_session, f.titre_film, sa.nom_salle, 
       s.date_heure, c.nom_client, c.email_client, 
       v.nombre_billets, (v.nombre_billets * sa.tarif_normal) AS prix_total,
       vi.nom_ville, vi.code_postal
FROM Ventes v
JOIN Sessions s ON v.id_session = s.id_session
JOIN Films f ON s.id_film = f.id_film
JOIN Salles sa ON s.id_salle = sa.id_salle
JOIN Clients c ON v.id_client = c.id_client
JOIN Villes vi ON sa.id_ville = vi.id_ville
WHERE c.nom_client = 'Sophie Durand';
```

## Comparaison des approches

1. **Table non normalisée**: 
   - Requête simple mais inefficace
   - Récupère des données dupliquées
   - Problèmes avec les valeurs multiples (genres, réalisateurs)

2. **Structure 1NF**:
   - Requête plus complexe avec plusieurs jointures
   - Élimine les problèmes de valeurs multiples
   - Prix total stocké directement

3. **Structure 2NF**:
   - Structure similaire à 1NF
   - Le prix total est calculé à partir du tarif de la salle
   - Meilleure cohérence des données

4. **Structure 3NF**:
   - Requête plus complexe avec plus de jointures
   - Architecture de données plus robuste et flexible
   - Meilleure intégrité des données
   - Évite les anomalies de mise à jour
   - Support plus facile pour l'évolution des fonctionnalités

La structure 3NF offre la meilleure intégrité des données et évite les anomalies de mise à jour, mais nécessite des requêtes plus complexes avec davantage de jointures.
# La Deuxième Forme Normale (2NF)

## Définition

La deuxième forme normale (2NF) est une étape dans le processus de normalisation des bases de données relationnelles. Une relation est en 2NF si et seulement si :

1. Elle est déjà en première forme normale (1NF)
2. Tous les attributs non-clés dépendent fonctionnellement de la totalité de la clé primaire

## Comprendre la 2NF

La 2NF s'applique principalement aux relations ayant une clé primaire composite (constituée de plusieurs attributs). Pour les relations avec une clé primaire simple, si elles sont déjà en 1NF, elles sont automatiquement en 2NF car il ne peut pas y avoir de dépendances partielles.

Une dépendance partielle se produit lorsqu'un attribut non-clé dépend seulement d'une partie de la clé primaire composite, plutôt que de la clé entière.

## Exemple avec clé composite (relation non-2NF)

Prenons une relation qui n'est pas en 2NF :

```
Inscription_Cours
----------------+---------------+-------------+---------------+-------
Code_Cours (PK) | ID_Étudiant (PK) | Nom_Cours | Nom_Étudiant | Note
----------------+---------------+-------------+---------------+-------
INFO101         | E1              | Base de données | Dupont     | A
INFO101         | E2              | Base de données | Martin     | B
INFO102         | E1              | Réseaux         | Dupont     | C
```

Cette relation viole la 2NF car :
- `Nom_Cours` dépend uniquement de `Code_Cours` (et non de la clé entière)
- `Nom_Étudiant` dépend uniquement de `ID_Étudiant` (et non de la clé entière)

## Conversion en 2NF

Pour convertir cette relation en 2NF, on la décompose en plusieurs relations sans dépendances partielles :

```
Cours
-------------+-------------
Code_Cours (PK) | Nom_Cours
-------------+-------------
INFO101      | Base de données
INFO102      | Réseaux

Étudiant
---------------+---------------
ID_Étudiant (PK) | Nom_Étudiant
---------------+---------------
E1              | Dupont
E2              | Martin

Inscription
----------------+---------------+-------
Code_Cours (PK) | ID_Étudiant (PK) | Note
----------------+---------------+-------
INFO101         | E1              | A
INFO101         | E2              | B
INFO102         | E1              | C
```

## Cas avec clé simple (automatiquement en 2NF)

```
Employé
--------------+----------+--------+-------------
ID_Employé (PK) | Nom     | Salaire | Département
--------------+----------+--------+-------------
1              | Dubois   | 45000  | Comptabilité
2              | Leroy    | 52000  | Marketing
3              | Moreau   | 48000  | Informatique
```

Cette relation est automatiquement en 2NF car sa clé primaire est simple (non composite). Tous les attributs non-clés dépendent de l'intégralité de la clé primaire puisqu'il n'y a qu'un seul attribut dans la clé.

## Importance de la 2NF

La 2NF est importante car elle :
- Élimine la redondance des données
- Réduit les anomalies de mise à jour
- Améliore l'intégrité des données
- Prépare la base de données pour la 3NF

## Limites de la 2NF

Bien que la 2NF élimine les dépendances partielles, elle ne traite pas les dépendances transitives. Une dépendance transitive se produit lorsqu'un attribut non-clé dépend d'un autre attribut non-clé.

Pour éliminer les dépendances transitives, il est nécessaire de passer à la troisième forme normale (3NF).

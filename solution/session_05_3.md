# Procédure pour convertir l'exercice 3 (Garage Automobile) en 1NF

## Rappel des données brutes

| ID_Réparation | Date_Réparation | ID_Client | Nom_Client | Adresse_Client | Téléphones_Client | ID_Véhicule | Marque_Modèle | Année_Fabrication | Pièces_Utilisées | Coûts_Pièces | Heures_Main_Œuvre | Coût_Horaire | Mécanicien_Responsable | Certification_Mécanicien |
|--------------|-----------------|-----------|------------|----------------|-------------------|-------------|--------------|-------------------|------------------|--------------|-------------------|-------------|------------------------|-------------------------|
| R001 | 10/03/2025 | C001 | Dupont Pierre | 15 rue des Lilas, 75001 Paris | 0612345678, 0723456789 | V001 | Renault Clio | 2018 | "Filtre à huile, Huile moteur 5W40" | "25.50, 45.00" | 2.5 | 60.00 | Michel Durant | "Renault Certified, ASE Master" |
| R002 | 12/03/2025 | C002 | Leroy Sophie | 8 avenue des Roses, 69002 Lyon | 0634567890 | V002 | Peugeot 308 | 2020 | "Plaquettes de frein, Disque de frein" | "85.00, 120.00" | 3.0 | 60.00 | Lucas Martin | "Peugeot Certified" |
| R003 | 15/03/2025 | C001 | Dupont Pierre | 15 rue des Lilas, 75001 Paris | 0612345678, 0723456789 | V003 | Citroën C3 | 2016 | "Batterie, Alternateur" | "150.00, 280.00" | 4.5 | 60.00 | Michel Durant | "Renault Certified, ASE Master" |
| R004 | 18/03/2025 | C003 | Bernard Julie | 25 boulevard Central, 33000 Bordeaux | 0645678901 | V004 | Toyota Yaris | 2019 | "Filtre à air, Bougies d'allumage" | "18.50, 45.00" | 1.0 | 60.00 | Emma Petit | "Toyota Certified, ASE Certified" |

## Identification des violations de 1NF

Pour qu'une relation soit en 1NF, elle doit respecter les conditions suivantes :
1. Chaque cellule doit contenir une valeur atomique (indivisible)
2. Chaque colonne doit contenir des valeurs du même type
3. Chaque colonne doit avoir un nom unique
4. L'ordre des colonnes et des lignes n'a pas d'importance

Dans notre cas, les violations de 1NF sont :
- **Téléphones_Client** : attribut multivalué (plusieurs numéros de téléphone)
- **Pièces_Utilisées** : attribut multivalué (plusieurs pièces)
- **Coûts_Pièces** : attribut multivalué (plusieurs coûts)
- **Certification_Mécanicien** : attribut multivalué (plusieurs certifications)

## Procédure de conversion en 1NF

### Étape 1 : Décomposer la table Téléphones_Client

Créer une table séparée pour les téléphones des clients :

**Table Client_Téléphone** :
| ID_Client | Téléphone |
|-----------|-----------|
| C001 | 0612345678 |
| C001 | 0723456789 |
| C002 | 0634567890 |
| C003 | 0645678901 |

### Étape 2 : Décomposer les tables Pièces et Coûts

Créer une table séparée pour les pièces utilisées et leurs coûts :

**Table Pièces_Réparation** :
| ID_Réparation | Pièce_Utilisée | Coût_Pièce |
|--------------|----------------|------------|
| R001 | Filtre à huile | 25.50 |
| R001 | Huile moteur 5W40 | 45.00 |
| R002 | Plaquettes de frein | 85.00 |
| R002 | Disque de frein | 120.00 |
| R003 | Batterie | 150.00 |
| R003 | Alternateur | 280.00 |
| R004 | Filtre à air | 18.50 |
| R004 | Bougies d'allumage | 45.00 |

### Étape 3 : Décomposer la table Certification_Mécanicien

Créer une table séparée pour les certifications des mécaniciens :

**Table Certification_Mécanicien** :
| Mécanicien_Responsable | Certification |
|------------------------|---------------|
| Michel Durant | Renault Certified |
| Michel Durant | ASE Master |
| Lucas Martin | Peugeot Certified |
| Emma Petit | Toyota Certified |
| Emma Petit | ASE Certified |

### Étape 4 : Restructurer la table principale

La table principale devient :

**Table Réparation** :
| ID_Réparation | Date_Réparation | ID_Client | Nom_Client | Adresse_Client | ID_Véhicule | Marque_Modèle | Année_Fabrication | Heures_Main_Œuvre | Coût_Horaire | Mécanicien_Responsable |
|--------------|-----------------|-----------|------------|----------------|-------------|--------------|-------------------|-------------------|-------------|------------------------|
| R001 | 10/03/2025 | C001 | Dupont Pierre | 15 rue des Lilas, 75001 Paris | V001 | Renault Clio | 2018 | 2.5 | 60.00 | Michel Durant |
| R002 | 12/03/2025 | C002 | Leroy Sophie | 8 avenue des Roses, 69002 Lyon | V002 | Peugeot 308 | 2020 | 3.0 | 60.00 | Lucas Martin |
| R003 | 15/03/2025 | C001 | Dupont Pierre | 15 rue des Lilas, 75001 Paris | V003 | Citroën C3 | 2016 | 4.5 | 60.00 | Michel Durant |
| R004 | 18/03/2025 | C003 | Bernard Julie | 25 boulevard Central, 33000 Bordeaux | V004 | Toyota Yaris | 2019 | 1.0 | 60.00 | Emma Petit |

## Vérification 1NF

Après ces modifications :
1. Chaque cellule contient une valeur atomique
2. Chaque colonne contient des valeurs du même type
3. Chaque colonne a un nom unique
4. L'ordre des colonnes et des lignes n'a pas d'importance

La structure est maintenant en 1NF, mais elle contient encore des dépendances partielles et transitives qui devront être traitées lors de la conversion en 2NF et 3NF.

## Structure finale en 1NF

Nous avons maintenant 4 tables en 1NF :
1. **Table Réparation**
2. **Table Client_Téléphone**
3. **Table Pièces_Réparation**
4. **Table Certification_Mécanicien**

Chacune de ces tables est en 1NF car chaque attribut contient uniquement des valeurs atomiques.


---

# Procédure pour convertir l'exercice 3 (Garage Automobile) de 1NF à 2NF

## Identification des violations de 2NF

Rappel : Une relation est en 2NF si elle est en 1NF et si tous les attributs non-clés dépendent fonctionnellement de la totalité de la clé primaire.

Pour analyser les dépendances fonctionnelles dans nos tables :

1. **Table Réparation** :
   - La clé primaire est `ID_Réparation`
   - Les attributs `Nom_Client` et `Adresse_Client` dépendent uniquement de `ID_Client` (dépendance partielle)
   - Les attributs `Marque_Modèle` et `Année_Fabrication` dépendent uniquement de `ID_Véhicule` (dépendance partielle)

2. **Table Client_Téléphone** :
   - La clé primaire est composée de (`ID_Client`, `Téléphone`)
   - Il n'y a pas d'autres attributs, donc pas de dépendances partielles

3. **Table Pièces_Réparation** :
   - La clé primaire est composée de (`ID_Réparation`, `Pièce_Utilisée`)
   - Il n'y a pas de dépendances partielles

4. **Table Certification_Mécanicien** :
   - La clé primaire est composée de (`Mécanicien_Responsable`, `Certification`)
   - Il n'y a pas de dépendances partielles

## Procédure de conversion en 2NF

### Étape 1 : Décomposer la table Réparation

Nous allons diviser la table Réparation en plusieurs tables pour éliminer les dépendances partielles :

**Table Client** :
| ID_Client (PK) | Nom_Client | Adresse_Client |
|---------------|------------|----------------|
| C001 | Dupont Pierre | 15 rue des Lilas, 75001 Paris |
| C002 | Leroy Sophie | 8 avenue des Roses, 69002 Lyon |
| C003 | Bernard Julie | 25 boulevard Central, 33000 Bordeaux |

**Table Véhicule** :
| ID_Véhicule (PK) | Marque_Modèle | Année_Fabrication |
|-----------------|--------------|-------------------|
| V001 | Renault Clio | 2018 |
| V002 | Peugeot 308 | 2020 |
| V003 | Citroën C3 | 2016 |
| V004 | Toyota Yaris | 2019 |

**Table Réparation (révisée)** :
| ID_Réparation (PK) | Date_Réparation | ID_Client (FK) | ID_Véhicule (FK) | Heures_Main_Œuvre | Coût_Horaire | Mécanicien_Responsable |
|-------------------|-----------------|---------------|-----------------|-------------------|-------------|------------------------|
| R001 | 10/03/2025 | C001 | V001 | 2.5 | 60.00 | Michel Durant |
| R002 | 12/03/2025 | C002 | V002 | 3.0 | 60.00 | Lucas Martin |
| R003 | 15/03/2025 | C001 | V003 | 4.5 | 60.00 | Michel Durant |
| R004 | 18/03/2025 | C003 | V004 | 1.0 | 60.00 | Emma Petit |

### Étape 2 : Vérifier les autres tables

Les autres tables sont déjà en 2NF :

- **Table Client_Téléphone** : Pas de dépendances partielles
- **Table Pièces_Réparation** : Pas de dépendances partielles
- **Table Certification_Mécanicien** : Pas de dépendances partielles

## Structure finale en 2NF

Après la conversion en 2NF, nous avons 6 tables :

1. **Table Client** (nouvelle)
   - Clé primaire : `ID_Client`

2. **Table Véhicule** (nouvelle)
   - Clé primaire : `ID_Véhicule`

3. **Table Réparation** (révisée)
   - Clé primaire : `ID_Réparation`
   - Clés étrangères : `ID_Client`, `ID_Véhicule`

4. **Table Client_Téléphone** (inchangée)
   - Clé primaire : `(ID_Client, Téléphone)`
   - Clé étrangère : `ID_Client` référence la table Client

5. **Table Pièces_Réparation** (inchangée)
   - Clé primaire : `(ID_Réparation, Pièce_Utilisée)`
   - Clé étrangère : `ID_Réparation` référence la table Réparation

6. **Table Certification_Mécanicien** (inchangée)
   - Clé primaire : `(Mécanicien_Responsable, Certification)`

Chacune de ces tables est maintenant en 2NF car tous les attributs non-clés dépendent de la totalité de la clé primaire.

Cette structure élimine les problèmes de redondance causés par les dépendances partielles que nous avions dans la version 1NF. Par exemple, les informations du client ne sont plus dupliquées pour chaque réparation.

Cependant, il reste encore des dépendances transitives à éliminer pour passer à la 3NF.


---

# Procédure pour convertir l'exercice 3 (Garage Automobile) de 2NF à 3NF

## Identification des violations de 3NF

Rappel : Une relation est en 3NF si elle est en 2NF et si aucun attribut non-clé ne dépend d'un autre attribut non-clé (absence de dépendances transitives).

Analysons chaque table pour identifier les dépendances transitives :

1. **Table Réparation** :
   - `Coût_Horaire` est une valeur constante (60.00) qui ne dépend pas directement de `ID_Réparation` mais qui semble être un tarif standard du garage
   - Il y a potentiellement une dépendance transitive : `ID_Réparation` → `Mécanicien_Responsable` → `Coût_Horaire`

2. **Table Véhicule** :
   - Pas de dépendances transitives identifiées

3. **Table Client**, **Table Client_Téléphone**, **Table Pièces_Réparation**, **Table Certification_Mécanicien** :
   - Pas de dépendances transitives identifiées

## Procédure de conversion en 3NF

### Étape 1 : Décomposer la table Réparation

Nous allons séparer le `Coût_Horaire` dans une nouvelle table et créer une table dédiée aux mécaniciens :

**Table Tarif** :
| ID_Tarif (PK) | Type_Service | Coût_Horaire |
|--------------|--------------|-------------|
| T001 | Réparation standard | 60.00 |

**Table Mécanicien** :
| ID_Mécanicien (PK) | Nom_Mécanicien |
|-------------------|----------------|
| M001 | Michel Durant |
| M002 | Lucas Martin |
| M003 | Emma Petit |

**Table Réparation (révisée)** :
| ID_Réparation (PK) | Date_Réparation | ID_Client (FK) | ID_Véhicule (FK) | Heures_Main_Œuvre | ID_Tarif (FK) | ID_Mécanicien (FK) |
|-------------------|-----------------|---------------|-----------------|-------------------|--------------|-------------------|
| R001 | 10/03/2025 | C001 | V001 | 2.5 | T001 | M001 |
| R002 | 12/03/2025 | C002 | V002 | 3.0 | T001 | M002 |
| R003 | 15/03/2025 | C001 | V003 | 4.5 | T001 | M001 |
| R004 | 18/03/2025 | C003 | V004 | 1.0 | T001 | M003 |

### Étape 2 : Ajuster la table Certification_Mécanicien

Il faut mettre à jour la table des certifications pour utiliser l'ID du mécanicien :

**Table Certification_Mécanicien (révisée)** :
| ID_Mécanicien (FK) | Certification |
|-------------------|---------------|
| M001 | Renault Certified |
| M001 | ASE Master |
| M002 | Peugeot Certified |
| M003 | Toyota Certified |
| M003 | ASE Certified |


## Structure finale en 3NF

Après la conversion en 3NF, nous avons maintenant 9 tables :

1. **Table Client** (inchangée)
   - Clé primaire : `ID_Client`

2. **Table Marque** (nouvelle)
   - Clé primaire : `ID_Marque`

3. **Table Véhicule** (révisée)
   - Clé primaire : `ID_Véhicule`
   - Clé étrangère : `ID_Marque`

4. **Table Mécanicien** (nouvelle)
   - Clé primaire : `ID_Mécanicien`

5. **Table Tarif** (nouvelle)
   - Clé primaire : `ID_Tarif`

6. **Table Réparation** (révisée)
   - Clé primaire : `ID_Réparation`
   - Clés étrangères : `ID_Client`, `ID_Véhicule`, `ID_Tarif`, `ID_Mécanicien`

7. **Table Client_Téléphone** (inchangée)
   - Clé primaire : `(ID_Client, Téléphone)`
   - Clé étrangère : `ID_Client`

8. **Table Pièces_Réparation** (inchangée)
   - Clé primaire : `(ID_Réparation, Pièce_Utilisée)`
   - Clé étrangère : `ID_Réparation`

9. **Table Certification_Mécanicien** (révisée)
   - Clé primaire : `(ID_Mécanicien, Certification)`
   - Clé étrangère : `ID_Mécanicien`

Chacune de ces tables est maintenant en 3NF car :
1. Elles sont toutes en 2NF (absence de dépendances partielles)
2. Aucun attribut non-clé ne dépend d'un autre attribut non-clé (absence de dépendances transitives)

Cette structure 3NF élimine les problèmes de redondance causés par les dépendances transitives que nous avions dans la version 2NF. Par exemple, le coût horaire standard n'est plus répété dans chaque enregistrement de réparation, et les informations sur les mécaniciens sont correctement normalisées.

## Résumé de la transformation

1. **1NF → 2NF** : Élimination des dépendances partielles
   - Séparation des informations client et véhicule dans des tables dédiées

2. **2NF → 3NF** : Élimination des dépendances transitives
   - Création d'une table Tarif pour le coût horaire
   - Création d'une table Mécanicien
   - Séparation de la marque et du modèle dans la table Véhicule

La base de données est maintenant correctement normalisée et prête à l'utilisation dans un environnement de production.


# Pour aller plus loin

## Normaliser la table Véhicule

Pour une normalisation plus complète, nous pouvons séparer la marque et le modèle :

**Table Marque** :
| ID_Marque (PK) | Nom_Marque |
|---------------|------------|
| MA001 | Renault |
| MA002 | Peugeot |
| MA003 | Citroën |
| MA004 | Toyota |

**Table Véhicule (révisée)** :
| ID_Véhicule (PK) | ID_Marque (FK) | Modèle | Année_Fabrication |
|-----------------|---------------|--------|-------------------|
| V001 | MA001 | Clio | 2018 |
| V002 | MA002 | 308 | 2020 |
| V003 | MA003 | C3 | 2016 |
| V004 | MA004 | Yaris | 2019 |

L'attribut "Marque_Modèle" viole effectivement la 1NF (Première Forme Normale) car il ne respecte pas le principe d'atomicité des données. La 1NF exige que chaque attribut contienne une valeur atomique (indivisible).


## Normaliser la table Certification_Mécanicien

Pour une normalisation plus complète et cohérente, nous devrions effectivement créer une table dédiée pour les certifications elles-mêmes.

Voici comment cette amélioration pourrait être implémentée:

**Table Certification** (nouvelle):
| ID_Certification (PK) | Nom_Certification | Description |
|----------------------|-------------------|-------------|
| CERT001 | Renault Certified | Certification officielle Renault |
| CERT002 | ASE Master | Certification Master Automotive Service Excellence |
| CERT003 | Peugeot Certified | Certification officielle Peugeot |
| CERT004 | Toyota Certified | Certification officielle Toyota |
| CERT005 | ASE Certified | Certification standard Automotive Service Excellence |

**Table Mécanicien_Certification** (renommée):
| ID_Mécanicien (FK) | ID_Certification (FK) | Date_Obtention |
|-------------------|----------------------|----------------|
| M001 | CERT001 | 2020-05-15 |
| M001 | CERT002 | 2019-11-23 |
| M002 | CERT003 | 2021-03-10 |
| M003 | CERT004 | 2022-01-05 |
| M003 | CERT005 | 2020-08-17 |

Cette structure offre plusieurs avantages:

1. **Intégrité référentielle** - Les certifications sont des entités avec leurs propres attributs
2. **Élimination de la redondance** - Le nom et les détails de chaque certification ne sont stockés qu'une seule fois
3. **Extensibilité** - Possibilité d'ajouter des attributs aux certifications (organisme émetteur, validité, etc.)
4. **Cohérence** - Protection contre les erreurs de saisie et les variations orthographiques
5. **Évolutivité** - Facilité pour ajouter de nouvelles certifications au système

Cette modification complète notre modèle 3NF en traitant correctement les certifications comme des entités à part entière plutôt que comme de simples valeurs.

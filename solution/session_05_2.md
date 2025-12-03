Pour l'exercice 2 (Gestion d'Université), la procédure de conversion en 1NF est simple car les données sont déjà pratiquement en 1NF. Voici la procédure détaillée:

# Procédure pour convertir l'exercice 2 en 1NF

## 1. Analyse des données actuelles

   | ID_Cours | Nom_Cours | ID_Professeur | Nom_Professeur | Département_Prof | ID_Étudiant | Nom_Étudiant | Programme_Étudiant | Note |
   |----------|-----------|---------------|----------------|------------------|-------------|--------------|---------------------|------|
   | CS101 | Introduction à l'informatique | P001 | Dr. Lefevre | Informatique | E001 | Moreau Paul | Génie Informatique | 18/20 |
   | CS101 | Introduction à l'informatique | P001 | Dr. Lefevre | Informatique | E002 | Garcia Ana | Sciences des Données | 16/20 |
   | CS101 | Introduction à l'informatique | P001 | Dr. Lefevre | Informatique | E003 | Laurent Thomas | Génie Informatique | 14/20 |
   | MATH201 | Algèbre linéaire | P002 | Dr. Rousseau | Mathématiques | E001 | Moreau Paul | Génie Informatique | 15/20 |
   | MATH201 | Algèbre linéaire | P002 | Dr. Rousseau | Mathématiques | E002 | Garcia Ana | Sciences des Données | 19/20 |
   | PHY101 | Mécanique classique | P003 | Dr. Petit | Physique | E004 | Blanc Julie | Physique | 17/20 |

## 2. Vérification des conditions de 1NF

En examinant les données:
- Tous les attributs semblent déjà atomiques (pas de valeurs multiples dans une cellule)
- Pas de répétition de groupes d'attributs
- La table a besoin d'une clé primaire clairement définie

## 3. Résolution

La relation est déjà en 1NF car elle ne contient pas d'attributs multivalués.

La clé primaire devrait être la combinaison de:
- ID_Cours
- ID_Étudiant

Cette clé composite garantit l'unicité de chaque ligne puisqu'un étudiant ne peut être inscrit qu'une seule fois à un cours spécifique.

## 4. Table finale en 1NF

| ID_Cours (PK) | ID_Étudiant (PK) | Nom_Cours | ID_Professeur | Nom_Professeur | Département_Prof | Nom_Étudiant | Programme_Étudiant | Note |
|---------------|------------------|-----------|---------------|----------------|------------------|--------------|---------------------|------|
| CS101 | E001 | Introduction à l'informatique | P001 | Dr. Lefevre | Informatique | Moreau Paul | Génie Informatique | 18/20 |
| CS101 | E002 | Introduction à l'informatique | P001 | Dr. Lefevre | Informatique | Garcia Ana | Sciences des Données | 16/20 |
| CS101 | E003 | Introduction à l'informatique | P001 | Dr. Lefevre | Informatique | Laurent Thomas | Génie Informatique | 14/20 |
| MATH201 | E001 | Algèbre linéaire | P002 | Dr. Rousseau | Mathématiques | Moreau Paul | Génie Informatique | 15/20 |
| MATH201 | E002 | Algèbre linéaire | P002 | Dr. Rousseau | Mathématiques | Garcia Ana | Sciences des Données | 19/20 |
| PHY101 | E004 | Mécanique classique | P003 | Dr. Petit | Physique | Blanc Julie | Physique | 17/20 |

Cette table est maintenant officiellement en 1NF avec une clé primaire composite clairement définie (ID_Cours, ID_Étudiant).


---

# Procédure pour convertir l'exercice 2 en 2NF

## 1. Analyse de la relation en 1NF

Notre relation universitaire en 1NF:
| ID_Cours (PK) | ID_Étudiant (PK) | Nom_Cours | ID_Professeur | Nom_Professeur | Département_Prof | Nom_Étudiant | Programme_Étudiant | Note |
|---------------|------------------|-----------|---------------|----------------|------------------|--------------|---------------------|------|

## 2. Identification des dépendances fonctionnelles

Pour être en 2NF, tous les attributs non-clés doivent dépendre de la clé primaire entière. Analysons les dépendances:

- `Nom_Cours` dépend uniquement de `ID_Cours` (pas de la clé entière)
- `ID_Professeur` dépend uniquement de `ID_Cours` (pas de la clé entière)
- `Nom_Professeur` dépend uniquement de `ID_Professeur` (pas de la clé entière)
- `Département_Prof` dépend uniquement de `ID_Professeur` (pas de la clé entière)
- `Nom_Étudiant` dépend uniquement de `ID_Étudiant` (pas de la clé entière)
- `Programme_Étudiant` dépend uniquement de `ID_Étudiant` (pas de la clé entière)
- `Note` dépend de la clé primaire entière (ID_Cours, ID_Étudiant)

## 3. Décomposition en 2NF

Nous devons décomposer la relation en plusieurs tables sans dépendances partielles:

**Table Cours**
| ID_Cours (PK) | Nom_Cours | ID_Professeur (FK) |
|---------------|-----------|---------------------|
| CS101 | Introduction à l'informatique | P001 |
| MATH201 | Algèbre linéaire | P002 |
| PHY101 | Mécanique classique | P003 |

**Table Professeur**
| ID_Professeur (PK) | Nom_Professeur | Département_Prof |
|---------------------|----------------|------------------|
| P001 | Dr. Lefevre | Informatique |
| P002 | Dr. Rousseau | Mathématiques |
| P003 | Dr. Petit | Physique |

**Table Étudiant**
| ID_Étudiant (PK) | Nom_Étudiant | Programme_Étudiant |
|------------------|--------------|---------------------|
| E001 | Moreau Paul | Génie Informatique |
| E002 | Garcia Ana | Sciences des Données |
| E003 | Laurent Thomas | Génie Informatique |
| E004 | Blanc Julie | Physique |

**Table Inscription (relation entre Cours et Étudiant)**
| ID_Cours (PK) | ID_Étudiant (PK) | Note |
|---------------|------------------|------|
| CS101 | E001 | 18/20 |
| CS101 | E002 | 16/20 |
| CS101 | E003 | 14/20 |
| MATH201 | E001 | 15/20 |
| MATH201 | E002 | 19/20 |
| PHY101 | E004 | 17/20 |

## 4. Vérification

- Chaque table a une clé primaire bien définie
- Pas de dépendances partielles dans les tables résultantes
- Les relations entre tables sont établies par des clés étrangères
- L'intégrité référentielle est maintenue

Cette décomposition permet d'éviter la redondance des données tout en conservant toutes les informations de la relation d'origine. La structure est maintenant en 2NF car tous les attributs non-clés dépendent de la totalité de la clé primaire dans chaque table.

---

# Procédure pour convertir l'exercice 2 en 3NF

## 1. Analyse du schéma en 2NF

Notre schéma actuel en 2NF:

**Table Cours**
| ID_Cours (PK) | Nom_Cours | ID_Professeur (FK) |

**Table Professeur**
| ID_Professeur (PK) | Nom_Professeur | Département_Prof |

**Table Étudiant**
| ID_Étudiant (PK) | Nom_Étudiant | Programme_Étudiant |

**Table Inscription**
| ID_Cours (PK) | ID_Étudiant (PK) | Note |

## 2. Identification des dépendances transitives

Pour être en 3NF, en plus d'être en 2NF, aucun attribut non-clé ne doit dépendre d'un autre attribut non-clé.

Analysons les dépendances transitives potentielles:

- Dans la table Cours: Pas de dépendances transitives évidentes.
- Dans la table Professeur: Pas de dépendances transitives évidentes.
- Dans la table Étudiant: Pas de dépendances transitives évidentes.
- Dans la table Inscription: Pas de dépendances transitives évidentes.

À première vue, le schéma pourrait déjà sembler en 3NF. Cependant, examinons plus attentivement:

- Dans la table Professeur: `Département_Prof` dépend uniquement de `ID_Professeur`. C'est une dépendance fonctionnelle directe et non transitive.
- Dans la table Étudiant: `Programme_Étudiant` dépend uniquement de `ID_Étudiant`. C'est aussi une dépendance fonctionnelle directe.

## 3. Décomposition pour atteindre la 3NF

Dans ce cas précis, notre schéma est déjà en 3NF car il n'y a pas de dépendances transitives évidentes. Les tables décomposées lors du passage en 2NF satisfont déjà les conditions de la 3NF.

Si nous imaginions que chaque département avait un directeur ou une localisation spécifique, nous aurions alors une dépendance transitive (par exemple, `ID_Professeur → Département_Prof → Directeur_Département`). Dans ce cas, il faudrait créer une table distincte pour les départements.
Cependant, dans notre exemple, il n'y a pas de telles dépendances.
Nous n'avons donc pas besoin de décomposer davantage.

## 4. Vérification de la conformité 3NF

Dans ce schéma optimisé:
- Chaque table a une clé primaire bien définie
- Aucune dépendance partielle (satisfait 2NF)
- Aucune dépendance transitive (satisfait 3NF)
- Les relations entre tables sont établies par des clés étrangères
- L'intégrité référentielle est maintenue

Le schéma est maintenant complètement normalisé en 3NF, éliminant toute redondance potentielle et prévenant les anomalies de mise à jour.
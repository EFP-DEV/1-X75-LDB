# **Exercices Session 5 : Normalisation: 1NF, 2NF

## Exercice 1: Gestion d'une Librairie

### Données Brutes
Voici un extrait des données d'une librairie stockées dans une seule table:

| ID_Commande | Date_Commande | Client_Nom | Client_Email | Client_Téléphones | Livres_Commandés | Prix_Unitaires |
|-------------|---------------|------------|--------------|-------------------|------------------|----------------|
| C001 | 15/03/2025 | Dupont Jean | dupont@email.com | 0612345678, 0156789012 | "Le Petit Prince (ISBN: 978-2-07-040850-4), L'Étranger (ISBN: 978-2-07-036002-4)" | "12.50, 9.90" |
| C002 | 18/03/2025 | Martin Sophie | smartin@email.com | 0723456789 | "1984 (ISBN: 978-2-07-036822-8)" | "11.20" |
| C003 | 20/03/2025 | Dubois Marie | mdubois@email.com | 0634567890, 0145678923 | "Harry Potter T1 (ISBN: 978-2-07-054090-1), Le Seigneur des Anneaux (ISBN: 978-2-266-28536-9), Dune (ISBN: 978-2-266-23336-1)" | "15.50, 25.90, 13.40" |

**Instructions:**
1. Convertir ces données en 1NF
2. Convertir le résultat en 2NF

### Violations à identifier:
- Attributs multivalués (téléphones, livres, prix)
- Dépendances partielles après conversion en 1NF

## Exercice 2: Gestion d'Université

### Données Brutes
Voici un extrait des données d'une université stockées dans une seule table:

   | ID_Cours | Nom_Cours | ID_Professeur | Nom_Professeur | Département_Prof | ID_Étudiant | Nom_Étudiant | Programme_Étudiant | Note |
   |----------|-----------|---------------|----------------|------------------|-------------|--------------|---------------------|------|
   | CS101 | Introduction à l'informatique | P001 | Dr. Lefevre | Informatique | E001 | Moreau Paul | Génie Informatique | 18/20 |
   | CS101 | Introduction à l'informatique | P001 | Dr. Lefevre | Informatique | E002 | Garcia Ana | Sciences des Données | 16/20 |
   | CS101 | Introduction à l'informatique | P001 | Dr. Lefevre | Informatique | E003 | Laurent Thomas | Génie Informatique | 14/20 |
   | MATH201 | Algèbre linéaire | P002 | Dr. Rousseau | Mathématiques | E001 | Moreau Paul | Génie Informatique | 15/20 |
   | MATH201 | Algèbre linéaire | P002 | Dr. Rousseau | Mathématiques | E002 | Garcia Ana | Sciences des Données | 19/20 |
   | PHY101 | Mécanique classique | P003 | Dr. Petit | Physique | E004 | Blanc Julie | Physique | 17/20 |

**Instructions:**
1. Convertir ces données en 1NF
2. Convertir le résultat en 2NF

### Violations à identifier:
- La table est déjà en 1NF (pas d'attributs multivalués)
- Dépendances partielles (informations sur cours/professeurs/étudiants)

## Exercice 3: Gestion d'un Garage Automobile

### Données Brutes
Voici un extrait des données d'un garage automobile stockées dans une seule table:

| ID_Réparation | Date_Réparation | ID_Client | Nom_Client | Adresse_Client | Téléphones_Client | ID_Véhicule | Marque_Modèle | Année_Fabrication | Pièces_Utilisées | Coûts_Pièces | Heures_Main_Œuvre | Coût_Horaire | Mécanicien_Responsable | Certification_Mécanicien |
|--------------|-----------------|-----------|------------|----------------|-------------------|-------------|--------------|-------------------|------------------|--------------|-------------------|-------------|------------------------|-------------------------|
| R001 | 10/03/2025 | C001 | Dupont Pierre | 15 rue des Lilas, 75001 Paris | 0612345678, 0723456789 | V001 | Renault Clio | 2018 | "Filtre à huile, Huile moteur 5W40" | "25.50, 45.00" | 2.5 | 60.00 | Michel Durant | "Renault Certified, ASE Master" |
| R002 | 12/03/2025 | C002 | Leroy Sophie | 8 avenue des Roses, 69002 Lyon | 0634567890 | V002 | Peugeot 308 | 2020 | "Plaquettes de frein, Disque de frein" | "85.00, 120.00" | 3.0 | 60.00 | Lucas Martin | "Peugeot Certified" |
| R003 | 15/03/2025 | C001 | Dupont Pierre | 15 rue des Lilas, 75001 Paris | 0612345678, 0723456789 | V003 | Citroën C3 | 2016 | "Batterie, Alternateur" | "150.00, 280.00" | 4.5 | 60.00 | Michel Durant | "Renault Certified, ASE Master" |
| R004 | 18/03/2025 | C003 | Bernard Julie | 25 boulevard Central, 33000 Bordeaux | 0645678901 | V004 | Toyota Yaris | 2019 | "Filtre à air, Bougies d'allumage" | "18.50, 45.00" | 1.0 | 60.00 | Emma Petit | "Toyota Certified, ASE Certified" |

**Instructions:**
1. Convertir ces données en 1NF
2. Convertir le résultat en 2NF

### Violations à identifier:
- Attributs multivalués (téléphones, pièces, coûts, certifications)
- Dépendances partielles (informations client liées uniquement à ID_Client)

---

## Solutions attendues

Pour chaque exercice, une solution complète comprendra:

1. **Conversion en 1NF**:
   - Élimination des attributs multivalués
   - Attribution d'une clé primaire appropriée

2. **Conversion en 2NF**:
   - Identification des dépendances partielles
   - Décomposition en tables sans dépendances partielles

Les solutions montreront clairement la structure des tables résultantes avec leurs clés primaires et étrangères.


---
> Ce cours est distribué sous **licence Creative Commons**. Toute reproduction ou distribution à but commercial est interdite sans l’accord préalable de l’auteur.

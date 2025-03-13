# MERISE

## Explications des trois niveaux de modélisation

### Niveau Conceptuel
Le modèle conceptuel représente la réalité métier indépendamment des contraintes techniques. Il identifie les entités importantes (APPRENANT, ENTREPRISE, STAGE, etc.) et leurs relations fonctionnelles. Ce niveau se concentre sur:
- Les objets métier essentiels
- Les relations entre ces objets
- Les attributs de base de chaque entité
- Les cardinalités des relations

### Niveau Logique
Le modèle logique transforme le modèle conceptuel en une structure organisée pour un système de gestion de base de données, mais reste indépendant d'un SGBD spécifique. Les modifications incluent:
- Transformation des entités en tables avec des noms en minuscules au pluriel
- Introduction des clés primaires (PK) et étrangères (FK)
- Définition des types de données génériques (VARCHAR, DATE, TEXT)
- Modélisation des relations par des clés étrangères

### Niveau Physique
Le modèle physique définit l'implémentation technique concrète dans un SGBD spécifique. Les caractéristiques ajoutées sont:
- Types de données précis avec leurs tailles (varchar(36), decimal(10,2))
- Contraintes d'intégrité (NOT NULL, UNIQUE, DEFAULT)
- Index pour optimiser les performances des requêtes
- Colonnes techniques (created_at, updated_at)
- Contraintes d'unicité spécifiques
- Valeurs par défaut pour certains champs

Ces trois niveaux représentent le processus progressif de transformation d'un modèle métier abstrait en une implémentation technique concrète et optimisée.

---
## Exemple
### Contexte

Une institution de formation souhaite informatiser la gestion des stages de ses apprenants. Le système doit permettre aux entreprises de proposer des offres, aux apprenants de postuler, et aux tuteurs de suivre le déroulement des stages.

### Spécifications techniques

Le schéma entité-association fourni représente la structure de données du système avec les entités suivantes:
- APPRENANT: Étudiant inscrit dans une formation
- ENTREPRISE: Organisme proposant des stages
- OFFRE_STAGE: Proposition de stage publiée par une entreprise
- CANDIDATURE: Demande soumise par un apprenant pour une offre
- STAGE: Période de formation en entreprise
- TUTEUR_PEDAGOGIQUE: Enseignant supervisant le stage côté académique
- TUTEUR_ENTREPRISE: Professionnel encadrant le stagiaire en entreprise
- FORMATION: Programme d'études suivi par l'apprenant

### Contraintes fonctionnelles

D'après le schéma:
1. Un apprenant peut effectuer 1 ou plusieurs stages, mais un stage ne concerne qu'un seul apprenant
2. Un apprenant peut soumettre plusieurs candidatures
3. Une entreprise peut proposer plusieurs offres de stage
4. Une offre de stage peut recevoir plusieurs candidatures
5. Un stage correspond à une seule offre, mais une offre peut ne pas aboutir à un stage
6. Chaque stage est supervisé par un tuteur pédagogique et encadré par un tuteur en entreprise
7. Une formation comprend plusieurs apprenants


### Niveau Conceptuel

![image info](MERISE_MCD.svg)


---

### Niveau Logique

![image info](MERISE_MLD.svg)

---
### Niveau Physique

[SQL DDL](MERISE_MPD.sql)







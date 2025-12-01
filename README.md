# Introduction au module : Bases de Données Relationnelles

Ce module a pour objectif de guider progressivement les apprenants dans la compréhension, la modélisation, la mise en œuvre et l’exploitation d’une base de données relationnelle. Il alterne théorie, démonstrations et mise en pratique, dans un cadre méthodique et professionnalisant.


## Objectifs pédagogiques

L’apprenant sera capable de :

1. Comprendre les concepts fondamentaux des bases de données relationnelles.
2. Identifier et modéliser les entités, attributs et relations à partir d’un besoin métier.
3. Élaborer un Modèle Conceptuel de Données (MCD) avec la méthode MERISE.
4. Transformer le MCD en schéma relationnel et appliquer les formes normales (1NF, 2NF, 3NF).
5. Rédiger des requêtes SQL (CRUD, jointures, agrégats, filtres).
6. Implémenter les contraintes d’intégrité (clés primaires, étrangères, unicité, nullabilité).
7. Structurer un projet complet de base de données dans un contexte applicatif.


## Approche pédagogique

- Progression pas à pas, de la manipulation simple à la conception relationnelle complète.
- Études de cas métiers pour ancrer les concepts dans la réalité.
- Alternance constante entre explication, démonstration et mise en pratique.
- Accompagnement dans les bonnes pratiques de structuration, de lisibilité et de cohérence.

- **Évaluation continue** : exercices pratiques reguliers.
- **Examen final** : test écrit + projet pratique.

## Résultats attendus

À la fin du module, l’apprenant saura concevoir une base de données relationnelle robuste, normalisée, et exploitable dans un environnement de développement applicatif. Il saura écrire et commenter des requêtes SQL utiles, comprendre les enjeux d’intégrité des données, et structurer ses projets de manière rigoureuse.

---


## Déroulé du module

Le module est structuré en **12 séances de 4 heures**, alternant entre théorie et pratique.

### Séance 1 – Introduction et manipulation d’une table simple
- Découverte des bases de données.
- Insertion, lecture, mise à jour et suppression de données via SQL.
- Premières requêtes avec filtres et tri.  
[Support](session_1.md) • [Exercices](session_1_exo.md)

### Séance 2 – Initiation à la modélisation
- Identification des entités et de leurs attributs.
- Définition des types, règles de nommage et contraintes.  
[Support](session_2.md) • [Exercices](session_2_exo.md)

### Séance 3 – Modélisation conceptuelle (MCD)
- Construction d’un MCD avec entités, attributs, associations.
- Travail sur les cardinalités et règles métiers.  
[Support](session_3.md) • [Exercices](session_3_exo.md)

### Séance 4 – Normalisation (1NF à 3NF)
- Détection des anomalies structurelles.
- Décomposition en tables cohérentes et non redondantes.  
[Support](session_4.md) • [Exercices](session_4_exo.md)

### Séance 5 – Application sur un cas réel
- Analyse d’un cahier des charges.
- Élaboration d’un modèle adapté au besoin métier.  
*(Aucun fichier spécifique fourni)*

### Séance 6 – Mise en œuvre de l’intégrité référentielle
- Déclaration des clés étrangères.
- Étude des comportements `ON DELETE` et `ON UPDATE`.  
[Support](session_6.md)

### Séance 7 – Requêtes SQL avancées
- Jointures simples et multiples.
- Agrégation, regroupement, sous-requêtes.  
[Support](session_7.md) • [Exercices](session_7_exo.md)

### Séance 8 – Cas pratiques et corrections
- Résolution collective d’exercices issus des séances précédentes.  
*(Aucun fichier spécifique fourni)*

### Séance 9 – Requêtes projetées et application métier
- Écriture de requêtes spécifiques aux besoins d’un projet (filtrage, tags, opérateurs, etc.).  
[Support](session_9.md) • [Exercices](session_9_exo.md)

### Séance 10 – Tests et corrections
- Mise en pratique de l'intégration SQL et test des cas limites.  
*(Aucun fichier spécifique fourni)*

### Séance 11 – Projet final
- Création complète de la base de données du projet.
- Tests d’intégrité, insertion de jeux de données, export SQL.  
[Support](session_11.md)

### Séance 12 – Examen final et évaluation
- QCM de validation des acquis.
- Revue du projet final et documentation.  
[Examen](examen.md)


## Tableau des cours

| Séance | X75B       | X75A       |
|--------|------------|------------|
| **1**  | 25/02/2025 | 30/01/2025 |
| **2**  | 27/02/2025 | 27/02/2025 |
| **3**  | 11/03/2025 | 13/03/2025 |
| **4**  | 13/03/2025 | 20/03/2025 |
| **5**  | 18/03/2025 | 27/03/2025 |
| **6**  | 20/03/2025 | 03/04/2025 |
| **7**  | 25/03/2025 | 10/04/2025 |
| **8**  | 27/03/2025 | 17/04/2025 |
| **9**  | 01/04/2025 | 24/04/2025 |
| **10** | 03/04/2025 | 08/05/2025 |
| **11** | 10/04/2025 | 15/05/2025 |
| **12** | 17/04/2025 | 22/05/2025 |
---


## Matériel nécessaire

- Un ordinateur avec **XAMPP** installé (Apache + MySQL)
- Un éditeur de texte comme **Visual Studio Code**
- Un navigateur web (Chrome, Firefox, etc.)

### 1. Installer XAMPP

- Télécharger XAMPP depuis : [https://www.apachefriends.org/index.html](https://www.apachefriends.org/index.html)
- Suivre les instructions d’installation pour ton système d’exploitation

### 2. Lancer les services

- Ouvrir le **XAMPP Control Panel**
- Démarrer les modules **Apache** et **MySQL**

### 3. Accéder à phpMyAdmin

- Ouvrir un navigateur et aller à : `http://localhost/phpmyadmin`
- Créer/modifier vos bases de données


---
> Ce cours est distribué sous **licence Creative Commons**. Toute reproduction ou distribution à but commercial est interdite sans l'accord préalable de l'auteur.

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

- **Évaluation continue** : exercices pratiques reguliers + projet final
- **Examen final** : test écrit

## Résultats attendus

À la fin du module, l’apprenant saura concevoir une base de données relationnelle robuste, normalisée, et exploitable dans un environnement de développement applicatif. Il saura écrire et commenter des requêtes SQL utiles, comprendre les enjeux d’intégrité des données, et structurer ses projets de manière rigoureuse.

---


## Déroulé du module

Le module est structuré en **12 sessions de 4 heures**, alternant entre théorie et pratique.


| #  | Titre                                          | Contenu principal                                                                           | Support                                                     |
| -- | ---------------------------------------------- | ------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| 1  | Histoire du stockage et Tabulation | Pourquoi et comment stocker | [Support](session_01.md) / — |
| 2  | Introduction & manipulation d'une table simple | Découverte des bases SQL : opérations CRUD, filtres et tri.                                 | [Support](session_02.md) / [Exercices](exo/session_02.md) |
| 3  | Experimentation SQL avec phpMyAdmin                   | Exercice guidé       | — / [Exercices](exo/session_03.md) |
| 4  | Modélisation conceptuelle (MCD)                | Construction d'un MCD : entités, associations, cardinalités, règles métiers.                | [Support](session_04.md) / [Exercices](exo/session_04.md) |
| 5  | Normalisation (1NF → 3NF)                      | Analyse et correction des anomalies pour obtenir un schéma logique fiable et non redondant. | [Support](session_05.md) / [Exercices](exo/session_05.md) |
| 6  | Application sur un cas réel                    | Analyse d'un cahier des charges et création d'un modèle adapté au besoin métier.            | [Support](session_06.md) / — |
| 7  | Du MCD au MLD au MPD                        | Transformation MCD → MLD → MPD, tables d'association, clés étrangères.         | [Support](session_07.md) / —                                    |
| 8  | Correction complète & SQL final                          | Correction du cas réel : MCD, MLD, MPD, SQL final.                                 | [Support](session_08.md) / — |
| 9  | Cas pratiques & corrections                    | Résolution collective d'exercices couvrant toutes les notions vues.                         | — / —                                                       |
| 10  | Requêtes projetées & application métier        | Requêtes adaptées à des besoins métier : filtrages avancés, opérateurs spécifiques.         |  — / —     |
| 11 | Projet final                                   | Conception d'une base complète, insertion de données, préparation d'un export SQL final.    |  — / —                                  |
| 12 | Examen final & évaluation                      | QCM de validation + revue détaillée du projet final.                                        | — / —                                                       |



## Matériel nécessaire

- Un ordinateur avec **XAMPP** installé (Apache + MySQL + PHP + phpMyAdmin)
- Un éditeur de code comme **Visual Studio Code** ou **Zed** ou **Notepad++**
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

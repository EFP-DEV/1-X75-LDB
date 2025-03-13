# **Cours : Bases de Données Relationnelles (LBB)**

## **Introduction**
Ce module vise à fournir une compréhension approfondie des bases de données relationnelles et de leur utilisation dans le cadre du développement web. Il s’aligne sur les objectifs du référentiel de formation, notamment :

- **Connaître et comprendre le fonctionnement des bases de données relationnelles** :
  - Différences entre les modèles de bases de données.
  - Concepts fondamentaux : entités, relations, clés et intégrité des données.
  
- **Concevoir et modéliser une base de données relationnelle** :
  - Utilisation de la méthode MERISE pour créer un modèle conceptuel (MCD).
  - Transformation en modèle logique et mise en œuvre des formes normales.

- **Manipuler et exploiter les données via SQL** :
  - Maîtriser les commandes **CRUD** (`INSERT`, `SELECT`, `UPDATE`, `DELETE`).
  - Effectuer des **jointures**, des agrégations et optimiser les requêtes.

- **Sécuriser et maintenir une base de données** :
  - Protection contre les injections SQL.
  - Gestion des permissions et sauvegarde des données.

- **Intégrer une base de données dans un projet web** :
  - Connexion via **PHP & PDO**.
  - Interaction sécurisée avec une base de données.

## **Plan du cours**
Le module est structuré en **10 séances de 4 heures**, alternant entre théorie et pratique.

### **Séance 1 : Introduction et positionnement**
- Présentation des objectifs et du rôle des bases de données.
- Historique des bases de données et panorama des SGBD.
- Introduction au modèle relationnel : entités, attributs, relations.

**Supports** : [Théorie](session_1.md) | [Exercices](session_1_exo.md)

---

### **Séance 2 : CRUD – Premières manipulations en SQL**
- Installation de **MySQL + PHPMyAdmin**.
- Création d’un utilisateur et d’une base de données.
- Manipulation des données : `INSERT`, `SELECT`, `UPDATE`, `DELETE`.
- Filtres (`WHERE`, `ORDER BY`) et fonctions d’agrégation (`COUNT`, `SUM`, `AVG`).

**Supports** : [Théorie](session_2.md) | [Exercices](session_2_exo.md)

---

### **Séance 3 : Modélisation conceptuelle (MCD - Modèle Entité-Association)**
- Introduction à la méthode **MERISE**.
- Construction d’un **Modèle Conceptuel des Données (MCD)**.
- Étude de cas et exercices de modélisation.

**Supports** : [Théorie](session_3.md) | [Exercices](session_3_exo.md)

---

### **Séance 4 : Passage du MCD au modèle relationnel et normalisation**
- Conversion d’un **MCD en schéma relationnel**.
- Explication et application des **trois premières formes normales**.
- Correction et optimisation d’un modèle.

**Supports** : [Théorie](session_4.md) | [Exercices](session_4_exo.md)

---

### **Séance 5 : Clés, relations et intégrité référentielle**
- Clés primaires, étrangères et index.
- Contraintes d’intégrité (`FOREIGN KEY`, `ON DELETE CASCADE`).
- Mise en relation des entités et cohérence des données.

**Supports** : [Théorie](session_5.md) | [Exercices](session_5_exo.md)

---

### **Séance 6 : Jointures et manipulation avancée des données**
- Utilisation des jointures (`INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`).
- Regroupements et filtrage (`GROUP BY`, `HAVING`).
- Optimisation des requêtes et indexation (`EXPLAIN`).

**Supports** : [Théorie](session_6.md) | [Exercices](session_6_exo.md)

---

### **Séance 7 : Projet pratique – Conception et implémentation**
- Analyse d’un **cahier des charges** et conception d’une base relationnelle.
- Travail en groupe : **MCD, MLD et requêtes SQL**.
- Corrections et échanges collectifs.

**Supports** : [Théorie](session_7.md) | [Exercices](session_7_exo.md)

---

### **Séance 8 : Suite du projet**
- Approfondissement du projet de base de données.
- Intégration des notions avancées (relations complexes, optimisation).
- Présentation des avancées et retours d’amélioration.

---

### **Séance 9 : Sécurité et bonnes pratiques en bases de données**
- Prévention des attaques **SQL Injection** et sécurisation des requêtes.
- Introduction à **PDO** (Connexion, Requêtes préparées).
- Sauvegarde et restauration d’une base (`mysqldump`).

**Supports** : [Théorie](session_9.md) | [Exercices](session_9_exo.md)

---

### **Séance 10 : Examen final et validation des acquis**
- Évaluation écrite et pratique sur la **modélisation et SQL**.
- Présentation des projets réalisés.
- Discussion finale sur les bonnes pratiques et retours d’expérience.

**Supports** : [Théorie](session_10.md) | [Exercices](session_10_exo.md)

---

## **Évaluation et méthodologie**
- **Méthode pédagogique** : alternance entre **cours théorique**, **exercices pratiques** et **études de cas**.
- **Évaluation continue** : exercices pratiques à chaque séance.
- **Examen final** : test écrit + projet pratique.

---

## **Pré-requis et matériel nécessaire**
### **Pré-requis**
- Connaissances de base en informatique (systèmes et fichiers).
- Familiarité avec les concepts de programmation (PHP recommandé mais non obligatoire).

### **Matériel requis**
- Un ordinateur avec **MySQL** et **PHPMyAdmin / HeidiSQL** installés.
- Un éditeur de texte (VS Code, Sublime Text ou autre).
- Un navigateur web.

---

## **Objectifs finaux du module**
À l’issue du cours, l’apprenant sera capable de :
1. **Concevoir et structurer** une base de données relationnelle en respectant les bonnes pratiques.
2. **Créer et manipuler** des données via **SQL**.
3. **Garantir l’intégrité et la sécurité** d’une base relationnelle.
4. **Intégrer une base de données** dans une application web en utilisant **PHP & PDO**.
5. **Optimiser** les requêtes SQL et assurer la maintenance d’une base de données.

---

## **Licence et droits d’usage**
Ce cours est distribué sous **licence Creative Commons**. Toute reproduction ou distribution à but commercial est interdite sans l’accord préalable de l’auteur.

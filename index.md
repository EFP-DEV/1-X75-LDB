# X75 : Bases de données

Ce dépôt rassemble le programme et les supports du module de bases de données des groupes **X75 A** et **X75 B**.

Le module comprend **48 heures : 12 séances de 4 heures**, dont 10 séances d’apprentissage, une révision générale et un examen.

Le [résumé du référentiel EFP et les objectifs du cours](referentiel.md) précisent les compétences visées.

## Le projet du module

Le projet commun repose sur une **application centrée sur les collections**, déclinable en application de collections, réseau social ou boutique pour l’atelier ADB. Son socle comprend des utilisateurs, des éléments publiés, des médias, des collections, des interactions et des crédits internes. Les thèmes, catégories et tags peuvent compléter le projet selon les besoins.

Les exercices commencent avec un même corpus de **42 documents culturels**, utilisé en séance 1 puis repris en tableaux à la séance 2. On classe d’abord les documents librement, puis on y recherche des informations. On apprend progressivement à interroger les données avec SQL, à les modifier, à les relier et à construire une base cohérente. Les mêmes tâches permettent de comparer les solutions et de vérifier les effets des changements. Les étudiants adaptent ensuite ce socle au sujet de leur application.

À la fin de la séance 10, le schéma, les scripts de création et d’import, les données de test, les requêtes et la documentation constituent une **base utilisable en atelier ADB**.

## Supports de cours

Le premier support disponible est la [séance 1 - Définir, classer et retrouver](session_01.md). Les liens vers les autres supports seront ajoutés au fil du module.

Les consignes, les exemples et les vérifications à effectuer figurent dans les supports de chaque séance. On conserve les fichiers de travail et les observations pour reprendre le projet à la séance suivante. La syntaxe et les outils sont introduits au moment où ils deviennent utiles.

## Calendrier

| Séance | X75 A | X75 B |
|---|---|---|
| **1 - [Définir, classer et retrouver](session_01.md)** | 04/11 | 10/11 |
| **2 - Structurer, distinguer et définir** | 12/11 | 17/11 |
| **3 - Répéter et automatiser les recherches** | 19/11 | 24/11 |
| **4 - Modifier et produire des bilans** | 25/11 | 01/12 |
| **5 - Rapprocher et relier** | 26/11 | 08/12 |
| **6 - Rencontrer les limites d’une mauvaise structure** | 02/12 | 15/12 - matin |
| **7 - Restructurer et normaliser** | 03/12 | 15/12 - après-midi |
| **8 - Confronter les interprétations et modéliser** | 09/12 | 22/12 - matin |
| **9 - Construire, corrompre, réparer et protéger** | 10/12 | 22/12 - après-midi |
| **10 - Maintenir, transmettre et vérifier** | 16/12 | 05/01 |
| **11 - Révision générale** | 17/12 | 12/01 |
| **12 - Examen** | 07/01 | **19/01 - à confirmer** |

## Programme des séances

### 1 : Définir, classer et retrouver

La séance s’ouvre par la présentation du formateur et des trois cours suivis avec lui - LDB, LPB et ADB -, de leur articulation et des contraintes d’organisation et de travail. Un temps est consacré aux questions.

On recueille au tableau les mots connus autour des données. Le formateur invente ensuite une histoire utilisant tous ces mots. On y distingue la donnée de l’information obtenue en l’interprétant dans un contexte : une même valeur peut désigner un nombre d’éléments ou un prix. L’histoire conduit à la question : « Si les ordinateurs ne connaissent que 0 et 1, comment du texte apparaît-il à l’écran ? »

On suit le nombre 122 à travers les systèmes de numération décimal, sexagésimal et vigésimal, la notation maya, le comptage unaire, puis le binaire. Ces comparaisons permettent d’expliquer la valeur des positions, le rôle du zéro et le bit. On découvre ensuite que 122 est le code ASCII de la lettre `z`. On distingue les sept bits du code ASCII de sa représentation sur un octet, puis on explique le décodage et l’affichage d’un glyphe fourni par une police. Une activité sur papier fait convertir les codes de `y` et de `x` entre décimal et binaire, vérifier les décompositions et expliquer le passage des bits au texte affiché. Ce chapitre est enseigné en LDB, avant le module LPB qui s’y réfère.

Après la pause, on change d’échelle pour aborder la classification d’un ensemble de documents : on réorganise librement les documents dispersés dans une interface web. Chaque groupe utilise son classement pour répondre aux [treize questions](session_01.md#5-rechercher-dans-le-classement) : dix recherches de mentions précises et trois comptages. Un autre groupe reprend les questions 1 et 3 sur ce classement. Les réponses, les parcours et les difficultés observées permettent de comparer les classements. Une démonstration montre ensuite comment les descriptions des images et la recherche du navigateur permettent déjà de répondre aux mêmes questions. On distingue les occurrences trouvées des documents comptés et on relie le choix des outils aux besoins à satisfaire.

La synthèse porte sur les résultats de la recherche textuelle : documents trouvés à tort, documents manqués et choix des termes de recherche. Une courte transition introduit la notion de requête et annonce SQL. Chaque groupe consigne le texte recherché, le document retrouvé et l’inscription qui répond à la question, puis conserve les résultats pour la séance 2. Les développements sur Codd, l’histoire de SQL et les interfaces à facettes sont proposés en lecture facultative hors séance.

**Notions abordées :** Donnée et information, rôle du contexte ; base de données, fichier plat et SGBD ; quantité et représentation ; systèmes de numération, notation positionnelle, rôle du zéro, bit, octet et conversions entre décimal et binaire ; caractère, code numérique ou point de code, encodage ASCII, décodage, police, glyphe et pixels ; premiers principes d’organisation et de classification ; recherche textuelle et vérification des comptages ; faux positifs et négatifs ; notion de requête et introduction à SQL sans syntaxe.

### 2 : Structurer, distinguer et définir

On reprend les 42 documents de la séance 1, leurs numéros, les notes et les captures des classements. Chaque document devient une fiche d’élément à publier ; plusieurs documents concernant la même œuvre restent distincts. On relève les informations utiles aux recherches : titre ou désignation, nature du document, personnes mentionnées et leurs rôles, lieu, date et horaire lorsqu’ils sont indiqués. On conserve aussi les descriptions complètes et les mentions utilisées dans les treize questions : prix et monnaie, référence, inscription, logo, puissance du moteur, durée, placement et année. Les regroupements proposés servent à décrire des collections et les documents qu’elles réunissent.

On organise ces données en tableaux pour reprendre les treize questions et en poser de nouvelles qui traversent plusieurs regroupements. On précise les champs pour distinguer les homonymes, interpréter les dates et représenter les valeurs manquantes. On vérifie les réponses et les comptages à partir du corpus, puis on conserve les tableaux, leur dictionnaire des données et les exports CSV pour la séance 3. Les données de départ précisent cette continuité.

**Notions abordées :** Tableur ; tableaux, lignes, colonnes et cellules ; identifiants ; dictionnaire des données ; nommage, types, formats et longueurs ; valeur absente, chaîne vide et zéro ; export CSV.

### 3 : Répéter et automatiser les recherches

On complète les fiches issues de la séance 2 avec des données fictives fournies pour l’exercice : utilisateurs responsables, statuts et dates de publication dans l’application. On distingue ces données des artistes et des dates figurant sur les documents. On recherche les éléments publiés, les brouillons et les publications d’une période. On installe le système de gestion de base de données (SGBD), on importe les données et on écrit des requêtes réutilisables.

**Notions abordées :** Installation et configuration locale du SGBD ; distinction serveur/client ; connexion et import ; `SELECT`, `WHERE`, comparaisons, opérateurs logiques, `LIKE`, `IS NULL`, `ORDER BY`, `DISTINCT`.

### 4 : Modifier et produire des bilans

On ajoute un élément, on corrige une fiche, on change un statut et on supprime un enregistrement. On vérifie les données avant et après chaque modification, puis on produit des bilans sur les éléments et leurs publications dans l’application.

**Notions abordées :** `INSERT`, `UPDATE`, `DELETE` ; portée du `WHERE` ; vérification avant et après modification ; `COUNT`, autres agrégats, `GROUP BY`, `HAVING`.

### 5 : Rapprocher et relier

À partir d’une base correctement structurée fournie, on retrouve les utilisateurs responsables des éléments, leurs médias et les collections qui les réunissent. On rapproche les informations manuellement, puis avec SQL. On recherche également les éléments sans collection et les collections vides. Un même élément peut appartenir à plusieurs collections : on vérifie les comptages obtenus après rapprochement.

**Notions abordées :** Clés de liaison ; `INNER JOIN`, `LEFT JOIN`, alias ; lecture des tables d’association ; relations multiples ; regroupements et risques de doubles comptages.

### 6 : Rencontrer les limites d’une mauvaise structure

On reprend les tâches de la séance précédente sur des versions dégradées des mêmes données : listes dans une cellule, colonnes répétées et coordonnées recopiées. On essaie les contournements fournis, puis on observe les effets des ajouts, des modifications et des suppressions.

**Notions abordées :** Redondances ; traitements textuels et requêtes fragiles ; anomalies d’insertion, de mise à jour et de suppression ; comparaison des résultats et de la difficulté des opérations.

### 7 : Restructurer et normaliser

On réorganise les données problématiques. On répète exactement les recherches et les modifications précédentes, puis on vérifie que les informations ont été conservées. Les transformations réalisées permettent de définir les trois premières formes normales.

**Notions abordées :** Atomicité ; dépendances fonctionnelles ; clés composées ; dépendances partielles et transitives ; **première, deuxième et troisième formes normales**.

### 8 : Confronter les interprétations et modéliser

On examine les besoins de l’application de collections et plusieurs cas limites : collection vide, élément présent dans plusieurs collections, utilisateur désactivé et suppression d’un élément encore référencé. On compare les interprétations, on fixe les règles métier et on représente le modèle retenu. Selon la déclinaison choisie, on précise aussi les règles d’un panier, d’un emprunt ou d’une interaction.

**Notions abordées :** Analyse des besoins ; règles métier ; entités, attributs, associations et cardinalités ; modèle conceptuel des données (MCD) → modèle logique des données (MLD) ; traduction des relations et tables d’association ; outil graphique.

### 9 : Construire, corrompre, réparer et protéger

On traduit le modèle en une base exécutable. Sur une copie sans protections, on introduit des doublons, des références inexistantes et des données incomplètes. On nettoie les données, on ajoute les contraintes, puis on répète les mêmes tentatives pour observer leur effet.

**Notions abordées :** modèle physique des données (MPD) ; types SQL ; `CREATE TABLE`, `ALTER TABLE` ; `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `CHECK`, valeurs par défaut ; intégrité référentielle ; `RESTRICT`, `CASCADE`, `SET NULL`.

### 10 : Maintenir, transmettre et vérifier

On prépare la base pour l’atelier : gestion des accès, sauvegarde et restauration. On observe les recherches sur un volume de données accru. Une autre équipe reconstruit la base et répond aux questions initiales à partir des fichiers et de la documentation transmis. On corrige les problèmes révélés.

**Notions abordées :** Comptes et permissions SQL ; connexion distante ; sécurité et distinction avec les comptes de l’application ; sauvegarde et restauration vérifiée ; index ; scripts, données de test et documentation ; choix relationnel et comparaison ciblée avec NoSQL.

### 11 : Révision générale

On reprend toute la chaîne sur le projet : besoin, modèle, création, import, requêtes, modifications, anomalies, contraintes et restauration. Les exercices de synthèse permettent de reprendre les difficultés rencontrées.

**Notions abordées :** **Ensemble des acquis. Aucune matière nouvelle.**

### 12 : Examen

L’épreuve pratique est individuelle et se déroule dans le contexte du projet d’atelier. Elle porte sur l’exploitation et la modification des données, le diagnostic et la correction de problèmes, ainsi que la justification des choix.

**Notions abordées :** **Évaluation des compétences travaillées pendant le module.**

## Évaluation

La séance 11 est consacrée à une révision générale, sans matière nouvelle.

L’examen est une épreuve pratique individuelle dans le contexte du projet d’atelier. Il évalue les compétences travaillées pendant le module : exploiter et modifier les données, diagnostiquer et corriger des problèmes, puis justifier les choix effectués.

## Archives

Les supports de l’année précédente sont conservés dans le dossier [2025-2026](2025-2026/). Le programme et les supports liés depuis cette page constituent la référence pour le module en cours.

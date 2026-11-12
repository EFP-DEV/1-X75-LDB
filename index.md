# X75 : Bases de données

Ce dépôt rassemble le programme et les supports du module de bases de données des groupes **X75 A** et **X75 B**.

Le module comprend **48 heures : 12 séances de 4 heures**, dont 10 séances d’apprentissage, une révision générale et un examen.

Le [résumé du référentiel EFP et les objectifs du cours](referentiel.md) précisent les compétences visées.

## Le projet du module

Le projet commun repose sur une **application centrée sur les collections**, déclinable en application de collections, réseau social ou boutique pour l’atelier ADB. Son socle comprend des utilisateurs, des éléments publiés, des médias, des collections, des interactions et des crédits internes. Les thèmes, catégories et tags peuvent compléter le projet selon les besoins.

Les exercices commencent avec un même corpus de **42 documents culturels**, utilisé en séance 1 puis repris progressivement dans le module. On classe d’abord les documents librement, puis on y recherche des informations. En séance 2, les commandes fictives de la **Papeterie du Canal**, distribuées en quatre lots, servent à construire un dictionnaire des données dans Excel : préciser le sens des champs, choisir leurs types et déterminer leurs valeurs admises. On apprend ensuite à transférer les données, à les interroger avec SQL, à les modifier, à les relier et à construire une base cohérente. Les mêmes tâches permettent de comparer les solutions et de vérifier les effets des changements. Les étudiants adaptent ensuite ce socle au sujet de leur application.

À la fin de la séance 10, le schéma, les scripts de création et d’import, les données de test, les requêtes et la documentation constituent une **base utilisable en atelier ADB**.

## Supports de cours

Les supports disponibles sont la [séance 1 - Définir, classer et retrouver](session_01.md) et la [séance 2 - Décrire et représenter les propriétés](session_02.md), accompagnée de l’[exercice « Des documents aux champs »](exo/session_02.md) et des [lots A à D de la papeterie](exo/session_02_documents.html). Les liens vers les autres supports seront ajoutés au fil du module.

Les consignes, les exemples et les vérifications à effectuer figurent dans les supports de chaque séance. On conserve les fichiers de travail et les observations pour reprendre le projet à la séance suivante. La syntaxe et les outils sont introduits au moment où ils deviennent utiles.

## Calendrier

| Séance | X75 A | X75 B |
|---|---|---|
| **1 - [Définir, classer et retrouver](session_01.md)** | 04/11 | 10/11 |
| **2 - [Décrire et représenter les propriétés](session_02.md)** | 12/11 | 17/11 |
| **3 - Identifier, relier et interroger** | 19/11 | 24/11 |
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

### 2 : Décrire et représenter les propriétés

La séance apprend à transformer une propriété du réel en un champ exploitable : préciser son sens, choisir son type et déterminer ce qu’il peut contenir. Les décisions suivent une boucle : proposer, confronter aux données, constater les conséquences et ajuster.

Les binômes travaillent sur les commandes fictives de la Papeterie du Canal. Le lot A fait relever les champs et un exemple exact dans Excel, avec une ligne par champ. Un premier échange précise le sens des dates, du prix unitaire et de l’adresse de livraison, avant le choix des types. Le lot B confronte ces types à des références et à des coordonnées variées. Les règles de contenu et de longueur sont proposées avant le lot C ; les règles de validation avant le lot D. Les étudiants doivent repérer aussi bien les valeurs légitimes refusées que les valeurs incohérentes acceptées et reconnaître les informations qui leur manquent.

Le classeur conserve le dictionnaire des données et la trace des décisions. Un autre binôme reformule les définitions et applique les règles aux documents ; les corrections sont vérifiées sur les mêmes valeurs. Une courte reprise d’une propriété du corpus culturel prépare le transfert vers le projet commun. Les identifiants, les relations et le transfert des données commencent à la séance suivante.

**Notions abordées :** Propriété, champ et valeur ; sens et usages ; dictionnaire et nommage ; types, unités et précision ; formats, contenu, longueurs et validation ; valeur fournie et valeur calculée ; conventions, informations manquantes et décisions à confirmer.

### 3 : Identifier, relier et interroger

Deux personnes portent le même nom : la consigne de modification devient ambiguë. Une personne possède plusieurs téléphones : recopier sa fiche provoque des incohérences lorsqu’une seule copie est modifiée. Ces difficultés font apparaître le besoin d’identifiants et de relations. On construit ces premières représentations avant d’introduire leur utilisation dans un SGBD.

On passe du dictionnaire des champs à un tableau de données. Un export CSV fait travailler les fichiers plats et les conventions d’échange : encodage, séparateurs, dates et valeurs absentes. On réimporte le fichier en précisant les types, puis on compare les valeurs aux sources, notamment les accents, les zéros initiaux et les dates.

On complète progressivement les fiches de documents avec des données fictives de fonctionnement : utilisateurs responsables, statuts et dates de publication dans l’application. On les distingue des artistes et des dates figurant sur les documents. L’installation du SGBD, l’import et les premières requêtes permettent ensuite de répéter les recherches et de vérifier les représentations. La pratique des filtres et des tris se poursuit en séance 4.

**Notions abordées :** Identifiants et premières relations ; distinction entre personne et coordonnées ; tableau de données ; fichiers plats, export CSV, conventions d’import et réimportation vérifiée ; installation et configuration locale du SGBD ; distinction serveur/client ; connexion et import ; premières recherches avec `SELECT`, `WHERE` et `ORDER BY`.

### 4 : Modifier et produire des bilans

On reprend les recherches et les tris de la séance 3 en précisant les filtres, les valeurs absentes et les résultats distincts. Les comptages font distinguer une absence, un texte vide, zéro et une réponse négative ; une réponse oui/non connue introduit le booléen. On ajoute un élément, on corrige une fiche, on change un statut et on supprime un enregistrement. On vérifie les données avant et après chaque modification, puis on produit des bilans sur les éléments et leurs publications dans l’application.

**Notions abordées :** Valeur absente, `NULL`, chaîne vide, zéro et booléen ; comparaisons, opérateurs logiques, `LIKE`, `IS NULL`, `DISTINCT` ; `INSERT`, `UPDATE`, `DELETE` ; portée du `WHERE` ; vérification avant et après modification ; `COUNT`, autres agrégats, `GROUP BY`, `HAVING`.

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

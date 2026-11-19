# X75 : Bases de données

Ce dépôt rassemble le programme et les supports du module de bases de données des groupes **X75 A** et **X75 B**.

Le module comprend **48 heures : 12 séances de 4 heures**, dont 10 séances d’apprentissage, une séance de questions ou consacrée aux index et un examen pratique individuel.

Le [résumé du référentiel EFP et les objectifs du cours](referentiel.md) précisent les compétences visées.

## Le projet du module

Le projet commun repose sur une **application centrée sur les collections**, déclinable en application de collections, réseau social ou boutique pour l’atelier ADB. Son socle comprend des utilisateurs, des éléments publiés, des médias, des collections, des interactions et des crédits internes. Les thèmes, catégories et tags peuvent compléter le projet selon les besoins.

Les exercices commencent avec un même corpus de **42 documents culturels**, utilisé en séance 1 puis repris progressivement dans le module. On classe d’abord les documents librement, puis on y recherche des informations. En séance 2, le lot A des commandes fictives de la **Papeterie du Canal** sert à relever les champs, à préciser leur sens et à proposer leurs types dans Excel. La seconde partie propose les huit scénarios de l’exercice de modélisation de 2025-2026. Chaque binôme en choisit un et décrit deux tables principales, avec deux enregistrements fictifs par table, vérification et justification. Approfondir ce scénario ou en traiter un autre est facultatif. Aucun devoir n’est demandé ; les travaux, même inachevés, sont repris lors de la correction collective des huit scénarios en séance 3, après la méthode de choix des champs. On apprend ensuite à transférer les données, à les interroger avec SQL, à les modifier, à les relier et à construire une base cohérente. Les mêmes tâches permettent de comparer les solutions et de vérifier les effets des changements. Les étudiants adaptent ensuite ce socle au sujet de leur application.

À la fin de la séance 10, le schéma, les scripts de création et d’import, les données de test, les requêtes et la documentation constituent une **base utilisable en atelier ADB**.

## Plan des séances

| Séance | Thème | Contenus et activités |
|---|---|---|
| 1 | Définir, classer et retrouver | Classer les documents, rechercher des informations, comprendre le rôle d’une base de données et d’un SGBD. |
| 2 | Décrire et représenter les propriétés | Identifier les champs, préciser leur sens et leurs types, saisir et vérifier les deux commandes A1 et A2 dans Excel, représenter des tables. |
| 3 | CRUD sur une seule table | Présenter la méthode de choix des champs, l’appliquer lors de la correction des huit scénarios de séance 2, puis combiner les propositions pour construire la table `personne`. Pratiquer INSERT, SELECT, UPDATE et DELETE dans dix exercices courts. |
| 4 | SELECT avancé | Filtres combinés, tri, valeurs distinctes, NULL, fonctions d’agrégation, GROUP BY et HAVING. Introduire les relations entre tables à partir des coordonnées d’une personne. |
| 5 | Clés et relations | Clés primaires et étrangères, cardinalités, relations un-à-plusieurs et plusieurs-à-plusieurs, intégrité référentielle. |
| 6 | Requêtes sur plusieurs tables | Jointures, qualification des colonnes, alias et agrégations portant sur plusieurs tables. |
| 7 | Concevoir la base ADB : analyser | Analyser les besoins de l’application, définir les règles de gestion et établir le dictionnaire des données. |
| 8 | Concevoir la base ADB : modéliser | Construire le MCD avec Merise : entités, associations et cardinalités. Confronter le modèle aux usages prévus. |
| 9 | Concevoir la base ADB : normaliser | Passer au MLD, traduire les associations, identifier les dépendances et normaliser pour supprimer les anomalies. |
| 10 | Construire la base ADB | Traduire le modèle en SQL, créer les contraintes, importer les données et vérifier la base avec les requêtes de l’application. Documenter les choix. |
| 11 | Questions ou index | Répondre aux questions et reprendre les difficultés ; aborder les index selon l’avancement de la classe. |
| 12 | Examen pratique individuel | Exploiter une base, corriger des problèmes et justifier les choix effectués. |

### Couverture du référentiel

Les activités doivent permettre de réaliser les opérations, de vérifier leurs résultats et d’expliquer les choix effectués. Le [référentiel](referentiel.md) reste la référence pour les compétences obligatoires.

Ce plan ne précise pas encore la place de plusieurs apprentissages requis : les familles de bases de données, dont NoSQL ; les outils de modélisation, d’administration et de connexion ; l’installation, la configuration et la maintenance ; les comptes utilisateurs, les droits et les connexions sécurisées, y compris distantes ; la sauvegarde et la restauration ; les fichiers plats ; la consultation de documentation et la veille sur les outils. Les apprentissages qui ne dépendent pas de l’infrastructure doivent être intégrés aux séances lors de la préparation des supports.

**Note sur l’infrastructure :** l’infrastructure de l’EFP n’est pas encore prête pour réaliser les parties du référentiel qui en dépendent. Leur mise en pratique a été reportée à l’atelier ADB, sous réserve que l’infrastructure soit disponible à ce moment-là.

La compréhension de l’utilité des index reste requise, même si leur approfondissement en séance 11 dépend de l’avancement. Par ailleurs, la section « Organisation » de `referentiel.md` décrit encore une séance de révision sans matière nouvelle : cette description diffère du nouveau plan de la séance 11.

## Calendrier

| Séance | X75 A | X75 B |
|---|---|---|
| **1 - [Définir, classer et retrouver](session_01.md)** | 04/11 | 10/11 |
| **2 - [Décrire et représenter les propriétés](session_02.md)** | 12/11 | 17/11 |
| **3 - [CRUD sur une seule table](session_03.md)** | 19/11 | 24/11 |
| **4 - SELECT avancé** | 25/11 | 01/12 |
| **5 - Clés et relations** | 26/11 | 08/12 |
| **6 - Requêtes sur plusieurs tables** | 02/12 | 15/12 - matin |
| **7 - Concevoir la base ADB : analyser** | 03/12 | 15/12 - après-midi |
| **8 - Concevoir la base ADB : modéliser** | 09/12 | 22/12 - matin |
| **9 - Concevoir la base ADB : normaliser** | 10/12 | 22/12 - après-midi |
| **10 - Construire la base ADB** | 16/12 | 05/01 |
| **11 - Questions ou index** | 17/12 | 12/01 |
| **12 - Examen pratique individuel** | 07/01 | **19/01 - à confirmer** |


## Évaluation

La séance 11 permet de répondre aux questions et de reprendre les difficultés ; les index sont abordés selon l’avancement de la classe.

L’examen est une épreuve pratique individuelle dans le contexte du projet d’atelier. Il évalue les compétences travaillées pendant le module : exploiter et modifier les données, diagnostiquer et corriger des problèmes, puis justifier les choix effectués.

## Archives

Les supports de l’année précédente sont conservés dans le dossier [2025-2026](2025-2026/). Le programme et les supports liés depuis cette page constituent la référence pour le module en cours.

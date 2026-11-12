# Séance 2 : Des documents aux champs puis aux tables

[Documents de la Papeterie du Canal](session_02_documents.html) · [Cours](../session_02.md)

La papeterie reçoit ses commandes par mail, courrier et téléphone. Elle souhaite conserver les renseignements nécessaires pour préparer les articles, joindre la personne et livrer à la bonne adresse. Chaque demande de cet exercice concerne un seul article, commandé en plusieurs exemplaires si nécessaire. Tous les prix sont unitaires, en euros TTC.

Les commandes, personnes et coordonnées du dossier sont fictives. Les variations et erreurs de transcription font partie de l’exercice. Une information manquante ou incertaine doit être signalée ; aucune correction ne doit inventer ce que la personne voulait dire.

La première partie utilise uniquement le lot A. Travaillez à deux : une personne manipule le classeur, l’autre relit les documents et examine les propositions. Échangez les rôles entre les deux étapes.

## 1. Lot A — Relever les champs utiles

Ouvrez uniquement le **[lot A](session_02_documents.html#lot-a)**, puis créez `papeterie_champs.xlsx` avec une feuille nommée `champs`.

Commencez avec deux colonnes :

| Champ | Exemple relevé |
|---|---|
| | |

**Une ligne décrit un champ, pas une personne ni une commande.** Choisissez les champs nécessaires pour préparer les articles, joindre la personne et livrer. Pour chacun, recopiez un exemple exact de [A1](session_02_documents.html#titre-a1) ou [A2](session_02_documents.html#titre-a2). Indiquez le repère du document dans un commentaire de la cellule contenant l’exemple.

Comparez chaque exemple au document. Avez-vous conservé ses signes, ses espaces et sa précision ? Si Excel a modifié une valeur, cherchez comment la conserver telle qu’elle apparaît dans le document, puis vérifiez le résultat. Chaque champ répond-il à un besoin de la papeterie ?

**Arrêtez-vous pour l’échange en classe.**

## 2. Préciser le sens, puis proposer un type

Au signal du professeur, reprenez [A1](session_02_documents.html#titre-a1) et répondez :

1. Deux dates apparaissent. Que représente chacune ? Vos noms de champs permettent-ils de les distinguer ?
2. Le montant `12,50 €` concerne-t-il un carnet ou les quatre carnets ? Votre champ permet-il de le comprendre ?
3. L’adresse donnée permet-elle de connaître le domicile de Marie ? Que sait-on exactement de cette adresse ?

Ajoutez **« Ce que ce champ décrit »**. Définissez chaque champ en une phrase, en précisant l’unité si nécessaire. Renommez les champs dont le sens reste ambigu.

Faites relire trois définitions par un autre binôme. Il doit expliquer ce qu’il comprend sans votre aide. Reprenez les formulations qui entraînent une interprétation différente de la vôtre.

Créez maintenant une feuille `decisions` pour garder la trace des choix discutés :

| Champ et proposition | Document et valeur examinée | Conséquence observée | Décision et justification | Vérification ou information manquante |
|---|---|---|---|---|
| | | | | |

Au signal suivant, ajoutez **« Type proposé »** dans `champs`. Choisissez pour chaque champ une représentation : texte, nombre entier, nombre décimal ou date. Préparez une justification fondée sur l’usage de la valeur. Conservez vos propositions et enregistrez `papeterie_champs.xlsx`, avec les feuilles `champs` et `decisions`. La première partie se termine ici.

## 3. Dessiner et décrire des tables

La seconde partie reprend les huit scénarios de l’[exercice de modélisation de 2025-2026](../2025-2026/exo/session_02.md). On passe des champs relevés dans les commandes à des tables regroupant les renseignements sur un même sujet.

Pour chaque scénario, on dessine un cadre par table sur papier ou dans un document nommé `session_02_tables`. Chaque cadre porte le nom de la table et contient ses champs. On complète ensuite la description de chaque champ avec le tableau guide ci-dessous.

### Travail demandé

1. Identifier les objets ou événements à décrire et nommer les tables de manière cohérente.
2. Expliquer ce que représente une ligne de données dans chaque table.
3. Proposer un identifiant permettant de distinguer deux lignes, même si elles portent le même nom.
4. Décrire chaque champ : nom, type, longueur maximale si applicable, caractère obligatoire et commentaire précisant le sens ou l’unité.
5. Proposer deux enregistrements fictifs pour vérifier manuellement la description. Les exemples inventés sont identifiés comme tels.
6. Justifier les choix et noter les questions qui restent ouvertes.

Les types restent exprimés en mots : texte, nombre entier, nombre décimal, date ou date et heure selon le besoin. Aucun script SQL n’est demandé. Une longueur de texte s’exprime en caractères ; lorsqu’aucune limite n’est justifiée, on écrit « à déterminer » avec la question à résoudre.

Les relations seront approfondies dans la suite du module. Lorsqu’un besoin implique plusieurs valeurs ou plusieurs événements, on le note et on propose les tables supplémentaires nécessaires, sans exiger ici les clés étrangères ni les cardinalités. Un historique complet ne se réduit pas à un compteur et à une dernière date.

### Tableau guide

| Table | Commentaire | Identifiant proposé |
|---|---|---|
| `film` | Une ligne décrit un film du catalogue. | `id` |

| Champ | Type | Longueur | Obligatoire | Commentaire |
|---|---|---|---|---|
| `id` | Nombre entier | Sans objet | Oui | Valeur unique et stable dans cette table. |
| `titre` | Texte | À déterminer | Oui | Titre du film ; deux films peuvent avoir le même titre. |
| `annee_sortie` | Nombre entier | Sans objet | À préciser | Année de sortie ; traitement d’une année inconnue à définir. |
| `duree_minutes` | Nombre entier | Sans objet | À préciser | Durée exprimée en minutes entières pour cette proposition. |

Dans ce tableau de description, une ligne représente un champ. Dans la future table `film`, une ligne représentera un film.

### Exercice 1 : Cinéma - Films et Acteurs

**Contexte :** Une plateforme de streaming cinématographique nécessite une base de données pour cataloguer ses films et acteurs.

**Contraintes :**

- Les films doivent être classifiés par genre et langue originale
- Les informations de production doivent inclure l'année, le pays et le budget
- Chaque film a une durée, une classification par âge et une note moyenne
- Pour les acteurs, capturer les informations biographiques essentielles

### Exercice 2 : Librairie - Livres et Auteurs

**Contexte :** Une librairie indépendante souhaite digitaliser son inventaire.

**Contraintes :**

- Les livres existent en plusieurs formats (poche, grand format, numérique)
- Chaque livre possède un ISBN unique, un titre, une année de publication
- Le système doit gérer les informations d'inventaire (stock, prix)
- Pour les auteurs, stocker les données biographiques et bibliographiques

### Exercice 3 : Blog - Articles et Éditeurs

**Contexte :** Un média en ligne souhaite moderniser sa plateforme de publication.

**Contraintes :**

- Les articles possèdent un titre, un contenu, une date de publication
- Chaque article a un statut (brouillon, révision, publié, archivé)
- Les éditeurs ont différents rôles et niveaux d'autorisation
- Le système doit permettre la catégorisation des articles

### Exercice 4 : Transport - Pays et Villes

**Contexte :** Une application de planification d'itinéraires internationaux.

**Contraintes :**

- Les pays ont des codes ISO, des langues officielles et des devises
- Les villes possèdent des coordonnées géographiques et des fuseaux horaires
- Les informations démographiques doivent être stockées
- Les codes d'aéroports et de gares sont nécessaires pour les villes principales

### Exercice 5 : Langues du monde

**Contexte :** Une application pour linguistes et traducteurs.

**Contraintes :**

- Chaque langue a un code ISO, une famille linguistique et un statut
- Le système doit stocker les informations sur les systèmes d'écriture
- Pour chaque langue, indiquer le nombre approximatif de locuteurs
- Documenter les régions où la langue est parlée

### Exercice 6 : E-commerce - Clients et Produits

**Contexte :** Une boutique en ligne multi-marchés.

**Contraintes :**

- Les produits ont des références uniques, des descriptions et des prix
- Pour chaque produit, gérer les informations de stock et de disponibilité
- Les clients possèdent des informations de contact et de facturation
- Les données clients doivent inclure l'historique des commandes

### Exercice 7 : Hôpital - Médecins et Patients

**Contexte :** Système de gestion hospitalier pour suivi des consultations.

**Contraintes :**

- Les médecins ont des spécialités, des numéros de licence et des horaires
- Les patients possèdent un dossier médical avec antécédents et allergies
- Chaque consultation doit être datée et documentée
- Les informations d'assurance médicale doivent être enregistrées

### Exercice 8 : École - Étudiants et Cours

**Contexte :** Système de gestion académique pour une université.

**Contraintes :**

- Les étudiants possèdent un numéro d'étudiant unique et des coordonnées
- Les cours ont un code, un intitulé, un nombre de crédits et un département
- Les sessions de cours ont des horaires et des salles attribuées
- Le système doit permettre d'enregistrer les résultats académiques

## 4. Relire et expliquer les propositions

Pour chaque scénario, on reprend les contraintes de l’énoncé une à une. Chaque besoin doit correspondre à un champ, à une table proposée ou à un point explicitement reporté au travail sur les relations.

On compare les deux enregistrements fictifs : les champs permettent-ils de conserver leurs valeurs, leurs unités et leurs différences ? On examine aussi une valeur absente, un nom identique sur deux lignes et un texte dépassant une limite proposée. Les conséquences et les corrections sont expliquées.

### Bilan individuel

On choisit une table et on explique ce que représente une ligne, le rôle de son identifiant et le choix du type de deux champs. On justifie un champ obligatoire ou facultatif, puis une longueur retenue ou laissée à déterminer. On termine par un besoin qui demandera de relier plusieurs tables.

On conserve `papeterie_champs.xlsx` et `session_02_tables` pour la suite du module.

L’exercice est discuté en groupe. Les critères sont la couverture des besoins, la clarté des définitions, la cohérence du nommage, la pertinence des types et la justification des choix.

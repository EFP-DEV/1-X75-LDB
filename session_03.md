# Séance 3 : CRUD sur une seule table

## Table des matières

| Partie | Contenu |
|---|---|
| **Ouverture. Correction de l’exercice précédent** | Reprendre les propositions de tables des huit scénarios de modélisation issus de 2025-2026 et justifier les choix. |
| **1. La table** | Colonnes, lignes, noms des champs et types de données. Présentation de la table utilisée pendant la séance. |
| **2. Le concept de requête** | Une instruction adressée au SGBD : écrire du SQL, exécuter la requête et lire le résultat ou le message retourné. |
| **3. Create — `INSERT`** | Ajouter des lignes en précisant les colonnes et les valeurs. |
| **4. Read — `SELECT`** | Lire toutes les données, choisir les colonnes et filtrer avec un `WHERE` simple. |
| **5. Update — `UPDATE`** | Modifier les lignes ciblées par un `WHERE`. Vérifier les données avant et après. |
| **6. Delete — `DELETE`** | Supprimer les lignes ciblées par un `WHERE`. Vérifier la sélection avant la suppression et contrôler le résultat. |

Dans CRUD, **Create correspond à l’ajout de données (`INSERT`)**.

Pour chaque opération, réaliser la requête, vérifier son résultat et expliquer les choix effectués.

## Ouverture — Correction de l’exercice précédent

La séance commence par la correction collective de la dernière partie de l’[exercice de séance 2](exo/session_02.md#3-dessiner-et-décrire-des-tables), reprise de l’exercice de modélisation de 2025-2026 : les huit scénarios pour dessiner et décrire des tables.

Reprenez votre document `session_02_tables`. Pour chaque scénario corrigé :

1. Rappelez le besoin et expliquez ce que représente une ligne de chaque table proposée.
2. Présentez l’identifiant et les champs ; justifiez les types, les longueurs, le caractère obligatoire et les unités.
3. Confrontez les deux enregistrements fictifs à cette description : valeurs conservées, noms identiques, informations absentes et limites de longueur.
4. Vérifiez que chaque contrainte de l’énoncé correspond à un champ, à une table ou à une question explicitement laissée ouverte.
5. Corrigez votre proposition et notez la justification des changements.

Les besoins impliquant plusieurs valeurs ou un historique doivent être repérés. Les clés étrangères et les cardinalités seront approfondies en séance 5.

Cette correction fait la transition entre la description des tables et la manipulation de leurs données : la suite de la séance utilise une table fournie pour apprendre les quatre opérations CRUD.

## 1. La table

En séance 2, vous avez décrit des champs et représenté des tables. Nous allons maintenant manipuler les données d’une table avec SQL, dans un service en ligne permettant d’exécuter des requêtes sur une base d’exercice.

La table `document` contient des fiches de documents culturels. **Une ligne représente une fiche de document ; une colonne représente une propriété.** Pour cette séance, les données sont fictives et la structure est fournie.

| Champ | Sens | Type de donnée |
|---|---|---|
| `id` | Identifiant unique de la fiche, choisi explicitement dans les exercices. | Nombre entier |
| `titre` | Titre du document. | Texte |
| `nature` | Nature du document : `livre`, `disque` ou `affiche`. | Texte |
| `annee` | Année de parution du document. | Nombre entier |
| `quantite` | Nombre d’exemplaires conservés. | Nombre entier |

L’identifiant permet de désigner une fiche sans dépendre de son titre. Deux documents peuvent porter le même titre ; ils doivent garder des identifiants différents. La définition des clés sera approfondie en séance 5.

Voici l’état initial utilisé dans les exemples :

| id | titre | nature | annee | quantite |
|---|---|---|---|---|
| 1 | Les chemins du Nord | livre | 2020 | 2 |
| 2 | Traversées | disque | 2022 | 1 |
| 3 | La ville en images | affiche | 2019 | 3 |
| 4 | Traversées | livre | 2023 | 1 |

### Préparer l’espace de travail

Ouvrez le service indiqué par le formateur. Il présente un espace pour préparer la base et un espace pour écrire les requêtes. Leur nom et leur disposition dépendent du service retenu.

Le script ci-dessous prépare la table et ses quatre lignes de départ. Placez-le dans l’espace de préparation de la base. La création de la structure sera étudiée en séance 10 ; ici, elle sert à disposer d’une table commune.

```sql
CREATE TABLE document (
    id INTEGER PRIMARY KEY,
    titre VARCHAR(150) NOT NULL,
    nature VARCHAR(20) NOT NULL,
    annee INTEGER NOT NULL,
    quantite INTEGER NOT NULL
);

INSERT INTO document (id, titre, nature, annee, quantite)
VALUES
    (1, 'Les chemins du Nord', 'livre', 2020, 2),
    (2, 'Traversées', 'disque', 2022, 1),
    (3, 'La ville en images', 'affiche', 2019, 3),
    (4, 'Traversées', 'livre', 2023, 1);
```

Une nouvelle préparation doit partir d’une base vide ou réinitialisée avec la commande du service. Réexécuter ce script sur la même base peut provoquer une erreur : la table ou les identifiants existent déjà.

**À expliquer :** que représente la valeur `3` dans la colonne `id` ? Que représente-t-elle dans la colonne `quantite` de cette même ligne ? Pourquoi le titre `Traversées` ne suffit-il pas pour désigner une seule fiche ?

## 2. Le concept de requête

Une **requête SQL** est une instruction adressée au SGBD. Elle précise l’opération à effectuer et les données concernées. Le service en ligne transmet votre instruction au SGBD, puis affiche le résultat ou un message.

Une lecture retourne des lignes et des colonnes. Un ajout, une modification ou une suppression peut retourner un message ou un nombre de lignes concernées. **Un message de réussite ne prouve pas que vous avez choisi les bonnes données.** Il faut lire l’état de la table pour le vérifier.

Dans nos exemples :

- les mots-clés SQL sont écrits en majuscules pour faciliter la lecture ;
- les noms de table et de colonnes reprennent exactement ceux de la structure ;
- les valeurs textuelles sont entourées d’apostrophes simples : `'livre'` ;
- les nombres s’écrivent sans apostrophes : `2020` ;
- le point-virgule termine une instruction.

Pour écrire une apostrophe dans un texte SQL, on la double : `'L''autre rive'` représente le texte `L'autre rive`.

### Écrire, exécuter et interpréter

Commencez par cette requête de lecture, qui sera détaillée dans la partie 4 :

```sql
SELECT * FROM document;
```

Elle demande toutes les colonnes et toutes les lignes de `document`. Comparez le résultat aux quatre fiches de départ. L’ordre d’affichage des lignes n’est pas garanti ; le tri sera étudié en séance 4.

Pour chaque requête de la séance :

1. Formulez la demande en français et prévoyez les lignes concernées.
2. Écrivez puis exécutez l’instruction SQL.
3. Lisez le résultat ou le message retourné.
4. Vérifiez les valeurs et expliquez un éventuel écart avec votre prévision.

En cas d’erreur, lisez le message avant de modifier la requête. Vérifiez le nom de la table, les colonnes, les apostrophes, les virgules et les valeurs utilisées. Une erreur de syntaxe empêche l’exécution ; une requête valide peut néanmoins répondre à une autre demande que celle prévue.

### Comprendre le fonctionnement du service

Certains services reconstruisent la base à chaque exécution ; d’autres conservent les changements pendant la session. Le formateur précisera le fonctionnement de celui qui sera utilisé.

Pour observer un changement, exécutez l’instruction et sa requête de vérification dans le même bloc. Si le service reconstruit la base à chaque exécution, conservez dans ce bloc les instructions nécessaires pour retrouver l’état attendu. S’il conserve les changements, évitez de répéter un ajout déjà effectué.

Gardez vos requêtes dans un fichier `session_03.sql` : la conservation de votre travail ne doit pas dépendre de l’onglet du navigateur. Vous pouvez y ajouter des commentaires commençant par `--` pour noter la demande et vos observations.

## 3. Create — `INSERT`

Dans CRUD, **Create signifie ajouter un enregistrement**. L’instruction utilisée est `INSERT INTO`. `CREATE TABLE`, rencontré dans le script de préparation, crée la structure d’une table.

Ajoutons une fiche :

```sql
INSERT INTO document (id, titre, nature, annee, quantite)
VALUES (5, 'Regards sur le fleuve', 'livre', 2024, 2);

SELECT * FROM document WHERE id = 5;
```

La première instruction ajoute la ligne. La seconde permet de lire la fiche portant l’identifiant `5` pour vérifier ses valeurs.

| Élément | Rôle |
|---|---|
| `INSERT INTO document` | Désigne la table dans laquelle ajouter la ligne. |
| `(id, titre, nature, annee, quantite)` | Précise les colonnes à renseigner. |
| `VALUES (...)` | Fournit les valeurs dans le même ordre que les colonnes. |

Le nombre de valeurs doit correspondre au nombre de colonnes indiquées. L’ordre est essentiel : SQL n’interprète pas le sens d’un titre pour deviner dans quelle colonne le ranger.

Dans cette table, chaque identifiant doit être unique et tous les champs sont obligatoires. Réutiliser l’identifiant `5` pour une autre fiche provoque une erreur. Pour la séance, choisissez un identifiant disponible et renseignez tous les champs.

### À réaliser

À partir de l’état initial, ajoutez les deux fiches suivantes :

| id | titre | nature | annee | quantite |
|---|---|---|---|---|
| 6 | L'autre rive | disque | 2021 | 4 |
| 7 | Jardins de nuit | affiche | 2025 | 1 |

Pour chaque ajout, écrivez une requête de lecture ciblant son identifiant. Vérifiez toutes les valeurs, puis expliquez comment vous avez écrit l’apostrophe de `L'autre rive`.

**À prévoir sans l’exécuter :** que se passerait-il si vous ajoutiez une seconde fiche avec l’identifiant `6` ? Un autre titre suffirait-il à rendre cet ajout possible ?

## 4. Read — `SELECT`

`SELECT` permet de lire les données sans les modifier. On choisit les colonnes à afficher, la table à consulter et, si nécessaire, une condition pour retenir certaines lignes.

### Lire toutes les colonnes

```sql
SELECT *
FROM document;
```

L’astérisque `*` désigne toutes les colonnes. Sans condition, toutes les lignes sont retournées.

### Choisir les colonnes

```sql
SELECT titre, nature
FROM document;
```

Cette requête affiche uniquement le titre et la nature. Les autres colonnes restent présentes dans la table : choisir les colonnes du résultat ne change pas la structure ni les données conservées.

### Retenir certaines lignes avec `WHERE`

```sql
SELECT id, titre, quantite
FROM document
WHERE nature = 'livre';
```

`WHERE` exprime une condition. Ici, une ligne est retenue si sa nature vaut `'livre'`. La colonne utilisée pour filtrer ne doit pas nécessairement figurer dans les colonnes affichées.

Les comparaisons simples permettent de formuler plusieurs demandes :

| Opérateur | Sens | Exemple de condition |
|---|---|---|
| `=` | Égal à | `id = 2` |
| `<>` | Différent de | `nature <> 'livre'` |
| `>` | Strictement supérieur à | `quantite > 1` |
| `<` | Strictement inférieur à | `annee < 2022` |
| `>=` | Supérieur ou égal à | `annee >= 2022` |
| `<=` | Inférieur ou égal à | `quantite <= 2` |

Les filtres combinés, le tri et les calculs sur plusieurs lignes seront abordés en séance 4.

### À réaliser

Repartez de l’état initial à quatre lignes. Pour chaque demande, écrivez les identifiants attendus avant d’exécuter la requête, puis comparez-les au résultat.

1. Affichez toutes les fiches et toutes leurs colonnes.
2. Affichez uniquement les identifiants et les titres des livres.
3. Affichez les fiches dont l’année de parution est supérieure ou égale à 2022.
4. Affichez les titres et les quantités des documents conservés en plus d’un exemplaire.
5. Retrouvez les fiches dont le titre est `Traversées`.
6. Recherchez la fiche d’identifiant `99`.

Expliquez pourquoi la cinquième demande retourne plusieurs lignes. Pour la sixième, distinguez un résultat vide d’un message d’erreur : une recherche valide peut ne trouver aucune ligne.

## 5. Update — `UPDATE`

`UPDATE` modifie les valeurs de lignes existantes. `SET` indique les nouvelles valeurs ; `WHERE` détermine les lignes à modifier.

La fiche `2` indique un exemplaire de `Traversées`. Après réception de deux exemplaires supplémentaires, la quantité doit être portée à `3`.

```sql
SELECT id, titre, quantite
FROM document
WHERE id = 2;

UPDATE document
SET quantite = 3
WHERE id = 2;

SELECT id, titre, quantite
FROM document
WHERE id = 2;
```

Le premier `SELECT` permet de contrôler la cible et sa valeur actuelle. `UPDATE` remplace la quantité par `3`. Le dernier `SELECT` permet de constater la nouvelle valeur. L’instruction n’ajoute pas de fiche.

On peut modifier plusieurs champs dans une seule instruction en séparant les affectations par une virgule :

```sql
UPDATE document
SET annee = 2021, quantite = 4
WHERE id = 1;
```

### Maîtriser la portée du changement

**Sans `WHERE`, `UPDATE` modifie toutes les lignes de la table.** Une condition portant sur un titre partagé peut aussi modifier plusieurs fiches.

Avant une modification, utilisez un `SELECT` avec **exactement la même condition**. Comparez les lignes trouvées à la demande. Après la modification, relisez la fiche par son identifiant et vérifiez aussi les autres lignes pour constater qu’elles ont conservé leurs valeurs.

Si vous modifiez le champ qui sert de filtre, sa valeur précédente ne permettra plus de retrouver la fiche. L’identifiant reste alors utile pour vérifier le résultat.

### À réaliser

Repartez de l’état initial. Effectuez les opérations dans l’ordre :

1. Corrigez l’année de la fiche `3` : elle doit être `2020`.
2. Portez la quantité de la fiche `1` à `5`.
3. Corrigez le titre de la fiche `4` en `Traversées — carnet de voyage`.

Pour chaque opération, conservez la lecture avant modification, l’instruction `UPDATE` et la lecture après modification. Terminez par une lecture de toute la table.

**À analyser sans l’exécuter :** dans l’état initial, quelles lignes seraient modifiées par `WHERE titre = 'Traversées'` ? Pourquoi cette condition serait-elle inadaptée pour corriger uniquement le livre ? Que produirait l’absence de `WHERE` ?

## 6. Delete — `DELETE`

`DELETE` supprime des lignes. La condition `WHERE` précise lesquelles. La table et ses colonnes restent en place.

La fiche `3` a été créée par erreur et doit être retirée du catalogue :

```sql
SELECT *
FROM document
WHERE id = 3;

DELETE FROM document
WHERE id = 3;

SELECT *
FROM document
WHERE id = 3;

SELECT * FROM document;
```

Avant la suppression, la lecture doit montrer la fiche attendue. Après la suppression, la recherche de l’identifiant `3` doit retourner un résultat vide. La dernière lecture permet de vérifier que les autres fiches sont toujours présentes.

**Sans `WHERE`, `DELETE FROM document;` supprime toutes les lignes de la table.** L’absence de condition concerne toute la table, comme pour `UPDATE`.

Supprimer une fiche et ramener sa quantité à zéro répondent à des besoins différents. Avec `quantite = 0`, la fiche reste consultable, mais aucun exemplaire n’est conservé. Avec `DELETE`, la fiche disparaît de la table. Il faut préciser la demande avant de choisir l’opération.

### À réaliser

Repartez de l’état initial, puis traitez cette suite de demandes :

1. Ajoutez une fiche temporaire : identifiant `8`, titre `Fiche de démonstration`, nature `affiche`, année `2026`, quantité `1`.
2. Vérifiez que la fiche a été enregistrée avec les valeurs attendues.
3. Supprimez uniquement cette fiche temporaire, après avoir vérifié votre sélection.
4. Vérifiez qu’elle a disparu et que les quatre fiches initiales sont toujours présentes.
5. Pour le disque d’identifiant `2`, le dernier exemplaire est retiré, mais sa fiche doit rester consultable. Choisissez et exécutez l’opération adaptée, puis justifiez votre choix.

### Mise en pratique individuelle : enchaîner les quatre opérations

Repartez de l’état initial. Une nouvelle fiche doit être intégrée au catalogue, corrigée, puis retirée parce qu’elle correspond à une saisie effectuée par erreur.

1. Ajoutez le livre `Les jardins du matin`, identifiant `9`, année `2024`, quantité `2`.
2. Retrouvez sa fiche et affichez seulement son identifiant, son titre et sa quantité.
3. Corrigez sa quantité à `3`.
4. Supprimez cette fiche.
5. Vérifiez que les quatre fiches initiales et leurs valeurs sont conservées.

Pour chaque étape, notez le résultat attendu, la requête, le résultat observé et une phrase de justification. Si le service reconstruit la base à chaque exécution, rassemblez les étapes dans un même bloc, avec les lectures de vérification entre les changements.

Conservez ce travail dans `session_03.sql`. Vous devez pouvoir expliquer le rôle de chaque instruction, les lignes visées par chaque `WHERE` et les observations qui confirment que la demande a été respectée.

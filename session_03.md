# Séance 3 — Choisir les champs, puis utiliser les données

Pourquoi conserver un champ plutôt qu’un autre ? Comment savoir si notre description suffit ? Une fois les données enregistrées, comment retrouver celles qui répondent à un besoin, les compléter ou les corriger ?

Cette séance prolonge l’[exercice de séance 2](exo/session_02.md#3-dessiner-et-décrire-des-tables). Nous allons combiner les propositions des huit exercices pour construire ensemble une table `personne`, puis utiliser SQL pour ajouter, lire, modifier et supprimer des fiches. Ces quatre opérations forment le **CRUD**.

À la fin, vous devez pouvoir justifier le choix d’un champ, écrire une requête simple à partir d’une demande et vérifier son résultat.

## 1. Pourquoi avons-nous l’impression de deviner ?

« Ai-je assez de champs ? », « Est-ce le bon champ ? », « Qu’attend le professeur ? » : ces questions apparaissent lorsque l’on cherche une liste définitive dans un énoncé qui ne précise pas tous les usages.

Le client vous demande d’enregistrer le prix de vente de chaque article. Que savez-vous déjà et que devez-vous encore lui demander ?

| Situation | Exemple | Que faire ? |
|---|---|---|
| **Exigence explicite** | Le client a demandé un prix de vente pour chaque article. | Prévoir un champ `prix_vente`. |
| **Hypothèse à confirmer** | Vous supposez que le prix est exprimé en euros, TVA comprise. | Demander au client quelle devise il utilise et si le montant inclut la TVA. |
| **Information manquante** | Un article passe de 10 € à 12 €. Le client n’a rien dit sur les anciens prix. | Demander « Après le changement, devez-vous encore pouvoir retrouver le prix de 10 € ? » La réponse permet de décider s’il faut garder un historique. |

Il n’existe pas une liste de champs valable pour tous les contextes. Cela ne signifie pas que toutes les propositions se valent : une proposition doit conserver les informations requises et permettre les opérations attendues.

Pour un étudiant absent, reprenez deux champs de votre travail et classez les décisions associées dans ces trois situations. Formulez ensuite une question qui réduirait réellement votre incertitude.

## 2. Choisir les champs avec une méthode

### Quatre repères

| Repère | Question | Exemple |
|---|---|---|
| Utilité | Que permettra cette information ? | La durée permet de sélectionner un film selon le temps disponible. |
| Profondeur documentaire | Jusqu’où faut-il décrire le sujet ? | Une courte présentation ou un parcours biographique détaillé. |
| Précision | Quel sens exact et quel niveau de détail ? | Une année de sortie ou une date de sortie dans un pays donné. |
| Disponibilité | L’information est-elle connue et fiable ? | Un budget peut être inconnu ou estimé. |

### Des techniques pour décider

**Commencez par `bool`, `int` et `string`.** Prenez deux films et décrivez leurs sous-titres de trois façons.

| Type | Question | Film A | Film B |
|---|---|---|---|
| `bool` — booléen | Y a-t-il des sous-titres ? | Oui | Oui |
| `int` — nombre entier | Combien de pistes de sous-titres sont disponibles ? | 2 | 2 |
| `string` — texte pour chaque langue | En quelles langues les sous-titres sont-ils disponibles ? | français, anglais | allemand, italien |

Le client demande « J’ai besoin de sous-titres en français pour suivre le film. Lequel puis-je regarder ? » Avec la première ligne, que pouvez-vous lui dire ? Avec la deuxième ? À partir de quelle ligne pouvez-vous lui conseiller le film A ?

Les trois représentations répondent chacune à une question. Les deux films ont des sous-titres et proposent chacun deux pistes. Pour ce client, l’information utile est la langue de chaque piste : elle permet de vérifier que le français est disponible pour le film A.

**Terminez la phrase « Ce champ permet de… ».** Un usage concret justifie mieux un champ que « cela pourrait être intéressant ». Conserver une donnée demande aussi de la renseigner et de la maintenir.

**Définissez avant de choisir le type.** `duree_minutes` décrit une durée en minutes. Si les usages acceptent des minutes entières, un entier convient. Une durée précise à la seconde demanderait une autre convention.

**Comparez deux valeurs et une absence.** Pour un prix, examinez `12,50`, `0` et une information inconnue. Un prix nul et un prix inconnu ne sont pas équivalents. Cette comparaison aide à discuter le type et le caractère obligatoire.

**N’inventez pas une limite sans raison.** La longueur du plus grand titre de vos exemples ne prouve pas que les prochains titres seront plus courts. Écrivez « à déterminer » et la question à résoudre lorsqu’aucune limite n’est justifiée.

**Séparez la donnée de son affichage.** `12,50 €` présente un montant avec une monnaie ; cela ne signifie pas que tout doit être stocké comme une chaîne de texte si l’on doit calculer avec le montant.

Pour chaque champ retenu, conservez : son nom, son sens, un exemple, son usage, son type, son unité éventuelle, son caractère obligatoire et les hypothèses encore ouvertes.

## 3. Correction collective des huit scénarios de séance 2

Chaque binôme devait travailler sur un scénario librement choisi, avec deux tables principales et deux enregistrements fictifs par table. Apportez vos propositions, même inachevées : aucun achèvement à domicile n’était demandé. La discussion collective couvre les huit situations ; vous participez aussi à celles que vous n’avez pas préparées.

Avant la discussion, choisissez en binôme un champ de votre scénario. Préparez une phrase pour expliquer à quelle question du client il répond et pourquoi vous avez choisi ce type. Si le choix reste ouvert, formulez la question que vous poseriez au client.

Pendant la correction, proposez votre réponse ou votre question. Pour les autres scénarios, utilisez les mêmes repères pour discuter les choix proposés. Le [guide de questionnement des huit situations](solution/session_02.md) accompagne la discussion.

| Situation | Travail de la classe |
|---|---|
| Cinéma | Construire ensemble les questions à partir de la recherche et du choix d’un film. |
| Librairie | Réutiliser la démarche pour obtenir un livre dans le format souhaité. |
| Blog | Questionner la préparation, la relecture et la publication d’un article. |
| Transport | Formuler les recherches nécessaires pour faire transporter une voiture vers le lieu où l’on voudrait vivre. |
| Langues | Relier le sujet à LBA, LDB et LPB, puis engager une lecture critique des sources sur les codes ISO. |
| Commerce | Formuler les questions permettant de commander et de retrouver une commande passée. |
| Hôpital | Identifier les questions liées au rendez-vous et au suivi de consultations successives. |
| École | Questionner un horaire de cours et le sens d’un résultat académique. |

## 4. Combiner les tables des huit exercices

### Reprendre les huit exercices

1. Rassemblez les schémas discutés pendant la correction des [huit exercices de séance 2](exo/session_02.md#3-dessiner-et-décrire-des-tables) : cinéma, librairie, blog, transport, langues, commerce, hôpital et école.
2. Pour chaque table, terminez la phrase « Une ligne de cette table représente… ». Travaillez uniquement sur les noms des tables et leurs champs. Laissez les tables vides.

### Construire un schéma commun

3. Comparez les tables des différents exercices. Lesquelles pouvez-vous réunir ? Lesquelles devez-vous garder séparées ? Dessinez le schéma obtenu et indiquez de quels exercices provient chaque table.
4. Construisez ensemble la table `personne`. Comparez les champs proposés par les binômes. Lesquels ont le même sens malgré des noms différents ? Lesquels portent le même nom avec des sens différents ? Décidez lesquels conserver et comment les nommer.
5. Pour chaque champ retenu dans `personne`, indiquez son type et la question du client à laquelle il permet de répondre.

### Vérifier les choix

6. Échangez vos schémas. Pour chacun des huit exercices, choisissez une demande de l’énoncé et montrez où trouver les informations nécessaires dans le schéma commun. Notez les demandes qui restent sans réponse.
7. Remettez votre schéma annoté avant la pause. Justifiez un regroupement et une décision de garder deux tables séparées.

### Tableau « Personne » construit en classe

Les cases vides correspondent aux indications laissées en blanc en classe. La dernière colonne, intitulée ici « Contexte », reprend les mentions « acteur » et « patient ».

| Champs | Type | Longueur | Obligatoire | Note | Contexte |
|---|---|---|---|---|---|
| `nationalite` | texte | 3 | non | code ISO | acteur |
| `nom_prenom` | texte | 320 | oui | | acteur |
| `date_de_naissance` | entier/date | | non | | patient |
| `recompenses` | texte | 150 | non | | |
| `film_phare` | texte | voir film | non | | |
| `popularite` | | | | | |
| `role_film_phare` | texte | | | peut différer du film phare | |
| `biographie` | texte | TRÈS LONG | | fiche signalétique | |
| `bibliographie` | texte | TRÈS LONG | | liste (attention0 | |
| `fonction_editeur` | texte | 30 | oui | | |
| `niveau_autorisation` | | | | | |
| `fonction_medecin` | | | | | |
| `code_postal` | | | | | |
| `rue` | | | | | |
| `ville` | | | | | |
| `pays` | | | | | |
| `code_postal_livraison` | | | | | |
| `rue_livraison` | | | | | |
| `ville_livraison` | | | | | |
| `code_postal_facturation` | | | | | |
| `dossier_medical` | | | | | |
| `antecedent` | | | | | |
| `allergies` | | | | | |

## Pause

Pendant la pause, l’enseignant ouvre un DB Fiddle vide en MySQL 8 et colle le [script de création et de remplissage de la table de la classe](preparation/session_03_personne_classe.sql) dans « Schema SQL ». Le script crée les 23 colonnes et charge 24 fiches de l’histoire du calcul et de l’informatique. Pour les exercices, `date_de_naissance` contient l’année seule. Les fonctions éditoriales, les droits, les votes et les adresses sont fictifs.

## 5. Utiliser les données avec SQL

Ouvrez le lien DB Fiddle partagé par l’enseignant. Dans « Query SQL », exécutez `SELECT COUNT(*) FROM personne;` pour vérifier que les 24 fiches sont présentes avant de commencer. Les quatre exemples utilisent les deux colonnes obligatoires du tableau, `nom_prenom` et `fonction_editeur`. Un texte s’écrit entre apostrophes. Chaque requête se termine par un point-virgule.

### Quatre exemples à suivre

**1. Ajouter une fiche avec `INSERT`.** Après `INSERT INTO`, donnez le nom de la table et les colonnes à remplir. Après `VALUES`, écrivez les valeurs dans le même ordre.

```sql
INSERT INTO personne (nom_prenom, fonction_editeur)
VALUES ('Lou Martin', 'relecture');
```

**2. Lire une fiche avec `SELECT`.** `SELECT` indique les colonnes à afficher, `FROM` la table à lire et `WHERE` la condition qui choisit les lignes. Ici, on demande le nom et la fonction de Lou. Pour afficher ces colonnes pour tout le monde, on enlève la condition `WHERE`.

```sql
SELECT nom_prenom, fonction_editeur
FROM personne
WHERE nom_prenom = 'Lou Martin';
```

**3. Modifier une fiche avec `UPDATE`.** Après `UPDATE`, nommez la table. `SET` indique quelle colonne modifier et quelle valeur lui donner. Reprenez la condition du `SELECT` qui vous a permis de retrouver Lou.

```sql
UPDATE personne
SET fonction_editeur = 'publication'
WHERE nom_prenom = 'Lou Martin';
```

Relancez le `SELECT`. Quelle fonction voyez-vous maintenant ?

**4. Supprimer une fiche avec `DELETE`.** `DELETE FROM` indique la table dans laquelle supprimer des lignes. Vérifiez d’abord avec votre `SELECT` que la condition désigne uniquement la fiche voulue.

```sql
DELETE FROM personne
WHERE nom_prenom = 'Lou Martin';
```

Relancez le même `SELECT`. Combien de lignes obtenez-vous ? Dans un `UPDATE` ou un `DELETE`, enlever le `WHERE` ferait porter l’action sur toutes les lignes de la table.

### Dix exercices courts

Partez des 24 fiches de la table `personne`. Écrivez **une requête par consigne**, dans l’ordre, dans `session_03.sql`. Dans le bloc « Query SQL » de DB Fiddle, gardez les requêtes précédentes pour que chaque étape reprenne les modifications déjà faites.

1. Un lecteur cherche le manuel écrit par Mary Allen Wilkes. Affichez la bibliographie de cette personne.
2. Une notice porte la mention `Prix Turing 2008`. Retrouvez le nom de la personne qui a reçu cette récompense et affichez sa biographie.
3. Qui est représenté dans le film `Hidden Figures` ? Affichez le nom de chaque personne et le contenu de `role_film_phare` pour lire qui l’interprète à l’écran.
4. Dans le catalogue de la classe, quelles fiches ont exactement 12 votes ? Affichez leur nom et leur popularité.
5. La fiche de Grace Hopper reçoit un vote supplémentaire. Portez sa popularité à 13 en ciblant son nom.
6. Recherchez Grace Hopper par son nom et affichez sa popularité pour vérifier la mise à jour.
7. Ajoutez une fiche provisoire pour Benedict Cumberbatch. Indiquez `The Imitation Game` comme film, `Alan Turing` comme rôle et `relecture` comme fonction éditoriale dans le catalogue.
8. Retrouvez toutes les fiches associées à `The Imitation Game`. Pour chacune, affichez le nom et le rôle indiqué.
9. Supprimez uniquement la fiche provisoire de Benedict Cumberbatch.
10. Reprenez la requête de l’exercice 8. Vérifiez quelle fiche figure encore au catalogue pour ce film.

### Correction en classe

- **Exercices 1 à 3.** La bibliographie de Mary Allen Wilkes indique `LAP6 Handbook`. Le prix Turing 2008 mène à Barbara Liskov. Pour `Hidden Figures`, vérifiez les deux interprétations dans vos résultats. Taraji P. Henson joue Katherine Johnson et Octavia Spencer joue Dorothy Vaughan.
- **Exercices 4 à 6.** Alan Turing et Grace Hopper commencent chacun avec 12 votes. Après la mise à jour, Grace Hopper en a 13. Relancez la requête 4 pour vérifier qu’Alan Turing en a toujours 12. Pourquoi la condition `popularite = 12` aurait-elle modifié deux fiches à l’étape 5 ?
- **Exercices 7 à 10.** La même recherche par film donne d’abord deux fiches, celle d’Alan Turing et celle de Benedict Cumberbatch. Après la suppression, elle renvoie uniquement celle d’Alan Turing. Expliquez pourquoi le titre du film convenait pour la recherche et pourquoi vous avez choisi le nom pour la suppression.

## 6. Bilan et questions

Reprenez une requête qui vous a posé problème. Lisez la consigne à un camarade, montrez la partie de la requête que vous avez changée et expliquez comment vous avez vérifié le résultat. Mettez en commun les questions qui restent.

# Séance 3 — Choisir les champs, puis utiliser les données

Pourquoi conserver un champ plutôt qu’un autre ? Comment savoir si notre description suffit ? Une fois les données enregistrées, comment retrouver celles qui répondent à un besoin, les compléter ou les corriger ?

Cette séance prolonge l’[exercice de séance 2](exo/session_02.md#3-dessiner-et-décrire-des-tables). Nous allons expliquer les choix de champs, construire progressivement une table et utiliser SQL pour ajouter, lire, modifier et supprimer ses données : les quatre opérations **CRUD**.

À la fin, vous devez pouvoir justifier un champ par un usage, produire une lecture adaptée à une demande et expliquer quelles lignes une modification ou une suppression concerne.

| Durée | Étape |
|---|---|
| 40 minutes | Ouverture : correction collective des huit scénarios de séance 2 : cinéma 15 min, librairie 5, blog 4, transport 3, langues 7, commerce 2, hôpital 2, école 2. |
| 20 minutes | Comprendre les difficultés rencontrées. |
| 20 minutes | Une méthode pour choisir les champs. |
| 40 minutes | Application : plusieurs contextes, une table qui s’élargit. |
| 10 minutes | Pause. |
| 100 minutes | Manipuler les données avec SQL. |
| 10 minutes | Bilan et questions ouvertes. |

**État du support :** le thème, les données et les résultats détaillés du nouvel exercice restent à définir. La méthode et le parcours sont présentés ici ; la mise en pratique complète de cette nouvelle table sera possible lorsque ce complément sera fourni. Les exemples SQL ci-dessous sont des illustrations indépendantes de ce futur exercice.

## 1. Ouverture : correction collective des huit scénarios de séance 2 — 40 minutes

Chaque binôme devait travailler sur un scénario librement choisi, avec deux tables principales et deux enregistrements fictifs par table. Apportez vos propositions, même inachevées : aucun achèvement à domicile n’était demandé. La discussion collective couvre les huit situations ; vous participez aussi à celles que vous n’avez pas préparées.

Reprenez vos propositions et suivez le [guide de questionnement des huit situations](solution/session_02.md). La correction part des usages : ce que vous cherchez à faire, les questions que cela pose et les renseignements nécessaires pour y répondre. Les tables se construisent à partir des sujets et des événements ainsi distingués.

| Situation | Durée | Travail de la classe |
|---|---|---|
| Cinéma | 15 minutes | Construire ensemble les questions à partir de la recherche et du choix d’un film. |
| Librairie | 5 minutes | Réutiliser la démarche pour obtenir un livre dans le format souhaité. |
| Blog | 4 minutes | Questionner la préparation, la relecture et la publication d’un article. |
| Transport | 3 minutes | Formuler les recherches nécessaires pour faire transporter une voiture vers le lieu où l’on voudrait vivre. |
| Langues | 7 minutes | Relier le sujet à LBA, LDB et LPB, puis engager une lecture critique des sources sur les codes ISO. |
| Commerce | 2 minutes | Formuler les questions permettant de commander et de retrouver une commande passée. |
| Hôpital | 2 minutes | Identifier les questions liées au rendez-vous et au suivi de consultations successives. |
| École | 2 minutes | Questionner un horaire de cours et le sens d’un résultat académique. |

La répartition conserve 40 minutes et suit une allocation de Zipf arrondie selon les priorités : cinéma, langues, librairie, blog, transport, puis les trois derniers exercices. L’accompagnement diminue progressivement ; les langues constituent un approfondissement volontaire de la recherche documentaire.

Gardez la trace des demandes, des informations qu’elles nécessitent et des incertitudes. Distinguez ce qui vient de votre expérience, ce qui est imposé par l’énoncé et ce qui demande une recherche ou une clarification. Pour les langues, le parcours de recherche est fixé ; son développement détaillé sera préparé séparément.

Pour reprendre seul cette correction, répondez aux questions du guide avant de lire les relances. Expliquez ensuite une décision de votre proposition et formulez une question qui reste ouverte. Les deux enregistrements fictifs de chacune de vos tables servent à examiner si les informations retenues permettent de répondre aux demandes de départ.

## 2. Pourquoi avons-nous l’impression de deviner ? — 20 minutes

« Ai-je assez de champs ? », « Est-ce le bon champ ? », « Qu’attend le professeur ? » : ces questions apparaissent lorsque l’on cherche une liste définitive dans un énoncé qui ne précise pas tous les usages.

Revenez sur un choix qui vous a posé problème. Était-ce un manque de vocabulaire technique, une ambiguïté du besoin ou plusieurs solutions possibles ? Expliquez ce qui vous aurait permis de décider.

Distinguez trois situations :

| Situation | Exemple | Ce que l’on peut faire |
|---|---|---|
| Exigence explicite | Le prix doit être conservé. | La prendre en compte et préciser son sens. |
| Hypothèse | Le prix est exprimé en euros TTC. | La rendre visible et la faire confirmer. |
| Information manquante | Faut-il conserver les anciens prix ? | Poser une question précise. |

Il n’existe pas une liste de champs valable pour tous les contextes. Cela ne signifie pas que toutes les propositions se valent : une proposition doit conserver les informations requises et permettre les opérations attendues.

Pour un étudiant absent, reprenez deux champs de votre travail et classez les décisions associées dans ces trois situations. Formulez ensuite une question qui réduirait réellement votre incertitude.

## 3. Choisir les champs avec une méthode — 20 minutes

### Quatre repères

| Repère | Question | Exemple |
|---|---|---|
| Utilité | Que permettra cette information ? | La durée permet de sélectionner un film selon le temps disponible. |
| Profondeur documentaire | Jusqu’où faut-il décrire le sujet ? | Une courte présentation ou un parcours biographique détaillé. |
| Précision | Quel sens exact et quel niveau de détail ? | Une année de sortie ou une date de sortie dans un pays donné. |
| Disponibilité | L’information est-elle connue et fiable ? | Un budget peut être inconnu ou estimé. |

### Des techniques pour décider

**Terminez la phrase « Ce champ permet de… ».** Un usage concret justifie mieux un champ que « cela pourrait être intéressant ». Conserver une donnée demande aussi de la renseigner et de la maintenir.

**Définissez avant de choisir le type.** `duree_minutes` décrit une durée en minutes. Si les usages acceptent des minutes entières, un entier convient. Une durée précise à la seconde demanderait une autre convention.

**Comparez deux valeurs et une absence.** Pour un prix, examinez `12,50`, `0` et une information inconnue. Un prix nul et un prix inconnu ne sont pas équivalents. Cette comparaison aide à discuter le type et le caractère obligatoire.

**N’inventez pas une limite sans raison.** La longueur du plus grand titre de vos exemples ne prouve pas que les prochains titres seront plus courts. Écrivez « à déterminer » et la question à résoudre lorsqu’aucune limite n’est justifiée.

**Séparez la donnée de son affichage.** `12,50 €` présente un montant avec une monnaie ; cela ne signifie pas que tout doit être stocké comme une chaîne de texte si l’on doit calculer avec le montant.

Pour chaque champ retenu, conservez : son nom, son sens, un exemple, son usage, son type, son unité éventuelle, son caractère obligatoire et les hypothèses encore ouvertes.

## 4. Plusieurs contextes, une table qui s’élargit — 40 minutes

Le nouvel exercice fournira un même sujet, puis plusieurs contextes successifs. Son thème reste à préciser. Le parcours sera le suivant :

1. Définir ce que représente une ligne et proposer les champs utiles au premier usage.
2. Lire un second contexte, puis ajouter les champs nécessaires sans retirer les précédents.
3. Recommencer pour un troisième usage et expliquer chaque ajout.
4. Essayer de lire la table complète pour répondre à chacune des demandes.
5. Examiner des informations multiples et des valeurs communes à plusieurs lignes.

La table accumulée sera conservée pour la pratique SQL. À chaque étape, notez la demande, les champs ajoutés et leur justification. Les informations nécessaires à la réponse sont-elles présentes ? Sont-elles faciles à retrouver ?

Une table large peut être simple à comprendre au départ : tout se trouve au même endroit. Elle peut aussi devenir encombrante pour chaque usage particulier. Il faudra distinguer cette difficulté de lecture des problèmes de conservation : plusieurs téléphones, plusieurs rôles ou plusieurs événements ne se résument pas à un affichage trop large.

Nous n’allons pas encore séparer cette table. Nous allons d’abord observer ce que SQL permet de résoudre et ce qui reste difficile.

## 5. Utiliser les données avec SQL — 100 minutes

### Une requête, une action et un résultat — 10 minutes

Une requête SQL est une instruction adressée au SGBD. Une lecture retourne des lignes et des colonnes ; une modification peut retourner un message ou un nombre de lignes concernées. Un message de réussite ne prouve pas que les bonnes lignes ont été choisies.

La structure et les données de départ seront fournies avec le nouvel exercice. Leur création ne sera pas à réaliser de mémoire. Utilisez le service indiqué en classe. Certains services conservent les modifications ; d’autres reconstruisent la base à chaque exécution. Le complément d’exercice précisera le fonctionnement et la réinitialisation de l’environnement retenu.

Conservez vos requêtes dans `session_03.sql`. Pour chaque opération : formulez la demande, prévoyez les lignes concernées, exécutez, observez et expliquez les éventuels écarts. Si le service reconstruit la base, les modifications et leurs lectures de vérification doivent rester dans un même bloc d’exécution.

Dans les exemples illustratifs suivants, `document` représente une table contenant notamment `titre`, `nature`, `annee` et `quantite`. Ils expliquent la syntaxe ; ils ne constituent pas le jeu de données du nouvel exercice.

Les textes sont entourés d’apostrophes simples, les nombres s’écrivent sans apostrophes et le point-virgule termine l’instruction. Dans un texte, une apostrophe s’écrit deux fois : `'L''autre rive'`.

### Lire avec SELECT — 25 minutes

```sql
SELECT * FROM document;

SELECT titre, quantite
FROM document
WHERE nature = 'livre';
```

La première requête demande toutes les colonnes et toutes les lignes. La seconde ne retourne que les titres et quantités des livres. La colonne utilisée pour filtrer ne doit pas nécessairement être affichée.

Le résultat peut être compris comme une « sous-table » adaptée à un besoin. **Aucune nouvelle table stockée n’est créée.** Les colonnes non affichées et les lignes non retenues restent dans la source.

Pour la grande table de l’exercice, écrivez une lecture par contexte. Avant chaque requête, listez les colonnes nécessaires et prévoyez les lignes attendues. Comparez ensuite le résultat à la table complète et expliquez ce qui est devenu plus lisible.

Les comparaisons `=`, `<>`, `<`, `>`, `<=` et `>=` permettent de retenir les lignes qui satisfont une condition. Un résultat vide peut être correct : ce n’est pas nécessairement une erreur. L’ordre des lignes n’est pas garanti ; le tri sera étudié en séance 4.

Une table large n’impose pas automatiquement une requête longue : sélectionner trois champs reste une demande courte. Les difficultés de ciblage et de répétition seront examinées séparément.

### Ajouter avec INSERT — 15 minutes

Dans CRUD, **Create signifie ajouter une ligne avec `INSERT`**. Cela ne désigne pas la création de la structure avec `CREATE TABLE`.

```sql
INSERT INTO document (titre, nature, annee, quantite)
VALUES ('L''autre rive', 'livre', 2024, 2);

SELECT titre, nature, annee, quantite
FROM document
WHERE titre = 'L''autre rive';
```

Les valeurs correspondent aux colonnes dans le même ordre. Le nombre de valeurs doit correspondre au nombre de colonnes annoncées. Dans une table comportant d’autres champs obligatoires sans valeur par défaut, il faut également les renseigner : cet exemple suppose que les quatre champs indiqués suffisent.

Pour le nouvel exercice, ajoutez la fiche fournie, puis relisez toutes ses valeurs. Si d’autres lignes partagent la propriété utilisée pour la retrouver, elles apparaîtront aussi : une recherche par titre ne garantit pas de retrouver uniquement la nouvelle fiche.

Observez aussi l’effort de saisie : quels champs servent au contexte de cette fiche ? Lesquels sont absents ou difficiles à renseigner ? N’inventez pas une valeur pour masquer une information inconnue.

### Modifier avec UPDATE — 20 minutes

```sql
SELECT titre, nature, quantite
FROM document
WHERE titre = 'Traversées' AND nature = 'livre';

UPDATE document
SET quantite = 3
WHERE titre = 'Traversées' AND nature = 'livre';

SELECT titre, nature, quantite
FROM document
WHERE titre = 'Traversées' AND nature = 'livre';
```

`SET` indique la nouvelle valeur ; `WHERE` détermine les lignes concernées. `AND` exige que les deux conditions soient satisfaites. Nous l’introduisons ici uniquement pour cumuler les propriétés nécessaires au ciblage ; les filtres combinés seront approfondis en séance 4.

Ce ciblage peut encore retenir plusieurs lignes : deux livres peuvent partager ce titre. Le premier `SELECT` permet de le constater avant la modification. Si les lignes retenues ne correspondent pas à la demande, ne lancez pas l’`UPDATE` ; examinez les propriétés disponibles.

Sans `WHERE`, toutes les lignes sont modifiées. Une condition valide peut elle aussi être trop large. Après l’action, vérifiez les valeurs modifiées et les lignes qui devaient rester inchangées. Si vous changez une propriété utilisée dans le filtre, sa valeur précédente ne permettra plus de retrouver la ligne de la même manière.

Dans le nouvel exercice, les propriétés communes rendront le ciblage progressivement fastidieux. Conservez les conditions successives et expliquez ce que chacune permet de distinguer. Si deux lignes ne peuvent pas être distinguées avec leurs propriétés, dites-le explicitement : ajouter une condition identique pour les deux ne résout rien.

### Supprimer avec DELETE — 15 minutes

```sql
SELECT * FROM document
WHERE titre = 'Fiche de démonstration' AND nature = 'affiche';

DELETE FROM document
WHERE titre = 'Fiche de démonstration' AND nature = 'affiche';

SELECT * FROM document
WHERE titre = 'Fiche de démonstration' AND nature = 'affiche';

SELECT * FROM document;
```

Le premier résultat doit correspondre aux lignes que l’on souhaite retirer. Après la suppression, cette recherche ne doit plus les retrouver ; la dernière lecture permet de contrôler les autres lignes. Sans `WHERE`, `DELETE` supprime toutes les lignes, mais conserve la table et ses colonnes.

Supprimer une fiche et ramener sa quantité à zéro répondent à deux besoins différents. Si le dernier exemplaire est retiré mais que sa fiche doit rester consultable, on modifie la quantité. On ne supprime la fiche que si la demande porte bien sur son retrait.

Dans l’exercice, sélectionnez la fiche temporaire avant de la supprimer. Justifiez votre condition et vérifiez la conservation des autres données. Une propriété partagée peut entraîner une suppression plus large que prévu, comme pour `UPDATE`.

### Enchaîner les opérations — 15 minutes

À partir de l’état initial fourni avec l’exercice :

1. Ajoutez la fiche demandée.
2. Retrouvez-la en affichant les propriétés utiles au contexte indiqué.
3. Corrigez une valeur après avoir contrôlé les lignes ciblées.
4. Supprimez cette fiche après une nouvelle lecture de contrôle.
5. Comparez l’état final à l’état initial.

Conservez la demande, le résultat prévu, la requête, l’observation et une phrase de justification. Les fiches et valeurs précises de cette activité accompagneront le futur jeu de données.

## 6. Ce que nous savons faire, ce qui reste difficile — 10 minutes

Trois difficultés doivent maintenant être distinguées :

| Difficulté | Ce que nous avons constaté |
|---|---|
| Trop de colonnes pour un usage particulier | `SELECT` permet de choisir les colonnes et les lignes utiles. |
| Désigner précisément une ligne | Les propriétés partagées peuvent rendre les conditions longues ou insuffisantes. |
| Conserver plusieurs valeurs ou événements | La sélection de certaines colonnes ne résout pas le problème de structure. |

La table naïve a des avantages : une première lecture directe et des informations réunies au même endroit. Ses limites apparaissent selon les besoins, notamment quand les informations se multiplient ou se répètent. Nous conserverons ces observations pour comparer plus tard cette approche avec des tables séparées, sur les mêmes opérations.

Si vous souhaitez désormais une manière simple et stable de désigner une ligne, expliquez quel ciblage vous a conduit à ce besoin. Cette question prépare l’étude des identifiants. Les clés, les relations et les jointures apporteront ensuite des réponses aux problèmes rencontrés, avec leurs propres coûts de compréhension.

Pour conclure, choisissez un champ et justifiez son utilité, expliquez une lecture SQL adaptée à un contexte, puis décrivez une modification ou suppression avec ses contrôles. Terminez par un problème que les opérations vues aujourd’hui ne suffisent pas à résoudre.

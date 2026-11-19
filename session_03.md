# Séance 3 — Choisir les champs, puis utiliser les données

Pourquoi conserver un champ plutôt qu’un autre ? Comment savoir si notre description suffit ? Une fois les données enregistrées, comment retrouver celles qui répondent à un besoin, les compléter ou les corriger ?

Cette séance prolonge l’[exercice de séance 2](exo/session_02.md#3-dessiner-et-décrire-des-tables). Nous allons construire ensemble une table `personne`, enrichie selon plusieurs usages, puis utiliser SQL pour ajouter, lire, modifier et supprimer ses données : les quatre opérations **CRUD**. Nous comparerons ensuite cette table avec des tables liées pour conserver plusieurs coordonnées par personne.

À la fin, vous devez pouvoir justifier un champ par un usage, produire une lecture adaptée à une demande, vérifier les lignes concernées par une modification ou une suppression et expliquer pourquoi cinq colonnes de téléphone imposent une limite que des lignes liées permettent de dépasser.

| Durée | Étape |
|---|---|
| 40 minutes | Ouverture : correction collective des huit scénarios de séance 2 : cinéma 15 min, librairie 5, blog 4, transport 3, langues 7, commerce 2, hôpital 2, école 2. |
| 20 minutes | Comprendre les difficultés rencontrées. |
| 20 minutes | Une méthode pour choisir les champs. |
| 40 minutes | Construire la table personne par contextes et faire apparaître la limite du sixième contact. |
| 10 minutes | Pause des étudiants ; l’enseignant reprend le travail réalisé et le met en place dans DB Fiddle. |
| 90 minutes | Manipuler les mêmes personnes avec SQL. |
| 10 minutes | Comparer avec des coordonnées dans des tables liées et ajouter le sixième téléphone. |
| 10 minutes | Bilan et questions ouvertes. |

**Support de l’enseignant :** le [guide de préparation](preparation/session_03_personne.md) fournit un exemple de **58 champs et 24 figures de l’histoire du calcul et de l’informatique, dont dix femmes**, avec un dictionnaire des champs, des sources et les scripts SQL. La table se construit en classe ; l’enseignant crée le schéma et le jeu de données pendant la pause. L’exemple sert de référence ou de solution de repli. Les requêtes ci-dessous emploient ses noms de champs et ses valeurs ; elles sont adaptées aux choix de la classe si nécessaire.

La comparaison relationnelle a lieu **pendant cette séance**. Elle montre comment ajouter une coordonnée sans ajouter de colonne. L’étude des clés et des relations reste prévue en séance 5, celle des jointures en séance 6 et la normalisation en séance 9.

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

Gardez la trace des demandes, des informations qu’elles nécessitent et des incertitudes. Distinguez ce qui vient de votre expérience, ce qui est imposé par l’énoncé et ce qui demande une recherche ou une clarification. Pour les langues, suivez le parcours du guide : relever une affirmation sur les codes ISO, identifier sa source et préciser ce qu’elle permet de conclure.

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

### Décrire les mêmes personnes dans plusieurs contextes — 20 minutes

Une ligne représente **une personne**, même lorsqu’elle intervient dans plusieurs contextes. Construisez une table `personne` en partant de figures de l’histoire du calcul et de l’informatique : Al-Khwarizmi, Leibniz, Babbage, Lovelace, Turing, von Neumann, Hopper, Berners-Lee et d’autres figures du jeu d’exemple. Les femmes participent aux mêmes recherches et manipulations : Ada Lovelace, Grace Hopper, Margaret Hamilton ou Katherine Johnson, par exemple.

Les renseignements biographiques sont documentés dans le guide. **Toutes les coordonnées sont fictives** : la simulation réunit volontairement des personnes de différentes époques. Ne les présentez pas comme des renseignements historiques.

Pour chaque contexte, formulez une demande, proposez les champs nécessaires et expliquez leur utilité. Ajoutez-les sans retirer ceux des usages précédents. Quelques fiches suffisent à construire la structure en classe ; la saisie de l’ensemble du jeu se fait pendant la pause.

| Contexte | Demande à traiter | Propriétés utiles |
|---|---|---|
| Présentation commune | Reconnaître une personne et présenter son parcours. | Nom, prénom, nom complet, année de naissance, biographie, domaine. |
| Cinéma / acteurs | Retrouver Turing à partir de *The Imitation Game* et savoir qui l’incarne. | Présence dans la rubrique, film, lien avec le film, interprète. |
| Librairie / auteurs | Retrouver un livre d’Al-Khwarizmi ou de Berners-Lee. | Présence dans la rubrique, livre, langue de rédaction. |
| Blog | Retrouver le blog de Berners-Lee ou de Buterin. | Présence dans la rubrique, nom du blog, adresse du site. |
| Transport | Décrire le lien de Hopper avec la marine ou de Hamilton avec Apollo. | Présence dans la rubrique, organisation, fonction, grade éventuel. |
| Commerce | Retrouver l’entreprise d’Evelyn Berezin et son rôle. | Présence dans la rubrique, organisation, fonction. |
| Cryptographie | Retrouver le travail de Turing ou de Shannon sur le chiffrement. | Présence dans la rubrique, travail cryptographique. |
| Cryptomonnaie | Retrouver les contributions de Nakamoto à Bitcoin ou de Buterin à Ethereum. | Présence dans la rubrique, projet, contribution. |
| Sport | Retrouver Turing pour sa pratique de la course de fond. | Présence dans la rubrique, discipline, performance documentée. |
| Documentation | Retrouver l’origine d’un renseignement et ses incertitudes. | Source, note documentaire. |

Dans l’exemple, ces demandes aboutissent à **33 champs descriptifs**. Les indicateurs de rubrique valent `1` lorsque la fiche est retenue pour ce contexte et `0` sinon ; ils ne décrivent pas toute la carrière de la personne. La rubrique `acteur` inclut les personnes représentées au cinéma : `lien_film` précise que Turing est la personne représentée, tandis que `interprete_personne` désigne Benedict Cumberbatch. La même ligne de Turing sert au cinéma, à la cryptographie et au sport.

### Multiplier les coordonnées — 10 minutes

Ajoutez un téléphone pour joindre la personne, puis un téléphone professionnel et un numéro à prévenir en cas d’urgence dans un contexte médical. Combien d’emplacements prévoir ? Retenez cinq téléphones, puis appliquez le même raisonnement aux adresses et aux emails.

| Étape | Champs ajoutés | Total dans l’exemple |
|---|---:|---:|
| Description dans les différents contextes | 33 | 33 |
| Téléphones : domicile, professionnel, mobile, urgence, autre | 5 | 38 |
| Adresses : domicile, livraison, facturation, professionnelle, autre ; rue, code postal et ville pour chacune | 15 | 53 |
| Emails : personnel, professionnel, associatif, administratif, autre | 5 | **58** |

À chaque ajout, notez le sens, le type et un exemple de valeur. Téléphones et codes postaux sont des textes : leurs signes et leurs zéros initiaux doivent être conservés. Une année de naissance inconnue reste non renseignée. Expliquez aussi ce qui justifierait le nombre cinq : aucune règle de gestion donnée ici ne fixe ce plafond.

### Faire apparaître la limite — 10 minutes

Remplissez les cinq emplacements de chaque type de coordonnée pour Turing, à partir des valeurs fictives du guide. Demandez ensuite d’ajouter **un deuxième téléphone professionnel, `+32 2 000 10 06`, en conservant les cinq numéros existants**. `telephone_autre` est déjà occupé.

Examinez les propositions : remplacer un numéro fait perdre une information ; placer deux numéros dans une cellule oblige à les séparer pour les utiliser ; ajouter une colonne modifie la structure et déplace le plafond. Reprenez la demande avec une deuxième adresse de livraison (`31 rue des Cartes`, `1040`, `Etterbeek`) ou un deuxième email professionnel (`alan.projet@example.test`).

Formulez le problème : **le plafond vient du schéma, pas du besoin**. La largeur de la table rend certaines lectures encombrantes ; les cinq emplacements imposent une autre difficulté, celle de conserver une sixième coordonnée. Nous pratiquerons d’abord le CRUD sur cette table, puis nous réaliserons l’ajout dans des tables liées au cours de la même séance.

### Pause — 10 minutes

Avant la pause, transmettez à l’enseignant le travail réalisé : les champs retenus, leurs types et les lignes d’exemple, avec les hypothèses encore ouvertes.

Pendant la pause des étudiants, l’enseignant traduit cette structure en SQL, y ajoute les données et exécute le tout dans DB Fiddle. Au retour, il partage le lien et présente la table obtenue. Comparez ses colonnes et ses lignes au travail réalisé avant la pause : cette même table sert de point de départ à la pratique du CRUD.

Le [script d’exemple](preparation/session_03_personne.sql) est prévu pour MySQL 8. Pour la comparaison de fin de séance, l’enseignant dispose aussi du [script de coordonnées liées](preparation/session_03_personne_relationnel.sql), à adapter si la structure construite en classe diffère. La création de la structure et le transfert des données sont pris en charge par l’enseignant.

## 5. Utiliser les données avec SQL — 90 minutes

### Une requête, une action et un résultat — 10 minutes

Une requête SQL est une instruction adressée au SGBD. Une lecture retourne des lignes et des colonnes ; une modification peut retourner un message ou un nombre de lignes concernées. Un message de réussite ne prouve pas que les bonnes lignes ont été choisies.

Ouvrez le lien DB Fiddle partagé par l’enseignant. La structure et les données de départ reprennent le travail réalisé avant la pause ; leur création ne sera pas à réaliser de mémoire. L’enseignant précise le moteur utilisé, la manière d’exécuter les requêtes et de revenir à l’état initial.

Conservez vos requêtes dans `session_03.sql`. Pour chaque opération : formulez la demande, prévoyez les lignes concernées, exécutez, observez et expliquez les éventuels écarts. Si le service reconstruit la base, les modifications et leurs lectures de vérification doivent rester dans un même bloc d’exécution.

Les requêtes portent sur la table `personne` construite avant la pause. Dans le jeu d’exemple, elle contient 24 fiches. Si la classe a constitué un autre jeu, relevez son nombre initial de lignes et adaptez les résultats attendus.

Les textes sont entourés d’apostrophes simples, les nombres s’écrivent sans apostrophes et le point-virgule termine l’instruction. Dans un texte, une apostrophe s’écrit deux fois : `'Lou D''Arcy'`.

### Lire avec SELECT — 20 minutes

```sql
SELECT * FROM personne;

SELECT nom_complet, film_repere, lien_film, interprete_personne
FROM personne
WHERE acteur = 1;

SELECT nom_complet, discipline_sportive, performance_sportive
FROM personne
WHERE sport = 1;
```

La première requête demande toutes les colonnes et toutes les lignes. Les suivantes retiennent les propriétés utiles au cinéma ou au sport. Avec le jeu d’exemple, on attend 24 personnes, trois fiches en cinéma et une en sport. Turing apparaît dans les deux derniers résultats, mais sa fiche n’est enregistrée qu’une fois. La colonne utilisée pour filtrer ne doit pas nécessairement être affichée.

Le résultat peut être compris comme une « sous-table » adaptée à un besoin. **Aucune nouvelle table stockée n’est créée.** Les colonnes non affichées et les lignes non retenues restent dans la source.

Chaque binôme choisit un autre contexte et écrit sa lecture : auteurs, blog, transport, commerce, cryptographie ou cryptomonnaie. Avant la requête, listez les colonnes nécessaires et prévoyez les lignes attendues. Comparez ensuite le résultat à la table complète et expliquez ce qui est devenu plus lisible. Le guide contient les requêtes et les effectifs attendus pour chaque contexte.

Les comparaisons `=`, `<>`, `<`, `>`, `<=` et `>=` permettent de retenir les lignes qui satisfont une condition. Un résultat vide peut être correct : ce n’est pas nécessairement une erreur. L’ordre des lignes n’est pas garanti ; le tri sera étudié en séance 4.

Une table large n’impose pas automatiquement une requête longue : sélectionner trois champs reste une demande courte. Les difficultés de ciblage et de répétition seront examinées séparément.

### Ajouter avec INSERT — 15 minutes

Dans CRUD, **Create signifie ajouter une ligne avec `INSERT`**. Cela ne désigne pas la création de la structure avec `CREATE TABLE`.

```sql
INSERT INTO personne (nom, prenom, nom_complet, email_personnel, note_documentaire)
VALUES ('D''Arcy', 'Lou', 'Lou D''Arcy', 'lou.exercice@example.test',
        'Personne fictive ajoutée pour la manipulation CRUD.');

SELECT nom, prenom, nom_complet, email_personnel, note_documentaire
FROM personne
WHERE nom_complet = 'Lou D''Arcy';
```

Les valeurs correspondent aux colonnes dans le même ordre. Le nombre de valeurs doit correspondre au nombre de colonnes annoncées. Dans l’exemple, `nom_complet` est obligatoire, les indicateurs prennent la valeur par défaut `0` et les autres champs peuvent rester non renseignés. Si la classe a retenu d’autres champs obligatoires sans valeur par défaut, renseignez-les également.

Ajoutez cette fiche temporaire de Lou D’Arcy, puis relisez les valeurs saisies. Avec le jeu d’exemple, une ligne est ajoutée et la table passe de 24 à 25 fiches. Si d’autres lignes partageaient ce nom complet, elles apparaîtraient aussi : un nom ne garantit pas l’unicité d’une personne.

Observez aussi l’effort de saisie : quels champs servent au contexte de cette fiche ? Lesquels sont absents ou difficiles à renseigner ? N’inventez pas une valeur pour masquer une information inconnue.

### Modifier avec UPDATE — 20 minutes

Demande : corriger le téléphone mobile fictif de **John McCarthy** en `+32 470 00 50 09`. Commencez par rechercher les personnes prénommées John.

```sql
SELECT nom, prenom, adresse_domicile_ville, telephone_mobile
FROM personne
WHERE prenom = 'John';

SELECT nom, prenom, telephone_mobile
FROM personne
WHERE prenom = 'John' AND nom = 'McCarthy';

UPDATE personne
SET telephone_mobile = '+32 470 00 50 09'
WHERE prenom = 'John' AND nom = 'McCarthy';

SELECT nom, prenom, telephone_mobile
FROM personne
WHERE prenom = 'John';
```

`SET` indique la nouvelle valeur ; `WHERE` détermine les lignes concernées. `AND` exige que les deux conditions soient satisfaites. Nous l’introduisons ici uniquement pour cumuler les propriétés nécessaires au ciblage ; les filtres combinés seront approfondis en séance 4.

Le premier résultat contient John von Neumann et John McCarthy. Leur ville fictive est la même : ajouter cette condition ne les départagerait pas. Le nom distingue les deux fiches dans cet échantillon, sans garantir l’unicité de cette combinaison dans toute base. Si les lignes retenues par le deuxième `SELECT` ne correspondent pas à la demande, ne lancez pas l’`UPDATE` ; examinez les propriétés disponibles.

Sans `WHERE`, toutes les lignes sont modifiées. Une condition valide peut elle aussi être trop large. Après l’action, vérifiez les valeurs modifiées et les lignes qui devaient rester inchangées. Si vous changez une propriété utilisée dans le filtre, sa valeur précédente ne permettra plus de retrouver la ligne de la même manière.

Après la modification, le téléphone de McCarthy se termine par `50 09` ; celui de von Neumann reste `40 01`. Conservez les conditions successives et expliquez ce que chacune permet de distinguer. Si deux lignes ne peuvent pas être distinguées avec leurs propriétés, dites-le explicitement : ajouter une condition identique pour les deux ne résout rien.

### Supprimer avec DELETE — 15 minutes

```sql
SELECT nom_complet, email_personnel
FROM personne
WHERE nom_complet = 'Lou D''Arcy' AND email_personnel = 'lou.exercice@example.test';

DELETE FROM personne
WHERE nom_complet = 'Lou D''Arcy' AND email_personnel = 'lou.exercice@example.test';

SELECT * FROM personne
WHERE nom_complet = 'Lou D''Arcy';

SELECT nom_complet, telephone_mobile FROM personne;
```

Le premier résultat doit correspondre aux lignes que l’on souhaite retirer. Après la suppression, cette recherche ne doit plus les retrouver ; la dernière lecture permet de contrôler les autres lignes. Sans `WHERE`, `DELETE` supprime toutes les lignes, mais conserve la table et ses colonnes.

Supprimer une personne et corriger son téléphone répondent à deux besoins différents. Si seul le numéro est erroné, on modifie cette valeur. On ne supprime la fiche que si la demande porte bien sur son retrait.

Sélectionnez la fiche temporaire avant de la supprimer. Justifiez votre condition et vérifiez la conservation des autres données. Avec le jeu d’exemple, Lou n’apparaît plus et les 24 personnes initiales restent présentes. Le téléphone corrigé de McCarthy reste modifié : retrouver le nombre initial de lignes ne signifie pas retrouver tout l’état initial.

### Enchaîner les opérations — 10 minutes

Repartez de l’état initial, dans votre copie de travail, et réalisez cette demande sans recopier tout le bloc précédent :

1. Ajoutez la personne fictive **Sam Martin** : `nom = 'Martin'`, `prenom = 'Sam'`, `nom_complet = 'Sam Martin'`, `email_personnel = 'sam.exercice@example.test'` et une note indiquant qu’il s’agit d’une fiche temporaire.
2. Retrouvez sa fiche en affichant son nom complet et son email.
3. Corrigez son email en `sam.cours@example.test`, après avoir contrôlé les lignes ciblées.
4. Supprimez cette fiche après une nouvelle lecture de contrôle. Tenez compte de l’email corrigé si vous l’utilisez dans la condition.
5. Comparez les lignes et les valeurs finales à l’état initial : la fiche temporaire a disparu et les autres données sont conservées.

Conservez la demande, le résultat prévu, la requête, l’observation et une phrase de justification. Avec le jeu d’exemple, les effectifs attendus sont 24, puis 25 après l’ajout, toujours 25 après la correction et 24 après la suppression.

## 6. Ajouter le sixième téléphone dans des tables liées — 10 minutes

Reprenez la demande laissée ouverte avant la pause : conserver un deuxième téléphone professionnel de Turing sans perdre les cinq numéros existants. L’enseignant présente les **mêmes données de départ** dans quatre tables, à l’aide du [script de comparaison](preparation/session_03_personne_relationnel.sql). Le script s’applique au jeu initial et conserve la grande table pour la comparaison.

| Table | Une ligne représente… | Champs dans l’exemple |
|---|---|---:|
| `personne_relationnelle` | Une personne, avec les 33 propriétés descriptives et un identifiant. | 34 |
| `telephone` | Un numéro, son usage et l’identifiant de la personne, avec un identifiant propre à cette ligne. | 4 |
| `adresse` | Une adresse, son usage et l’identifiant de la personne, avec un identifiant propre à cette ligne. | 6 |
| `email` | Un email, son usage et l’identifiant de la personne, avec un identifiant propre à cette ligne. | 4 |
| **Total** | **Quatre tables au lieu d’une.** | **48, contre 58 auparavant** |

Dans la grande table, les cinq téléphones occupent cinq colonnes de la fiche de Turing. Dans `telephone`, ils occupent cinq lignes qui portent toutes l’identifiant de Turing. Le champ `usage_telephone` précise domicile, professionnel, mobile, urgence ou autre. Plusieurs lignes peuvent avoir le même usage.

L’enseignant montre comment retrouver les coordonnées par cet identifiant. Exécutez la lecture, l’ajout fourni, puis la même lecture de contrôle :

```sql
SELECT id, nom_complet
FROM personne_relationnelle
WHERE nom_complet = 'Alan Turing';

SELECT usage_telephone, numero
FROM telephone
WHERE personne_id = (
    SELECT id FROM personne_relationnelle WHERE nom_complet = 'Alan Turing'
);

INSERT INTO telephone (personne_id, usage_telephone, numero)
SELECT id, 'professionnel', '+32 2 000 10 06'
FROM personne_relationnelle
WHERE nom_complet = 'Alan Turing';

SELECT usage_telephone, numero
FROM telephone
WHERE personne_id = (
    SELECT id FROM personne_relationnelle WHERE nom_complet = 'Alan Turing'
);
```

Ces requêtes sont fournies pour observer la comparaison : les sous-requêtes et la forme `INSERT … SELECT` ne sont pas à maîtriser à ce stade. L’enseignant peut aussi relever l’identifiant et l’utiliser directement dans des requêtes simples. Le nom complet sert ici à retrouver une fiche connue du jeu d’exemple ; il ne devient pas un identifiant unique.

Avant l’ajout, retrouvez les cinq numéros. Après **un seul ajout**, vérifiez les six lignes, dont deux numéros professionnels, et la conservation des cinq valeurs précédentes. **Une ligne a été ajoutée ; aucune colonne n’a changé.** Expliquez pourquoi le nouveau modèle n’impose plus un nombre fixe de téléphones par personne.

Montrez où seraient ajoutés la deuxième adresse de livraison et le deuxième email professionnel. Le guide fournit ces prolongements ; le principe est le même. La comparaison porte ici sur les coordonnées : les livres, films et autres propriétés multiples seront repris lors du travail sur les relations et la normalisation.

## 7. Ce que nous savons faire, ce qui reste difficile — 10 minutes

Trois difficultés doivent maintenant être distinguées :

| Difficulté | Ce que nous avons constaté |
|---|---|
| Trop de colonnes pour un usage particulier | `SELECT` permet de choisir les colonnes et les lignes utiles. |
| Désigner précisément une ligne | Les propriétés partagées peuvent rendre les conditions longues ou insuffisantes. |
| Conserver plusieurs coordonnées | Des lignes liées permettent d’ajouter une coordonnée sans réserver une colonne supplémentaire. |

La table initiale réunit toutes les informations d’une personne au même endroit. La comparaison a montré sa limite face à une sixième coordonnée, puis la manière dont des tables liées répondent à cette demande. Le nombre de tables augmente, mais les mêmes champs de coordonnées servent pour chaque nouvelle ligne.

Le rattachement des coordonnées a introduit un identifiant de personne. Expliquez pourquoi le prénom partagé des deux John ne remplit pas ce rôle. En séance 5, nous préciserons comment les clés identifient les lignes et maintiennent leurs liens ; en séance 6, nous apprendrons à lire ensemble les données de plusieurs tables.

Pour conclure, choisissez un champ et justifiez son utilité, expliquez une lecture SQL adaptée à un contexte, puis décrivez une modification ou suppression avec ses contrôles. Expliquez enfin pourquoi le sixième téléphone exigeait un changement de structure dans la première table et seulement une nouvelle ligne dans la seconde organisation. Distinguez ce que vous avez réalisé en CRUD de ce que vous avez observé avec les identifiants et les tables liées.

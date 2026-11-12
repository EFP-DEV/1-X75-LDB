# Séance 2 : Décrire et représenter les propriétés

Quels renseignements faut-il garder pour préparer et livrer une commande ? Comment les ranger dans un tableau ?

Cette séance confronte **la diversité des données réelles** aux **possibilités et aux limites de leur représentation technique**. Un choix apparemment évident peut supprimer un caractère significatif, refuser une valeur légitime ou laisser entrer une valeur incohérente.

Les problèmes se résolvent par une boucle : **proposer, tester sur des cas réels, constater les conséquences, ajuster**. Vous apprendrez ainsi à justifier vos décisions et à reconnaître quand il vous manque une information pour décider.

En séance 1, nous avons utilisé des propriétés pour classer et retrouver des documents. Nous allons maintenant décrire les renseignements qu’une papeterie doit conserver pour préparer des articles, joindre une personne et livrer une commande.

À la fin de la séance, vous devez pouvoir définir un champ sans ambiguïté, choisir une représentation adaptée à son usage, formuler une règle vérifiable et expliquer les conséquences de vos choix à partir d’un document.

L’[exercice « Des documents aux champs »](exo/session_02.md) se réalise à deux dans Excel, à partir des [lots A à D de la Papeterie du Canal](exo/session_02_documents.html). Vous construisez progressivement un **dictionnaire des données**. Dans ce tableau de description, **une ligne décrit un champ**. Les lots et les nouvelles colonnes sont introduits au signal du professeur. Les explications du cours reprennent les questions rencontrées pendant le travail.

## Des chiffres ou des lettres

La séance commence par un jeu oral. Le professeur pose une question courte sur une donnée de tous les jours : un code postal, un numéro de maison, un téléphone, un prénom, une quantité ou un prix.

Répondez spontanément. Le professeur révèle ensuite un exemple qui complique la réponse. **Gardez-vous votre choix ou changez-vous d’avis ?** Expliquez pourquoi en une phrase, puis passez à la question suivante.

À la fin du jeu, reprenez un exemple : qu’aurait-on perdu ou rendu difficile avec le premier choix ? Cette question guidera le travail sur les commandes de la papeterie.

## 1. Préciser ce que le champ décrit

### Partir du besoin — lot A

La papeterie reçoit des demandes par mail, courrier et téléphone. Chaque commande de l’exercice porte sur un seul article, éventuellement en plusieurs exemplaires. Tous les prix sont unitaires, en euros TTC.

Lisez A1 et A2. Quels renseignements faut-il pouvoir retrouver pour préparer les articles, contacter la personne et livrer à la bonne adresse ? Relevez les champs utiles et un exemple exact pour chacun.

Une **propriété** est une caractéristique que l’on souhaite décrire : la quantité commandée, le nom de la personne à joindre ou la date de livraison souhaitée. Un **champ** donne un nom et une définition précise à une propriété que l’on veut enregistrer. Une **valeur** décrit cette propriété pour un cas particulier : `4` est la quantité commandée dans A1.

Le choix des champs dépend des opérations à réaliser. Il doit permettre de retrouver les renseignements nécessaires sans devoir réinterpréter tout le document à chaque utilisation.

### Mettre le sens à l’épreuve

Avant de choisir les types, reprenez A1 :

1. Deux dates apparaissent. Que représente chacune ? Vos noms de champs permettent-ils de les distinguer ?
2. Le montant `12,50 €` concerne-t-il un carnet ou les quatre carnets ? Votre champ permet-il de le comprendre ?
3. L’adresse donnée permet-elle de connaître le domicile de Marie ? Que sait-on exactement de cette adresse ?

Ajoutez **« Ce que ce champ décrit »**. Définissez chaque champ en une phrase et précisez son nom si nécessaire. Un autre binôme doit pouvoir reformuler votre définition sans explication orale.

Après l’échange, on peut distinguer :

| Champ possible | Sens précis |
|---|---|
| `date_document` | Date indiquée sur le mail, le courrier ou la note. |
| `date_livraison_souhaitee` | Date à laquelle la personne demande à recevoir sa commande. |
| `prix_unitaire_ttc_eur` | Prix TTC d’un exemplaire de l’article, en euros. |
| `adresse_livraison` | Adresse à laquelle la personne demande de livrer la commande. |

La date du document ne prouve pas à elle seule sa date de réception. Une livraison souhaitée ne prouve pas qu’elle a eu lieu. L’adresse de livraison ne permet pas de conclure que la personne y habite.

Le montant des quatre carnets de A1 peut être **calculé** : `4 × 12,50 € = 50 €`. Il s’agit du montant des articles ; les documents ne renseignent pas d’éventuels frais supplémentaires. La quantité et le prix unitaire sont des données fournies, tandis que ce montant résulte d’un calcul.

### Nommer et séparer selon les usages

Un nom comme `date_livraison_souhaitee` indique mieux le sens que `date`. Choisissez une convention cohérente, par exemple des minuscules et des mots séparés par `_`.

Conserver le nom complet permet de l’afficher pour joindre la personne. Séparer prénom et nom de famille suppose un besoin qui justifie cette séparation et des informations suffisantes pour la réaliser. Le nombre de mots ne suffit pas à décider du découpage.

Pour une adresse, il peut être utile de distinguer le code postal, la localité et le pays afin de les contrôler séparément. Une consigne comme « Déposer à l’accueil » décrit une instruction de livraison. Chaque séparation doit être reliée à une utilisation prévue.

**Avant de demander comment représenter une valeur, il faut savoir ce qu’elle signifie.**

## 2. Choisir un type à partir de l’usage

### Proposer avant d’ouvrir le lot B

Ajoutez **« Type proposé »**. Pour chaque champ, choisissez une première représentation : texte, nombre entier, nombre décimal ou date. Justifiez-la par ce que la papeterie doit pouvoir faire avec la valeur.

Pour chaque renseignement, choisissez : texte, nombre ou date. Demandez-vous ce que vous devrez en faire : calculer un prix, comparer des dates, retrouver un numéro de téléphone… Une suite de chiffres peut servir à compter, mais aussi à désigner un article ou une adresse. Son apparence ne suffit donc pas à choisir un type.

| Type envisagé | Ce qu’il permet de représenter | Utilisation possible |
|---|---|---|
| Texte | Une suite de caractères, comprenant éventuellement lettres, chiffres, espaces et ponctuation. | Afficher une désignation, rechercher une référence ou conserver une consigne. |
| Nombre entier | Par exemple, 4 carnets ou 12 enveloppes : on compte des exemplaires entiers. | Compter des exemplaires et comparer les quantités. |
| Nombre décimal | Une valeur pouvant comporter une partie décimale. | Calculer avec un prix unitaire. |
| Date | Un jour du calendrier. | Ordonner les livraisons souhaitées ou comparer deux dates. |

La définition doit aussi préciser l’**unité** : exemplaires pour une quantité, euros TTC pour le prix unitaire de cet exercice. Pour un montant, il faut prévoir la précision nécessaire ; les prix du dossier sont exprimés au centime. Le choix du type numérique exact dans un SGBD sera repris lors de la création des tables.

Le type inscrit dans votre dictionnaire décrit le futur champ. Le mot « Date » écrit dans une cellule du dictionnaire reste du texte : il ne configure pas automatiquement une colonne de dates dans une base.

## 3. Confronter les choix aux nouvelles commandes

### Examiner les valeurs — lot B

Ouvrez B1 et B2. Appliquez vos choix sans les modifier immédiatement. Pour chaque difficulté, relevez le document, la valeur exacte et la conséquence de votre décision.

| Propriété | Valeurs rencontrées | Question à résoudre |
|---|---|---|
| Référence d’article | `1000`, `2000`, puis `AB-012` et `P-07`. | Une représentation numérique conserve-t-elle toutes les références ? |
| Code postal | `1000`, `4000`, puis `01210` et `SW1A 1AA`. | Que deviennent le zéro initial, les lettres et l’espace ? |
| Numéro dans la voie, si vous l’avez séparé | `14`, `25`, puis `12B`. | Ce champ décrit-il une quantité ? |
| Téléphone | `0470 00 00 11`, puis `+33 6 00 00 00 33` et `+44 7700 900123`. | Quels caractères faut-il préserver ? Quel contexte faut-il connaître pour transformer l’écriture ? |

Une référence, un code postal ou un téléphone servent ici à désigner ou à joindre. Avec du **texte**, on peut garder le zéro au début de `01210` et les lettres de `AB-012`. Une quantité et un prix doivent, eux, permettre les opérations arithmétiques prévues.

Une représentation qui accepte les deux premiers documents peut échouer sur les suivants. Quand une valeur légitime ne tient pas dans la représentation proposée, il faut réexaminer cette représentation.

### Distinguer valeur et format

Un **format** définit une manière d’écrire ou d’afficher une valeur. Une date connue peut s’afficher `18/11/2026` ou `2026-11-18`. Un prix peut s’afficher `12,50 €` alors que l’opération de calcul utilise le montant numérique, avec sa monnaie connue.

Le format ne change pas le sens du champ. Il ne démontre pas non plus que la valeur est correcte. Afficher deux décimales ne prouve pas que la saisie respectait une règle limitant la précision au centime.

Dans **« Exemple relevé »**, recopiez l’exemple exactement comme il est écrit dans le document. Une autre colonne, **« Format retenu »**, décrit la présentation envisagée. Cette séparation permet de comparer la source avec une éventuelle transformation.

Toute transformation doit être justifiée. Retirer des séparateurs d’un téléphone peut en faciliter la comparaison, à condition de préserver le numéro. Ajouter un indicatif international exige de connaître le pays du numéro ; le pays de livraison ne suffit pas à l’établir.

### Garder la trace de la décision

Dans la feuille `decisions`, consignez une proposition maintenue et une proposition modifiée ou laissée en attente. Pour chacune :

1. indiquez le champ et votre proposition ;
2. citez le document et la valeur qui l’ont mise à l’épreuve ;
3. décrivez la conséquence constatée ;
4. justifiez le choix retenu et vérifiez-le à nouveau sur les documents déjà ouverts.

Une proposition qui fonctionne dès le départ doit aussi pouvoir être expliquée. Si vous hésitez, précisez les options et l’information nécessaire pour décider.

## 4. Déterminer le contenu et la longueur

### Formuler les premières règles avant le lot C

Le type texte permet une grande diversité de valeurs. Il reste à déterminer ce que chaque champ peut contenir : caractères, espaces, ponctuation, longueur et éventuelle absence.

Ajoutez **« Contenu et longueur »**. À partir des lots A et B, proposez des règles pour le nom de contact, la référence d’article et la consigne de livraison. Indiquez ce qui justifie chaque restriction. Si aucune limite de longueur n’est encore fondée, écrivez « à déterminer » et précisez quelle information vous cherchez.

### Examiner les textes — lot C

Ouvrez C1 à C3 et appliquez vos propositions aux textes tels qu’ils sont écrits.

`Élodie D’Hondt-Martin` fait intervenir un accent, une apostrophe et un trait d’union. `Alexandrine de la Roche-Saint-André` comporte plusieurs mots. `Bo Li` est court. La consigne de C2 occupe plusieurs phrases.

Une règle limitée aux lettres non accentuées peut refuser un nom présent dans le dossier. Une longueur minimale peut refuser un nom court ; une longueur maximale peut empêcher de conserver une consigne utile. Supprimer des caractères pour faire entrer la valeur dans le champ peut modifier l’information.

Pour chaque limite proposée, demandez-vous :

- Quelle nécessité impose cette limite ?
- Dans quelle unité est-elle exprimée : caractères, par exemple ? Comptez-vous les espaces et la ponctuation ?
- Quelle valeur du dossier est refusée ou altérée ?
- Que ferait-on concrètement si une prochaine valeur dépassait cette limite ?

Une limite peut venir d’un besoin de l’application ou d’un outil avec lequel elle échange. Il faut alors la documenter et prévoir le traitement des valeurs qui la dépassent. Le nom et les consignes ne sont pas raccourcis silencieusement.

**La plus longue valeur observée ne définit pas, à elle seule, la longueur maximale des prochaines valeurs.** Un dictionnaire peut comporter une décision provisoire clairement signalée.

## 5. Contrôler sans inventer une correction

### Écrire des règles avant le lot D

Ajoutez **« Règles de validation »**. Proposez au moins une règle pour la quantité, le prix unitaire et la date de livraison souhaitée. Donnez pour chacune un exemple accepté et un exemple refusé. Les exemples inventés pour éprouver une règle doivent être signalés comme tels et rester distincts des transcriptions du dossier.

Une **règle de validation** exprime une condition qu’une valeur doit respecter dans son contexte d’utilisation. Elle complète le type.

| Décision | Question | Exemple pour la quantité |
|---|---|---|
| Sens | Que compte-t-on ? | Le nombre d’exemplaires de l’article commandé. |
| Type | Quelle famille de valeurs représente-t-on ? | Un entier. |
| Format | Comment l’écrit-on ou l’affiche-t-on ? | Avec des chiffres, sans décimales à l’affichage. |
| Validation | Quelles valeurs accepte-t-on pour ce besoin ? | Au moins un exemplaire pour une commande de l’exercice. |

Un entier peut être négatif ; le type seul ne suffit donc pas à exprimer la règle sur la quantité. Une règle sur le prix doit préciser le traitement des valeurs négatives et du zéro. Si cette décision dépend d’une pratique de la papeterie qui n’est pas connue, notez l’hypothèse et la confirmation nécessaire.

Écrire une règle dans Excel ne la fait pas appliquer automatiquement. Ici, vous l’appliquez aux exemples et vous expliquez votre décision.

### Examiner les transcriptions — lot D

Pour chaque valeur qui vous fait hésiter, distinguez **le constat** et **l’action à entreprendre**.

Une valeur peut être incompatible avec une règle et nécessiter une confirmation pour être corrigée. Le `31 novembre 2026` ne désigne aucun jour du calendrier. Cela ne permet pas de choisir entre le 30 novembre, le 1er décembre ou une autre date.

De même, constater l’absence de `@` dans `luc.moreau.example.com` permet de signaler un problème de forme. Cela ne révèle pas l’adresse souhaitée. Une forme acceptée ne suffirait d’ailleurs pas à prouver que la boîte existe ou appartient à la personne.

Une ponctuation inhabituelle dans un téléphone doit être examinée selon la règle retenue. Avant de refuser ou de transformer la valeur, il faut distinguer les séparateurs des caractères nécessaires à son interprétation.

### Reconnaître une convention manquante

Dans D3, `03/04/2027` peut se lire le 3 avril selon la convention jour/mois/année, ou le 4 mars selon la convention mois/jour/année. Le contexte francophone favorise la première lecture. Une convention partagée permet de décider ; lorsqu’elle n’est pas établie, il faut expliciter son interprétation ou demander une confirmation.

Une fois la date comprise, on peut choisir une écriture commune. Changer son affichage ne résout pas une incertitude sur le jour souhaité.

D3 ne précise pas l’article ni la quantité. On ne peut pas compléter ce message en reprenant automatiquement les renseignements d’une autre commande portant le même nom. Les informations manquantes restent à demander ; elles ne deviennent ni une quantité nulle ni une réponse négative.

### Vérifier la portée d’une règle

Vous écrivez « code postal valide ». Comment votre partenaire saura-t-il quels codes accepter ou refuser ? Il faut préciser le pays et la règle applicable, puis distinguer la forme du code de sa correspondance avec une localité. Une règle établie pour un pays ne s’applique pas automatiquement à tous les autres.

Une règle peut donc échouer de deux façons : **refuser une valeur légitime** ou **accepter une valeur incohérente**. Reprenez les lots précédents après chaque modification pour examiner ces deux conséquences.

## 6. Transmettre le dictionnaire des données

Le **dictionnaire des données** rassemble les définitions et les décisions nécessaires pour comprendre les champs et les utiliser de manière cohérente. Votre feuille `champs` s’est construite progressivement :

| Rubrique | Ce qu’elle doit permettre de comprendre |
|---|---|
| Champ | Le nom choisi pour désigner la propriété. |
| Exemple relevé | Une transcription exacte, dont le document source est repérable. |
| Ce que ce champ décrit | Le sens de la propriété, avec son unité lorsqu’elle est nécessaire. |
| Type proposé | La famille de valeurs envisagée pour le futur champ. |
| Format retenu | L’écriture ou l’affichage prévu. |
| Contenu et longueur | Les caractères admis et les limites envisagées, avec leur justification ou leur caractère provisoire. |
| Règles de validation | Les conditions à appliquer pour accepter une valeur dans son contexte. |
| Décisions à confirmer | Les points qui restent ouverts et les informations nécessaires pour les résoudre. |

Le document source peut être indiqué dans un commentaire de la cellule contenant l’exemple. La feuille `decisions` conserve les propositions successives et les conséquences observées.

Échangez votre classeur avec un autre binôme. Faites-lui reformuler le sens de trois champs et appliquer vos règles à des valeurs des documents. Comparez vos conclusions. Si les décisions diffèrent, recherchez ce qui manque dans la définition ou dans la règle, puis reprenez les mêmes valeurs après correction.

Pour transférer cette démarche au projet du module, choisissez une propriété d’un document culturel de la séance 1 : titre, date, référence ou prix. Définissez un champ, proposez son type et une règle, puis cherchez dans le corpus une autre valeur qui pourrait mettre ce choix à l’épreuve.

## 7. Bilan

Choisissez un champ de votre tableau et expliquez :

1. son sens et l’usage qui justifie sa présence ;
2. son type et les valeurs qu’il doit pouvoir conserver ;
3. une règle utile pour contrôler la saisie ;
4. une valeur précise qui a confirmé ou remis en cause votre choix ;
5. la vérification effectuée après votre décision.

Présentez également une décision qui reste à confirmer : quelles options envisagez-vous, quelle information manque et auprès de quelle source pourrait-on l’obtenir ?

Conservez `papeterie_champs.xlsx`, avec les feuilles `champs` et `decisions`. La séance suivante reprendra le passage du dictionnaire aux données : distinguer les fiches, représenter les relations, transférer les valeurs dans un fichier puis dans une base et vérifier leur conservation.

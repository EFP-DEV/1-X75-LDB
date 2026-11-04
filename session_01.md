# Séance 1 : Définir, classer et retrouver

Un titre, une date, une photographie ou un prix peuvent constituer des données. Une application les conserve pour les afficher, les rechercher et les modifier.

On distingue d’abord **donnée et information**, puis on compare plusieurs manières de représenter le nombre **122**, jusqu’à l’écriture **binaire**. Le code **ASCII** permet ensuite de relier ce nombre à la lettre **z**, dont une police fournit le dessin affiché à l’écran. On classe ensuite un ensemble de **42 documents culturels** pour y rechercher des informations. Chaque réponse doit être justifiée par le document correspondant ; chaque comptage, par la liste des documents retenus.

## 1. Mettre les mots en commun

**Quand vous entendez « base de données », à quoi pensez-vous ?**

Proposez les mots qui vous viennent à l’esprit et un exemple concret pour chacun. Conservez cette liste pour la reprendre à la fin de la séance.

## 2. Distinguer donnée et information

Une **donnée** est une valeur ou une description représentée sous une forme que l’on peut conserver, transmettre ou traiter. Un nombre, un titre, une date ou une photographie peuvent constituer des données.

Une **information** est ce que l’on apprend en interprétant des données dans un **contexte**. Ce contexte précise à quoi les données se rapportent et comment les comprendre.

### Une même donnée, plusieurs significations

Observez cette valeur :

```text
12
```

Que représente-t-elle ? Un nombre d’objets, un prix, un âge ? La valeur seule ne permet pas de choisir. Comparons deux contextes possibles :

| Donnée | Contexte | Information obtenue |
|---|---|---|
| `12` | Nombre d’éléments dans la collection « À lire ». | La collection « À lire » contient 12 éléments. |
| `12` | Prix indiqué pour un livre, en euros. | Le prix indiqué pour ce livre est de 12 €. |

La valeur est identique, mais l’information obtenue change avec le contexte : l’objet concerné, le libellé et l’unité permettent de l’interpréter. Le contexte peut lui-même être enregistré sous forme de données, par exemple le nom de la collection ou la monnaie du prix.

### Justifier l’information obtenue

Savoir qu’une collection contient 12 éléments ne permet pas de connaître leurs titres. L’information formulée doit s’appuyer sur les données disponibles et leur contexte.

Reprenez un exemple proposé au début de la séance. Identifiez la donnée, précisez son contexte, puis formulez une information que vous pouvez en tirer. Indiquez aussi une conclusion que ces éléments ne permettent pas de soutenir. Faites relire votre exemple par une autre personne : dispose-t-elle du contexte nécessaire pour comprendre la donnée de la même façon ?

## 3. Les systèmes de numération : des bits au texte affiché

**Si les ordinateurs ne connaissent que 0 et 1, comment du texte apparaît-il à l’écran ?**

Les données numériques sont représentées par des suites de **bits**. Un bit peut prendre deux valeurs, notées `0` et `1`. Pour comprendre comment ces deux valeurs permettent de représenter une lettre, nous allons suivre le nombre **122** : apprendre à l’écrire autrement, l’associer à un caractère, puis expliquer son affichage.

### Quantité et représentation : le décimal (base 10)

Un **système de numération** définit les symboles et les règles qui permettent d’écrire et de lire les nombres. Une même quantité peut avoir plusieurs écritures selon les conventions choisies.

Le système décimal utilise dix chiffres : `0123456789`. On décompose le nombre **122** :

```text
122 = 100 + 20 + 2
122 = 1 × 100 + 2 × 10 + 2 × 1
```

Chaque chiffre multiplie la valeur de sa position :

| | Centaines | Dizaines | Unités |
|---|---|---|---|
| Rang | 2 | 1 | 0 |
| Valeur de la position | 10² = 100 | 10¹ = 10 | 10⁰ = 1 |
| Chiffre | 1 | 2 | 2 |
| Contribution au nombre | 100 | 20 | 2 |

La **base est 10** : chaque position vaut dix fois celle située immédiatement à sa droite. Le **rang** commence à zéro à droite ; il devient l’exposant de la puissance. On parle de **notation positionnelle**, car la contribution d’un chiffre dépend de sa position.

Dans `122`, les deux chiffres `2` contribuent-ils de la même façon au nombre ? Expliquez à partir du tableau.

Les regroupements par dix nous sont familiers. D’autres conventions utilisent d’autres regroupements pour représenter la même quantité.

### Sexagésimal (base 60)

Une minute regroupe **60 secondes** et une heure regroupe **60 minutes**. Pour exprimer une durée de 122 secondes, on forme deux groupes de 60 secondes ; il reste deux secondes :

```text
122 secondes = 2 × 60 secondes + 2 secondes
122 secondes = 2 minutes et 2 secondes
```

En heures, minutes et secondes, cette durée s’écrit **`00:02:02`**. Chaque groupe est écrit avec des chiffres décimaux, mais le passage des secondes aux minutes, puis des minutes aux heures, se fait par **60**. C’est le principe **sexagésimal**.

```text
00:00:59 → 00:01:00
00:59:59 → 01:00:00
```

On vérifie la durée en revenant aux secondes : `2 × 60 + 2 = 122`.

Pourquoi 122 secondes ne correspondent-elles pas à 1 minute et 22 secondes ? Faites le calcul pour justifier votre réponse.

La durée ne change pas ; sa représentation dépend de la convention. On peut aussi regrouper des unités par vingt.

### Vigésimal (base 20)

Un regroupement par **vingt** est appelé **vigésimal**. Le nom « quatre-vingts » en conserve la trace : il désigne `4 × 20`. Même lorsqu’on dit « quatre-vingts », l’écriture chiffrée `80` reste décimale. Le nom du nombre et son écriture chiffrée sont deux représentations distinctes. [Académie française, « Septante, octante, nonante »](https://www.dictionnaire-academie.fr/article/QDL078).

Pour représenter 122 par groupes de vingt, on forme six vingtaines et il reste deux unités :

```text
122 = 6 × 20 + 2 × 1
```

On vérifie : six groupes de vingt donnent 120 ; les deux unités restantes donnent 122.

Dans cette décomposition, que représente le `6` ? Que représente le `2` ? Expliquez pourquoi les additionner directement ne suffit pas à retrouver 122.

Il reste à choisir des signes et des positions pour écrire ces deux valeurs. La notation maya en fournit un exemple.

### La notation maya en base 20

La notation maya présentée ici utilise trois signes : un **point** pour 1, une **barre** pour 5 et un signe en forme de **coquillage** pour 0. Les points et les barres se combinent pour représenter les valeurs de 1 à 19.

Les positions sont disposées verticalement. Dans la représentation en base 20 utilisée ici, le niveau inférieur vaut 1, le suivant 20, puis le suivant 400. Un signe zéro peut occuper un niveau où la contribution est nulle. [Diane Davies, archéologue spécialiste des Mayas, « The Maya number system »](https://www.mayaarchaeologist.co.uk/the-main-differences-between-the-maya-number-system-and-ours/).

Pour notre nombre 122, deux niveaux suffisent :

| Niveau | Signes à ce niveau | Valeur des signes | Contribution au nombre |
|---|---|---|---|
| Vingtaines, au-dessus | Un point au-dessus d’une barre | 1 + 5 = 6 | 6 × 20 = 120 |
| Unités, en dessous | Deux points | 2 | 2 × 1 = 2 |

La somme des contributions redonne **122**. Les signes et leur disposition changent, mais on retrouve le principe positionnel : la valeur d’un groupe de signes dépend de son niveau.

Pourquoi compter les valeurs des signes sans tenir compte des niveaux donnerait-il une mauvaise réponse ?

Cette distinction permet de comparer la notation positionnelle à un comptage où toutes les marques ont la même valeur.

### Unaire (comptage par marques)

Dans la numération **unaire**, chaque marque représente une unité. Le nombre cinq s’écrit par exemple `|||||`. Pour représenter **122**, il faudrait donc **122 marques**.

Chaque marque vaut une unité, quelle que soit sa position. On compte les marques pour retrouver la quantité : aucune position ne multiplie leur valeur. Ce système est différent des notations positionnelles que nous venons de voir et demande beaucoup de marques pour un grand nombre.

Déplacer une marque, sans en ajouter ni en retirer, change-t-il la quantité représentée ? Justifiez votre réponse.

Avec les bits, nous allons utiliser deux symboles et une notation positionnelle pour représenter 122 en quelques positions.

### Binaire (base 2)

Le système **binaire** utilise deux chiffres : `0` et `1`. Dans l’écriture binaire d’un entier, chaque chiffre correspond à un bit. Chaque position vaut **deux fois** celle située immédiatement à sa droite.

On décompose 122 en puissances de deux. On place `1` aux positions retenues et `0` aux autres :

```text
122 = 64 + 32 + 16 + 8 + 2
```

| Puissance de deux | 2⁷ | 2⁶ | 2⁵ | 2⁴ | 2³ | 2² | 2¹ | 2⁰ |
|---|---|---|---|---|---|---|---|---|
| Valeur de la position | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
| Bit | 0 | 1 | 1 | 1 | 1 | 0 | 1 | 0 |

Le nombre **122 en décimal** s’écrit donc **`01111010` en binaire**, sur huit positions. Pour vérifier, on additionne les valeurs des positions contenant `1` : on doit retrouver 122.

Un zéro indique qu’une position ne contribue pas à la somme, tout en maintenant la place des autres chiffres. Le zéro à la position de valeur 4 signifie que cette valeur n’est pas retenue. Le remplacer par `1` changerait le nombre.

Le zéro tout à gauche ne change pas la valeur : **`1111010` et `01111010` représentent le même nombre**. Il permet ici de compléter l’écriture jusqu’à huit positions.

Pourquoi la position de valeur 4 contient-elle `0` ? Quelle valeur obtiendrait-on en remplaçant ce seul bit par `1` ?

Nous savons maintenant représenter 122 avec des bits. Pour lui faire représenter une lettre, il faut une convention supplémentaire.

### ASCII : du nombre au caractère

Un **caractère** est un élément de texte : une lettre, un chiffre, un signe de ponctuation ou une espace, par exemple. **ASCII** est une convention commune qui associe des caractères à des codes numériques.

Voici un extrait de sa table :

| Caractère | Code ASCII en décimal |
|---|---|
| `x` minuscule | 120 |
| `y` minuscule | 121 |
| `z` minuscule | 122 |

Le nombre que nous suivons depuis le début, **122**, est donc le **code ASCII de `z` minuscule**. Ce code numérique, également appelé **point de code**, sert ici à identifier le caractère. Il ne compte pas un nombre de lettres.

ASCII définit **128 codes, de 0 à 127**, représentables sur **sept bits**. Certains correspondent à des caractères visibles ; d’autres servent notamment à commander des retours à la ligne.

Un **octet** est un groupe de **huit bits**. Dans les exemples de ce cours, on place le code ASCII dans un octet en ajoutant un zéro à gauche :

```text
Caractère :                     z
Code ASCII en décimal :         122
Code sur sept bits :            1111010
Représentation sur un octet :    01111010
```

Un **encodage de caractères** est une convention qui permet de représenter les caractères par des codes et des bits. Avec ASCII, nous pouvons donc passer de `z` à l’octet `01111010`. Lors de la lecture, le **décodage** permet de retrouver `z` à partir de cet octet.

**ASCII ne permet pas de représenter les lettres accentuées comme `é`.**

Une fois le caractère retrouvé, il reste à lui donner une forme visible.

### De la lettre au glyphe affiché

Une **police de caractères** fournit des formes graphiques appelées **glyphes**. Pour afficher notre lettre, le logiciel sélectionne un glyphe de `z` dans la police utilisée, puis le transforme en **pixels**, les points qui composent l’image à l’écran.

Deux polices peuvent dessiner `z` différemment. Le caractère et son code ASCII restent les mêmes ; la forme graphique peut changer.

| Notion | Rôle dans notre exemple |
|---|---|
| **Caractère** | La lettre `z` que l’on veut représenter. |
| **Code numérique ou point de code** | Le numéro 122 attribué à `z` dans la table ASCII. |
| **Encodage** | La convention ASCII qui permet de représenter ce caractère par des bits ; ici, `01111010` sur un octet. |
| **Glyphe** | Le dessin de `z` fourni par la police pour son affichage. |

On peut maintenant suivre les deux sens du parcours :

```text
Pour enregistrer :
z → code ASCII 122 → représentation sur un octet → 01111010

Pour afficher :
01111010 → décodage ASCII → caractère z
→ choix d’un glyphe dans une police → pixels à l’écran
```

Comme pour les données étudiées au début de la séance, **l’interprétation dépend du contexte**. La suite `01111010` peut représenter le nombre 122. Lue comme du texte ASCII, elle représente `z`. Les bits seuls ne précisent pas laquelle de ces interprétations le logiciel doit utiliser.

### Activité : convertir, vérifier et expliquer

**Durée indicative : 10 minutes, sur papier, en binôme.** Utilisez la petite table ASCII donnée plus haut.

1. **Convertissez 121**, le code ASCII de `y`, en binaire sur huit positions. Complétez la dernière ligne du tableau ci-dessous.
2. **Faites vérifier votre résultat** par votre partenaire : il additionne les valeurs des positions contenant `1`. Il doit retrouver 121.
3. **Lisez `01111000`** : calculez sa valeur décimale, puis identifiez le caractère correspondant dans la table ASCII. Vérifiez en décomposant le résultat pour retrouver les mêmes bits.
4. **Expliquez le passage à l’affichage** : décrivez comment le logiciel passe de cet octet au caractère puis au glyphe affiché. Précisez ce qui peut changer si l’on choisit une autre police.
5. **Précisez le contexte nécessaire** : pourquoi la suite de bits seule ne permet-elle pas de décider s’il faut l’interpréter comme un nombre ou comme du texte ?

| Valeur de la position | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|---|---|---|---|---|---|---|---|---|
| Bit pour représenter 121 | | | | | | | | |

Conservez les deux conversions, leurs décompositions de vérification et votre explication du passage des bits au texte affiché.

<details>
<summary><strong>Correction : à lire après l’activité</strong></summary>

Pour `y` :

```text
121 = 64 + 32 + 16 + 8 + 1
121 en décimal = 01111001 en binaire
```

Pour l’octet à lire :

```text
01111000 en binaire = 64 + 32 + 16 + 8 = 120 en décimal
```

Le code ASCII 120 correspond à **`x` minuscule**. Le logiciel retrouve ce caractère en décodant l’octet selon ASCII, puis utilise une police pour choisir un glyphe et l’afficher en pixels. Changer de police peut changer son dessin, mais ne change pas son code ASCII.

Le contexte doit indiquer comment interpréter la donnée : comme un nombre ou comme du texte utilisant un encodage donné. Sans cette indication, on ne peut pas décider si `01111000` désigne le nombre 120 ou le caractère `x`.

</details>

### Réponse à la question de départ

**Si les ordinateurs ne connaissent que 0 et 1, comment du texte apparaît-il à l’écran ?**

Les bits permettent de représenter des nombres. Une convention comme ASCII associe certains nombres à des caractères : **122 correspond à `z`**. Le logiciel interprète les bits selon cette convention, retrouve le caractère, puis utilise une police pour afficher son glyphe sous forme de pixels.

---

**Pause : 20 minutes**

---

## 4. Réorganiser librement

Comment organiser de nombreux documents pour y retrouver des informations ?

En groupe, ouvrez l’[interface web de classement](https://efp-dev.github.io/1-X75-LDB/exo/session_01.html) sur un ordinateur connecté à Internet. Vous disposez de **42 documents culturels** : couvertures, pochettes, affiches, documents de théâtre, billets, cartes postales et photographies de lieux. Ces objets peuvent être publiés et réunis en collections dans le projet du module.

Déplacez les images par glisser-déposer. Cliquez sur une image pour l’agrandir et lire ses inscriptions. **Les positions ne sont pas sauvegardées : recharger la page rétablit la disposition initiale.**

Votre première tâche est de **classer librement les documents**, avant de passer aux questions de recherche. Tous les groupes disposent du même ensemble, dans la même disposition initiale.

1. Créez un fichier `observations-classement.md` pour vos notes : règle de classement, difficultés et réponses aux recherches.
2. Choisissez une règle de classement et notez-la. Déplacez les documents pour former vos regroupements ; donnez un nom à chacun dans vos notes.
3. Si un document pourrait appartenir à plusieurs regroupements, décrivez la difficulté et justifiez votre choix.
4. Ne rechargez pas la page.

**Conservez tous les documents, sans les modifier, les supprimer ni les dupliquer.**

## 5. Rechercher dans le classement

Une fois le classement terminé, le formateur vous pose treize questions de recherche. Répondez dans l’ordre, à partir de votre classement. Gardez les documents à leur place et ne rechargez pas la page pendant les recherches.

[Questions de recherche — document formateur](preparation/session_01_questions.md).

Pour chaque question, notez :

- la réponse, avec les titres ou les références permettant de retrouver les documents ;
- les documents qui justifient cette réponse ;
- le chemin suivi et les éventuels retours en arrière ;
- le temps nécessaire pour retrouver les documents et établir la réponse ;
- les hésitations ou les informations qui manquent.

Pour chaque comptage, dressez la liste des documents retenus. Cette liste doit permettre de vérifier le total et de repérer les oublis ou les doubles comptages.

Signalez les recherches inachevées pour les reprendre lors de la recherche dans le code source.

## 6. Comparer les classements

[Exercice : comparer les classements](exo/session_01_comparer_classements.md).

## 7. Chercher autrement dans les mêmes documents

Les positions des images sont une manière d’organiser votre recherche. La page conserve aussi une description textuelle de chaque document. Ces descriptions permettent de chercher directement une référence, un nom ou une inscription.

<details>
<summary>Après la comparaison des classements : rechercher dans le code source</summary>

### Retrouver les descriptions des images

Depuis le plateau de classement, ouvrez le code source HTML de la page avec **Ctrl+U**. Dans ce nouvel onglet, ouvrez la recherche de texte du navigateur avec **Ctrl+F**.

Les images possèdent déjà des descriptions textuelles dans leur attribut `alt`. Ces textes alternatifs décrivent leur contenu, notamment pour les personnes qui utilisent un lecteur d’écran. Ils permettent aussi de retrouver les informations sans lire les inscriptions dans les images.

Pour reprendre la question 1, cherchez `1.99`. La description du document 04 permet de retrouver la pochette de Tanita Tikaram :

```html
<img src="../asset/session_01/04-tanita-tikaram.jpg"
     alt="Pochette de disque : le CD « Twist in My Sobriety (Full Length Version) » de Tanita Tikaram. Fond blanc, motif géométrique coloré en bas à gauche, photographie de l’artiste près de son nom et carré rouge portant la mention « Special Price £1.99 »."
     draggable="false">
```

L’attribut `src` indique le chemin du fichier image. L’attribut `alt` décrit ici le support, le titre, l’interprète et le prix inscrit. Le navigateur cherche dans ce texte ; les inscriptions de l’image ont déjà été transcrites. La notation compte : le texte utilise un point dans `1.99`, alors que la question utilise une virgule.

Lisez la description du document trouvé, puis revenez à l’image pour vérifier la réponse. Reprenez une autre question en cherchant une mention précise : référence, inscription, durée ou nom. Qu’est-ce qui facilite la recherche par rapport à votre classement visuel ?

### Distinguer les occurrences et les documents

Avec une recherche sans distinction entre majuscules et minuscules, `Megadeth` donne quatre résultats dans le code source pour deux documents : la pochette 06 et le billet 16. Le nom apparaît dans le chemin du fichier et dans le texte alternatif de chacun. Pour la question 9, la mention `B12` permet de retrouver le billet concerné.

Le nombre affiché par la recherche est donc un **nombre d’occurrences du texte recherché**. Un même document peut contenir plusieurs occurrences : comptez chaque document une seule fois.

Dans l’onglet du code source de `exo/session_01.html`, reprenez les trois comptages en cherchant successivement `Couverture de livre`, `Pochette de disque` et `Affiche de cinéma`. Chaque description concernée commence par l’une de ces expressions, présente une seule fois par document. Comparez les résultats à vos comptages visuels et retrouvez les documents qui les justifient.

Essayez aussi `livre` seul : ce texte apparaît dans `livret d’accompagnement du DVD`, au document 13. De même, `affiche` apparaît dans certains chemins d’images. Expliquez pourquoi une formulation plus précise change le résultat et répond mieux à la question posée.

### Comprendre le besoin avant de construire l’outil

**Pour répondre aux questions de cette activité, les données de la page et la recherche du navigateur suffisent.** Les descriptions sont déjà conservées dans un fichier et un outil permet déjà de les retrouver. Cette autre manière d’exploiter les documents reste disponible quel que soit leur classement visuel.

Le choix d’un outil dépend des opérations à réaliser : retrouver, compter, rapprocher ou modifier les données. Avant de construire une base ou d’installer un logiciel, identifiez vos besoins et ce que les données et les outils disponibles permettent déjà de faire.

Dans `observations-classement.md`, conservez une recherche effectuée dans le code source, sa réponse vérifiée et un exemple où le nombre d’occurrences diffère du nombre de documents.

</details>

## 8. Du classement aux bases de données et aux requêtes

### Les limites du classement et de la recherche textuelle

**Classer** consiste à regrouper ou à ordonner des éléments selon des critères. Parmi les 42 documents, un regroupement par prix facilite la recherche d’un montant. Il aide peu à répondre à une autre question : **quel document mentionne Ravi Shankar comme compositeur ?** Chercher seulement parmi les disques ferait manquer l’affiche de cinéma *Pather Panchali*, document 36.

Une recherche sur le nom permet de retrouver cette affiche sans déplacer les documents. Le même ensemble peut être recherché par prix, date, lieu ou personne. **L’enjeu est de répondre à des questions différentes sans refaire le classement à chaque demande.**

La recherche textuelle a toutefois ses limites : **Ctrl+F cherche une suite de caractères**, dont il faut interpréter le sens. Pour retrouver les documents qui affichent un montant à payer, essayez `prix` dans le code source, puis lisez les descriptions trouvées.

| Cas dans le corpus | Ce que la recherche permet de constater |
|---|---|
| L’affiche de *Quand la mer monte...*, document 09, mentionne le **prix Louis-Delluc 2004**. | Le mot est présent, mais désigne une récompense : c’est un **faux positif**, un résultat trouvé qui ne répond pas à la question. |
| La pochette de Tanita Tikaram, document 04, porte **Special Price £1.99**. | Le montant figure dans la description, mais pas le mot français `prix` : c’est un **faux négatif**, un document pertinent que la recherche manque. |

Le choix des termes et la qualité des descriptions déterminent les résultats. Si une inscription manque dans le texte, Ctrl+F ne peut pas la retrouver. De même, comme vous l’avez constaté avec `Megadeth`, compter les occurrences ne suffit pas à compter les documents.

### Distinguer base de données, SGBD et application

Ces recherches permettent de distinguer les données conservées des logiciels qui les exploitent.

| Notion | Rôle | Exemple dans le projet de collections |
|---|---|---|
| **Base de données** | Ensemble organisé de données conservées pour être retrouvées et exploitées. | Les données des éléments publiés, des utilisateurs et des collections. |
| **Système de gestion de base de données (SGBD)** | Logiciel qui permet de définir, conserver, rechercher et modifier les données. Il fournit aussi des mécanismes de contrôle des accès et de cohérence. | Il enregistre une nouvelle fiche, retrouve les éléments d’une collection et applique les droits d’accès à la base. |
| **Application** | Logiciel qui utilise les données pour proposer des pages et des fonctions à ses utilisateurs. | Elle affiche les collections et propose des formulaires de recherche ou de modification. |

Dans notre activité, le fichier HTML joue le rôle d’une petite base de données en **fichier plat** : les descriptions sont conservées directement dans ce fichier. **Ce fichier et Ctrl+F suffisent pour répondre aux treize questions**, en lisant les descriptions et en vérifiant les documents retenus.

Les besoins du projet iront plus loin : répéter des recherches combinant plusieurs critères, relier documents et collections, gérer des modifications simultanées ou attribuer des droits différents. Un SGBD fournit des mécanismes adaptés à ces opérations. Son choix se justifie par les besoins de gestion ; il ne dispense pas de décrire correctement les données ni de vérifier les réponses.

### Le modèle relationnel et l’indépendance des données

Le **modèle relationnel** organise les données en **relations**, représentées sous forme de tables. Une table décrit des enregistrements en lignes et leurs propriétés en colonnes. Des identifiants permettent de rapprocher les données de plusieurs tables.

Pour notre corpus, on pourrait distinguer le titre du document, sa nature, le montant inscrit et sa monnaie. Une récompense et un montant à payer seraient alors décrits par des propriétés distinctes. La précision de la recherche dépend donc aussi de la manière dont on structure les données.

En **1970, Edgar F. Codd** propose ce modèle pour permettre notamment d’exploiter les données sans connaître leur organisation interne dans la machine. Le principe d’**indépendance des données** vise à séparer les programmes des détails de leur stockage : une réorganisation physique doit pouvoir laisser les programmes qui utilisent les données inchangés. [Publication de Codd, 1970](https://research.ibm.com/publications/a-relational-model-of-data-for-large-shared-data-banks).

Les mêmes tables peuvent ainsi servir à plusieurs recherches, sans imposer un classement unique. En séance 2, vous reprendrez les 42 documents pour organiser leurs propriétés en tableaux, en conservant les informations nécessaires aux questions déjà résolues.

### Formuler une requête avec SQL ou une interface

Une **requête de recherche** est une demande adressée à un système pour obtenir des données selon des critères. « Retrouver les documents mentionnant Ravi Shankar comme compositeur » précise une personne et son rôle ; « compter les éléments d’une collection » demande un résultat calculé à partir des éléments retenus.

**SQL** est un langage utilisé pour interroger et gérer les bases de données relationnelles. Pour une recherche, on décrit le résultat attendu : les données à sélectionner, les conditions à respecter, le tri ou le comptage souhaité. Le SGBD détermine comment accéder aux données pour obtenir ce résultat. SQL permet aussi de définir leur structure, de les ajouter, de les modifier et de les supprimer. Sa syntaxe sera introduite à partir de la séance 3.

Une interface permet de formuler ces demandes sans écrire directement le langage utilisé par le système. Dans les contacts d’un téléphone, on saisit un nom ; dans une boutique, on combine une catégorie, une taille et une fourchette de prix. Ces filtres combinables sont souvent appelés **facettes**.

L’application traduit les choix de l’utilisateur en instructions exécutables. Elle peut notamment envoyer une requête SQL à un SGBD relationnel, puis présenter les résultats. D’autres systèmes utilisent d’autres langages : l’apparence d’un champ de recherche ne permet pas de déduire comment les données sont conservées ou interrogées.

### Vérifier et expliquer

Reprenez une de vos recherches dans `observations-classement.md`. Notez le critère recherché, le texte saisi, le numéro du document retenu et l’inscription qui justifie la réponse. Indiquez un résultat à écarter ou un document que la recherche manque, puis expliquez pourquoi. Une information absente reste signalée comme inconnue.

Reprenez enfin les mots proposés au début de séance. Expliquez la différence entre base de données, SGBD et application, puis citez un besoin couvert par le fichier HTML et Ctrl+F et un besoin du projet qui justifierait l’emploi d’un SGBD.

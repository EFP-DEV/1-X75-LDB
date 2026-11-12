# Séance 2 : Décrire et représenter les propriétés

Quels renseignements faut-il garder pour préparer et livrer une commande ? Comment les ranger dans un tableau ?

Cette séance confronte **la diversité des données réelles** aux **possibilités et aux limites de leur représentation technique**. Un choix apparemment évident peut supprimer un caractère significatif, refuser une valeur légitime ou laisser entrer une valeur incohérente.

Les problèmes se résolvent par une boucle : **proposer, tester sur des cas réels, constater les conséquences, ajuster**. Vous apprendrez ainsi à justifier vos décisions et à reconnaître quand il vous manque une information pour décider.

En séance 1, nous avons utilisé des propriétés pour classer et retrouver des documents. Nous allons maintenant décrire les renseignements qu’une papeterie doit conserver pour préparer des articles, joindre une personne et livrer une commande.

À la fin de la séance, vous devez pouvoir définir un champ sans ambiguïté, choisir une représentation adaptée à son usage, formuler une règle vérifiable et expliquer les conséquences de vos choix à partir d’un document.

L’[exercice](exo/session_02.md) comprend deux parties : le lot A de la Papeterie du Canal jusqu’à la proposition des types, puis les huit scénarios de conception de tables repris de 2025-2026. Le premier travail produit `papeterie_champs.xlsx` ; le second produit des dessins de tables accompagnés de la description de leurs champs.

## Des chiffres ou des lettres

1. Un code postal, c’est un nombre ?
2. Un numéro de maison, on met un nombre ?
3. Un numéro de téléphone, c’est forcément un nombre ?
4. Un prénom, on autorise seulement les lettres ?
5. Une quantité, c’est un nombre entier ?
6. Un prix, c’est un nombre ?

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

### Proposer les types du dictionnaire

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

## 3. Regrouper les champs dans des tables

La seconde partie de l’[exercice](exo/session_02.md#3-dessiner-et-décrire-des-tables) reprend les scénarios de cinéma, librairie, blog, transport, langues, commerce, hôpital et école.

Une **entité** est un objet ou un concept sur lequel on conserve des renseignements : un film, une personne, un produit. Un événement, comme une consultation, peut aussi nécessiter sa propre table. On commence par préciser ce que représente une ligne de chaque table.

Dans le dictionnaire de la papeterie, une ligne décrit un champ. Dans une table de films, une ligne décrit un film et chaque colonne correspond à une propriété : titre, année de sortie, durée. Le dessin représente la structure ; les exemples de films représentent les données.

### Distinguer deux lignes

Deux films peuvent avoir le même titre. Deux personnes peuvent porter le même nom. Un **identifiant** permet de distinguer leurs lignes sans dépendre de ces ressemblances.

Une clé primaire identifie chaque ligne de manière unique. Sa valeur doit être présente et rester stable. On peut proposer un champ `id` entier. La manière de produire ses valeurs sera précisée lors de la création de la base ; dessiner ce champ ne crée aucun mécanisme automatique.

## 4. Décrire chaque champ

On complète les noms et les types par une longueur, un caractère obligatoire et un commentaire.

| Décision | Question à résoudre | Exemple |
|---|---|---|
| Sens | Quelle information décrit le champ ? | Une durée de film en minutes. |
| Type | Quelle représentation convient aux opérations ? | Un entier pour compter des exemplaires ; du texte pour une référence. |
| Longueur | Quelle limite est justifiée ? | Une limite de titre dépend du besoin ou de l’outil ; elle peut rester à déterminer. |
| Obligatoire | L’information doit-elle être connue pour enregistrer la ligne ? | Un article peut être enregistré comme brouillon avant de posséder une date de publication. |
| Commentaire | Quelle précision évite une autre interprétation ? | Prix unitaire en euros TTC ; échelle de notation à préciser. |

Un type ne suffit pas à fixer les valeurs admises : un entier peut être négatif. Une règle telle que « stock supérieur ou égal à zéro » doit être formulée séparément et justifiée par le besoin. On l’applique manuellement aux exemples.

Un format décrit l’affichage : `12,50 €` présente un montant et sa monnaie ; `2026-11-18` présente un jour du calendrier. Le format ne garantit pas la validité de la valeur. Un champ facultatif peut être absent ; cette absence ne signifie pas automatiquement zéro.

Les textes doivent conserver les accents, les espaces et la ponctuation nécessaires. Une limite n’est pas justifiée par la seule longueur des exemples présents. En cas de dépassement, on signale le problème au lieu de couper silencieusement la valeur.

## 5. Représenter les besoins qui dépassent une table

Un client peut passer plusieurs commandes ; un patient peut avoir plusieurs consultations ; un pays peut avoir plusieurs langues officielles. Ces besoins ne disparaissent pas parce que les relations n’ont pas encore été étudiées.

À cette étape, on relève les objets et événements qui nécessiteront des tables supplémentaires et on décrit leurs propres champs. Les liens, clés étrangères et cardinalités seront formalisés ensuite. Un compteur de commandes ne conserve ni leurs dates individuelles ni leur contenu. Une seule allergie ne représente pas un dossier qui doit en conserver plusieurs.

## 6. Vérifier les propositions sur des exemples

Pour chaque scénario, on dessine les tables, on décrit les champs et on construit deux enregistrements fictifs. On vérifie manuellement la conservation de chaque valeur, la distinction des lignes et les effets des règles proposées. Les exemples permettent de justifier une décision ou de mettre en évidence une information manquante.

## 7. Bilan

On explique le sens d’une ligne de table, le rôle de son identifiant et les choix de types, de longueurs et de champs obligatoires. Chaque contrainte du scénario est reliée à une proposition ou à un besoin à traiter avec les relations.

On conserve `papeterie_champs.xlsx`, limité aux étapes 1 et 2 de la papeterie, et `session_02_tables`, qui rassemble la seconde partie. La séance suivante approfondira les identifiants, les relations et le passage des descriptions aux données.

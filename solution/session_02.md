# Séance 2 Corrigé et explications

[Exercice](../exo/session_02.md) · [Cours](../session_02.md)

## Première partie La papeterie jusqu’au choix des types

Le travail porte sur A1 et A2, jusqu’à l’étape 2 incluse. Le classeur `papeterie_champs.xlsx` conserve quatre rubriques dans `champs` : **Champ**, **Exemple relevé**, **Ce que ce champ décrit**, **Type proposé**. La feuille `decisions` conserve les choix et leurs justifications.

### Comprendre les renseignements du lot A

#### Les deux dates de A1

`12 novembre 2026` est la date indiquée sur le document. Le champ peut s'appeler `date_document`. Cette mention ne suffit pas à établir quand le message a été reçu.

`18 novembre 2026` est la date de livraison souhaitée. Le champ peut s'appeler `date_livraison_souhaitee`. La demande ne prouve pas que la livraison aura lieu ou a eu lieu ce jour-là.

Le nom `date` laisserait l'utilisateur choisir entre plusieurs interprétations. La définition doit permettre à une autre personne de comprendre le même événement.

#### Le prix de A1

`12,50 €` désigne le prix **d'un carnet**, TTC et en euros. Le champ `prix_unitaire_ttc_eur` rend ces trois précisions explicites.

Les quatre carnets représentent `4 × 12,50 € = 50 €` d'articles. La quantité et le prix unitaire sont fournis ; le montant de 50 € est calculé. Il ne faut pas le présenter comme une transcription du document, ni comme un total incluant d'éventuels frais de livraison : ces frais ne sont pas renseignés.

#### Le sens de l'adresse

L'adresse de A1 indique où Marie Martin souhaite recevoir la commande. Elle ne permet pas d'affirmer qu'il s'agit de son domicile.

Dans la proposition ci-dessous, le numéro et la voie restent ensemble. Le code postal, la localité et le pays sont séparés pour permettre des contrôles adaptés à la destination. Le nom de contact reste complet : son découpage en prénom et nom n'est pas nécessaire au besoin décrit.

Tous les exemples du tableau suivant viennent de A1. Ce repère figure dans le commentaire de chaque exemple. Les noms de champs et le découpage sont des propositions ; d’autres choix sont recevables s’ils conservent les renseignements et répondent au besoin.

### Sens des champs et types proposés

| Champ | Exemple relevé | Ce que ce champ décrit | Type proposé |
|---|---|---|---|
| `date_document` | `12 novembre 2026` | Jour indiqué sur le document de demande. | Date |
| `nom_contact` | `Marie Martin` | Nom complet de la personne à joindre au sujet de la demande. | Texte |
| `reference_article` | `1000` | Code qui désigne l'article demandé. | Texte |
| `designation_article` | `carnets à couverture bleue` | Description de l'article donnée dans la demande. | Texte |
| `quantite` | `4` | Nombre d'exemplaires de l'article demandé. | Nombre entier |
| `prix_unitaire_ttc_eur` | `12,50 €` | Prix TTC d'un exemplaire de l'article, exprimé en euros. | Nombre décimal |
| `date_livraison_souhaitee` | `18 novembre 2026` | Jour auquel la personne demande à recevoir la commande. | Date |
| `voie_livraison` | `14 rue des Tilleuls` | Numéro et voie indiqués pour la livraison. | Texte |
| `code_postal_livraison` | `1000` | Code postal indiqué pour l'adresse de livraison. | Texte |
| `localite_livraison` | `Bruxelles` | Localité indiquée pour l'adresse de livraison. | Texte |
| `pays_livraison` | `Belgique` | Pays indiqué pour l'adresse de livraison. | Texte |
| `consigne_livraison` | `Merci de sonner à la porte principale.` | Instruction à transmettre pour la remise du colis. | Texte |
| `telephone` | `0470 00 00 11` | Numéro fourni pour joindre la personne au sujet de la demande. | Texte |
| `email` | `marie.martin@example.com` | Adresse email fournie pour joindre la personne. | Texte |

Le prix est un nombre dans le futur champ de données. Son **exemple relevé** reste la transcription `12,50 €`, avec le symbole monétaire. De même, le type Date proposé ne remplace pas la transcription `18 novembre 2026` par un autre affichage dans la colonne des exemples.

Le texte convient aux références, téléphones et codes postaux parce qu’ils désignent quelque chose et que leurs caractères doivent être préservés. La quantité compte des exemplaires ; le prix permet de calculer ; les dates permettent de comparer des jours. Une écriture composée de chiffres ne suffit pas à imposer un type numérique.

Une trace possible dans `decisions` est : « `prix_unitaire_ttc_eur` proposé décimal ; A1 fournit `12,50 €` par carnet ; le montant des articles se calcule avec la quantité 4 ; type maintenu ; le résultat calculé est 50 € et ne renseigne pas les frais de livraison. »

## Seconde partie Repères pour les huit scénarios

Le résultat attendu est un dessin des tables accompagné de la description de leurs champs. Les propositions ci-dessous indiquent les données à couvrir et les points à justifier. Les relations seront formalisées ensuite. Un besoin reporté reste visible dans le travail.

Pour chaque table, on peut proposer un `id` entier, obligatoire, unique et stable. Les codes métier restent des champs distincts lorsqu’ils remplissent un autre rôle. Les longueurs de texte restent à déterminer si aucun catalogue, outil ou besoin ne les justifie. Les unités et les hypothèses figurent dans les commentaires.

### Exercice 1 Cinéma

| Table | Champs à décrire et types proposés |
|---|---|
| `film` | Titre, genre, langue originale et pays de production : texte ; année de sortie et durée en minutes : entiers ; budget et note moyenne : décimaux ; classification par âge : texte. |
| `acteur` | Nom complet, lieu de naissance, nationalité et biographie : texte ; date de naissance : date. |

Le titre est nécessaire pour le catalogue. Le budget peut être inconnu : son absence ne signifie pas un budget nul. L’échelle de la note et la monnaie du budget sont à préciser. Plusieurs genres, pays ou acteurs pour un film nécessiteront des relations ; le titre ne distingue pas à lui seul deux films.

### Exercice 2 Librairie

| Table | Champs à décrire et types proposés |
|---|---|
| `livre` | ISBN, titre, format : texte ; année de publication et stock : entiers ; prix : décimal. |
| `auteur` | Nom complet, biographie et éléments bibliographiques descriptifs : texte ; date de naissance : date. |

Une ligne de `livre` peut représenter une édition dans un format commercialisé ; cette hypothèse doit être écrite. L’ISBN est textuel et unique dans le cadre de l’énoncé. Le titre, le format et le prix sont nécessaires à la vente. Le traitement du stock d’un format numérique reste à préciser : une absence de stock physique ne signifie pas automatiquement une rupture.

Une bibliographie structurée et l’association de plusieurs auteurs à un livre demandent des relations. Un résumé biographique ne remplace pas la liste exploitable des œuvres.

### Exercice 3 Blog

| Table | Champs à décrire et types proposés |
|---|---|
| `article` | Titre, contenu, statut et catégorie : texte ; publication : date et heure si l’heure est utile. |
| `editeur` | Nom complet, email et rôle : texte ; niveau d’autorisation : code textuel ou entier selon une convention explicitée. |

Le statut peut prendre les valeurs brouillon, révision, publié ou archivé. Une date de publication peut être absente pour un brouillon ; un article publié doit avoir une date cohérente avec son statut. Un nombre comme 3 n’explique pas à lui seul les permissions accordées. Les rôles, droits et catégories multiples demandent une définition puis des relations adaptées.

### Exercice 4 Transport

| Table | Champs à décrire et types proposés |
|---|---|
| `pays` | Nom et code du pays : texte ; population : entier ; date de référence de la population : date. |
| `ville` | Nom et fuseau horaire : texte ; latitude et longitude en degrés décimaux : décimaux ; population : entier. |
| `aeroport`, `gare` | Nom et code : texte ; autres propriétés selon le besoin du scénario. |

La convention des codes ISO doit être choisie avant de fixer leur longueur. Les langues officielles et les devises peuvent être multiples ; les tables correspondantes et leurs liens avec le pays restent à préparer. Les aéroports et gares sont à conserver individuellement lorsqu’une ville en possède plusieurs. La population peut être inconnue et doit être située dans le temps.

### Exercice 5 Langues du monde

| Table | Champs à décrire et types proposés |
|---|---|
| `langue` | Nom, code, famille linguistique et statut : texte ; estimation du nombre de locuteurs : entier ; date de référence : date. |
| `systeme_ecriture`, `region` | Nom et description : texte. |

La convention du code et les valeurs admises du statut sont à préciser. Le nombre de locuteurs est une estimation : sa source et sa date sont utiles pour l’interpréter. Une estimation inconnue reste absente. Plusieurs systèmes d’écriture ou régions nécessitent des relations ; deux champs « région principale » et « région secondaire » ne couvrent pas un nombre variable de régions.

### Exercice 6 Commerce

| Table | Champs à décrire et types proposés |
|---|---|
| `produit` | Référence, nom, description et disponibilité : texte ; prix : décimal avec monnaie précisée ; stock : entier pour des unités indivisibles. |
| `client` | Nom, email, téléphone, adresse de facturation, code postal, localité et pays : texte. |
| `commande` | Date de commande : date et heure ; statut : texte. |
| `ligne_commande` | Quantité : entier selon l’unité vendue ; prix unitaire appliqué : décimal. |

La référence produit est obligatoire et unique selon l’énoncé. Les coordonnées nécessaires au contact et à la facturation doivent être précisées sans rendre chaque moyen de contact obligatoire par défaut. Les commandes et leurs lignes conservent l’historique ; un compteur et la dernière date ne permettent pas de retrouver le contenu de chaque achat. Les liens avec le client et le produit seront définis ensuite.

### Exercice 7 Hôpital

| Table | Champs à décrire et types proposés |
|---|---|
| `medecin` | Nom, numéro professionnel, coordonnées et description des horaires : texte. |
| `patient` | Nom, informations d’assurance : texte ; naissance : date. |
| `consultation` | Date et heure : temporel ; compte rendu : texte. |
| `antecedent`, `allergie` | Description : texte ; date pertinente : date si connue. |

Chaque consultation doit rester datée et documentée. Une note de dernière consultation ne constitue pas l’historique. Le dossier doit pouvoir conserver plusieurs antécédents et allergies : il faut prévoir les enregistrements et leurs liens, sans réduire ces données à une seule valeur. Les spécialités et les horaires structurés pourront aussi nécessiter des tables. Le sens d’une information absente doit être précisé ; l’absence de renseignement sur une allergie ne prouve pas son absence.

### Exercice 8 École

| Table | Champs à décrire et types proposés |
|---|---|
| `etudiant` | Numéro étudiant, nom et coordonnées : texte. |
| `cours` | Code, intitulé et département : texte ; crédits : entier ou décimal selon les règles de l’établissement. |
| `session_cours` | Début et fin : date et heure ; salle : texte. |
| `resultat` | Note : décimal si l’échelle l’exige ; date d’évaluation : date ; appréciation éventuelle : texte. |

Le numéro étudiant est obligatoire et unique. Le code du cours sert à le retrouver. Chaque résultat devra être rattaché à l’étudiant et à l’enseignement ou à l’évaluation concernés ; il ne suffit pas d’ajouter une unique note à la fiche de l’étudiant. L’échelle de notation et les conditions de présence d’une note restent à préciser. Un résultat non encore établi ne devient pas zéro.

### Vérification et explication attendues

On reprend chaque contrainte du scénario et on indique le champ ou la table qui la couvre. Les deux enregistrements fictifs permettent de comparer les valeurs, les types et les identifiants. Un texte long, une valeur absente ou deux noms identiques permettent d’expliquer les limites des choix.

Une réponse complète précise ce que représente une ligne, justifie les caractéristiques de ses champs et conserve les besoins qui demanderont des relations. Les compteurs, résumés et valeurs principales ne remplacent pas un historique ou une collection complète.

Le [corrigé de 2025-2026](../2025-2026/solution/session_02.md) contient des exemples détaillés pour les sept premiers scénarios. Ses limites de longueur sont des propositions ; ses réductions à une langue, une allergie ou un compteur ne couvrent pas tous les besoins des énoncés. Ces simplifications ne sont pas imposées par la première forme normale. Les repères ci-dessus conservent les besoins complets et incluent le scénario de l’école.

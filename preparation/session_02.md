# Préparation : Séance 2

[Documents par lots](../exo/session_02_documents.html) · [Exercice](../exo/session_02.md) · [Cours](../session_02.md) · [Référentiel](../referentiel.md)

[Aide à la conduite du cours](session_02_conduite.md) : déroulement à cocher, questions à poser, réponses attendues et points à vérifier pour couvrir toute la séance.

## Intention et résultat attendu

La séance apprend à **transformer une propriété du réel en un champ exploitable** : préciser son sens, choisir son type et déterminer ce qu’il peut contenir. La diversité des commandes met les décisions à l’épreuve. Les étudiants proposent, appliquent leurs choix à des valeurs précises, constatent les conséquences et ajustent.

Le livrable est `papeterie_champs.xlsx`, avec une feuille `champs` et une feuille `decisions`. **Chaque ligne de `champs` décrit un champ.** Les commandes servent de sources et de cas d’examen. La saisie d’une table de commandes et son transfert dans un SGBD viendront ensuite.

Le travail contribue aux compétences du référentiel sur l’analyse du besoin, la définition des champs, des types et des règles, ainsi que la justification des choix et la consultation d’une source technique. Les opérations réalisées sont le relevé, la définition, la confrontation des propositions aux documents, leur révision et leur vérification. La séance se termine par une reprise du dictionnaire de chaque binôme à partir des commandes de la papeterie, puis par un bilan individuel des choix effectués.

## Préparer la distribution

Prévoir Excel et les quatre lots de la Papeterie du Canal. Commencer par le jeu oral « Des chiffres ou des lettres », écrans fermés. Garder ses pièges dans le support formateur et révéler chaque exemple après les réponses. Le document HTML sépare les lots à l’impression. Distribuer A après le jeu, puis B, C et D aux moments prévus. Ne pas distribuer les repères de correction. Utiliser les sections du cours après les premières propositions et les échanges correspondants.

Les documents fournis sont les sources de l’exercice. Conserver leurs transcriptions, y compris les erreurs. Lorsqu’une confirmation manque, demander de formuler la question et de nommer la source à consulter. Ne pas fournir oralement une nouvelle quantité, une adresse corrigée ou une politique commerciale inventée pour fermer la discussion.

La première feuille comporte seulement **« Champ »** et **« Exemple relevé »**. Le repère A1 ou A2 figure dans un commentaire de cellule. Laisser les étudiants saisir puis comparer leurs exemples aux documents. Si Excel transforme une valeur, leur faire chercher une solution et vérifier le résultat. Introduire le format Texte à partir de ce constat ; reprendre alors la valeur dans le document source. Si aucune transformation n’est observée, proposer de saisir `0012` dans une cellule vide et de comparer le résultat à la saisie.

Un binôme peut retenir une bonne représentation dès le départ. Lui demander de la confronter aux nouvelles valeurs et de la justifier. Aucune erreur volontaire n’est nécessaire.

## Déroulement proposé

Repère pour les **4 heures annoncées au programme** : 210 minutes de travail, 20 minutes de pause et 10 minutes de marge. Les temps comprennent les consignes et les échanges.

| Temps écoulé | Durée | Activité et signal du professeur |
|---|---:|---|
| 00:00–00:10 | 10 min | **Des chiffres ou des lettres.** Six minutes de questions rapides avec un piège à chaque fois, une minute de conclusion, puis trois minutes pour présenter la papeterie et organiser les binômes. |
| 00:10–00:35 | 25 min | **Lot A.** Relever les champs utiles et les exemples exacts dans les deux premières colonnes. |
| 00:35–00:55 | 20 min | **Préciser le sens.** Poser les trois questions sur les dates, le prix et l’adresse. Ajouter « Ce que ce champ décrit », faire reformuler trois définitions par un autre binôme, puis ouvrir `decisions`. |
| 00:55–01:15 | 20 min | **Avant B.** Présenter les quatre familles de types. Ajouter « Type proposé » et faire justifier les propositions par les usages. |
| 01:15–01:40 | 25 min | **Lot B.** Confronter les types aux nouvelles références et coordonnées. Garder les traces des décisions, reprendre les valeurs de A, puis ajouter « Format retenu ». |
| 01:40–01:50 | 10 min | **Avant C.** Ajouter « Contenu et longueur ». Faire formuler les restrictions proposées et leurs justifications. |
| 01:50–02:10 | 20 min | **Pause.** |
| 02:10–02:35 | 25 min | **Lot C.** Examiner les noms et les consignes, discuter les refus et les limites, puis reprendre les textes déjà ouverts. |
| 02:35–02:50 | 15 min | **Avant D.** Ajouter « Règles de validation ». Faire écrire des règles pour quantité, prix et date, avec exemples accepté et refusé. |
| 02:50–03:20 | 30 min | **Lot D.** Appliquer les règles. Distinguer constat, action et information manquante. Vérifier les règles révisées sur les lots précédents. |
| 03:20–03:40 | 20 min | **Vérification du dictionnaire.** Ajouter « Décisions à confirmer ». Chaque binôme reprend trois champs de son classeur, applique une règle à deux valeurs du dossier et précise une question ouverte. |
| 03:40–03:50 | 10 min | **Bilan individuel oral ou écrit.** Expliquer un champ, un choix vérifié et une décision à confirmer. Enregistrer le classeur. |
| 03:50–04:00 | 10 min | **Marge.** À répartir selon les difficultés rencontrées. |

Limiter les restitutions à quelques décisions documentées. Lors d’une hésitation, demander : « Quelle valeur précise pose problème ? », « Quelle conséquence aurait votre choix ? » et « Quelle information permettrait de décider ? »

## Ouverture Des chiffres ou des lettres

Suivre les [six questions et leurs pièges dans l’aide à la conduite](session_02_conduite.md#1-des-chiffres-ou-des-lettres). Poser une question sur une donnée familière, laisser la classe répondre, puis révéler un cas qui complique la réponse : code postal `0612`, numéro de maison `8 bis`, téléphone avec indicatif, prénom composé, quantité de pommes en kilogrammes et prix affiché avec `€`.

Le rythme et la révélation font le jeu : ne pas projeter tout le tableau, ne pas expliquer les types avant de commencer. Après chaque exemple, demander qui maintient sa réponse, qui la change et pourquoi. Une justification brève suffit. Accueillir aussi une réponse qui avait prévu le piège.

Ce sont des exemples construits, distincts des lots. Pour `0612`, examiner la conservation du zéro sans lui attribuer de pays. Terminer en faisant expliquer la différence entre `0612` et `612`, puis retenir : **le choix dépend de l’usage et de l’information à préserver**. Présenter ensuite le besoin de la papeterie et la boucle de travail. L’ensemble tient dans les dix premières minutes.

## Après le lot A : faire préciser le sens

Poser les questions avant de proposer des noms de champs :

- Les deux dates de A1 décrivent-elles le même événement ?
- `12,50 €` est-il le prix d’un carnet ou celui des quatre carnets ?
- L’adresse permet-elle d’affirmer que Marie y habite ?

Les définitions doivent distinguer la date du document, la livraison souhaitée et une éventuelle livraison effective, qui n’est pas renseignée. La date du document ne doit pas être présentée comme une date de réception attestée. L’adresse est une adresse de livraison ; le domicile n’est pas établi.

Le prix est **unitaire, TTC et en euros**. Les quatre carnets de A1 représentent `4 × 12,50 € = 50 €` d’articles. Ce montant est calculé. Le dossier n’indique pas d’éventuels frais supplémentaires. Demander de vérifier le calcul à partir des deux valeurs sources.

La liste retenue doit couvrir la préparation des articles, le contact et la livraison. Selon le découpage justifié, on peut retrouver : date du document, nom de contact, référence et désignation de l’article, quantité, prix unitaire, date de livraison souhaitée, adresse avec code postal/localité/pays, consigne, téléphone et email. Le numéro dans la voie peut être séparé ; ce choix doit être expliqué.

Accepter plusieurs découpages cohérents. Le besoin n’impose pas une séparation prénom/nom. Une liste de mots n’est pas une définition suffisante : « date » ou « prix » doit être précisé. Faire reprendre les formulations qu’un autre binôme interprète autrement.

## Avant et après le lot B : choisir la représentation

Faire choisir un type **avant** l’ouverture du lot : texte, entier, nombre décimal ou date. Reprendre les idées du jeu d’ouverture et demander une opération utile pour chaque choix. Garder les valeurs précises de B pour la confrontation. Un choix déjà adapté grâce au jeu doit être expliqué et vérifié sur les nouveaux documents.

| Valeur du dossier | Point à faire expliquer |
|---|---|
| `AB-012` et `P-07` | Les références comportent des lettres et un trait d’union. Elles servent à désigner les articles. |
| `01210` | Le zéro initial fait partie du code reçu. Une représentation comme quantité peut perdre cette écriture. |
| `SW1A 1AA` | Le code comporte des lettres et un espace. Une règle limitée aux codes numériques du lot A est insuffisante. |
| `12B` | Si le numéro dans la voie est séparé, le champ doit conserver sa lettre. |
| `+33 6 00 00 00 33` et `+44 7700 900123` | Préserver les indicatifs et les caractères nécessaires. Une notation internationale ne s’obtient pas en ajoutant systématiquement le même préfixe. |
| Quantités et prix | Les choix doivent permettre de compter les exemplaires et de calculer les montants. La présence de chiffres ne suffit pas à faire de tous les champs des nombres. |

Faire documenter au moins une proposition maintenue et une proposition révisée ou en attente. Si tous les types étaient adaptés, les questions sur le découpage, le format ou les limites peuvent rester ouvertes ; ne pas imposer une modification artificielle.

Après l’échange, ajouter le format. Une date peut avoir plusieurs affichages ; le montant numérique et le symbole monétaire ont des rôles distincts. Les transformations sont décrites et justifiées, tandis que les exemples sources restent exacts. Le pays de livraison ne prouve pas le pays d’un numéro national.

La feuille est un dictionnaire : écrire « entier » ne rend pas une cellule entière. Aucune protection automatique n’a été créée. Si Excel a altéré une transcription, revenir au document. [Microsoft explique la conservation des zéros initiaux et le réglage Texte](https://support.microsoft.com/en-us/excel/keeping-leading-zeros-and-large-numbers).

## Avant et après le lot C : contenu et longueur

Faire proposer des règles pour le nom de contact, la référence et la consigne avant de distribuer C. Accepter « à déterminer » lorsqu’une limite ne peut pas encore être justifiée, avec une question précise à résoudre.

Examiner l’accent, l’apostrophe et le trait d’union de **Élodie D’Hondt-Martin**, les espaces et la longueur de **Alexandrine de la Roche-Saint-André**, le nom court **Bo Li** et la consigne complète de C2.

Une règle trop restrictive doit être révisée. Faire expliciter l’effet d’une troncature : perte d’une partie du nom, d’une indication d’accès ou de la demande d’appeler. Si aucune valeur n’est refusée, demander ce qui justifie la limite au-delà de ce dossier.

Ne pas transformer la plus grande longueur observée en maximum universel. Une limite peut venir d’un besoin ou d’un outil destinataire ; demander sa source et le traitement prévu des dépassements. Distinguer les restrictions documentées des habitudes comme « toujours 50 caractères ». Une longueur exprimée en caractères doit préciser la prise en compte des espaces et de la ponctuation.

## Avant et après le lot D : validation et suite à donner

Avant D, faire formuler des règles pour quantité, prix et date. La quantité porte sur des exemplaires entiers. Les décisions sur le prix doivent préciser le traitement des valeurs négatives et du zéro. Les politiques commerciales non fournies restent des hypothèses à confirmer.

Les catégories du dossier se recouvrent : une valeur incompatible peut aussi nécessiter une confirmation. Faire distinguer le **constat** de l’**action** dans `decisions`.

| Document et valeur | Constat et justification | Action recevable |
|---|---|---|
| D1 — `2,5` carnets | Incompatible avec une quantité d’exemplaires entiers dans cet exercice. | Demander la quantité voulue ; ne pas arrondir à 2 ou à 3. |
| D1 — `31 novembre 2026` | Aucun jour du calendrier ne correspond à cette date. | Demander la date souhaitée ; ne pas choisir une date voisine. |
| D1 — `luc.moreau.example.com` | Le texte ne comporte pas le séparateur `@` d’une adresse email. | Conserver la transcription et demander l’adresse ; ne pas remplacer arbitrairement un point. |
| D2 — `−7 €` | Le type numérique peut représenter cette valeur. Une règle de prix positif ou nul l’exclut ; expliciter la règle retenue et son statut. | Faire confirmer le prix et, si nécessaire, la règle commerciale. Ne pas retirer le signe ni recopier automatiquement le prix d’une autre commande. |
| D2 — `40000 Liège, Belgique` | Le code fourni comporte cinq chiffres, alors que la forme belge en comporte quatre. Cela ne donne pas la correction exacte. | Demander confirmation de l’adresse et vérifier la correspondance code/localité dans une source adaptée. Ne pas supprimer automatiquement un zéro. |
| D2 — `0480/00.00.88` | La ponctuation diffère des exemples précédents. Ce constat seul ne prouve pas que le numéro est erroné. | Accepter selon la règle ou proposer une présentation cohérente en préservant les chiffres et la source. Une conversion internationale demande le pays du numéro. |
| D3 — `03/04/2027` | Deux lectures calendaires sont possibles selon la convention. Le contexte francophone favorise le 3 avril. | Accepter une lecture fondée sur une convention partagée et explicitée ; si elle manque, demander une confirmation. |

Pour la forme belge, faire consulter l’indication « quatre chiffres » dans la [fiche Belgique de l’Union postale universelle](https://www.upu.int/UPU/media/upu/PostalEntitiesFiles/addressingUnit/belFr.pdf). Cette règle concerne la Belgique. La présence de quatre chiffres ne prouve pas que le code existe ou correspond à la localité.

D3 ne fournit pas l’article ni la quantité et n’établit pas qu’il modifie B2. Ne pas compléter le message par rapprochement du seul nom. Garder la question pour la séance suivante sur les identifiants et les relations.

Une convention de date explicitement partagée est une justification recevable. Ne pas exiger « date invalide » pour D3, ni transformer toutes les variations de présentation en erreurs. Pour les emails et les téléphones, aucune validation universelle n’est attendue.

## Relecture et bilan

La feuille `champs` comporte finalement huit rubriques : **Champ**, **Exemple relevé**, **Ce que ce champ décrit**, **Type proposé**, **Format retenu**, **Contenu et longueur**, **Règles de validation**, **Décisions à confirmer**. Le repère source reste dans le commentaire de l’exemple. La feuille `decisions` garde les propositions, les valeurs examinées, les conséquences, les justifications et les vérifications.

Chaque binôme reprend son propre classeur et les commandes des lots A à D. Faire vérifier trois champs : leur définition, leur type et leurs règles correspondent-ils aux renseignements à conserver et aux besoins de la papeterie ? Faire appliquer une règle à une valeur acceptable et à une valeur problématique du dossier, avec les repères des documents, puis préciser une question ouverte. Après correction, faire reprendre les mêmes valeurs. La vérification doit produire un résultat consigné dans `decisions`, y compris lorsqu’aucune modification n’est nécessaire.

Pour le bilan individuel de dix minutes, utiliser les [sept questions du cours](../session_02.md#7-bilan), également reprises dans l’exercice. Chaque étudiant garde le classeur et les commandes sous les yeux et prépare des réponses courtes sur un champ : sens, utilité, type, règle, choix maintenu ou modifié, vérification et décision à confirmer. La dernière question peut porter sur un autre champ du tableau.

Évaluer les justifications et les conséquences observées : sens explicite, données préservées, choix reliés aux usages, règles applicables et incertitudes formulées. La présence d’une question ouverte justifiée est un résultat recevable. Un tableau rempli sans preuve tirée des documents ne suffit pas.

## Place dans la progression

Cette version remplace l’ancien exercice d’inscriptions. Le programme est recentré en séance 2 sur le dictionnaire et les choix de représentation. L’exploitation des fichiers plats reste prévue en séance 3, avec l’export, l’import, les conventions et la comparaison des valeurs obtenues. La distinction entre absence, zéro, texte vide et réponse négative sera reprise lors des filtres et comptages en séance 4. Le cas particulier du calcul d’âge ne fait plus partie de cette séance.

La séance 3 partira des fiches à distinguer et des coordonnées multiples pour introduire les identifiants et les relations. Les types SQL précis et les contraintes exécutées par le SGBD seront formalisés à la création des tables, en séance 9.

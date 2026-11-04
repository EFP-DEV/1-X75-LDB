# Préparation : Séance 1

## Systèmes de numération

Le chapitre sur les systèmes de numération est désormais enseigné dans la [section 3 du support LDB](../session_01.md#3-les-systèmes-de-numération), avant le module LPB. Il remplace l’activité d’encodage du texte. L’objectif est de distinguer une quantité de son écriture, puis d’expliquer les positions et les zéros lors des conversions entre décimal et binaire.

Partir du tableau de pommes et poser la question du zéro. Montrer l’écriture maya de 1614 sans expliquer immédiatement ses symboles. Reprendre ensuite la décomposition décimale de 847. Faire proposer une règle pour la suite sexagésimale avant d’ouvrir la révélation des heures, minutes et secondes. Comparer les noms des nombres pour retrouver les groupes de vingt, puis introduire le binaire et le bit. Après le comptage unaire, revenir à l’illustration maya pour expliquer ses niveaux et son zéro.

Repères pour les calculs et les deux exercices :

- Exemple guidé : `1101` en binaire vaut `8 + 4 + 1 = 13` en décimal.
- Encoder : `17 = 16 + 1`, soit `10001` en binaire. Les zéros conservent les rangs de `8`, `4` et `2` sans ajouter de contribution.
- Décoder : `101010` en binaire vaut `32 + 8 + 2 = 42` en décimal. La décomposition de 42 en puissances de deux redonne l’écriture initiale.

Faire expliquer le rôle des positions et du zéro, puis vérifier chaque conversion dans l’autre sens. Conserver les deux résultats et leurs décompositions pour les ajouter aux notes du bilan. Les réponses restent dans cette préparation ; les tableaux du support étudiant servent au travail à réaliser.

## Activité de classement et de recherche

Le [support étudiant](../session_01.md) s’appuie sur un plateau de classement de 42 documents culturels.

L’activité commence directement par le classement libre des 42 documents. Chaque groupe répond ensuite à treize questions : dix recherches d’informations et trois comptages. L’utilisation du classement par un autre groupe et la mise en commun permettent de comparer les parcours, les difficultés, les documents oubliés et les doubles comptages.

La démonstration dans le code source vient après cette comparaison. Elle montre que les descriptions des documents et la recherche du navigateur permettent déjà de répondre aux questions. La séance fait ainsi identifier le besoin auquel un outil doit répondre avant d’en construire ou d’en installer un.

Les objets représentés peuvent être publiés et réunis en collections dans le projet commun. Les regroupements spontanés permettront ensuite d’introduire les tables ; on ne fournit pas de classement modèle.

## Utilisation du plateau

- Chaque groupe part de la même disposition des 42 images et les déplace librement, sans catégories prédéfinies ni suppression ou duplication de documents.
- Un clic agrandit une image ; Échap, le bouton « Fermer » ou un clic à l’extérieur referment l’agrandissement.
- Les positions ne sont pas sauvegardées. Éviter de recharger la page pendant l’activité.

## Corpus de l’activité

L’[inventaire du corpus](../asset/session_01/README.md) décrit les 42 documents : livres et bande dessinée, pochettes de disques, affiches de cinéma, documents de théâtre, billets fictifs, cartes postales et photographies de lieux. Les réponses doivent s’appuyer sur les inscriptions et les descriptions, sans connaissance préalable des œuvres.

Une même œuvre peut apparaître sur plusieurs supports : couverture, programme et billet. On peut ainsi classer par support, œuvre, artiste ou lieu, sans fournir de catégories à l’avance.

## Questions de la séance

La série est conservée dans le [document de questions destiné au formateur](session_01_questions.md). La présenter uniquement après le classement libre.

Le [corrigé formateur](session_01_questions_ctrl_f.md) donne les réponses, les documents justificatifs, les termes de recherche et les inventaires des trois comptages. Il propose aussi cinq questions complémentaires hors déroulé.

## Accès par GitHub Pages

Ouvrir le [plateau de classement](https://efp-dev.github.io/1-X75-LDB/exo/session_01.html) sur un ordinateur connecté à Internet. Les recherches visuelles et dans le code source portent sur cette même page et sur le même corpus complet. Les questions sont conservées dans le document formateur et posées après le classement libre.

## Conventions de recherche et de comptage

Les questions 3, 7 et 11 sont les trois comptages : livres, pochettes de disques et affiches de cinéma. Elles sont réparties parmi les dix recherches d’informations. Un classement par support devrait permettre de compter un groupe directement ; un classement par couleur peut obliger à parcourir plusieurs groupes. Les autres questions mobilisent des mentions précises : prix, référence, inscription, logo, puissance du moteur, durée, placement, nom ou année. Quatre questions emploient « Quel document » sans annoncer sa catégorie ; faire noter les regroupements parcourus.

Après le classement, préciser les conventions communes avant de poser les questions : les couvertures de livres comprennent la bande dessinée, dont le manga ; les programmes et le livret DVD restent des documents de théâtre distincts. Les pochettes de disques comprennent les albums et les singles. Conserver ces conventions lors des échanges entre groupes et de la recherche dans le code source.

## Conditions de comparaison

Chaque groupe reçoit le même corpus et la même disposition initiale, puis réorganise directement les documents selon ses propres critères. Les treize questions sont posées une fois le classement terminé, dans le même ordre pour tous. Pendant les recherches, conserver les positions choisies et ne pas recharger la page.

Un autre groupe utilise le classement sur le même ordinateur pour les **questions 1 et 3** : retrouver le document affichant un prix de 1,99 livre sterling et compter les livres, bandes dessinées comprises. Comparer les critères, les chemins suivis et les documents retrouvés. Dès la fin du classement, chaque groupe décrit ses règles dans `observations-classement.md`. Ces traces servent à la séance 2 ; la page ne conserve pas les positions.

## Démonstration : rechercher dans le code source

Cette démonstration suit les recherches dans les classements et la mise en commun. Le [support étudiant](../session_01.md#7-chercher-autrement-dans-les-mêmes-documents) conserve l’explication dans un encadré replié, à ouvrir après la démonstration.

Prévoir **5 minutes de démonstration**, puis **10 minutes de pratique par les groupes**. Montrer la recherche de `1.99` pour reprendre la question 1, l’écart entre les occurrences de `Megadeth` et le nombre de documents, puis le comptage avec `Couverture de livre`. Chaque groupe reprend ensuite une recherche d’information de la même série, les trois comptages et un exemple de comptage trompeur. Les termes et les réponses du [corrigé](session_01_questions_ctrl_f.md) servent de repères au formateur pendant cette pratique.

Annoncer : « Je pourrais trouver les réponses plus vite avec une base de données et un moteur de recherche. C’est ce que nous allons apprendre à construire. Mais il faut d’abord comprendre pourquoi nous en aurions besoin. » Montrer ensuite que, pour les questions de cette activité, les données et l’outil de recherche sont déjà disponibles.

Ouvrir le plateau, puis utiliser **Ctrl+U** pour ouvrir le code source HTML et **Ctrl+F** pour y chercher du texte. Le texte alternatif de chaque image, dans son attribut `alt`, décrit le document : support, titre, personnes et mentions telles que le prix, la référence, la durée ou le placement. Ces informations sont écrites directement dans le fichier HTML et sont donc disponibles dans le code source. Les attributs `data-id`, `data-x` et `data-y` servent au fonctionnement du plateau.

Commencer par `1.99` : la recherche conduit au document 04, la pochette de **Twist in My Sobriety**, de **Tanita Tikaram**, dont la description contient « Special Price £1.99 ». Rapprocher la réponse de l’image agrandie. Faire observer le point utilisé dans le texte, alors que la question emploie une virgule.

Chercher ensuite `Megadeth` sans distinction entre majuscules et minuscules : les quatre occurrences correspondent à deux documents, la pochette 06 et le billet 16. Le nom figure dans le texte alternatif et dans le chemin de chaque image. La recherche `B12`, utilisée pour la question 9, permet de retrouver précisément le billet.

Terminer la démonstration par `Couverture de livre`, pour reprendre la question 3. Pendant la pratique, reprendre aussi les questions 7 et 11 dans le même onglet du code source de `exo/session_01.html`. Chaque description concernée commence par l’expression correspondante, écrite une seule fois par document. Lire le nombre de résultats de la recherche, puis retrouver les numéros dans les attributs `data-id` :

| Recherche dans le code source | Nombre de documents | Numéros des documents (`data-id`) |
|---|---:|---|
| `Couverture de livre` | 12, manga compris | 01, 02, 03, 21, 22, 23, 24, 25, 26, 27, 38, 39 |
| `Pochette de disque` | 10 | 04, 05, 06, 07, 28, 29, 30, 31, 32, 37 |
| `Affiche de cinéma` | 8 | 08, 09, 10, 11, 33, 34, 35, 36 |

Pour expliquer un comptage trompeur, les groupes peuvent reprendre `Megadeth` ou essayer `livre` seul : ce texte apparaît aussi dans `livret d’accompagnement du DVD`, au document 13. Le mot `affiche` apparaît dans certains noms de fichiers. Faire préciser la recherche, par exemple avec `Affiche de cinéma` ou `Couverture de livre`. Le navigateur compte les occurrences du texte recherché ; la formulation de la recherche permet ici de compter les documents.

Faire retrouver les identifiants des documents et rapprocher une réponse de son image. Demander ce qui a rendu la recherche plus rapide : les informations sont déjà transcrites dans les textes alternatifs. Le navigateur cherche dans ce texte ; il ne lit pas les inscriptions des images. Le fichier HTML joue ici le rôle d’une petite base de données en fichier plat, et la recherche du navigateur fournit l’outil nécessaire à ces questions. Conclure que ces besoins sont déjà couverts. La construction d’un autre outil devra se justifier par les opérations à réaliser et les limites rencontrées, avant les tableaux de la séance 2 et le SGBD de la séance 3.

Faire conserver dans `observations-classement.md` la formulation d’une recherche, la réponse vérifiée sur le document et un exemple de comptage trompeur corrigé. Comparer le travail nécessaire pour retrouver et vérifier la réponse avec celui des recherches visuelles. Le raccourci montre une autre représentation des mêmes informations ; il ne dépend pas des positions choisies sur le plateau.

Les totaux portent sur les **42 documents du corpus**. Le manga nº 27 est compté parmi les livres ; le livret DVD nº 13 reste un document de théâtre et n’entre pas dans ce total. Le comptage visuel et la recherche dans le code source portent ainsi sur le même corpus complet.

## Articulation avec le programme

Cette activité ouvre le projet commun de collections, déclinable en application de collections, réseau social ou boutique pour l’atelier ADB. Elle suit la progression du [programme](../index.md) et travaille les compétences de recherche, d’organisation, de vérification et de justification du [référentiel](../referentiel.md).

Pour la séance 2, faire conserver les notes et l’accès au corpus complet avec ses descriptions, y compris les mentions nécessaires aux treize questions. Les 42 documents seront repris avec les mêmes numéros pour organiser leurs informations en tableaux ; les regroupements serviront à décrire les collections proposées. Utiliser les treize réponses et les inventaires du [corrigé](session_01_questions_ctrl_f.md) pour vérifier la conservation des informations. Les données de départ du projet précisent les informations à reprendre et les fichiers attendus.

Les données fictives d’utilisateurs, de statuts et de dates de publication seront fournies à partir de la séance 3. Distinguer alors les informations figurant sur le document de celles qui décrivent sa publication dans l’application.

## Conduite de la séance

Le volume officiel du module reste de **48 heures**, réparties en **12 séances de 4 heures théoriques**. Pour cette séance, le créneau réel est de **210 minutes**. Le déroulé prévoit **180 minutes de travail et 20 minutes de pause**, soit **200 minutes**, avec **10 minutes de marge** pour les retards éventuels.

Les durées sont des repères pour le formateur ; elles restent dans la préparation, sans apparaître dans le support étudiant. Les numéros de sections ci-dessous renvoient au [support étudiant](../session_01.md).

Les **vingt premières minutes** sont consacrées à la présentation du formateur, aux trois cours assurés ensemble - **LDB, LPB et ADB** -, à leur articulation, aux contraintes d’organisation et de travail et aux questions des étudiants. La mise en commun des mots autour des données commence ensuite.

La séance suit deux mouvements opposés. **Avant la pause**, partir des connaissances et des mots des étudiants pour distinguer les données de leur représentation. Les systèmes de numération permettent de comparer plusieurs écritures d’une même quantité, jusqu’au binaire et au **bit, la plus petite unité de donnée numérique**. **Après la pause**, changer d’échelle : partir de nombreux documents pour construire des regroupements et discuter leur classification. La pause intervient après **une heure de cours**, de **01:00 à 01:20**. Elle marque le changement d’échelle ; toute l’activité de classement commence ensuite.

### Déroulé : 180 minutes de travail et 20 minutes de pause

| Temps écoulé | Durée | Activité et conduite | Résultat ou vérification attendue |
|---|---:|---|---|
| 00:00–00:20 | 20 min | **Présentation du formateur et des cours (introduction).** Se présenter, expliquer les objectifs et l’articulation de LDB, LPB et ADB, préciser les contraintes d’organisation et de travail, puis répondre aux questions. | Les étudiants connaissent le cadre des trois cours ; les questions sont traitées ou notées pour suivi. |
| 00:20–00:30 | 10 min | **Mise en commun des mots (§ 1).** Inscrire au tableau les mots proposés par les étudiants autour des données. Faire préciser leur sens par des exemples. | Liste de mots, exemples et définitions provisoires, conservée pour la fin de séance. |
| 00:30–00:40 | 10 min | **Histoire à partir des mots : donnée et information (§ 2).** Inventer une histoire utilisant tous les mots du tableau. Faire comparer les informations obtenues à partir de `12` selon le contexte, puis faire reprendre un exemple des étudiants. Terminer par la question de la représentation dans un ordinateur. | Tous les mots ont été utilisés ; les étudiants distinguent la donnée, son contexte et l’information obtenue, et repèrent une conclusion que les données ne permettent pas de soutenir. |
| 00:40–01:00 | 20 min | **Systèmes de numération (§ 3).** Comparer les écritures décimale, sexagésimale, vigésimale, binaire et unaire ; revenir à l’exemple maya. Introduire le bit avec le binaire, puis faire encoder 17 et décoder 101010. Intégrer les reprises guidées et les questions aux exemples et aux exercices. | Deux conversions justifiées par les puissances de deux et vérifiées dans l’autre sens ; rôle du zéro et distinction entre quantité et écriture expliqués. |
| 01:00–01:20 | 20 min | **Pause.** | Reprise avec le changement d’échelle vers les documents. |
| 01:20–01:25 | 5 min | **Changement d’échelle et installation de l’activité (§ 4).** Passer de l’unité élémentaire à l’organisation d’un ensemble de documents. Former les groupes, ouvrir le plateau, montrer l’agrandissement et le déplacement des documents. Préparer les notes et répartir les rôles. | Fichier de notes prêt ; manipulation comprise ; chaque groupe peut choisir ses critères. |
| 01:25–01:45 | 20 min | **Réorganisation libre (§ 4).** Laisser les groupes choisir une règle, déplacer les documents, nommer leurs regroupements et discuter les cas difficiles. | Règle décrite, présence des 42 documents vérifiée. |
| 01:45–02:25 | 40 min | **Recherches dans le classement (§ 5).** Préciser les conventions de comptage, puis faire traiter les treize questions dans l’ordre, au rythme de chaque groupe. Accompagner la lecture des consignes et le relevé des preuves. | Treize réponses justifiées, trois inventaires de documents, durées, chemins suivis et hésitations consignés. |
| 02:25–02:35 | 10 min | **Utilisation par un autre groupe (§ 6).** Former des paires de groupes : pendant 5 minutes, l’un reprend les questions 1 et 3 sur le classement de l’autre, qui observe sans expliquer. Inverser ensuite les rôles. | Notes sur les regroupements compris, les hésitations et les documents retrouvés. Aucun déplacement ni rechargement de la page. |
| 02:35–02:40 | 5 min | **Comparaison collective (§ 6).** Reprendre la question 1 pour confronter les parcours et les critères qui les influencent. | Désaccords vérifiés sur les documents ; comparaison appuyée sur les parcours observés et les critères de classement. |
| 02:40–02:55 | 15 min | **Recherche dans le code source (§ 7).** Consacrer 5 minutes à la démonstration : `1.99`, occurrences de `Megadeth`, puis `Couverture de livre`. Prévoir ensuite 10 minutes de pratique : une recherche d’information de la série, les trois comptages et l’explication d’un comptage trompeur. | Réponse rapprochée de l’image, totaux comparés aux inventaires et exemple expliqué d’écart entre occurrences et documents. |
| 02:55–03:00 | 5 min | **Reprise des notions (§ 8).** Revenir aux mots du début ; faire expliciter une règle de classement et distinguer base de données en fichier plat, SGBD et application. | Définitions corrigées et illustrées par le travail réalisé ; règle vérifiée sur un document inclus et un document exclu. |
| 03:00–03:10 | 10 min | **Recherche et vérification (§ 9).** Consacrer 5 minutes aux faux positifs et négatifs de la recherche `prix`, au choix des termes de recherche, puis à la transition vers les requêtes et SQL. Prévoir ensuite 5 minutes pour consigner une recherche et sa vérification dans les notes. | Texte recherché, numéro du document retrouvé et inscription répondant à la question ; résultats écartés avec la raison de leur exclusion. |
| 03:10–03:20 | 10 min | **Conservation et bilan (§ 10).** Faire compléter et enregistrer les notes, dont les deux conversions expliquées et la recherche vérifiée et formuler une question encore difficile. Annoncer la reprise en tableaux à la séance 2. | `observations-classement.md` disponible ; chaque groupe explique un choix et la manière dont il en a vérifié le résultat. |

Le complément du support sur les questions nouvelles, Codd, l’histoire de SQL, les interfaces et les facettes est une **lecture facultative hors séance**. Il ne fait pas partie des activités du déroulé et ne demande aucun travail à remettre.

### Temps consacré au classement et aux recherches

Après les cinq minutes de prise en main, la réorganisation dispose de **20 minutes** pour choisir une règle, déplacer les 42 documents, nommer les regroupements, discuter les cas ambigus et conserver les traces. Les questions interviennent une fois ce classement terminé.

La série de treize questions dispose de **40 minutes**. À titre de repère, réserver environ 15 minutes aux dix recherches d’informations, 20 minutes aux trois comptages avec leurs inventaires et 5 minutes aux consignes et à la relecture des notes. Ces temps ne constituent pas des échéances par question : les comptages restent aux positions 3, 7 et 11, et chaque groupe avance dans l’ordre prévu.

L’échange entre groupes dispose de **10 minutes**, soit cinq minutes par classement, pour observer l’utilisation des classements sur les questions 1 et 3. La mise en commun dispose ensuite de **5 minutes** pour comparer les parcours sur la question 1 et vérifier les désaccords sur les documents. Les autres observations restent dans les notes.

### Organisation du travail et chronométrage

Former des groupes de deux ou trois. Tous participent aux décisions de classement, à la lecture et à la justification des réponses. Pendant les recherches, une personne manipule les documents ; une autre prend les notes et relève les durées. Dans un trinôme, séparer la prise de notes et le chronométrage.

Pendant la prise en main, faire créer `observations-classement.md` avec un espace pour la règle et les difficultés de classement, treize entrées numérotées pour les réponses et un espace pour les observations de l’autre groupe. Le formateur pose les questions après le classement ; les groupes relèvent leur numéro dans leurs notes. Autoriser des notes brèves : réponse, titres ou références des documents justificatifs, parcours et hésitations en quelques mots. Pour un comptage, conserver la liste des documents retenus avec le total.

Présenter les questions et leur ordre après le classement. Chaque groupe démarre le chronomètre à la lecture d’une question et l’arrête lorsque sa réponse, ses preuves et, le cas échéant, son inventaire sont consignés. Il relève ensuite la durée, avec les regroupements parcourus et les éventuels retours en arrière. La correction et la justification des réponses restent les critères de réussite.

### Ajuster le rythme et conduire la comparaison

Si une activité demande davantage de temps, utiliser la **marge globale de 10 minutes**, selon le temps encore disponible. Décaler les étapes suivantes d’autant, sans dépasser **03:30** depuis le début de la séance. Maintenir les vingt minutes d’introduction, la pause de vingt minutes, les treize questions, les vérifications, les dix minutes de synthèse et les dix minutes de conservation finale. La marge absorbe les retards ; aucune activité supplémentaire n’y est prévue.

Signaler toute recherche restée inachevée dans les notes et la reprendre lors de la vérification dans le code source. Une durée interrompue ne se compare pas à celle d’une recherche terminée.

Le recueil des mots au tableau dure **10 minutes** et précède les définitions. Le formateur dispose ensuite de **10 minutes** pour inventer une histoire utilisant tous les mots et conduire à la question de la représentation des données. Au fil du récit, faire distinguer la donnée de l’information obtenue grâce au contexte : `12` peut désigner un nombre d’éléments ou un prix. Faire reprendre un exemple du tableau et justifier ce qu’il permet de comprendre ; faire préciser ce qui reste inconnu. Vérifier au tableau que chaque mot a été repris. Comparer ensuite les systèmes de numération et introduire le bit avec le binaire ; intégrer les questions, les reprises guidées et les deux conversions aux **20 minutes** consacrées à cette section. Conserver l’ordre des découvertes, notamment la révélation de l’horloge et le retour à l’illustration maya. Les propositions initiales restent visibles pour permettre leur révision en fin de séance.

On ne propose pas de catégories à l’avance. On recueille les cas difficiles à classer sans introduire les tables d’association, les formes normales ou la syntaxe SQL. Les tableaux seront introduits en séance 2 à partir des descriptions des classements.

Lors de la comparaison, faire préciser les regroupements visités et les documents qui les composent. La familiarité avec les documents peut aider à retrouver une réponse. L’utilisation par un autre groupe apporte une observation complémentaire sur la lisibilité des regroupements.

Lors des recherches et de l’échange entre groupes, faire désigner les documents qui justifient les réponses et les comptages. Le souvenir d’une réponse ne remplace pas sa vérification. Laisser les critères de classement libres, puis comparer les choix à partir des parcours réellement observés.

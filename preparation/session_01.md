# Préparation — Séance 1

## Activité de classement et de recherche

Le [support étudiant](../session_01.md) utilise une [page de classement](../session_01.html), avec des images déplaçables en JavaScript. La diffusion retenue passe exclusivement par GitHub Pages, à l’[adresse cible du plateau](https://efp-dev.github.io/1-X75-LDB/session_01.html). La publication du nouveau plateau reste à effectuer selon les modalités ci-dessous. Le [corpus](../asset/session_01/README.md) retient 42 documents, tous disponibles dans le dépôt, dont les douze couvertures de livres et bandes dessinées.

L’activité commence directement par le classement libre des 42 documents. Chaque groupe répond ensuite à treize questions : dix recherches d’informations et trois comptages. L’utilisation du classement par un autre groupe et la mise en commun permettent de comparer les parcours, les difficultés et les risques d’oubli, de double comptage ou d’interprétation incorrecte.

La démonstration dans le code source vient après cette comparaison. Elle montre que les descriptions des documents et la recherche du navigateur permettent déjà de répondre aux questions. La séance fait ainsi identifier le besoin auquel un outil doit répondre avant d’en construire ou d’en installer un.

Les objets représentés peuvent être publiés et réunis en collections dans le [projet commun](../projet.md). Les regroupements spontanés permettront ensuite d’introduire les tables ; on ne fournit pas de classement modèle.

## Interface retenue

- Espace libre tenant dans un écran d’ordinateur, sans défilement, adaptation mobile ni mise en page responsive.
- Images dispersées dans une disposition initiale identique pour tous les groupes.
- Déplacement des images par glisser-déposer et clic pour les afficher en grand.
- Aucun dossier, colonne ou zone prédéfinie : les regroupements résultent des positions choisies.
- Sur le plateau, les informations se lisent dans les images. Les informations utiles aux recherches figurent aussi dans le code source pour la démonstration.
- Aucune sauvegarde, aucun export ni import du classement. Un rechargement revient à la disposition initiale.
- Aucune modification, suppression ou duplication des documents.

## Corpus retenu — 42 documents

| Type | Documents | Nombre |
|---|---|---:|
| Couvertures de livres | Jodorowsky — *La Danse de la réalité* ; Barjavel — *La Nuit des temps* ; Dr. Seuss — *The Lorax* | 3 |
| Pochettes de disques | Tanita Tikaram — *Twist in My Sobriety* ; Garland Jeffreys — *Hail Hail Rock ’n’ Roll* ; Megadeth — *Symphony of Destruction* ; Bernard Lavilliers et Catherine Ringer — *Idées noires* | 4 |
| Affiches | *The Wild Robot* ; *Quand la mer monte…* ; *Enfermés dehors* ; *Trailer Park Boys* | 4 |
| Documents de théâtre | *La Cantatrice chauve* : programme de Pierre Pradinas et livret DVD de Jean-Luc Lagarce ; *Don Quichotte* : programme du TNP | 3 |
| Billets fictifs | Concert de Tanita Tikaram ; concert de Megadeth ; représentation de *La Cantatrice chauve* | 3 |
| Cartes postales | Toul — Le Théâtre ; Paris — Concert de La Scala ; Sissonne — Cinéma-Concert — sélection provisoire de lieux historiques | 3 |
| Livres et BD supplémentaires | *Priya PADMA — Sens unique* ; *Le Dit du Genji* ; *Le Palais des rêves* ; *Don Quichotte* ; *Cent Ans de solitude* ; *La Végétarienne* ; *Akira* ; *Les Mille et Une Nuits* ; *Neige* | 9 |
| Disques supplémentaires | *Buena Vista Social Club* ; *Clube da Esquina* ; *Mulatu of Ethiopia* ; *Miss Perfumado* ; *Las últimas composiciones* ; *Alf Leila wa Leila* | 6 |
| Affiches supplémentaires | *Le Voyage de Chihiro* ; *Une séparation* ; *Parasite* ; *Pather Panchali* | 4 |
| Photographies de lieux | Teatro Colón à Buenos Aires ; Teatro La Fenice à Venise ; opéra de Harbin | 3 |
| **Total** | | **42** |

Les types de documents servent à constituer le corpus, sans être affichés comme catégories dans l’interface. Une même œuvre peut apparaître sur plusieurs supports : couverture, programme et billet. On peut ainsi classer par support, œuvre, artiste ou lieu.

## Questions de la séance

1. Quel document affiche un prix de 1,99 livre sterling ?
2. Quel document porte la référence CML-2456 ?
3. Combien de livres sont représentés, bandes dessinées comprises ?
4. Sur quelle façade peut-on lire « Societas MDCCXCII » ?
5. Quel document porte le logo d’Ethiopian Airlines ?
6. Quelle carte postale mentionne un moteur de 25 HP ?
7. Combien de pochettes de disques y a-t-il ?
8. Quel spectacle annonce une durée de 1 h 25 ?
9. Quel billet indique le placement « Balcon · B12 » ?
10. Quelle carte postale montre un Hôtel-Café de la Comédie ?
11. Combien d’affiches de cinéma y a-t-il ?
12. Quel document mentionne Ravi Shankar comme compositeur ?
13. Quelle pochette mentionne l’année 1972 ?

Le [corrigé formateur](session_01_questions_ctrl_f.md) reprend ces treize questions dans le même ordre, avec les réponses, les numéros des documents, les termes à rechercher et les inventaires des trois comptages. Il s’appuie sur les descriptions textuelles du corpus. Les cinq questions complémentaires sont conservées à la fin de ce fichier, hors du déroulé de la séance.

## Supports et diffusion

Les 42 références figurent dans `session_01.html` et dans le [manifeste du corpus](../asset/session_01/corpus.json), toutes avec le statut `available`. L’[inventaire](../asset/session_01/README.md) précise les titres, les auteurs ou artistes, les supports et les noms de fichiers. Un clic agrandit l’image ; Échap, le bouton « Fermer » ou un clic à l’extérieur referment l’agrandissement. Les questions sont posées par le formateur et ne figurent pas dans l’interface.

Parmi les documents de la sélection active, 39 images téléchargées et 3 billets fictifs sont disponibles. Les vingt anciens fichiers remplacés ont été supprimés. Les informations de provenance et les sources originales restent conservées. Les références diversifient les origines culturelles et les langues ; leurs réponses doivent rester accessibles à partir des inscriptions, sans connaissance préalable des œuvres.

### Accès par GitHub Pages

L’adresse du plateau à communiquer aux groupes est [https://efp-dev.github.io/1-X75-LDB/session_01.html](https://efp-dev.github.io/1-X75-LDB/session_01.html). L’activité nécessite un ordinateur connecté à Internet. Les recherches dans les classements et dans le code source portent sur cette même page et sur le même corpus complet.

**État de publication relevé le 4 novembre 2026 :** GitHub Pages est déjà configuré pour le dépôt `EFP-DEV/1-X75-LDB`, depuis la branche `main`, dossier racine `/`, sans domaine personnalisé. Le site existant est publié, mais le nouveau fichier `session_01.html` est encore absent de la branche distante. L’adresse ci-dessus est donc la cible de diffusion du nouveau plateau ; la finalisation des supports ne vaut pas publication.

La mise en ligne devra inclure ensemble, en conservant leurs chemins relatifs :

- `session_01.html` à la racine ;
- `asset/session_01.css` et `asset/session_01.js` ;
- les 42 fichiers images de `asset/session_01/` référencés dans le HTML et le [manifeste](../asset/session_01/corpus.json), y compris les trois billets SVG.

La publication du nouveau plateau nécessite l’envoi de cet ensemble de fichiers sur `main`, en tenant compte de la réorganisation du dépôt en cours. Elle reste à effectuer avant l’activité.

### Choix visuels conservés

Les trois cartes postales provisoires restent dans le corpus actuel. Le livret DVD de Jean-Luc Lagarce remplace provisoirement un programme de salle. Un éventuel remplacement devra conserver les informations nécessaires aux questions ou s’accompagner d’une mise à jour des énoncés et du corrigé. L’aperçu existant montre uniquement les documents 1 à 20 ; les recherches portent sur les 42 documents du plateau.

### Conventions de recherche et de comptage

Les questions 3, 7 et 11 sont les trois comptages : livres, pochettes de disques et affiches de cinéma. Elles sont réparties parmi les dix recherches d’informations. Un classement par support devrait permettre de compter un groupe directement ; un classement par couleur peut obliger à parcourir plusieurs groupes. Les autres questions mobilisent des mentions précises : prix, référence, inscription, logo, puissance du moteur, durée, placement, nom ou année. Quatre questions emploient « Quel document » sans annoncer sa catégorie ; faire expliciter les hypothèses qui orientent les recherches.

Après le classement, préciser les conventions communes avant de poser les questions : les couvertures de livres comprennent la bande dessinée, dont le manga ; les programmes et le livret DVD restent des documents de théâtre distincts. Les pochettes de disques comprennent les albums et les singles. Conserver ces conventions lors des échanges entre groupes et de la recherche dans le code source.

## Conditions de comparaison

Chaque groupe reçoit le même corpus et la même disposition initiale, puis réorganise directement les documents selon ses propres critères. Les treize questions sont posées une fois le classement terminé, dans le même ordre pour tous. Pendant les recherches, conserver les positions choisies et ne pas recharger la page.

Un autre groupe utilise le classement sur le même ordinateur pour les **questions 1 et 3** : retrouver le document affichant un prix de 1,99 livre sterling et compter les livres, bandes dessinées comprises. Comparer les critères, les chemins suivis et les documents retrouvés. Dès la fin du classement, chaque groupe conserve une capture d’écran et décrit ses règles dans `observations-classement.md`. Ces traces servent à la séance 2 ; la page ne conserve pas les positions.

## Démonstration : rechercher dans le code source

Cette démonstration suit les recherches dans les classements et la mise en commun. Le [support étudiant](../session_01.md#7-chercher-autrement-dans-les-mêmes-documents) conserve l’explication dans un encadré replié, à ouvrir après la démonstration.

Prévoir **5 minutes de démonstration**, puis **10 minutes de pratique par les groupes**. Montrer la recherche de `1.99` pour reprendre la question 1, l’écart entre les occurrences de `Megadeth` et le nombre de documents, puis le comptage avec `Couverture de livre`. Chaque groupe reprend ensuite une recherche d’information de la même série, les trois comptages et un exemple de comptage trompeur. Les termes et les réponses du [corrigé](session_01_questions_ctrl_f.md) servent de repères au formateur pendant cette pratique.

Annoncer : « Je pourrais trouver les réponses plus vite avec une base de données et un moteur de recherche. C’est ce que nous allons apprendre à construire. Mais il faut d’abord comprendre pourquoi nous en aurions besoin. » Montrer ensuite que, pour les questions de cette activité, les données et l’outil de recherche sont déjà disponibles.

Ouvrir le plateau, puis utiliser **Ctrl+U** pour ouvrir le code source HTML et **Ctrl+F** pour y chercher du texte. Le texte alternatif de chaque image, dans son attribut `alt`, décrit le document : support, titre, personnes et mentions telles que le prix, la référence, la durée ou le placement. Ces informations sont écrites directement dans le fichier HTML et sont donc disponibles dans le code source. Les attributs `data-id`, `data-x` et `data-y` servent au fonctionnement du plateau.

Commencer par `1.99` : la recherche conduit au document 04, la pochette de **Twist in My Sobriety**, de **Tanita Tikaram**, dont la description contient « Special Price £1.99 ». Rapprocher la réponse de l’image agrandie. Faire observer le point utilisé dans le texte, alors que la question emploie une virgule. Le montant est celui inscrit sur le document ; la synthèse reviendra sur ce qu’il permet d’affirmer.

Chercher ensuite `Megadeth` sans distinction entre majuscules et minuscules : les quatre occurrences correspondent à deux documents, la pochette 06 et le billet 16. Le nom figure dans le texte alternatif et dans le chemin de chaque image. La recherche `B12`, utilisée pour la question 9, permet de retrouver précisément le billet. Conserver les chemins des images dans les attributs `src` : leurs correspondances supplémentaires font partie de la démonstration.

Terminer la démonstration par `Couverture de livre`, pour reprendre la question 3. Pendant la pratique, reprendre aussi les questions 7 et 11 dans le même onglet du code source de `session_01.html`. Chaque description concernée commence par l’expression correspondante, écrite une seule fois par document. Lire le nombre de résultats de la recherche, puis retrouver les numéros dans les attributs `data-id` :

| Recherche dans le code source | Nombre de documents | Numéros des documents (`data-id`) |
|---|---:|---|
| `Couverture de livre` | 12, manga compris | 01, 02, 03, 21, 22, 23, 24, 25, 26, 27, 38, 39 |
| `Pochette de disque` | 10 | 04, 05, 06, 07, 28, 29, 30, 31, 32, 37 |
| `Affiche de cinéma` | 8 | 08, 09, 10, 11, 33, 34, 35, 36 |

Pour expliquer un comptage trompeur, les groupes peuvent reprendre `Megadeth` ou essayer `livre` seul : ce texte apparaît aussi dans `livret d’accompagnement du DVD`, au document 13. Le mot `affiche` apparaît dans certains noms de fichiers. Faire préciser la recherche, par exemple avec `Affiche de cinéma` ou `Couverture de livre`. Le navigateur compte les occurrences du texte recherché ; la formulation de la recherche permet ici de compter les documents.

Faire retrouver les identifiants des documents et rapprocher une réponse de son image. Demander ce qui a rendu la recherche plus rapide : les informations sont déjà transcrites dans les textes alternatifs. Le navigateur cherche dans ce texte ; il ne lit pas les inscriptions des images. Le fichier HTML joue ici le rôle d’une petite base de données en fichier plat, et la recherche du navigateur fournit l’outil nécessaire à ces questions. Conclure que ces besoins sont déjà couverts. La construction d’un autre outil devra se justifier par les opérations à réaliser et les limites rencontrées, avant les tableaux de la séance 2 et le SGBD de la séance 3.

Faire conserver dans `observations-classement.md` la formulation d’une recherche, la réponse vérifiée sur le document et un exemple de comptage trompeur corrigé. Comparer le travail nécessaire pour retrouver et vérifier la réponse avec celui des recherches visuelles. Le raccourci montre une autre représentation des mêmes informations ; il ne dépend pas des positions choisies sur le plateau.

Les totaux portent sur les **42 documents disponibles**. Le manga nº 27 est compté parmi les livres ; le livret DVD nº 13 reste un document de théâtre et n’entre pas dans ce total. Le comptage visuel et la recherche dans le code source portent ainsi sur le même corpus complet.

## Articulation avec le programme

Cette activité ouvre le [projet commun de collections](../projet.md), déclinable en application de collections, réseau social ou boutique pour l’atelier ADB. Elle suit la progression du [programme](../readme.md) et travaille les compétences de recherche, d’organisation, de vérification et de justification du [référentiel](../referentiel.md).

Pour la séance 2, faire conserver les notes, les captures et l’accès au corpus complet avec ses descriptions, y compris les mentions nécessaires aux treize questions. Les 42 documents seront repris avec les mêmes numéros pour organiser leurs informations en tableaux ; les regroupements serviront à décrire les collections proposées. Utiliser les treize réponses et les inventaires du [corrigé](session_01_questions_ctrl_f.md) pour vérifier la conservation des informations. Les [données de départ du projet](../projet.md#données-de-départ-et-reprise-en-séance-2) précisent les informations à reprendre et les fichiers attendus.

Les données fictives d’utilisateurs, de statuts et de dates de publication seront fournies à partir de la séance 3. Distinguer alors les informations figurant sur le document de celles qui décrivent sa publication dans l’application.

## Conduite de la séance

Le volume officiel du module reste de **48 heures**, réparties en **12 séances de 4 heures théoriques**. Pour cette séance, le créneau réel est de **210 minutes**. Le déroulé prévoit **180 minutes de travail et 20 minutes de pause**, soit **200 minutes**, avec **10 minutes de marge** pour les retards éventuels.

Les durées sont des repères pour le formateur ; elles restent dans la préparation, sans apparaître dans le support étudiant. Les numéros de sections ci-dessous renvoient au [support étudiant](../session_01.md).

Les **vingt premières minutes** sont consacrées à la présentation du formateur, aux trois cours assurés ensemble — **LDB, LPB et ADB** —, à leur articulation, aux contraintes d’organisation et de travail et aux questions des étudiants. La mise en commun des mots autour des données commence ensuite.

La séance suit deux mouvements opposés. **Avant la pause**, partir des connaissances et des mots des étudiants pour descendre jusqu’au **bit, la plus petite unité de donnée numérique** ; les octets et l’encodage montrent ensuite comment combiner ces unités. **Après la pause**, changer d’échelle : partir de nombreux documents pour construire des regroupements et discuter leur classification. La pause intervient après **une heure de cours**, de **01:00 à 01:20**. Elle marque le changement d’échelle ; toute l’activité de classement commence ensuite.

### Déroulé — 180 minutes de travail et 20 minutes de pause

| Temps écoulé | Durée | Activité et conduite | Résultat ou vérification attendue |
|---|---:|---|---|
| 00:00–00:20 | 20 min | **Présentation du formateur et des cours (introduction).** Se présenter, expliquer les objectifs et l’articulation de LDB, LPB et ADB, préciser les contraintes d’organisation et de travail, puis répondre aux questions. | Les étudiants connaissent le cadre des trois cours ; les questions sont traitées ou notées pour suivi. |
| 00:20–00:30 | 10 min | **Mise en commun des mots (§ 1).** Inscrire au tableau les mots proposés par les étudiants autour des données. Faire préciser leur sens par des exemples. | Liste de mots, exemples et définitions provisoires, conservée pour la fin de séance. |
| 00:30–00:40 | 10 min | **Histoire à partir des mots (§ 2).** Inventer une histoire utilisant tous les mots du tableau, préciser leur sens dans le récit et conduire progressivement à la représentation binaire. Distinguer donnée, information et interprétation à partir du récit ; utiliser les exemples du support au besoin. | Tous les mots ont été utilisés ; les étudiants relient les données évoquées à la question de leur représentation avec `0` et `1`. |
| 00:40–01:00 | 20 min | **Bits, octets et encodage (§ 3).** Comparer les deux lectures de `01000001`, puis faire décoder et encoder les petits textes avec les correspondances fournies. Intégrer les reprises guidées et les questions à ces exercices. | Relecture des octets obtenus pour retrouver exactement le texte de départ, espaces compris ; explication du rôle de la règle de lecture. |
| 01:00–01:20 | 20 min | **Pause.** | Reprise avec le changement d’échelle vers les documents. |
| 01:20–01:25 | 5 min | **Changement d’échelle et installation de l’activité (§ 4).** Passer de l’unité élémentaire à l’organisation d’un ensemble de documents. Former les groupes, ouvrir le plateau, montrer l’agrandissement et le déplacement des documents. Préparer les notes et répartir les rôles. | Fichier de notes prêt ; manipulation comprise ; chaque groupe peut choisir ses critères. |
| 01:25–01:45 | 20 min | **Réorganisation libre (§ 4).** Laisser les groupes choisir une règle, déplacer les documents, nommer leurs regroupements et discuter les cas difficiles. | Règle décrite, présence des 42 documents vérifiée et capture du classement conservée. |
| 01:45–02:25 | 40 min | **Recherches dans le classement (§ 5).** Préciser les conventions de comptage, puis faire traiter les treize questions dans l’ordre, au rythme de chaque groupe. Accompagner la lecture des consignes et le relevé des preuves. | Treize réponses justifiées, trois inventaires de documents, durées, chemins suivis et hésitations consignés. |
| 02:25–02:35 | 10 min | **Utilisation par un autre groupe (§ 6).** Former des paires de groupes : pendant 5 minutes, l’un reprend les questions 1 et 3 sur le classement de l’autre, qui observe sans expliquer. Inverser ensuite les rôles. | Notes sur les regroupements compris, les hésitations et les documents retrouvés. Aucun déplacement ni rechargement de la page. |
| 02:35–02:40 | 5 min | **Comparaison collective (§ 6).** Reprendre la question 1 pour confronter les parcours et les critères qui les influencent. | Désaccords vérifiés sur les documents ; comparaison appuyée sur les parcours observés et les critères de classement. |
| 02:40–02:55 | 15 min | **Recherche dans le code source (§ 7).** Consacrer 5 minutes à la démonstration : `1.99`, occurrences de `Megadeth`, puis `Couverture de livre`. Prévoir ensuite 10 minutes de pratique : une recherche d’information de la série, les trois comptages et l’explication d’un comptage trompeur. | Réponse rapprochée de l’image, totaux comparés aux inventaires et exemple expliqué d’écart entre occurrences et documents. |
| 02:55–03:00 | 5 min | **Reprise des notions (§ 8).** Revenir aux mots du début ; faire expliciter une règle de classement et distinguer base de données en fichier plat, SGBD et application. | Définitions corrigées et illustrées par le travail réalisé ; règle vérifiée sur un document inclus et un document exclu. |
| 03:00–03:10 | 10 min | **Synthèse et justification (§ 9).** Consacrer 5 minutes aux faux positifs et négatifs de la recherche `prix`, à la distinction entre prix enregistré et prix actuel, puis à la transition vers les requêtes et SQL. Prévoir ensuite 5 minutes pour justifier une réponse dans les notes. | Critère explicite, résultat retenu ou écarté avec justification, et affirmation limitée à ce que le document permet de savoir. |
| 03:10–03:20 | 10 min | **Conservation et bilan (§ 10).** Faire compléter et enregistrer les notes, dont la justification de la synthèse, vérifier la présence de la capture et formuler une question encore difficile. Annoncer la reprise en tableaux à la séance 2. | `observations-classement.md` et capture disponibles ; chaque groupe explique un choix et la manière dont il en a vérifié le résultat. |

Le complément du support sur les questions nouvelles, Codd, l’histoire de SQL, les interfaces et les facettes est une **lecture facultative hors séance**. Il ne fait pas partie des activités du déroulé et ne demande aucun travail à remettre.

### Temps consacré au classement et aux recherches

Après les cinq minutes de prise en main, la réorganisation dispose de **20 minutes** pour choisir une règle, déplacer les 42 documents, nommer les regroupements, discuter les cas ambigus et conserver les traces. Les questions interviennent une fois ce classement terminé.

La série de treize questions dispose de **40 minutes**. À titre de repère, réserver environ 15 minutes aux dix recherches d’informations, 20 minutes aux trois comptages avec leurs inventaires et 5 minutes aux consignes et à la relecture des notes. Ces temps ne constituent pas des échéances par question : les comptages restent aux positions 3, 7 et 11, et chaque groupe avance dans l’ordre prévu.

L’échange entre groupes dispose de **10 minutes**, soit cinq minutes par classement, pour observer l’utilisation des classements sur les questions 1 et 3. La mise en commun dispose ensuite de **5 minutes** pour comparer les parcours sur la question 1 et vérifier les désaccords sur les documents. Les autres observations restent dans les notes.

### Organisation du travail et chronométrage

Former des groupes de deux ou trois. Tous participent aux décisions de classement, à la lecture et à la justification des réponses. Pendant les recherches, une personne manipule les documents ; une autre prend les notes et relève les durées. Dans un trinôme, séparer la prise de notes et le chronométrage.

Pendant la prise en main, faire créer `observations-classement.md` avec un espace pour la règle et les difficultés de classement, treize entrées numérotées pour les réponses et un espace pour les observations de l’autre groupe. Les questions restent consultables dans le support ; il suffit de relever leur numéro. Autoriser des notes brèves : réponse, titres ou références des documents justificatifs, parcours et hésitations en quelques mots. Pour un comptage, conserver la liste des documents retenus avec le total.

Présenter les questions et leur ordre après le classement. Chaque groupe démarre le chronomètre à la lecture d’une question et l’arrête lorsque sa réponse, ses preuves et, le cas échéant, son inventaire sont consignés. Il relève ensuite la durée. Le chronométrage sert à situer les difficultés ; interpréter les durées avec les parcours observés et la familiarité avec les documents. La correction et la justification des réponses restent les critères de réussite.

### Ajuster le rythme et conduire la comparaison

Si une activité demande davantage de temps, utiliser la **marge globale de 10 minutes**, selon le temps encore disponible. Décaler les étapes suivantes d’autant, sans dépasser **03:30** depuis le début de la séance. Maintenir les vingt minutes d’introduction, la pause de vingt minutes, les treize questions, les vérifications, les dix minutes de synthèse et les dix minutes de conservation finale. La marge absorbe les retards ; aucune activité supplémentaire n’y est prévue.

Signaler toute recherche restée inachevée dans les notes et la reprendre lors de la vérification dans le code source. Une durée interrompue ne se compare pas à celle d’une recherche terminée ; l’absence de réponse ne prouve pas l’absence de document.

Le recueil des mots au tableau dure **10 minutes** et précède les définitions. Le formateur dispose ensuite de **10 minutes** pour inventer une histoire utilisant tous les mots et conduire au binaire. Vérifier au tableau que chaque mot a été repris. Introduire ensuite le bit, l’octet et l’encodage ; intégrer les questions et les reprises guidées aux **20 minutes** consacrées à ces notions et aux exercices. Les propositions initiales restent visibles pour permettre leur révision en fin de séance.

On ne propose pas de catégories à l’avance. On recueille les cas difficiles à classer sans introduire les tables d’association, les formes normales ou la syntaxe SQL. Les tableaux seront introduits en séance 2 à partir des captures et des descriptions des classements.

Lors de la comparaison, faire préciser les regroupements visités et les documents qui les composent. La familiarité avec les documents peut aider à retrouver une réponse. L’utilisation par un autre groupe apporte une observation complémentaire sur la lisibilité des regroupements.

Lors des recherches et de l’échange entre groupes, faire désigner les documents qui justifient les réponses et les comptages. Le souvenir d’une réponse ne remplace pas sa vérification. Laisser les critères de classement libres, puis comparer les choix à partir des parcours réellement observés.

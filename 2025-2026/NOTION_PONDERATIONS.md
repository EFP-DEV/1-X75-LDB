# Inventaire des concepts présents dans le cours

Le classement porte sur la **place actuelle des concepts dans les supports**, selon leur récurrence et leur approfondissement. Un poids faible ne signifie pas qu’une notion est à supprimer.

| Poids | Signification |
|---|---|
| **5 - Très fort** | Concept structurant, expliqué et mobilisé dans plusieurs séances. |
| **4 - Fort** | Concept régulièrement travaillé ou central dans plusieurs activités. |
| **3 - Moyen** | Concept développé dans une activité, une séance ou un complément substantiel. |
| **2 - Léger** | Explication ponctuelle ou notion secondaire dans les activités. |
| **1 - Repère** | Notion citée, ouverture ou pratique demandée sans développement approfondi. |

Les numéros désignent les séances **avec leurs exercices et corrigés**. **7e** désigne la banque d’exercices SQL nommée « session 7 », dont le contenu dépasse celui du support principal. **Annexe** indique qu’aucune séance ne lui est explicitement attribuée. La séance **11** correspond à l’atelier final.

| Poids | Concept | Contenu à préserver | Séances qui le couvrent et sources complémentaires |
|---|---|---|---|
| **5** | **Modélisation d’un besoin métier** | Passer d’une situation réelle aux informations nécessaires ; délimiter le modèle et justifier les choix. | **2, 4, 6, 7, 8, 10, 11** ; [protocole de modélisation][P]. |
| **5** | **Entité et occurrence** | Reconnaître les objets, personnes ou événements à représenter ; distinguer leur catégorie d’un exemplaire particulier. | **1, 2, 4, 6, 7, 8, 10, 11** ; [identification des entités][ENT]. |
| **5** | **Attribut et valeur** | Déterminer les caractéristiques d’une entité et distinguer une caractéristique des valeurs qu’elle peut recevoir. | **1, 2, 4, 5, 6, 7, 8, 10, 11** ; [protocole][P]. |
| **5** | **Identification et unicité** | Distinguer les enregistrements ; choisir un identifiant ; comparer identification naturelle, artificielle et composée. | **1, 2, 3, 4, 5, 6, 7, 8, 10, 11** ; [corrigé librairie][C5L], [indexation][IDX]. |
| **5** | **Relation entre entités** | Représenter les liens du domaine et leur sens ; distinguer les objets reliés du lien qui les associe. | **4, 5, 6, 7, 8, 9, 10, 11** ; [exemples de MCD][MCD]. |
| **5** | **Cardinalité et participation** | Exprimer combien d’occurrences peuvent être liées, avec quels minimums et maximums ; raisonner sur les enregistrements présents dans la base. | **4, 6, 7, 8, 10, 11** ; [exemples de MCD][MCD], [référence SELECT][SEL]. |
| **5** | **Règle métier et intégrité des données** | Transformer les exigences en règles ; distinguer un état acceptable d’une incohérence et identifier ce qui garantit la règle. | **2, 4, 5, 6, 7, 8, 10, 11** ; [protocole][P]. |
| **5** | **Intégrité référentielle** | Garantir la validité des liens ; comprendre les références inexistantes et les conséquences des modifications ou suppressions sur les données liées. | **5, 6, 7, 8, 10, 11** ; [actions référentielles][FK]. |
| **5** | **Nature et type des données** | Choisir une représentation adaptée à l’information, à ses valeurs possibles et aux opérations nécessaires. | **1, 2, 3, 6, 7, 8, 10, 11** ; [types d’attributs][TYPES]. |
| **5** | **Présence, absence et caractère obligatoire** | Distinguer une information obligatoire, facultative ou absente ; comprendre les effets de cette absence sur les données et leur interrogation. | **2, 3, 4, 7, 8, 9, 10, 11** ; [référence SELECT][SEL]. |
| **5** | **Niveaux de modélisation** | Séparer description métier, organisation logique et réalisation physique ; suivre le passage MCD → MLD → MPD. | **4, 6, 7, 8, 10, 11** ; [MERISE et exemple des stages][MERISE]. |
| **4** | **Manipulation et évolution des données** | Créer, consulter, modifier et supprimer des informations ; comprendre la portée d’une opération sur un ou plusieurs enregistrements. | **3, 7e, 8, 9, 10, 11**. |
| **4** | **Traduction d’un besoin en requête** | Relier une question ou une fonctionnalité de l’interface aux données à retrouver ou à modifier. | **3, 5, 7e, 9, 11** ; [référence SELECT][SEL], [activité des fiches][FICHES]. |
| **4** | **Normalisation** | Transformer une organisation initiale en structures mieux définies ; comparer les étapes et conserver les informations pendant la décomposition. | **5**, reprises en **6, 10, 11** ; [annexes 1NF][NF1], [2NF][NF2], [3NF][NF3] et corrigés de la séance 5. |
| **4** | **Redondance et anomalies** | Repérer les informations répétées et les difficultés qu’elles provoquent lors des ajouts, modifications et suppressions. | **1, 5, 6, 10, 11** ; [protocole][P]. |
| **4** | **Atomicité des données** | Examiner ce qu’une cellule contient ; reconnaître les listes et regroupements qui compliquent les opérations prévues. | **1, 2, 5, 8, 11** ; [annexe sur l’atomicité][NF1]. |
| **4** | **Jointure** | Retrouver ensemble des informations réparties entre plusieurs tables ; examiner les correspondances, leur multiplicité et leur absence. | **5, 7e, 9, 11** ; [référence SELECT][SEL]. |
| **4** | **Filtrage** | Sélectionner les enregistrements qui répondent à une condition ou à une combinaison de conditions. | **3, 5, 7e, 9, 11** ; [référence SELECT][SEL], [activité des fiches][FICHES]. |
| **4** | **Tri et ordre des résultats** | Organiser les résultats selon un ou plusieurs critères ; distinguer la présence d’une information de sa position dans un affichage. | **3, 7e, 9, 11** ; introduction par les tableaux en **1**, [référence SELECT][SEL]. |
| **4** | **Regroupement et agrégation** | Passer des enregistrements individuels aux comptages, totaux, moyennes et synthèses par groupe. | **3** pour le comptage, **5, 7e, 9, 11** ; [référence SELECT][SEL], [activité des fiches][FICHES]. |
| **4** | **Classification des contenus** | Choisir des catégories, thèmes et mots-clés ; distinguer leurs fonctions et organiser une navigation cohérente. | **2, 6, 7, 8, 9**. |
| **4** | **Structure et contenu d’une base** | Distinguer la définition des tables des données qu’elles contiennent ; créer ou modifier la structure, puis l’alimenter. | **2, 3, 7, 8, 10, 11**. |
| **4** | **Validation d’un modèle par les usages** | Confronter le modèle à des données et à des opérations ; vérifier sa couverture des besoins et expliquer les écarts. | **2, 4, 6, 8, 10, 11** ; [protocole][P]. |
| **4** | **Jeu de données et cas de vérification** | Préparer des exemples cohérents, des cas absents ou multiples et des tentatives invalides ; comparer résultats attendus et observés. | **3, 5, 7e, 8, 9, 10, 11**. |
| **4** | **Nommage, documentation et justification** | Donner un sens explicite aux éléments du modèle ; documenter les champs, les règles et les décisions ; expliquer une solution. | **2, 3, 4, 7, 8, 11** ; [protocole][P]. |
| **3** | **Organisation tabulaire** | Comprendre lignes, colonnes et cellules ; lire horizontalement et verticalement ; comparer des données de même nature. | **1, 2, 5**. |
| **3** | **Donnée et représentation** | Distinguer l’information de sa mise en page ou de son affichage ; comparer des représentations différentes d’un même contenu. | **1** : listes, calendriers et tableaux ; **5** : résultat reconstruit après normalisation ; **9** : présentation des résultats. |
| **3** | **Dépendance fonctionnelle** | Déterminer quelles informations en déterminent d’autres ; reconnaître les dépendances à une partie de l’identifiant ou par intermédiaire. | **5**, notamment les corrigés ; [2NF][NF2], [3NF][NF3]. |
| **3** | **Association porteuse d’informations** | Reconnaître les données qui décrivent une relation : quantité d’une ligne de commande, note d’une inscription, date d’une certification. | **5, 10** ; [identification des entités][ENT], [corrigé du garage][C5G]. |
| **3** | **Données de référence et données d’activité** | Distinguer un catalogue relativement stable des événements ou opérations qui s’y rattachent. | **4, 5, 6, 8, 10** ; [exemple des stages][MERISE]. |
| **3** | **État et cycle de vie d’un objet métier** | Représenter brouillon, publication, lecture, activation ou validation ; relier les opérations à l’état courant. | **2, 4, 6, 7, 9, 10, 11**. |
| **3** | **Propriété, responsabilité et rôles** | Relier un contenu à son créateur, une collection à son propriétaire, un message à son responsable ; différencier les rôles des utilisateurs. | **2, 6, 7, 8, 9, 11**. |
| **3** | **Sélection des informations à restituer** | Choisir les caractéristiques utiles à un résultat et préparer un affichage adapté au besoin. | **3, 7e, 9, 11** ; [référence SELECT][SEL]. |
| **3** | **Pagination et limitation d’un résultat** | Découper une collection en portions et retrouver une portion déterminée ; sélectionner les premiers résultats selon un ordre. | **3, 7e, 9** ; [référence SELECT][SEL]. |
| **3** | **Recherche textuelle et pertinence** | Rechercher une partie de texte, combiner plusieurs champs et ordonner les correspondances selon leur intérêt. | **7e, 9** ; [activité des fiches][FICHES]. |
| **3** | **Composition de requêtes** | Utiliser un résultat intermédiaire pour répondre à une autre question ; décomposer une recherche complexe. | **3**, surtout le corrigé ; **7e, 11** ; [référence SELECT][SEL]. |
| **3** | **Indexation** | Organiser un accès supplémentaire aux données pour faciliter leur recherche ; distinguer cet accès des données elles-mêmes. | Évoquée en **1** et annoncée en **10** ; développée dans [l’activité des fiches][FICHES] et [l’annexe sur les index][IDX]. |
| **3** | **Transaction et fiabilité d’un ensemble d’opérations** | Traiter plusieurs opérations comme une unité ; validation, annulation, reprise partielle et propriétés ACID. | **Annexes** [transactions][TX] et [ACID][ACID] ; exemples également présents dans les compléments référentiels de **10**. |
| **3** | **Concurrence et isolation** | Examiner les effets d’accès simultanés ; protéger les opérations et arbitrer entre isolation et concurrence. | **Annexes** [transactions][TX] et [ACID][ACID]. |
| **3** | **Importation, exportation et restitution d’une base** | Transmettre une structure et des données, reconstituer un état de départ et produire les livrables d’un projet. | **7e, 9, 11**. |
| **3** | **Génération assistée et contrôle du résultat** | Produire un diagramme ou des données avec une assistance, puis vérifier leur conformité aux besoins et au modèle. | Exercices de **4, 6, 8**. |
| **3** | **Conserver, retrouver et vérifier l’information** | Comprendre les besoins auxquels répond le stockage : mémoire, comptage, administration, recherche et contrôle. | **1** ; [activité des fiches][FICHES]. |
| **2** | **Qualité, ambiguïté et hétérogénéité des données** | Repérer les informations manquantes, les formats variables, le bruit et les interprétations incertaines. | **1, 2, 5, 8** ; développement particulier dans [l’activité des fiches][FICHES]. |
| **2** | **Conventions, formats et unités** | Expliciter la manière de représenter une date, un pays, une langue, un montant ou une mesure. | **2, 3, 5** ; [corrigé de la séance 2][C2], [types d’attributs][TYPES]. |
| **2** | **Exactitude et approximation numériques** | Distinguer les besoins de précision et d’arrondi ; choisir une représentation selon les calculs envisagés. | Évoquée en **2**, exemples numériques en **3** ; surtout [types d’attributs][TYPES]. |
| **2** | **Exclusion entre associations** | Exprimer que deux relations ne doivent pas contenir simultanément la même association d’objets. | **4**, dans le [corrigé des spécialités médicales][C4M]. |
| **2** | **Unicité dépendant d’un contexte** | Définir une unicité à l’intérieur d’un groupe ou sous une condition, au lieu de l’imposer globalement. | **Annexe** [indexation et unicité][IDX]. |
| **2** | **Données stockées et données calculées** | Déterminer ce qu’il faut conserver et ce qui peut être obtenu à partir d’autres informations. | **2**, surtout le corrigé ; **5** ; [protocole][P]. |
| **2** | **Historique et traçabilité** | Conserver les dates, auteurs et événements utiles pour comprendre l’évolution d’une donnée. | **2, 6, 7, 9, 11** ; [identification des entités][ENT]. |
| **2** | **Suppression logique et conservation** | Distinguer disparition physique d’un enregistrement et changement d’état permettant de le conserver. | **3**, dans les bonnes pratiques ; statuts d’archivage présents en **6, 7, 9**. |
| **2** | **Répartition des responsabilités entre application et base** | Comprendre quelles règles la base peut faire respecter et pourquoi leur présence dans l’application ne remplit pas exactement le même rôle. | Principalement **10** ; prolongements en **11**. |
| **2** | **Protection des données et contrôle d’accès** | Stocker les secrets de manière adaptée, limiter les accès et éviter qu’une entrée utilisateur détourne une requête. | **6, 7, 9, 11** ; [référence SELECT][SEL]. |
| **2** | **Performance et coût des choix de conception** | Relier organisation, volume, types et requêtes aux coûts de stockage et de traitement. | **1, 5, 10** ; [types][TYPES], [indexation][IDX], [choix d’une base][CHOIX]. |
| **2** | **Diversité des modèles de données** | Reconnaître plusieurs façons d’organiser l’information et choisir selon les besoins ; relationnel, hiérarchique, réseau et familles non relationnelles. | **1** ; [comparaison des systèmes][CHOIX]. |
| **2** | **Indépendance entre données et programmes** | Comprendre l’intérêt de séparer la façon de stocker les données de la façon de les interroger. | **1**. |
| **2** | **Distribution et passage à l’échelle** | Répartir données et traitements ; comprendre pourquoi certains systèmes utilisent plusieurs machines. | **1** ; [transactions][TX], [ACID][ACID], [comparaison des systèmes][CHOIX]. |
| **2** | **Compromis entre cohérence et disponibilité** | Reconnaître que les garanties recherchées peuvent dépendre du contexte, notamment dans les systèmes distribués. | **Annexes** [ACID][ACID] et [comparaison des systèmes][CHOIX]. |
| **2** | **Mécanisation du traitement de l’information** | Distinguer calcul, conservation des données et instructions ; suivre le passage des registres aux machines et cartes perforées. | **1**. |
| **2** | **Codage et mesure de l’information** | Introduire la représentation numérique, le bit et la mémoire informatique. | **1**. |
| **2** | **Standardisation et portabilité** | Comprendre l’intérêt de conventions communes et l’existence de différences entre systèmes. | **1, 2** ; [délimiteurs et dialectes][DELIM], [transactions][TX], [comparaison des actions référentielles][NOACTION]. |
| **1** | **Algèbre relationnelle** | Repère théorique associé aux manipulations du modèle relationnel. | **1**. |
| **1** | **Entrepôt de données et analyse décisionnelle** | Ouverture vers l’exploitation de données pour l’analyse plutôt que pour les seules opérations courantes. | **1**. |
| **1** | **Dénormalisation volontaire** | Possibilité de conserver certaines redondances pour répondre à un besoin particulier. | **1** ; [annexe sur l’atomicité][NF1]. |
| **1** | **Formes normales avancées** | Existence de prolongements au-delà des formes travaillées dans le parcours. | **Annexe** [3NF][NF3]. |
| **1** | **Vue comme représentation réutilisable** | Réutiliser une interrogation sous la forme d’une représentation nommée. | [Référence SELECT][SEL], sans activité développée. |
| **1** | **Version enregistrée et suivi des changements** | Conserver les livrables et leurs évolutions dans un dépôt. | **11**, comme pratique demandée. |
| **1** | **Administration et environnement de travail** | Accéder à un serveur de données, utiliser un outil d’administration et préparer l’environnement. | [Présentation du module][INDEX], **1, 3, 7e, 8, 11** ; procédures présentes, mécanismes peu développés. |
| **1** | **Écosystème et ordres de grandeur** | Situer les systèmes, leurs usages, leur diffusion et les volumes de données évoqués. | **1** ; [panorama et statistiques][MARCHE], [comparaison des systèmes][CHOIX]. |

**Précisions pour préserver le périmètre :**

- La **3NF reste recensée** : elle apparaît dans les corrigés de la séance 5, dans une annexe et dans les exigences actuelles de l’atelier final. Son futur caractère facultatif ne retire rien de l’inventaire.
- Les **transactions, la concurrence et plusieurs approfondissements** sont présents dans le dépôt, mais leur traitement effectif en séance ne peut pas être déduit de leur seule présence.
- La **session 12** est annoncée comme examen dans l’index ; aucun support distinct ne permet de lui attribuer de nouvelles notions.
- Les contextes choisis restent les supports de ces concepts : rangement quotidien, calendriers, rois mérovingiens, cinéma, librairie, université, garage, clinique, stages, commandes et projet Atelier.

[P]: protocole_modélisation_DB.md
[ENT]: more/entity_identification.md
[C5L]: solution/session_05_1.md
[C5G]: solution/session_05_3.md
[C2]: solution/session_02.md
[C4M]: solution/session_04_1.md
[IDX]: more/INDEX_basics.md
[MCD]: more/MERISE_MCD_examples.md
[SEL]: session_SELECT.md
[FK]: more/FK_ON_DELETE_UPDATE.md
[TYPES]: more/entity_attributes_types.md
[MERISE]: more/MERISE.md
[FICHES]: more/session_1_2025.md
[NF1]: more/entity_NF_1_atomicity.md
[NF2]: more/entity_NF_2.md
[NF3]: more/entity_NF_3.md
[TX]: more/QUERY_TRANSACTIONS.md
[ACID]: more/acid.md
[CHOIX]: more/choose-db.md
[DELIM]: more/backtick.md
[NOACTION]: more/FK_RESTRICT_NO_ACTION.md
[INDEX]: index.md
[MARCHE]: more/market-stats.md

# Séance 2 — Construire les questions qui conduisent aux tables

[Énoncé](../exo/session_02.md#3-dessiner-et-décrire-des-tables) · [Correction collective à l’ouverture de la séance 3](../session_03.md)

Ce guide accompagne la correction collective des huit scénarios à l’ouverture de la séance 3. Les retours brefs pendant les exercices de séance 2 servent à accompagner les binômes ; ils ne remplacent pas cette correction. En séance 2, chaque binôme doit traiter un seul scénario librement choisi : deux tables principales et deux enregistrements fictifs par table. Les autres tables sont simplement notées ; approfondir ou traiter un autre scénario est facultatif. Aucun devoir ni achèvement à domicile n’est demandé. Accueillir les propositions inachevées et faire participer chacun aux scénarios qu’il n’a pas préparés. Les pistes ci-dessous dépassent donc le minimum individuel demandé.

Ce guide accompagne une conversation. On part de ce que l’on veut faire, on cherche les renseignements nécessaires, puis on distingue les sujets et les événements à décrire. Les réponses proposées sont des possibilités : les relances suivent les réponses de la classe.

La correction ouvre la séance 3 et dure **40 minutes**. Le cinéma reçoit 15 minutes pour installer la démarche ; la librairie 5, le blog 4, le transport 3, les langues 7, le commerce 2, l’hôpital 2 et l’école 2. Cette répartition décroissante selon les priorités pédagogiques reprend une allocation de Zipf arrondie. Les langues constituent un approfondissement volontaire au milieu du parcours.

Les noms en gras sont des propositions. Pour chaque champ : **quel type ? quelle longueur ou précision utile ? obligatoire ou facultatif, pourquoi ?** Les listes reprennent leur première apparition. Les liens entre sujets restent à représenter séparément.

## 1. Cinéma — Choisir un film et le retrouver · 15 minutes

### Partir des usages

Sur une plateforme de films et de séries, comment cherchez-vous un film ?

[OPEN MIC] 

une nouveauté, une comédie, un film d’action, une romance, un film japonais, un film d’horreur, un film avec Winona Ryder, un film réalisé par Gaspar Noé, un film recommandé à partir d’un film qu’on aime.


[OPEN EARS]

- une nouveauté : récent depuis sa sortie originale ou son arrivée sur la plateforme ? → **`date_sortie`**, **`date_ajout`**.
- une comédie : quel genre ? Peut-elle aussi être romantique, d’horreur ou d’action ? → **`nom_genre`** ; plusieurs genres possibles.
- Un film japonais : tourné ou produit au Japon, en japonais, ou d’un réalisateur japonais ? → **`pays_tournage`**, **`pays_production`**, **`langue`**, **`nationalite_realisateur`**, selon le sens retenu.
- Avec Winona Ryder ou par Gaspar Noé : interprète ou réalisateur ? → **`nom_acteur`**, **`nom_realisateur`** ; liens joue dans et réalise.
- Les recommandations d’un film que j’aime : quel point commun ? Genre, interprètes, réalisateur ? Hypothèses à préciser.

Inscrire progressivement les informations trouvées au tableau, avec la demande qui les justifie.

### Retrouver un film connu

Pour retrouver un film connu, que tapez-vous ? → **`titre`**.

Titre oublié, mais Johnny Depp joue dedans : comment le retrouver ? Parmi les résultats, comment reconnaître le bon ? → **`affiche`**, année de `date_sortie`, **`synopsis`**, acteurs déjà relevés.

Une affiche vous attire : que consultez-vous ensuite ? → `synopsis`, **`bande_annonce`**.

### Faire préciser les choix

Ce film tient-il dans l’heure qu’il vous reste ? → **`duree_minutes`**. Quelle unité ?

Ce film convient-il à un enfant ? Selon quelle classification ? → **`classification_age`**, **`systeme_classification`**.

Une note de 4 : sur combien ? Par qui ? Sans note, est-ce zéro ? → **`note`**, **`note_maximale`**, **`source_note`**.

Relire l’énoncé : budget et biographie sont demandés. Le budget : pour quel usage, dans quelle monnaie ? → **`budget`**, **`devise_budget`**. Quels renseignements sur l’acteur ? → **`biographie`**, à préciser. Sans usage identifié, garder la question pour le demandeur.

### Aller vers les tables

Dessiner les cadres `film` et `acteur`. Qu’est-ce qui décrit le film ou l’acteur ? Qu’est-ce qui reste identique d’un film à l’autre ? La biographie reste dans `acteur`.

Où décrire Gaspar Noé ? Un film peut-il avoir plusieurs réalisateurs ? Ajouter `realisateur` : une ligne par réalisateur. Faire formuler réalise et tracer les liens, y compris pour un film coréalisé.

Plusieurs acteurs par film ? Plusieurs films par acteur ? Avec les films fictifs A et B et les acteurs X et Y, tracer A–X, A–Y et B–X. Faire lire : X et Y jouent dans A ; X joue aussi dans B.

Conserver ces liens sur le dessin avec les verbes joue dans et réalise. Leur traduction en tables de liaison et en clés étrangères sera abordée en séance 5.

Que représente exactement une ligne de chaque table ? Choisir ensuite un champ pour demander son type, son unité, son caractère obligatoire et la justification d’une éventuelle limite de longueur.

**Trace à conserver :** les demandes des spectateurs, les informations qu’elles nécessitent, les sujets distingués et les questions encore ouvertes. Relire la proposition avec deux films fictifs, dont l’un possède plusieurs genres : peut-on toujours répondre aux demandes de départ ?

**Champs proposés, dans l’ordre :** `date_sortie` → `date_ajout` → `nom_genre` → `pays_tournage` → `pays_production` → `langue` → `nationalite_realisateur` → `nom_acteur` → `nom_realisateur` → `titre` → `affiche` → `synopsis` → `bande_annonce` → `duree_minutes` → `classification_age` → `systeme_classification` → `note` → `note_maximale` → `source_note` → `budget` → `devise_budget` → `biographie`.

Pour chacun : **type ? longueur ou précision ? obligatoire ?** Justifier.

## 2. Librairie — Obtenir le livre que l’on cherche · 5 minutes

Pour acheter un livre, que demandez-vous au libraire ? → **`titre`**, **`nom_auteur`**, **`theme`**. Un souvenir de lecture peut orienter la recherche.

Titre trouvé : poche, grand format ou numérique ? → **`format`**. Même prix ? → **`prix`**. Que compte le stock ? → **`quantite_stock`**. Disponible en numérique ? → **`disponibilite_numerique`**, sens à préciser.

Même titre, deux versions : laquelle commander ? Que désigne l’ISBN ? → **`isbn`**. Si nécessaire, rechercher sa définition avant de décrire ce champ.

Comment retrouver les autres livres d’un auteur ? Et un livre coécrit ? L’année de publication concerne quelle édition ? → **`annee_publication`**. Distinguer œuvre, édition et auteur.

**Trace :** une même œuvre en deux formats constitue le cas fictif de discussion. Les étudiants expliquent à quoi appartiennent prix, stock et référence, puis proposent leurs regroupements. Quels renseignements biographiques conserver ? → **`biographie`**, contenu et longueur à justifier.

**Champs proposés, dans l’ordre :** `titre` → `nom_auteur` → `theme` → `format` → `prix` → `quantite_stock` → `disponibilite_numerique` → `isbn` → `annee_publication` → `biographie`.

Pour chacun : **type ? longueur ou précision ? obligatoire ?** Justifier.

## 3. Blog — Faire publier un article · 4 minutes

Votre article est inachevé : comment le conserver sur le site ? → **`contenu`**, **`etat`**.

Qui peut relire, corriger ou publier ? → **`nom_editeur`**, **`role`** ; droits à définir.

Brouillon, prévu pour demain ou déjà publié : quel état, quelle date ? → `etat`, **`date_publication_prevue`**, **`date_publication`**.

Comment retrouver l’article ? Dans plusieurs rubriques ? → **`titre`**, `contenu`, **`nom_categorie`** ; lien avec les catégories.

**Trace :** les étudiants regroupent ce qui décrit l’article, l’éditeur et les catégories. Comparer un brouillon et un article publié : quelles informations peuvent manquer dans le premier ? Quelles autorisations faut-il encore faire préciser ?

**Champs proposés, dans l’ordre :** `contenu` → `etat` → `nom_editeur` → `role` → `date_publication_prevue` → `date_publication` → `titre` → `nom_categorie`.

Pour chacun : **type ? longueur ou précision ? obligatoire ?** Justifier.

## 4. Transport — Faire transporter sa voiture · 3 minutes

Vous déménagez : que demander au transporteur pour acheminer votre voiture ?

Ce contexte donne un objectif à la recherche. Il ne transforme pas l’exercice en conception complète d’une entreprise de logistique : on revient aux informations sur les pays, les villes et les itinéraires.

Proposer ces questions pour consulter un site de logistique :

- Départ et arrivée : un nom de ville suffit-il ? → **`nom_ville`**, **`nom_pays`** ; liens de départ et d’arrivée.
- Quelles étapes, quelles gares, quels aéroports ? Comment les distinguer ? → **`ordre_etape`**, **`nom_equipement`**, **`type_equipement`**.
- L’heure locale de quel lieu ? → **`heure_passage`**, **`fuseau_horaire`**.
- Quelle langue, quelle monnaie ? → **`langue`**, **`devise`**.
- Quels codes de pays ou d’équipements ? Quelle définition officielle ? → **`code_pays`**, **`code_equipement`** ; conventions à préciser.

ISO : qu’est-ce que c’est ? Qu’est-ce qu’une norme ? Pourquoi partager les mêmes codes entre plateformes et transporteurs ? Que risque-t-on si chacun invente les siens ? → désigner sans ambiguïté, échanger les données, éviter les erreurs.

Un code ISO : quelle norme, quel format ? Tous les codes d’équipements sont-ils ISO ? Où vérifier ? → identifier la convention avant de choisir le type et la longueur du champ.

Que savons-nous ? Que faut-il rechercher, et où ? → entreprise, site ou documentation.

**Trace :** les questions de recherche, les sujets déjà identifiés et les informations restant à confirmer. Où se situe le lieu ? → **`latitude`**, **`longitude`**, unité à préciser. Combien d’habitants, sur quel territoire et à quelle date ? → **`population`**, **`territoire_population`**, **`date_population`** ; usage à préciser. Aucun résultat de recherche n’est inventé pour compléter une table.

**Champs proposés, dans l’ordre :** `nom_ville` → `nom_pays` → `ordre_etape` → `nom_equipement` → `type_equipement` → `heure_passage` → `fuseau_horaire` → `langue` → `devise` → `code_pays` → `code_equipement` → `latitude` → `longitude` → `population` → `territoire_population` → `date_population`.

Pour chacun : **type ? longueur ou précision ? obligatoire ?** Justifier.

## 5. Langues — Pourquoi approfondir ce sujet ? · 7 minutes

Comment reconnaître une langue ? → **`nom_langue`**. Où est-elle pratiquée ? → **`region`**. Comment s’écrit-elle ? → **`systeme_ecriture`**. Combien de locuteurs ? → **`nombre_locuteurs`**.

Puis arrêter la classe : Pourquoi approfondir cet exercice ?

Écrire `___, ___, ___`, en reprenant le dispositif du pendu déjà utilisé. Faire trouver **LBA, LDB, LPB**, puis leur point commun dans la formation : les langages. Le sujet mérite que l’on sache chercher et lire ses définitions.

### Parcours de recherche à conduire ensemble

1. Relire l’énoncé. Retrouver la mention d’un code ISO, déjà rencontrée dans le transport. ISO suffit-il à dire de quel code nous parlons ? → **`code_iso`**, convention à préciser.
2. Chercher **language ISO code** et ouvrir la [liste des codes ISO 639 sur Wikipédia](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes).
3. Lire l’introduction lentement. Introduire **nomenclature** par son étymologie : le mot vient du latin *nomenclatura*, lié à la désignation par les noms. Ici, on examine un système de désignation organisé. Demander ce que change l’existence d’une convention commune dans un logiciel.
4. Relever les expressions qui demandent une interprétation : standard, deux ou trois lettres, date de 2007, objectif de couverture, langues naturelles, remplacement annoncé d’un autre ensemble de codes à trois lettres. Même longueur signifie-t-elle même convention ? Un objectif garantit-il une couverture complète ? Les affirmations de l’introduction deviennent des points à comprendre et à confronter aux sources.
5. Descendre au tableau. Ses colonnes montrent des propriétés effectivement utilisées pour décrire les langues. Les parcourir : noms, codes, portée (*scope*), type, endonymes, autres noms et notes. Champs candidats : **`portee`**, **`type_langue`**, **`endonyme`**, **`autre_nom`**, **`notes`**. Que comprenons-nous spontanément ? Quelle définition devons-nous vérifier ? Porter une attention particulière à la portée et au type.
6. Consulter les références et suivre la [liste de la Library of Congress](https://www.loc.gov/standards/iso639-2/php/English_list.php). Constater qu’elle concerne ISO 639-2. Est-ce la source correspondant à la couverture que nous cherchons ?
7. Chercher **iso 639-3 official**, identifier le [site ISO 639-3](https://iso639-3.sil.org/) et poursuivre la lecture à partir de la source officielle.

Ce parcours fixe l’intention de l’enquête. Son développement détaillé, les définitions officielles et la suite de la lecture seront préparés séparément. Les sept minutes servent à engager cette lecture critique, sans promettre d’épuiser la documentation.

**Trace :** conserver les questions et les sources correspondant à chaque convention. Quelle famille, quel statut ? → **`famille_linguistique`**, **`statut`**. Reprendre systèmes d’écriture, régions et estimation des locuteurs. Quelles réponses avons-nous trouvées ? Lesquelles restent à rechercher ? Qui compte, à quelle date, selon quelle définition ? → **`source_estimation`**, **`date_estimation`**, **`definition_locuteur`**. Ne pas recopier automatiquement les colonnes d’un site comme modèle définitif de l’application.

**Champs proposés, dans l’ordre :** `nom_langue` → `region` → `systeme_ecriture` → `nombre_locuteurs` → `code_iso` → `portee` → `type_langue` → `endonyme` → `autre_nom` → `notes` → `famille_linguistique` → `statut` → `source_estimation` → `date_estimation` → `definition_locuteur`.

Pour chacun : **type ? longueur ou précision ? obligatoire ?** Justifier.

## 6. Commerce — Commander et retrouver une commande · 2 minutes

Que savoir pour commander ? Quelles données fournir pour la livraison et la facture ?

Faire produire les relances : quelle référence ? → **`reference_produit`**. Quel prix, quelle monnaie, quelles taxes ? → **`prix_unitaire`**, **`devise`**, **`taux_taxe`**. Quelle disponibilité, quelle quantité ? → **`quantite_stock`**, **`quantite_commandee`**. Quelle adresse ? → **`adresse_livraison`**, **`adresse_facturation`**. Client et destinataire identiques ? → **`nom_client`**, **`nom_destinataire`**.

Prix ou adresse modifiés : que doit conserver l’ancienne commande ? → `prix_unitaire`, `adresse_livraison` et `adresse_facturation` au moment de l’achat.

**Trace :** distinguer produit, client, commande et contenu de commande. Deux achats fictifs successifs permettent de demander ce qui doit rester conservé. Le stock actuel ou le prix actuel ne répondent pas à toutes les questions sur le passé.

**Champs proposés, dans l’ordre :** `reference_produit` → `prix_unitaire` → `devise` → `taux_taxe` → `quantite_stock` → `quantite_commandee` → `adresse_livraison` → `adresse_facturation` → `nom_client` → `nom_destinataire`.

Pour chacun : **type ? longueur ou précision ? obligatoire ?** Justifier.

## 7. Hôpital — Prendre rendez-vous et revenir · 2 minutes

Quel médecin, quel créneau ? → **`nom_medecin`**, **`date_heure_consultation`**. Puis, sur un cas fictif : que retrouver de la première consultation ? → **`observations`**.

Quelle spécialité ? → **`specialite`**. Quelles disponibilités ? → **`debut_disponibilite`**, **`fin_disponibilite`**. Quel identifiant professionnel ? → **`identifiant_professionnel`**. Comment joindre le patient ? → **`telephone_patient`**, **`email_patient`**. Quels antécédents, allergies, assurance ? → **`antecedents`**, **`allergies`**, **`assurance`**.

Allergies non renseignées : aucune allergie ? Une consultation remplace-t-elle la précédente ?

**Trace :** distinguer médecin, patient et consultations datées. Nommer les autres sujets selon les réponses. Chaque renseignement proposé doit permettre de répondre à une question ; les informations inconnues restent signalées comme telles.

**Champs proposés, dans l’ordre :** `nom_medecin` → `date_heure_consultation` → `observations` → `specialite` → `debut_disponibilite` → `fin_disponibilite` → `identifiant_professionnel` → `telephone_patient` → `email_patient` → `antecedents` → `allergies` → `assurance`.

Pour chacun : **type ? longueur ou précision ? obligatoire ?** Justifier.

## 8. École — Trouver son cours et comprendre son résultat · 2 minutes

Où et quand a lieu votre prochain cours ? → **`salle`**, **`date_heure_cours`**. Quelle note, sur combien ? → **`note`**, **`note_maximale`**.

Quel cours ? → **`intitule_cours`**, **`code_cours`**. Quel département, combien de crédits ? → **`departement`**, **`credits`**. Quel étudiant, quelle évaluation, quelle session ? → **`nom_etudiant`**, **`intitule_evaluation`**, **`session`**.

Deux homonymes : comment les distinguer ? → **`id_etudiant`**. Cours répété : quelle occurrence ? → **`id_occurrence_cours`**. Deuxième essai : comment conserver le premier ? → **`numero_tentative`**.

**Trace :** les étudiants distinguent le cours, sa tenue à un moment donné, l’étudiant et le résultat à définir. Ils indiquent les règles à demander plutôt que de supposer ce que signifie une note absente.

**Champs proposés, dans l’ordre :** `salle` → `date_heure_cours` → `note` → `note_maximale` → `intitule_cours` → `code_cours` → `departement` → `credits` → `nom_etudiant` → `intitule_evaluation` → `session` → `id_etudiant` → `id_occurrence_cours` → `numero_tentative`.

Pour chacun : **type ? longueur ou précision ? obligatoire ?** Justifier.

## Ce que l’on conserve de la correction

Pour reprendre chaque exercice, garder une courte chaîne écrite : **situation → question → information nécessaire → sujet ou événement décrit → décision justifiée**. Ajouter les hypothèses et les recherches encore nécessaires.

Le dessin des tables vient de ces distinctions. On peut ensuite préciser ce que représente une ligne, comment la distinguer d’une autre et comment décrire ses champs : sens, type, unité, longueur et caractère obligatoire. Les relations sont exprimées en français à ce stade, sans SQL ni cardinalités imposées.

Pour les tables préparées, reprendre les deux enregistrements fictifs par table demandés dans l’exercice. Permettent-ils de répondre aux questions de départ ? Une information absente, plusieurs valeurs ou un second événement obligent-ils à revoir la proposition ? Expliquer la conséquence et le choix retenu constitue le résultat attendu.

# Séance 3 — Exemple de table personne à construire par contextes

[Cours](../session_03.md) · [Table et données SQL](session_03_personne.sql) · [Passage aux coordonnées liées](session_03_personne_relationnel.sql) · [Référentiel](../referentiel.md)

Cet exemple suit la démarche prévue en séance 3 : construire la table avec la classe, reprendre le schéma et les données pendant la pause, puis pratiquer le CRUD sur ce travail. Il constitue un exemple disponible pour l’enseignant ; les choix et les propositions de la classe peuvent produire une autre table.

**Une table de 58 champs et 24 fiches de précurseurs et pionniers du calcul et de l’informatique, dont dix femmes.** Le parcours va d’Al-Khwarizmi aux ordinateurs, aux langages, aux bases de données, au Web et aux cryptomonnaies. Une même personne revient dans plusieurs contextes. On ajoute les propriétés nécessaires à ces usages sans créer une nouvelle ligne pour chaque activité de la personne.

Les femmes sont présentes à plusieurs étapes de cette histoire : Ada Lovelace, Grace Hopper, Jean Bartik, Betty Holberton, Margaret Hamilton, Katherine Johnson, Dorothy Vaughan, Mary Allen Wilkes, Evelyn Berezin et Barbara Liskov. Chaque fiche décrit une contribution précise ; elles participent au même jeu de données et aux mêmes activités que les autres figures.

Les noms et les liens documentaires renvoient à des personnes réelles. **Toutes les coordonnées sont fictives**, dans une simulation contemporaine qui réunit volontairement des personnes de différentes époques. Les rues, téléphones et emails ne sont pas des renseignements biographiques. Les dates inconnues restent non renseignées.

## Construire les besoins avant les colonnes

Partir de quelques personnes et de ce que l’on cherche à savoir sur elles. Les propositions ci-dessous donnent des relances ; chaque nom est un exemple de passage entre contextes.

| Contexte | Situation à proposer | Informations qui deviennent utiles |
|---|---|---|
| Description commune | Reconnaître la personne et présenter son parcours. | Nom utilisé, année de naissance, biographie, domaine. |
| Cinéma / acteurs | Retrouver Turing à partir de *The Imitation Game*. Qui l’incarne ? | Film, lien avec le film, interprète. |
| Librairie / auteurs | Retrouver un livre d’Al-Khwarizmi ou de Tim Berners-Lee. | Livre, langue de rédaction. |
| Blog | Lire Berners-Lee ou Vitalik Buterin. | Nom du blog, adresse du site. |
| Transport | Décrire le lien de Grace Hopper avec la marine, de Margaret Hamilton avec le logiciel de vol Apollo ou d’Evelyn Berezin avec les réservations aériennes. | Organisation, fonction, grade lorsqu’il existe. |
| Commerce | Retrouver l’entreprise d’Evelyn Berezin et les systèmes de traitement de texte qu’elle commercialisait. | Organisation commerciale, fonction. |
| Cryptographie | Retrouver le travail de Turing sur Enigma et celui de Shannon sur les systèmes de chiffrement. | Nature du travail cryptographique. |
| Cryptomonnaie | Retrouver les personnes ou pseudonymes associés à Bitcoin et Ethereum. | Projet, contribution. |
| Sport | Reprendre Turing, déjà présent, pour sa course de fond. | Discipline, performance documentée. |

Dans cet exemple, les indicateurs `acteur`, `auteur`, `blogueur`, `transport`, `commerce`, `cryptographie`, `cryptomonnaie` et `sport` désignent les **contextes retenus pour la séance**. `1` signifie que la fiche sera utilisée dans ce contexte ; `0` signifie que ce contexte n’a pas été retenu pour cette fiche. Ils ne prétendent pas décrire toute la carrière d’une personne.

La rubrique `acteur` reprend le contexte cinéma au sens large choisi pour l’exercice : Turing y apparaît comme **personne représentée**, et Benedict Cumberbatch comme son interprète. `lien_film` conserve cette distinction. Une même fiche peut donc être retrouvée avec `acteur = 1`, puis `cryptographie = 1`, puis `sport = 1`.

## Décompte et sens des champs

Les 58 colonnes sont numérotées dans le fichier SQL. Les groupes correspondent aux demandes successives.

| Champs | Noms | Usage |
|---|---|---|
| 1–6 | `nom`, `prenom`, `nom_complet`, `annee_naissance`, `biographie`, `domaine_activite` | Identifier et présenter la personne. Le nom complet reste utilisable lorsqu’une séparation nom/prénom n’est pas établie. |
| 7–10 | `acteur`, `film_repere`, `lien_film`, `interprete_personne` | Retrouver la personne dans le contexte cinéma et préciser sa relation au film. |
| 11–13 | `auteur`, `livre_repere`, `langue_livre` | Présenter un livre écrit par la personne. |
| 14–16 | `blogueur`, `nom_blog`, `url_blog` | Retrouver son blog. |
| 17–20 | `transport`, `organisation_transport`, `fonction_transport`, `grade_transport` | Décrire son lien avec une organisation de transport ou la marine. Le grade peut être sans objet. |
| 21–23 | `commerce`, `organisation_commerce`, `fonction_commerce` | Décrire son lien avec une activité commerciale. |
| 24–25 | `cryptographie`, `travail_cryptographique` | Décrire le travail sur les codes, le chiffrement ou ses applications. |
| 26–28 | `cryptomonnaie`, `projet_cryptomonnaie`, `contribution_cryptomonnaie` | Décrire son rôle dans un projet de cryptomonnaie. |
| 29–31 | `sport`, `discipline_sportive`, `performance_sportive` | Décrire une pratique sportive documentée. |
| 32–33 | `source_reference`, `note_documentaire` | Retrouver une source et conserver les précisions ou incertitudes. |
| 34–38 | `telephone_domicile`, `telephone_professionnel`, `telephone_mobile`, `telephone_urgence`, `telephone_autre` | Réserver cinq emplacements téléphoniques. Le numéro d’urgence permet de joindre une personne à prévenir. |
| 39–41 | `adresse_domicile_rue`, `adresse_domicile_code_postal`, `adresse_domicile_ville` | Adresse du domicile. |
| 42–44 | `adresse_livraison_rue`, `adresse_livraison_code_postal`, `adresse_livraison_ville` | Destination d’une livraison. |
| 45–47 | `adresse_facturation_rue`, `adresse_facturation_code_postal`, `adresse_facturation_ville` | Adresse à faire figurer sur une facture. |
| 48–50 | `adresse_professionnelle_rue`, `adresse_professionnelle_code_postal`, `adresse_professionnelle_ville` | Adresse professionnelle. |
| 51–53 | `adresse_autre_rue`, `adresse_autre_code_postal`, `adresse_autre_ville` | Un cinquième emplacement d’adresse. |
| 54–58 | `email_personnel`, `email_professionnel`, `email_associatif`, `email_administratif`, `email_autre` | Réserver cinq emplacements pour les emails. |

Le type `SMALLINT` conserve une année, sans inventer un jour ou un mois. Les téléphones et codes postaux sont des textes : les signes, espaces et zéros initiaux ne sont pas des quantités. `BOOLEAN` sert aux indicateurs de contexte. Les biographies et notes utilisent `TEXT`. Les longueurs des `VARCHAR` sont des hypothèses techniques pour cet exemple, à discuter selon les usages.

Le nom complet et les indicateurs sont obligatoires ; les autres champs sont facultatifs dans cette première structure. Un `NULL` signifie qu’aucune valeur n’est renseignée : il ne permet pas à lui seul de distinguer une information inconnue d’une propriété sans objet. La note documentaire précise les cas discutés. Aucun identifiant unique n’est encore imposé dans la table initiale.

## Faire apparaître le plafond de stockage

Le parcours aboutit d’abord à **33 champs descriptifs**. Introduire ensuite les coordonnées, une demande à la fois : téléphone à domicile, au travail, mobile, numéro à prévenir en cas d’urgence, puis autre numéro.

| Étape | Ajout | Total |
|---|---|---|
| Personne décrite dans plusieurs contextes | 33 champs | 33 |
| Cinq téléphones | 5 colonnes | 38 |
| Cinq adresses : rue, code postal, ville | 15 colonnes | 53 |
| Cinq emails | 5 colonnes | **58** |

À chaque étape, faire justifier l’ajout et demander ce qui justifie le nombre cinq. La multiplication des colonnes fait presque doubler la structure initiale ; elle impose toujours un plafond.

La fiche de Turing porte cinq téléphones, cinq adresses et cinq emails fictifs. Le domicile et la facturation reprennent volontairement la même adresse dans deux emplacements distincts.

Donner ensuite cette demande : **« Ajouter un deuxième téléphone professionnel : `+32 2 000 10 06`, sans perdre aucun des cinq numéros existants. »** Le champ `telephone_autre` est déjà occupé. Remplacer une valeur en ferait perdre une ; mettre deux numéros dans une cellule abandonnerait le principe d’une valeur par emplacement ; ajouter une colonne modifierait le schéma. La limite ne vient d’aucune règle du besoin.

Reprendre avec une deuxième adresse de livraison : `31 rue des Cartes`, `1040`, `Etterbeek`, puis un deuxième email professionnel : `alan.projet@example.test`. Les mêmes limites réapparaissent. Les valeurs sont des ajouts proposés pour la démonstration ; elles ne figurent pas dans le jeu initial.

## Jeu de données et observations prévues

| Fiche | Contextes retenus | Observation utile |
|---|---|---|
| Al-Khwarizmi | Auteur | Un traité est un livre ; une année approximative n’est pas une année exacte. |
| Gottfried Wilhelm Leibniz | Auteur | Calcul mécanique et binaire ; un ouvrage philosophique complète le portrait du mathématicien. |
| Charles Babbage | Auteur | Machines à différences et analytique ; son autobiographie offre une autre entrée. |
| Ada Lovelace | Présentation commune | Notes de 1843 et procédure pour les nombres de Bernoulli ; distinguer article et livre. |
| George Boole | Auteur | Logique algébrique et *An Investigation of the Laws of Thought*. |
| Alan Turing | Cinéma, cryptographie, sport | Une seule fiche répond à trois usages ; tous les emplacements de coordonnées sont remplis. |
| John von Neumann | Auteur | Architecture des ordinateurs et *The Computer and the Brain* ; prénom partagé avec McCarthy. |
| Claude Shannon | Auteur, cryptographie | Théorie de l’information et étude mathématique des systèmes de chiffrement. |
| Grace Hopper | Transport | La marine justifie le contexte ; la fonction reste précisément décrite. |
| Jean Bartik | Présentation commune | Une des six programmeuses initiales de l’ENIAC. |
| Betty Holberton | Présentation commune | Une autre des six programmeuses initiales de l’ENIAC. |
| Margaret Hamilton | Transport | Direction de l’équipe du logiciel de vol Apollo. |
| Katherine Johnson | Cinéma, transport | Personne représentée dans un film et calculatrice de trajectoires spatiales. |
| Dorothy Vaughan | Cinéma, transport | Direction d’une équipe de calcul et programmation FORTRAN ; représentée dans le même film que Johnson. |
| Mary Allen Wilkes | Auteur | Logiciel du LINC et manuel technique *LAP6 Handbook*. |
| Evelyn Berezin | Transport, commerce | Réservations aériennes et entreprise de traitement de texte. |
| Barbara Liskov | Présentation commune | Abstraction des données, langage CLU et systèmes distribués. |
| Edgar Frank Codd | Présentation commune | Le modèle relationnel, directement lié au sujet du cours. |
| Edsger Dijkstra | Présentation commune | Algorithmes et rigueur de la programmation. |
| John McCarthy | Présentation commune | Lisp et intelligence artificielle ; prénom partagé avec von Neumann. |
| Donald Knuth | Auteur | Analyse des algorithmes et *The Art of Computer Programming*. |
| Tim Berners-Lee | Auteur, blog | Un livre et un blog conduisent à la même personne. |
| Satoshi Nakamoto | Cryptographie, cryptomonnaie | Le pseudonyme est utilisable sans inventer une identité civile. |
| Vitalik Buterin | Blog, cryptomonnaie | Deux contextes sur la même ligne. |

Les deux John ont des noms de famille différents, mais le même prénom et la même ville fictive, Bruxelles. Le prénom et la ville ne suffisent donc pas au ciblage. Ajouter le nom permet de distinguer ces deux fiches dans cet échantillon ; cette combinaison n’est pas une garantie générale d’unicité.

Une fiche indiquée « présentation commune » reste une personne à présenter, comparer et retrouver. On ne lui invente pas un livre, un film ou une activité commerciale pour remplir chaque groupe de colonnes. Les deux figures des cryptomonnaies prolongent le parcours vers des usages plus récents ; elles ne remplacent pas les figures fondatrices.

## Pendant la pause

Le fichier [session_03_personne.sql](session_03_personne.sql) contient la création de la table et les 24 fiches. Choisir MySQL 8 dans l’environnement utilisé et placer le script dans la partie de préparation du schéma et des données. Le lancement reste à effectuer par l’enseignant ; le script n’a pas été exécuté lors de sa rédaction.

Pour le travail construit en classe, adapter les noms, types et valeurs à ce qui a été décidé. Les élèves retrouvent après la pause la table à laquelle ils ont contribué. Le fichier d’exemple peut également servir de solution de repli.

## CRUD sur les mêmes personnes

Pour chaque demande, prévoir le résultat, écrire la requête, observer les lignes obtenues et expliquer le choix des colonnes ou conditions. Les résultats ci-dessous sont attendus d’après la lecture du jeu de données.

### Lire selon le contexte

```sql
SELECT * FROM personne;

SELECT nom_complet, film_repere, lien_film, interprete_personne
FROM personne WHERE acteur = 1;

SELECT nom_complet, livre_repere, langue_livre
FROM personne WHERE auteur = 1;

SELECT nom_complet, nom_blog, url_blog
FROM personne WHERE blogueur = 1;

SELECT nom_complet, organisation_transport, fonction_transport, grade_transport
FROM personne WHERE transport = 1;

SELECT nom_complet, organisation_commerce, fonction_commerce
FROM personne WHERE commerce = 1;

SELECT nom_complet, travail_cryptographique
FROM personne WHERE cryptographie = 1;

SELECT nom_complet, projet_cryptomonnaie, contribution_cryptomonnaie
FROM personne WHERE cryptomonnaie = 1;

SELECT nom_complet, discipline_sportive, performance_sportive
FROM personne WHERE sport = 1;
```

Résultats attendus : 24 fiches au total ; trois en cinéma, neuf auteurs, deux blogueurs, cinq dans le transport, une dans le commerce, trois en cryptographie, deux en cryptomonnaie et une en sport. Les catégories se recouvrent : additionner leurs effectifs ne donne pas le nombre de personnes. Certaines fiches n’apparaissent que dans la lecture générale.

Faire retrouver Turing dans trois résultats. Choisir quelques colonnes rend la lecture plus simple, mais ne crée aucune nouvelle table et ne libère aucun emplacement téléphonique.

### Ajouter une fiche provisoire

```sql
INSERT INTO personne (nom, prenom, nom_complet, email_personnel, note_documentaire)
VALUES ('D''Arcy', 'Lou', 'Lou D''Arcy', 'lou.exercice@example.test',
        'Personne fictive ajoutée pour la manipulation CRUD.');

SELECT nom, prenom, nom_complet, email_personnel, note_documentaire
FROM personne WHERE nom_complet = 'Lou D''Arcy';
```

Une fiche est ajoutée ; les indicateurs ont leur valeur par défaut `0`. Lire les valeurs saisies. L’apostrophe dans le nom est doublée à l’intérieur du texte SQL. La table comporte désormais 25 fiches.

### Modifier en précisant un prénom partagé

Demande : corriger le téléphone mobile fictif de John McCarthy en `+32 470 00 50 09`.

```sql
SELECT nom, prenom, annee_naissance, adresse_domicile_ville, telephone_mobile
FROM personne WHERE prenom = 'John';

SELECT nom, prenom, annee_naissance, telephone_mobile
FROM personne
WHERE prenom = 'John' AND nom = 'McCarthy';

UPDATE personne
SET telephone_mobile = '+32 470 00 50 09'
WHERE prenom = 'John' AND nom = 'McCarthy';

SELECT nom, prenom, annee_naissance, telephone_mobile
FROM personne WHERE prenom = 'John';
```

Le premier résultat contient deux lignes. Ajouter la ville commune ne les départagerait pas. Après modification, le téléphone de McCarthy se termine par `50 09` ; celui de von Neumann reste `40 01`. Faire expliquer pourquoi le nom a été ajouté à la condition.

### Supprimer la fiche provisoire

```sql
SELECT nom_complet, email_personnel
FROM personne WHERE nom_complet = 'Lou D''Arcy' AND email_personnel = 'lou.exercice@example.test';

DELETE FROM personne
WHERE nom_complet = 'Lou D''Arcy' AND email_personnel = 'lou.exercice@example.test';

SELECT * FROM personne WHERE nom_complet = 'Lou D''Arcy';
SELECT nom_complet, annee_naissance FROM personne;
```

La recherche de Lou ne doit plus retourner de ligne ; les 24 fiches initiales restent présentes. Le téléphone corrigé de McCarthy reste modifié : le nombre de lignes retrouve sa valeur initiale, mais tout l’état de la base n’est pas revenu à son état initial.

## Comparer avec des coordonnées liées

Repartir du jeu initial, puis charger [session_03_personne_relationnel.sql](session_03_personne_relationnel.sql). Le script copie les 24 fiches, leur attribue un identifiant et reprend chaque coordonnée renseignée dans la table correspondante. La grande table reste disponible pour la comparaison.

| Table obtenue | Champs | Une ligne représente… |
|---|---:|---|
| `personne_relationnelle` | 34 | Une personne : les 33 champs descriptifs et son identifiant. |
| `telephone` | 4 | Un numéro, son usage et son rattachement à une personne, avec son propre identifiant. |
| `adresse` | 6 | Une adresse, son usage et son rattachement à une personne, avec son propre identifiant. |
| `email` | 4 | Un email, son usage et son rattachement à une personne, avec son propre identifiant. |
| **Total** | **48** | **Quatre tables, moins de champs, autant de coordonnées que nécessaire.** |

Les données initiales donnent 24 personnes, dix lignes de téléphone, neuf lignes d’adresse et dix lignes d’email. Pour Turing, on retrouve cinq lignes dans chacune des trois tables de coordonnées. L’adresse de domicile et celle de facturation restent deux lignes avec des usages distincts.

L’enseignant peut relever l’identifiant de Turing puis l’utiliser dans des lectures simples sur chaque table. Les sous-requêtes ci-dessous évitent de présumer la valeur attribuée à cet identifiant ; leur syntaxe ne constitue pas un attendu de la séance 3.

```sql
SELECT id, nom_complet FROM personne_relationnelle WHERE nom_complet = 'Alan Turing';

SELECT usage_telephone, numero
FROM telephone
WHERE personne_id = (
    SELECT id FROM personne_relationnelle WHERE nom_complet = 'Alan Turing'
);

INSERT INTO telephone (personne_id, usage_telephone, numero)
SELECT id, 'professionnel', '+32 2 000 10 06'
FROM personne_relationnelle WHERE nom_complet = 'Alan Turing';

SELECT usage_telephone, numero
FROM telephone
WHERE personne_id = (
    SELECT id FROM personne_relationnelle WHERE nom_complet = 'Alan Turing'
);
```

Après un seul ajout, six lignes sont attendues pour Turing, dont deux numéros professionnels. Vérifier la présence des cinq numéros précédents et du nouveau. **On ajoute une ligne ; la structure reste identique.** Expliquer pourquoi le plafond de cinq a disparu.

Pour prolonger la même démonstration :

```sql
INSERT INTO adresse (personne_id, usage_adresse, rue, code_postal, ville)
SELECT id, 'livraison', '31 rue des Cartes', '1040', 'Etterbeek'
FROM personne_relationnelle WHERE nom_complet = 'Alan Turing';

INSERT INTO email (personne_id, usage_email, adresse_email)
SELECT id, 'professionnel', 'alan.projet@example.test'
FROM personne_relationnelle WHERE nom_complet = 'Alan Turing';

SELECT usage_adresse, rue, code_postal, ville
FROM adresse
WHERE personne_id = (
    SELECT id FROM personne_relationnelle WHERE nom_complet = 'Alan Turing'
);

SELECT usage_email, adresse_email
FROM email
WHERE personne_id = (
    SELECT id FROM personne_relationnelle WHERE nom_complet = 'Alan Turing'
);
```

Retrouver six adresses et six emails pour Turing, avec les anciennes valeurs conservées. Plusieurs coordonnées peuvent avoir le même usage : la structure ne remplace pas un plafond de cinq par une restriction à une seule coordonnée de chaque type.

Cette comparaison porte sur les coordonnées. Les livres, films, activités, sources et autres propriétés multiples fourniront d’autres occasions de revoir le modèle. Leur normalisation complète reste à travailler selon la progression du module.

## Références des exemples

Les rattachements aux contextes sont des choix pédagogiques fondés sur les liens suivants. Les notices ont été consultées le 19 novembre 2026 ; les coordonnées de simulation ne proviennent pas de ces sources.

- Turing, calcul et cryptanalyse : [archives de King’s College](https://turingarchive.kings.cam.ac.uk/about-alan-turing). Son lien avec le film et l’interprète sont présentés par [Bletchley Park](https://www.youtube.com/watch?v=n2ngy0Mahpo). Sa pratique du marathon et son classement de 1947 sont documentés par les [archives de Sherborne](https://oldshirburnian.org.uk/alan-turings-sporting-life/).
- Al-Khwarizmi, traité d’algèbre et incertitudes biographiques : [MacTutor, université de St Andrews](https://mathshistory.st-andrews.ac.uk/Biographies/Al-Khwarizmi/).
- Hopper, travaux informatiques et carrière navale : [Naval History and Heritage Command](https://www.history.navy.mil/browse-by-topic/people/namesakes/grace-hopper.html).
- Berners-Lee, Web et blog : [page personnelle au W3C](https://www.w3.org/People/Berners-Lee/). Son livre avec Mark Fischetti figure dans sa [liste de publications](https://www.w3.org/People/Berners-Lee/Publications.html).
- Nakamoto et Bitcoin : [texte fondateur](https://bitcoin.org/en/bitcoin-paper). Le pseudonyme et l’identité non établie sont décrits dans cette [notice du Federal Register](https://public-inspection.federalregister.gov/2024-00508.pdf).
- Buterin, naissance en 1994 et rôle dans Ethereum : [histoire du projet Ethereum](https://ethereum.org/ethereum-history-founder-and-ownership). L’adresse du blog est également attestée dans le [dépôt public de son blog](https://github.com/vbuterin/blog/issues/141).
- Johnson, trajectoires spatiales, année de naissance et interprète dans *Hidden Figures* : [biographie de la NASA](https://www.nasa.gov/centers-and-facilities/langley/katherine-johnson-biography/).
- Leibniz, calcul mécanique, naissance en 1646 et *Théodicée* : [MacTutor](https://mathshistory.st-andrews.ac.uk/Biographies/Leibniz/).
- Babbage, machines, naissance en 1791 et autobiographie : [MacTutor](https://mathshistory.st-andrews.ac.uk/Biographies/Babbage/).
- Lovelace, naissance en 1815 et notes sur la machine analytique : [Computer History Museum](https://www.computerhistory.org/babbage/adalovelace/).
- Boole, naissance en 1815, logique et ouvrage retenu : [MacTutor](https://mathshistory.st-andrews.ac.uk/Biographies/Boole/).
- Von Neumann, naissance en 1903, architecture des ordinateurs et *The Computer and the Brain* : [Institute for Advanced Study](https://www.ias.edu/von-neumann).
- Shannon, naissance en 1916, théorie de l’information et cryptographie : [MIT](https://news.mit.edu/2001/shannon). Le livre avec Warren Weaver est présenté par [University of Illinois Press](https://www.press.uillinois.edu/books/?id=p725487).
- Bartik et Holberton, années de naissance et participation à la programmation de l’ENIAC : [entretien conservé au Smithsonian](https://mads.si.edu/mads/id/NMAH-AC0196_bart730427).
- Hamilton, responsabilité dans le logiciel de vol Apollo : [NASA](https://science.nasa.gov/people/margaret-hamilton/). Sa naissance en 1936 est documentée dans son [entretien au Computer History Museum](https://archive.computerhistory.org/resources/access/text/2022/03/102738243-05-01-acc.pdf).
- Vaughan, naissance en 1910, calcul, FORTRAN et interprète dans *Hidden Figures* : [NASA](https://www.nasa.gov/people/dorothy-vaughan/).
- Wilkes, naissance en 1937, LINC, LAP6 et manuel : [archives de Washington University](https://becker.wustl.edu/news/mary-allen-wilkes/).
- Berezin, naissance en 1925, réservations aériennes et Redactron : [Computer History Museum](https://computerhistory.org/profile/evelyn-berezin/).
- Liskov, naissance en 1939, abstraction des données, CLU et systèmes distribués : [Computer History Museum](https://computerhistory.org/profile/barbara-liskov/).
- Codd, naissance en 1923 et bases de données : [IEEE Computer Society](https://history.computer.org/pioneers/codd.html). Son rôle dans le modèle relationnel est rappelé par [ACM SIGMOD](https://www.sigmod.org/sigmod-awards/sigmod-edgar-f-codd-innovations-award/).
- Dijkstra, naissance en 1930 et algorithmique : [MacTutor](https://mathshistory.st-andrews.ac.uk/Biographies/Dijkstra/).
- McCarthy, Lisp et intelligence artificielle : [notice personnelle à Stanford](https://www-formal.stanford.edu/jmc/biography.html). Son année de naissance figure dans la [présentation du prix John McCarthy](https://robots.stanford.edu/ijcai-awards/).
- Knuth, ouvrage et analyse des algorithmes : [Stanford](https://www-cs-faculty.stanford.edu/~knuth/taocp.html). Sa naissance en 1938 figure dans son [curriculum vitæ](https://www-cs-faculty.stanford.edu/~knuth/vita.pdf).

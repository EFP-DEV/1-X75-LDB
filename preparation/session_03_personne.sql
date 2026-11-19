-- Séance 3 : une table personne, 58 champs, 24 figures de l'histoire du calcul
-- et de l'informatique, dont 10 femmes.
-- Exemple pour MySQL 8, à charger dans une base vide.
-- Les références biographiques sont documentées dans session_03_personne.md.
-- Toutes les coordonnées sont inventées pour la simulation contemporaine.
-- Elles ne sont pas les coordonnées réelles des personnes citées.
-- Les indicateurs désignent les contextes retenus pour la séance :
-- 1 = fiche utilisée dans ce contexte ; 0 = contexte non retenu pour cette fiche.
-- Cela ne constitue pas un inventaire exhaustif des activités d'une personne.
-- « acteur » désigne ici la rubrique cinéma, y compris une personne représentée.
-- lien_film précise la relation ; interprete_personne nomme son interprète.
-- Aucun identifiant à ce stade : John von Neumann et John McCarthy
-- montrent qu'un prénom et une ville commune ne suffisent pas au ciblage.

CREATE TABLE personne (
    nom VARCHAR(100),                                  -- 01
    prenom VARCHAR(100),                               -- 02
    nom_complet VARCHAR(200) NOT NULL,                 -- 03
    annee_naissance SMALLINT,                          -- 04
    biographie TEXT,                                  -- 05
    domaine_activite VARCHAR(100),                     -- 06
    acteur BOOLEAN NOT NULL DEFAULT 0,                -- 07
    film_repere VARCHAR(200),                          -- 08
    lien_film VARCHAR(100),                            -- 09
    interprete_personne VARCHAR(150),                  -- 10
    auteur BOOLEAN NOT NULL DEFAULT 0,                -- 11
    livre_repere VARCHAR(250),                         -- 12
    langue_livre VARCHAR(60),                          -- 13
    blogueur BOOLEAN NOT NULL DEFAULT 0,               -- 14
    nom_blog VARCHAR(150),                             -- 15
    url_blog VARCHAR(500),                             -- 16
    transport BOOLEAN NOT NULL DEFAULT 0,              -- 17
    organisation_transport VARCHAR(150),               -- 18
    fonction_transport VARCHAR(150),                   -- 19
    grade_transport VARCHAR(100),                      -- 20
    commerce BOOLEAN NOT NULL DEFAULT 0,               -- 21
    organisation_commerce VARCHAR(150),                -- 22
    fonction_commerce VARCHAR(150),                    -- 23
    cryptographie BOOLEAN NOT NULL DEFAULT 0,          -- 24
    travail_cryptographique VARCHAR(250),              -- 25
    cryptomonnaie BOOLEAN NOT NULL DEFAULT 0,          -- 26
    projet_cryptomonnaie VARCHAR(100),                  -- 27
    contribution_cryptomonnaie VARCHAR(250),            -- 28
    sport BOOLEAN NOT NULL DEFAULT 0,                  -- 29
    discipline_sportive VARCHAR(100),                  -- 30
    performance_sportive VARCHAR(200),                 -- 31
    source_reference VARCHAR(500),                    -- 32
    note_documentaire TEXT,                           -- 33

    telephone_domicile VARCHAR(40),                    -- 34
    telephone_professionnel VARCHAR(40),               -- 35
    telephone_mobile VARCHAR(40),                      -- 36
    telephone_urgence VARCHAR(40),                     -- 37
    telephone_autre VARCHAR(40),                       -- 38

    adresse_domicile_rue VARCHAR(200),                 -- 39
    adresse_domicile_code_postal VARCHAR(20),          -- 40
    adresse_domicile_ville VARCHAR(100),               -- 41
    adresse_livraison_rue VARCHAR(200),                -- 42
    adresse_livraison_code_postal VARCHAR(20),         -- 43
    adresse_livraison_ville VARCHAR(100),              -- 44
    adresse_facturation_rue VARCHAR(200),              -- 45
    adresse_facturation_code_postal VARCHAR(20),       -- 46
    adresse_facturation_ville VARCHAR(100),            -- 47
    adresse_professionnelle_rue VARCHAR(200),          -- 48
    adresse_professionnelle_code_postal VARCHAR(20),  -- 49
    adresse_professionnelle_ville VARCHAR(100),        -- 50
    adresse_autre_rue VARCHAR(200),                    -- 51
    adresse_autre_code_postal VARCHAR(20),             -- 52
    adresse_autre_ville VARCHAR(100),                  -- 53

    email_personnel VARCHAR(254),                      -- 54
    email_professionnel VARCHAR(254),                  -- 55
    email_associatif VARCHAR(254),                     -- 56
    email_administratif VARCHAR(254),                  -- 57
    email_autre VARCHAR(254)                           -- 58
);

-- Une même fiche dans trois contextes : cinéma, cryptographie, sport.
INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    acteur, film_repere, lien_film, interprete_personne,
    cryptographie, travail_cryptographique,
    sport, discipline_sportive, performance_sportive,
    source_reference, note_documentaire
) VALUES (
    'Turing', 'Alan', 'Alan Turing', 1912,
    'Mathématicien ayant travaillé sur le calcul et le décryptage à Bletchley Park.',
    'informatique',
    1, 'The Imitation Game', 'personne représentée', 'Benedict Cumberbatch',
    1, 'Cryptanalyse des messages chiffrés par Enigma',
    1, 'course de fond', '5e du marathon AAA en 1947',
    'https://turingarchive.kings.cam.ac.uk/about-alan-turing',
    'La rubrique acteur inclut ici le sujet du film. Les coordonnées ajoutées sont fictives.'
);

-- Auteur d'un traité ; les dates approximatives restent dans une note.
INSERT INTO personne (
    nom_complet, biographie, domaine_activite,
    auteur, livre_repere, langue_livre, source_reference, note_documentaire
) VALUES (
    'Al-Khwarizmi', 'Mathématicien ayant rédigé un traité d''algèbre.', 'mathématiques',
    1, 'Al-jabr wa-l-muqabala', 'arabe',
    'https://mathshistory.st-andrews.ac.uk/Biographies/Al-Khwarizmi/',
    'Naissance vers 780, année exacte non renseignée. Nom usuel conservé sans imposer une séparation nom/prénom.'
);

-- Le contexte transport est introduit par la marine.
INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    transport, organisation_transport, fonction_transport, grade_transport,
    source_reference, note_documentaire
) VALUES (
    'Hopper', 'Grace', 'Grace Hopper', 1906,
    'Informaticienne et officier de marine ayant travaillé sur les langages de programmation.',
    'informatique',
    1, 'US Navy', 'officier chargée de travaux informatiques', 'rear admiral',
    'https://www.history.navy.mil/browse-by-topic/people/namesakes/grace-hopper.html',
    'Le rattachement au transport passe par la marine ; la fiche ne lui attribue pas le pilotage d''un navire.'
);

-- Une même fiche dans les contextes auteur et blog.
INSERT INTO personne (
    nom, prenom, nom_complet, biographie, domaine_activite,
    auteur, livre_repere, langue_livre, blogueur, nom_blog, url_blog,
    source_reference, note_documentaire
) VALUES (
    'Berners-Lee', 'Tim', 'Tim Berners-Lee', 'Inventeur du World Wide Web.', 'informatique',
    1, 'Weaving the Web', 'anglais',
    1, 'DesignIssues', 'https://www.w3.org/DesignIssues/',
    'https://www.w3.org/People/Berners-Lee/',
    'Weaving the Web est écrit avec Mark Fischetti. Année de naissance non renseignée dans cet extrait.'
);

-- Un pseudonyme ne donne ni identité civile ni année de naissance certaine.
INSERT INTO personne (
    nom_complet, biographie, domaine_activite,
    cryptographie, travail_cryptographique,
    cryptomonnaie, projet_cryptomonnaie, contribution_cryptomonnaie,
    source_reference, note_documentaire
) VALUES (
    'Satoshi Nakamoto', 'Pseudonyme associé au texte fondateur de Bitcoin.', 'informatique',
    1, 'Utilisation de signatures numériques et de hachage dans le protocole Bitcoin',
    1, 'Bitcoin', 'Publication du texte présentant Bitcoin et lancement du projet',
    'https://bitcoin.org/en/bitcoin-paper',
    'Identité civile non établie. Le texte Bitcoin est un article technique, pas le livre demandé dans le contexte librairie.'
);

-- Blog et cryptomonnaie : encore une fiche réutilisée dans plusieurs contextes.
INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    blogueur, nom_blog, url_blog,
    cryptomonnaie, projet_cryptomonnaie, contribution_cryptomonnaie,
    source_reference, note_documentaire
) VALUES (
    'Buterin', 'Vitalik', 'Vitalik Buterin', 1994,
    'Informaticien à l''origine de la proposition Ethereum.', 'informatique',
    1, 'Vitalik Buterin', 'https://vitalik.ca/',
    1, 'Ethereum', 'Proposition initiale et cofondation du projet',
    'https://ethereum.org/ethereum-history-founder-and-ownership',
    'Le blog est une autre entrée vers la même personne. Les contextes retenus ne résument pas toute sa carrière.'
);

-- Cinéma et transport spatial.
INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    acteur, film_repere, lien_film, interprete_personne,
    transport, organisation_transport, fonction_transport,
    source_reference
) VALUES (
    'Johnson', 'Katherine', 'Katherine Johnson', 1918,
    'Mathématicienne ayant calculé des trajectoires de vols spatiaux.', 'mathématiques',
    1, 'Hidden Figures', 'personne représentée', 'Taraji P. Henson',
    1, 'NASA', 'calcul de trajectoires de vols spatiaux',
    'https://www.nasa.gov/centers-and-facilities/langley/katherine-johnson-biography/'
);

-- Fondements du calcul mécanique et de la logique.
INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    auteur, livre_repere, langue_livre, source_reference
) VALUES
(
    'Leibniz', 'Gottfried Wilhelm', 'Gottfried Wilhelm Leibniz', 1646,
    'Mathématicien et philosophe ayant travaillé sur le calcul binaire et une machine à calculer mécanique.',
    'mathématiques', 1, 'Essais de Théodicée', 'français',
    'https://mathshistory.st-andrews.ac.uk/Biographies/Leibniz/'
),
(
    'Babbage', 'Charles', 'Charles Babbage', 1791,
    'Concepteur de la machine à différences et de la machine analytique.',
    'calcul mécanique', 1, 'Passages from the Life of a Philosopher', 'anglais',
    'https://mathshistory.st-andrews.ac.uk/Biographies/Babbage/'
),
(
    'Boole', 'George', 'George Boole', 1815,
    'Mathématicien ayant développé une approche algébrique de la logique, utilisée ensuite dans les circuits numériques.',
    'logique', 1, 'An Investigation of the Laws of Thought', 'anglais',
    'https://mathshistory.st-andrews.ac.uk/Biographies/Boole/'
);

INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    source_reference, note_documentaire
) VALUES (
    'Lovelace', 'Ada', 'Ada Lovelace', 1815,
    'Mathématicienne ayant publié en 1843 des notes sur la machine analytique, avec une procédure de calcul des nombres de Bernoulli.',
    'programmation', 'https://www.computerhistory.org/babbage/adalovelace/',
    'Nom usuel. Ses notes accompagnent une traduction d''article ; elles ne sont pas présentées ici comme un livre autonome.'
);

-- Architecture des ordinateurs et théorie de l'information.
INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    auteur, livre_repere, langue_livre, source_reference
) VALUES (
    'von Neumann', 'John', 'John von Neumann', 1903,
    'Mathématicien ayant contribué à la conception des ordinateurs à programme enregistré et dirigé le projet informatique de l''IAS.',
    'architecture des ordinateurs', 1, 'The Computer and the Brain', 'anglais',
    'https://www.ias.edu/von-neumann'
);

INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    auteur, livre_repere, langue_livre,
    cryptographie, travail_cryptographique, source_reference, note_documentaire
) VALUES (
    'Shannon', 'Claude', 'Claude Shannon', 1916,
    'Chercheur ayant établi les fondements mathématiques de la théorie de l''information.',
    'théorie de l''information',
    1, 'The Mathematical Theory of Communication', 'anglais',
    1, 'Étude mathématique des systèmes de chiffrement dans Communication Theory of Secrecy Systems',
    'https://news.mit.edu/2001/shannon',
    'Le livre The Mathematical Theory of Communication associe Claude Shannon et Warren Weaver.'
);

-- Deux des six programmeuses de l'ENIAC, avec leur contribution propre.
INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    source_reference, note_documentaire
) VALUES
(
    'Bartik', 'Jean', 'Jean Bartik', 1924,
    'Une des six programmeuses initiales de l''ENIAC, impliquée dans la programmation des premiers ordinateurs électroniques.',
    'programmation', 'https://mads.si.edu/mads/id/NMAH-AC0196_bart730427',
    'Également connue sous les noms Betty Jean Jennings et Jean Jennings Bartik.'
),
(
    'Holberton', 'Betty', 'Betty Holberton', 1917,
    'Une des six programmeuses initiales de l''ENIAC, pionnière de la programmation des ordinateurs électroniques.',
    'programmation', 'https://mads.si.edu/mads/id/NMAH-AC0196_bart730427',
    'Également connue sous les noms Frances Elizabeth Snyder et Betty Snyder Holberton.'
);

-- Logiciel de vol, programmation scientifique et transport spatial.
INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    transport, organisation_transport, fonction_transport, source_reference
) VALUES (
    'Hamilton', 'Margaret', 'Margaret Hamilton', 1936,
    'Responsable de l''équipe de développement du logiciel de vol Apollo au laboratoire d''instrumentation du MIT.',
    'génie logiciel', 1, 'MIT Instrumentation Laboratory / NASA',
    'direction du développement du logiciel de vol Apollo',
    'https://science.nasa.gov/people/margaret-hamilton/'
);

INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    acteur, film_repere, lien_film, interprete_personne,
    transport, organisation_transport, fonction_transport, source_reference
) VALUES (
    'Vaughan', 'Dorothy', 'Dorothy Vaughan', 1910,
    'Mathématicienne ayant dirigé l''équipe West Area Computing, puis développé une expertise en programmation FORTRAN.',
    'calcul scientifique',
    1, 'Hidden Figures', 'personne représentée', 'Octavia Spencer',
    1, 'NACA / NASA', 'calcul et programmation pour la recherche aéronautique et le programme Scout',
    'https://www.nasa.gov/people/dorothy-vaughan/'
);

-- L'informatique interactive et les logiciels de laboratoire.
INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    auteur, livre_repere, langue_livre, source_reference, note_documentaire
) VALUES (
    'Wilkes', 'Mary Allen', 'Mary Allen Wilkes', 1937,
    'Programmeuse du LINC et conceptrice de son environnement logiciel LAP6, destiné notamment à la recherche biomédicale.',
    'systèmes interactifs', 1, 'LAP6 Handbook', 'anglais',
    'https://becker.wustl.edu/news/mary-allen-wilkes/',
    'Le livre retenu est un manuel technique rédigé pour les utilisateurs du système.'
);

-- Une pionnière commune aux contextes transport et commerce.
INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    transport, organisation_transport, fonction_transport,
    commerce, organisation_commerce, fonction_commerce, source_reference
) VALUES (
    'Berezin', 'Evelyn', 'Evelyn Berezin', 1925,
    'Conceptrice de systèmes informatiques, dont un système de réservation aérienne et des systèmes de traitement de texte.',
    'systèmes informatiques',
    1, 'Teleregister / United Airlines', 'conception d''un système de réservation de passagers',
    1, 'Redactron', 'cofondatrice et présidente d''une entreprise de traitement de texte',
    'https://computerhistory.org/profile/evelyn-berezin/'
);

-- Abstraction des données, bases relationnelles, algorithmes et langages.
INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    source_reference
) VALUES
(
    'Liskov', 'Barbara', 'Barbara Liskov', 1939,
    'Informaticienne ayant développé l''abstraction des données et dirigé la conception du langage CLU ; travaux sur les systèmes distribués.',
    'langages de programmation', 'https://computerhistory.org/profile/barbara-liskov/'
),
(
    'Codd', 'Edgar Frank', 'Edgar Frank Codd', 1923,
    'Informaticien à l''origine du modèle relationnel des bases de données.',
    'bases de données', 'https://history.computer.org/pioneers/codd.html'
),
(
    'Dijkstra', 'Edsger', 'Edsger Dijkstra', 1930,
    'Informaticien connu pour son algorithme de plus court chemin et ses travaux sur la rigueur de la programmation.',
    'algorithmique', 'https://mathshistory.st-andrews.ac.uk/Biographies/Dijkstra/'
),
(
    'McCarthy', 'John', 'John McCarthy', 1927,
    'Créateur du langage Lisp et pionnier de l''intelligence artificielle et du partage de temps.',
    'intelligence artificielle', 'https://www-formal.stanford.edu/jmc/biography.html'
);

INSERT INTO personne (
    nom, prenom, nom_complet, annee_naissance, biographie, domaine_activite,
    auteur, livre_repere, langue_livre, source_reference
) VALUES (
    'Knuth', 'Donald', 'Donald Knuth', 1938,
    'Informaticien ayant systématisé l''analyse des algorithmes et créé le système de composition TeX.',
    'algorithmique', 1, 'The Art of Computer Programming', 'anglais',
    'https://www-cs-faculty.stanford.edu/~knuth/taocp.html'
);

-- Simulation : Turing reçoit cinq coordonnées de chaque famille.
-- Les téléphones, rues et emails ci-dessous sont entièrement inventés.
-- Le téléphone d'urgence sert à joindre une personne à prévenir.
UPDATE personne SET
    telephone_domicile = '+32 2 000 10 01',
    telephone_professionnel = '+32 2 000 10 02',
    telephone_mobile = '+32 470 00 10 03',
    telephone_urgence = '+32 470 00 10 04',
    telephone_autre = '+32 470 00 10 05',
    adresse_domicile_rue = '18 rue des Ateliers, boîte 2',
    adresse_domicile_code_postal = '1030',
    adresse_domicile_ville = 'Schaerbeek',
    adresse_livraison_rue = '7 avenue des Albums',
    adresse_livraison_code_postal = '1050',
    adresse_livraison_ville = 'Ixelles',
    adresse_facturation_rue = '18 rue des Ateliers, boîte 2',
    adresse_facturation_code_postal = '1030',
    adresse_facturation_ville = 'Schaerbeek',
    adresse_professionnelle_rue = '42 rue des Tilleuls',
    adresse_professionnelle_code_postal = '1060',
    adresse_professionnelle_ville = 'Saint-Gilles',
    adresse_autre_rue = '5 chemin des Gravures',
    adresse_autre_code_postal = '5000',
    adresse_autre_ville = 'Namur',
    email_personnel = 'alan.personnel@example.test',
    email_professionnel = 'alan.travail@example.test',
    email_associatif = 'alan.club@example.test',
    email_administratif = 'alan.dossiers@example.test',
    email_autre = 'alan.autre@example.test'
WHERE nom_complet = 'Alan Turing';

UPDATE personne SET
    telephone_professionnel = '+32 2 000 20 01',
    telephone_mobile = '+32 470 00 20 02',
    adresse_professionnelle_rue = '8 quai des Cartes',
    adresse_professionnelle_code_postal = '1000',
    adresse_professionnelle_ville = 'Bruxelles',
    email_professionnel = 'grace.travail@example.test'
WHERE nom_complet = 'Grace Hopper';

UPDATE personne SET
    telephone_mobile = '+32 470 00 30 01',
    adresse_domicile_rue = '6 rue des Carnets',
    adresse_domicile_code_postal = '1050',
    adresse_domicile_ville = 'Ixelles',
    email_personnel = 'tim.personnel@example.test',
    email_professionnel = 'tim.travail@example.test'
WHERE nom_complet = 'Tim Berners-Lee';

-- Les deux John ont le même prénom et la même ville dans la simulation.
UPDATE personne SET
    telephone_mobile = '+32 470 00 40 01',
    adresse_domicile_rue = '9 rue des Reliures',
    adresse_domicile_code_postal = '1000',
    adresse_domicile_ville = 'Bruxelles',
    email_personnel = 'john.vonneumann@example.test'
WHERE nom = 'von Neumann' AND prenom = 'John';

UPDATE personne SET
    telephone_mobile = '+32 470 00 50 01',
    adresse_domicile_rue = '11 rue des Presses',
    adresse_domicile_code_postal = '1000',
    adresse_domicile_ville = 'Bruxelles',
    email_personnel = 'john.mccarthy@example.test'
WHERE nom = 'McCarthy' AND prenom = 'John';

-- Les coordonnées non fournies restent NULL ; ne pas les inventer en classe.

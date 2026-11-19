-- Séance 3 — Tableau « Personne » construit en classe, MySQL 8.
-- Dans un DB Fiddle vide, coller tout le fichier dans « Schema SQL ».
-- Une ligne représente une personne. Les 23 champs suivent l'ordre du tableau.
-- Seuls les deux champs marqués « oui » en classe sont obligatoires.

CREATE TABLE personne (
    nationalite CHAR(3),                    -- Code pays ISO à trois lettres.
    nom_prenom VARCHAR(320) NOT NULL,
    date_de_naissance SMALLINT UNSIGNED,    -- Option « entier » du tableau : année de naissance.
    recompenses VARCHAR(150),
    film_phare TEXT,                        -- Titre du film.
    popularite INT UNSIGNED,                -- Nombre de votes reçus par la fiche dans l'exercice.
    role_film_phare TEXT,
    biographie LONGTEXT,
    bibliographie LONGTEXT,
    fonction_editeur VARCHAR(30) NOT NULL,  -- Fonction dans la simulation éditoriale.
    niveau_autorisation VARCHAR(30),        -- Libellé du droit accordé dans la simulation.
    fonction_medecin TEXT,
    code_postal VARCHAR(20),                -- Le texte conserve les zéros initiaux.
    rue TEXT,
    ville TEXT,
    pays TEXT,
    code_postal_livraison VARCHAR(20),
    rue_livraison TEXT,
    ville_livraison TEXT,
    code_postal_facturation VARCHAR(20),
    dossier_medical TEXT,
    antecedent TEXT,
    allergies TEXT
) DEFAULT CHARACTER SET utf8mb4;

-- Les 24 fiches reprennent les biographies documentées dans session_03_personne.md.
-- Les fonctions éditoriales, les droits, les votes et les adresses sont fictifs.
-- Les colonnes médicales restent NULL pour toutes les personnes.

INSERT INTO personne
    (nom_prenom, date_de_naissance, biographie, bibliographie, fonction_editeur)
VALUES
    ('Al-Khwarizmi', NULL, 'Mathématicien ayant rédigé un traité d’algèbre en arabe.',
     'Al-jabr wa-l-muqabala', 'rédaction'),
    ('Gottfried Wilhelm Leibniz', 1646, 'A travaillé sur le calcul binaire et construit une machine à calculer mécanique.',
     'Essais de Théodicée', 'relecture'),
    ('Charles Babbage', 1791, 'A conçu la machine à différences et la machine analytique.',
     'Passages from the Life of a Philosopher', 'rédaction'),
    ('Ada Lovelace', 1815, 'A publié en 1843 une procédure pour calculer les nombres de Bernoulli avec la machine analytique.',
     'Notes sur la machine analytique, jointes à sa traduction de l’article de Menabrea (1843)', 'publication'),
    ('George Boole', 1815, 'A développé une approche algébrique de la logique utilisée dans les circuits numériques.',
     'An Investigation of the Laws of Thought', 'relecture'),
    ('John von Neumann', 1903, 'A contribué à la conception des ordinateurs à programme enregistré.',
     'The Computer and the Brain', 'rédaction'),
    ('Claude Shannon', 1916, 'A établi les fondements mathématiques de la théorie de l’information.',
     'The Mathematical Theory of Communication (avec Warren Weaver)', 'relecture');

INSERT INTO personne
    (nom_prenom, date_de_naissance, biographie, fonction_editeur)
VALUES
    ('Grace Hopper', 1906, 'Informaticienne et officier de marine, elle a travaillé sur les langages de programmation.', 'relecture'),
    ('Jean Bartik', 1924, 'A programmé l’ENIAC au sein de l’équipe initiale de six programmeuses.', 'publication'),
    ('Betty Holberton', 1917, 'A fait partie des six programmeuses de l’ENIAC.', 'rédaction'),
    ('Margaret Hamilton', 1936, 'A dirigé l’équipe du MIT chargée de développer le logiciel de vol du programme Apollo.', 'publication'),
    ('Mary Allen Wilkes', 1937, 'A conçu l’environnement logiciel LAP6 pour l’ordinateur de laboratoire LINC.', 'rédaction'),
    ('Evelyn Berezin', 1925, 'A conçu des systèmes de réservation aérienne et de traitement de texte.', 'relecture'),
    ('Satoshi Nakamoto', NULL, 'Pseudonyme utilisé pour publier le texte fondateur de Bitcoin.', 'rédaction'),
    ('Vitalik Buterin', 1994, 'A proposé Ethereum et participé à la fondation du projet.', 'relecture');

-- Ici, la fiche décrit la personne dont la vie est portée à l'écran.
INSERT INTO personne
    (nom_prenom, date_de_naissance, biographie, film_phare, role_film_phare, fonction_editeur)
VALUES
    ('Alan Turing', 1912, 'A travaillé sur les fondements du calcul et sur le décryptage à Bletchley Park.',
     'The Imitation Game', 'Personne représentée à l’écran par Benedict Cumberbatch', 'relecture'),
    ('Katherine Johnson', 1918, 'A calculé des trajectoires de vols spatiaux pour la NASA.',
     'Hidden Figures', 'Personne représentée à l’écran par Taraji P. Henson', 'publication'),
    ('Dorothy Vaughan', 1910, 'A dirigé le groupe West Area Computing et programmé en FORTRAN.',
     'Hidden Figures', 'Personne représentée à l’écran par Octavia Spencer', 'rédaction');

-- Palmarès de l'ACM : https://awards.acm.org/binaries/content/assets/awards/awards-booklet-2019.pdf
INSERT INTO personne
    (nom_prenom, date_de_naissance, biographie, recompenses, fonction_editeur)
VALUES
    ('John McCarthy', 1927, 'A créé Lisp et contribué aux débuts de l’intelligence artificielle.', 'Prix Turing 1971', 'relecture'),
    ('Edsger Dijkstra', 1930, 'A conçu un algorithme de recherche du plus court chemin dans un graphe.', 'Prix Turing 1972', 'rédaction'),
    ('Donald Knuth', 1938, 'A consacré ses travaux à l’analyse des algorithmes et créé le système de composition TeX.', 'Prix Turing 1974', 'publication'),
    ('Edgar Frank Codd', 1923, 'A proposé le modèle relationnel des bases de données.', 'Prix Turing 1981', 'rédaction'),
    ('Barbara Liskov', 1939, 'A dirigé la conception du langage CLU et travaillé sur l’abstraction des données et les systèmes distribués.', 'Prix Turing 2008', 'relecture'),
    ('Tim Berners-Lee', 1955, 'A inventé le World Wide Web.', 'Prix Turing 2016', 'publication');

-- Compléments documentaires.
UPDATE personne SET bibliographie = 'LAP6 Handbook' WHERE nom_prenom = 'Mary Allen Wilkes';
UPDATE personne SET bibliographie = 'The Art of Computer Programming' WHERE nom_prenom = 'Donald Knuth';
-- https://www.w3.org/People/Berners-Lee/MIT-CV.html
UPDATE personne SET nationalite = 'GBR', bibliographie = 'Weaving the Web (avec Mark Fischetti)'
WHERE nom_prenom = 'Tim Berners-Lee';
-- https://www.gov.uk/government/case-studies/how-expert-advice-inspired-the-national-centre-for-data-science
UPDATE personne SET nationalite = 'GBR' WHERE nom_prenom = 'Alan Turing';
-- https://www.americanhistory.si.edu/collections/object-groups/women-mathematicians/grace-hopper-the-navy-and-computers
UPDATE personne SET nationalite = 'USA' WHERE nom_prenom = 'Grace Hopper';
-- https://ir.cwi.nl/pub/30466/the-man-who-carried-computer-science-on-his-shoulders.pdf
UPDATE personne SET nationalite = 'NLD' WHERE nom_prenom = 'Edsger Dijkstra';

-- Quelques valeurs de simulation pour comparer une adresse, une livraison et une facturation.
UPDATE personne SET
    rue = '18 rue des Ateliers', code_postal = '1030', ville = 'Schaerbeek', pays = 'Belgique',
    rue_livraison = '7 avenue des Albums', code_postal_livraison = '1050', ville_livraison = 'Ixelles',
    code_postal_facturation = '1030', popularite = 12, niveau_autorisation = 'commenter'
WHERE nom_prenom = 'Alan Turing';

UPDATE personne SET
    rue = '8 quai des Cartes', code_postal = '1000', ville = 'Bruxelles', pays = 'Belgique',
    rue_livraison = '8 quai des Cartes', code_postal_livraison = '1000', ville_livraison = 'Bruxelles',
    code_postal_facturation = '1000', popularite = 12, niveau_autorisation = 'commenter'
WHERE nom_prenom = 'Grace Hopper';

UPDATE personne SET popularite = 0, niveau_autorisation = 'publier'
WHERE nom_prenom = 'Ada Lovelace';

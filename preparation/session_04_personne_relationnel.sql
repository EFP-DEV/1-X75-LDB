-- Séance 4 : comparaison avec des coordonnées dans des tables liées.
-- MySQL 8. Charger d'abord session_03_personne.sql, puis ce fichier.
-- Partir du jeu initial avant les manipulations CRUD de la classe.
-- La table personne reste disponible pour comparer les mêmes données.
-- Les 24 fiches sont copiées ; toutes les coordonnées renseignées sont reprises.
-- Ce script de préparation est destiné à l'enseignant.

CREATE TABLE personne_relationnelle LIKE personne;
INSERT INTO personne_relationnelle SELECT * FROM personne;

ALTER TABLE personne_relationnelle
    ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

CREATE TABLE telephone (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    personne_id INT NOT NULL,
    usage_telephone VARCHAR(100) NOT NULL,
    numero VARCHAR(40) NOT NULL,
    FOREIGN KEY (personne_id) REFERENCES personne_relationnelle(id)
);

CREATE TABLE adresse (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    personne_id INT NOT NULL,
    usage_adresse VARCHAR(100) NOT NULL,
    rue VARCHAR(200) NOT NULL,
    code_postal VARCHAR(20) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    FOREIGN KEY (personne_id) REFERENCES personne_relationnelle(id)
);

CREATE TABLE email (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    personne_id INT NOT NULL,
    usage_email VARCHAR(100) NOT NULL,
    adresse_email VARCHAR(254) NOT NULL,
    FOREIGN KEY (personne_id) REFERENCES personne_relationnelle(id)
);

-- Chaque emplacement renseigné devient une ligne.
-- UNION ALL conserve aussi les valeurs identiques utilisées à plusieurs fins.
INSERT INTO telephone (personne_id, usage_telephone, numero)
SELECT id, 'domicile', telephone_domicile
FROM personne_relationnelle WHERE telephone_domicile IS NOT NULL
UNION ALL
SELECT id, 'professionnel', telephone_professionnel
FROM personne_relationnelle WHERE telephone_professionnel IS NOT NULL
UNION ALL
SELECT id, 'mobile', telephone_mobile
FROM personne_relationnelle WHERE telephone_mobile IS NOT NULL
UNION ALL
SELECT id, 'urgence', telephone_urgence
FROM personne_relationnelle WHERE telephone_urgence IS NOT NULL
UNION ALL
SELECT id, 'autre', telephone_autre
FROM personne_relationnelle WHERE telephone_autre IS NOT NULL;

-- Dans ce jeu précis, chaque adresse fournie comporte ses trois éléments.
INSERT INTO adresse (personne_id, usage_adresse, rue, code_postal, ville)
SELECT id, 'domicile', adresse_domicile_rue,
    adresse_domicile_code_postal, adresse_domicile_ville
FROM personne_relationnelle WHERE adresse_domicile_rue IS NOT NULL
UNION ALL
SELECT id, 'livraison', adresse_livraison_rue,
    adresse_livraison_code_postal, adresse_livraison_ville
FROM personne_relationnelle WHERE adresse_livraison_rue IS NOT NULL
UNION ALL
SELECT id, 'facturation', adresse_facturation_rue,
    adresse_facturation_code_postal, adresse_facturation_ville
FROM personne_relationnelle WHERE adresse_facturation_rue IS NOT NULL
UNION ALL
SELECT id, 'professionnelle', adresse_professionnelle_rue,
    adresse_professionnelle_code_postal, adresse_professionnelle_ville
FROM personne_relationnelle WHERE adresse_professionnelle_rue IS NOT NULL
UNION ALL
SELECT id, 'autre', adresse_autre_rue,
    adresse_autre_code_postal, adresse_autre_ville
FROM personne_relationnelle WHERE adresse_autre_rue IS NOT NULL;

INSERT INTO email (personne_id, usage_email, adresse_email)
SELECT id, 'personnel', email_personnel
FROM personne_relationnelle WHERE email_personnel IS NOT NULL
UNION ALL
SELECT id, 'professionnel', email_professionnel
FROM personne_relationnelle WHERE email_professionnel IS NOT NULL
UNION ALL
SELECT id, 'associatif', email_associatif
FROM personne_relationnelle WHERE email_associatif IS NOT NULL
UNION ALL
SELECT id, 'administratif', email_administratif
FROM personne_relationnelle WHERE email_administratif IS NOT NULL
UNION ALL
SELECT id, 'autre', email_autre
FROM personne_relationnelle WHERE email_autre IS NOT NULL;

-- Les valeurs étant reprises dans les tables liées, retirer les 25 colonnes
-- de coordonnées de la copie. La table initiale personne reste intacte.
ALTER TABLE personne_relationnelle
    DROP COLUMN telephone_domicile,
    DROP COLUMN telephone_professionnel,
    DROP COLUMN telephone_mobile,
    DROP COLUMN telephone_urgence,
    DROP COLUMN telephone_autre,
    DROP COLUMN adresse_domicile_rue,
    DROP COLUMN adresse_domicile_code_postal,
    DROP COLUMN adresse_domicile_ville,
    DROP COLUMN adresse_livraison_rue,
    DROP COLUMN adresse_livraison_code_postal,
    DROP COLUMN adresse_livraison_ville,
    DROP COLUMN adresse_facturation_rue,
    DROP COLUMN adresse_facturation_code_postal,
    DROP COLUMN adresse_facturation_ville,
    DROP COLUMN adresse_professionnelle_rue,
    DROP COLUMN adresse_professionnelle_code_postal,
    DROP COLUMN adresse_professionnelle_ville,
    DROP COLUMN adresse_autre_rue,
    DROP COLUMN adresse_autre_code_postal,
    DROP COLUMN adresse_autre_ville,
    DROP COLUMN email_personnel,
    DROP COLUMN email_professionnel,
    DROP COLUMN email_associatif,
    DROP COLUMN email_administratif,
    DROP COLUMN email_autre;

-- Structure obtenue : 34 champs dans personne_relationnelle,
-- 4 dans telephone, 6 dans adresse et 4 dans email : 48 au total.
-- Aucune contrainte d'unicité sur (personne_id, usage) : deux téléphones
-- professionnels ou deux adresses de livraison sont possibles.

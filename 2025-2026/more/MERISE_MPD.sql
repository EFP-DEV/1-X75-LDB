-- Création des tables pour la gestion des stages d'apprenants

-- Table des formations
CREATE TABLE formations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(200) NOT NULL,
    niveau VARCHAR(50),
    specialite VARCHAR(100),
    duree_mois INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des apprenants
CREATE TABLE apprenants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telephone VARCHAR(20),
    formation_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (formation_id) REFERENCES formations(id)
);

-- Table des entreprises
CREATE TABLE entreprises (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(200) NOT NULL,
    adresse TEXT,
    secteur VARCHAR(100),
    contact_email VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des tuteurs pédagogiques
CREATE TABLE tuteurs_pedagogiques (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    specialite VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des tuteurs d'entreprise
CREATE TABLE tuteurs_entreprise (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    fonction VARCHAR(100),
    entreprise_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (entreprise_id) REFERENCES entreprises(id)
);

-- Table des offres de stage
CREATE TABLE offres_stage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    description TEXT,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    competences_requises TEXT,
    remuneration DECIMAL(10,2),
    entreprise_id INT NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (entreprise_id) REFERENCES entreprises(id),
    CHECK (date_debut < date_fin)
);

-- Table des candidatures
CREATE TABLE candidatures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_soumission DATE NOT NULL,
    statut VARCHAR(50) DEFAULT 'en_attente',
    lettre_motivation TEXT,
    apprenant_id INT NOT NULL,
    offre_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (apprenant_id) REFERENCES apprenants(id),
    FOREIGN KEY (offre_id) REFERENCES offres_stage(id),
    CONSTRAINT uk_apprenant_offre UNIQUE (apprenant_id, offre_id)
);

-- Table des stages
CREATE TABLE stages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    evaluation_entreprise TEXT,
    evaluation_apprenant TEXT,
    rapport_url VARCHAR(255),
    apprenant_id INT NOT NULL,
    offre_id INT NOT NULL,
    tuteur_pedagogique_id INT,
    tuteur_entreprise_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (apprenant_id) REFERENCES apprenants(id),
    FOREIGN KEY (offre_id) REFERENCES offres_stage(id),
    FOREIGN KEY (tuteur_pedagogique_id) REFERENCES tuteurs_pedagogiques(id),
    FOREIGN KEY (tuteur_entreprise_id) REFERENCES tuteurs_entreprise(id),
    CHECK (date_debut < date_fin)
);
# Modélisations Conceptuelles des Données (MCD)

Vous trouverez ci-dessous, pour chaque exercice de la premiere session, un exemple de MCD (Modèle Conceptuel des Données) répondant aux **contraintes** décrites. Chaque schéma illustre les **entités**, leurs **attributs clés** et les **associations** entre elles, au niveau conceptuel (les cardinalités peuvent être précisées ou simplifiées selon les besoins).

---

## Exercice 1 : Cinéma – Films et Acteurs

**Contexte :** Une plateforme de streaming cinématographique nécessite une base pour cataloguer ses films et acteurs.

**Contraintes principales :**
- Films : titre, genre, langue originale, année de production, pays, budget, durée, classification par âge, note moyenne.
- Acteurs : informations biographiques (nom, date de naissance, nationalité, etc.).

### MCD proposé
```plaintext
         ┌──────────────────────┐
         │       Film           │
         ├──────────────────────┤
         │ id_film              │
         │ titre                │
         │ genre                │
         │ langue_originale     │
         │ annee                │
         │ pays_production      │
         │ budget               │
         │ duree                │
         │ classification_age   │
         │ note_moyenne         │
         └──────────────────────┘
                │    0,N
                │ joue dans
                │    0,N
         ┌──────────────────────┐
         │       Acteur         │
         ├──────────────────────┤
         │ id_acteur            │
         │ nom                  │
         │ date_naissance       │
         │ nationalite          │
         │ infos_biographiques  │
         └──────────────────────┘
```
- **Association** : un film peut avoir plusieurs acteurs, et un acteur peut jouer dans plusieurs films (**M,N**).  
- Attributs principaux indiqués pour tenir compte des informations minimales requises (genre, pays, budget, etc.).

---

## Exercice 2 : Librairie – Livres et Auteurs

**Contexte :** Une librairie souhaite digitaliser son inventaire.

**Contraintes principales :**
- Livres : ISBN unique, titre, formats (poche, grand format, numérique), année de publication, stock, prix.
- Auteurs : données biographiques, bibliographie.
- Gestion de l’inventaire (stock).

### MCD proposé
```plaintext
          ┌────────────────────┐
          │       Livre        │
          ├────────────────────┤
          │ isbn               │
          │ titre              │
          │ format             │
          │ annee_publication  │
          │ stock              │
          │ prix               │
          └────────────────────┘
                │    M,N
                │ ecrit par
                │
          ┌────────────────────┐
          │      Auteur        │
          ├────────────────────┤
          │ id_auteur          │
          │ nom                │
          │ prenom             │
          │ bio                │
          └────────────────────┘
```
- **Association** : un auteur peut écrire plusieurs livres, et un livre peut avoir plusieurs auteurs (**M,N**).  
- L’**ISBN** sert de clé unique pour l’entité **Livre**.  

---

## Exercice 3 : Blog – Articles et Éditeurs

**Contexte :** Un média en ligne modernise sa plateforme de publication.

**Contraintes principales :**
- Articles : titre, contenu, date de publication, statut (brouillon, révision, publié, archivé), catégories.
- Éditeurs : rôle, niveau d’autorisation.

### MCD proposé
```plaintext
            ┌────────────────────┐
            │     Article        │
            ├────────────────────┤
            │ id_article         │
            │ titre              │
            │ contenu            │
            │ date_publication   │
            │ statut             │
            │ categorie          │
            └────────────────────┘
                  │    M,N
                  │ publie
                  │
            ┌────────────────────┐
            │     Editeur        │
            ├────────────────────┤
            │ id_editeur         │
            │ nom                │
            │ role               │
            │ niveau_autorisation│
            └────────────────────┘
```
- **Association** : un éditeur peut publier plusieurs articles, et un article peut être publié (ou modifié) par plusieurs éditeurs (**M,N**).  
- Le **statut** permet de gérer le cycle de vie de l’article.

---

## Exercice 4 : Transport – Pays et Villes

**Contexte :** Application de planification d’itinéraires internationaux.

**Contraintes principales :**
- Pays : code ISO, langues officielles, devises, informations démographiques.
- Villes : coordonnées géographiques, fuseau horaire, informations démographiques, codes d’aéroports/gares.

### MCD proposé
```plaintext
             ┌────────────────────┐
             │       Pays         │
             ├────────────────────┤
             │ code_iso           │
             │ nom_pays           │
             │ langue_officielle  │
             │ devise             │
             │ population         │
             └────────────────────┘
                   │    1,N
                   │ contient
                   │
             ┌────────────────────┐
             │       Ville        │
             ├────────────────────┤
             │ id_ville           │
             │ nom_ville          │
             │ coordonnees        │
             │ fuseau_horaire     │
             │ population         │
             │ code_aeroport      │
             │ code_gare          │
             └────────────────────┘
```
- **Association** : un pays contient plusieurs villes, mais chaque ville n’appartient qu’à un seul pays (**1,N**).  

---

## Exercice 5 : Langues du monde

**Contexte :** Application pour linguistes et traducteurs.

**Contraintes principales :**
- Langue : code ISO, famille linguistique, statut, système d’écriture, nombre de locuteurs, régions.
- Peut être parlé dans plusieurs régions/lieux, et une région peut avoir plusieurs langues officielles.

### MCD proposé
```plaintext
                 ┌────────────────────────┐
                 │        Langue          │
                 ├────────────────────────┤
                 │ code_iso              │
                 │ nom_langue            │
                 │ famille_linguistique  │
                 │ statut                │
                 │ systeme_ecriture      │
                 │ nb_locuteurs          │
                 └────────────────────────┘
                       │    M,N
                       │ est parlée dans
                       │
                 ┌────────────────────────┐
                 │        Region          │
                 ├────────────────────────┤
                 │ id_region             │
                 │ nom_region            │
                 │ pays_principaux       │
                 └────────────────────────┘
```
- **Association** : une langue peut être parlée dans plusieurs régions, et une région peut comporter plusieurs langues (**M,N**).  
- Les attributs reflètent la **famille linguistique**, le **système d’écriture**, etc.

---

## Exercice 6 : E-commerce – Clients et Produits

**Contexte :** Une boutique en ligne multi-marchés.

**Contraintes principales :**
- Produits : référence unique, description, prix, stock, disponibilité.
- Clients : informations de contact/facturation, historique des commandes.

### MCD proposé
```plaintext
             ┌─────────────────────┐
             │      Produit        │
             ├─────────────────────┤
             │ ref_produit         │
             │ description         │
             │ prix                │
             │ stock               │
             │ disponibilite       │
             └─────────────────────┘
                   │    M,N
                   │ commande
                   │
             ┌─────────────────────┐
             │      Client         │
             ├─────────────────────┤
             │ id_client           │
             │ nom                 │
             │ prenom              │
             │ email               │
             │ adresse_facturation │
             │ historique_cmd      │
             └─────────────────────┘
```
- **Association** : simplifiée ici en **M,N** (un client peut commander plusieurs produits, et un produit peut être commandé par plusieurs clients).  
- Dans une vraie modélisation, on introduirait souvent une **entité Commande** ainsi qu’une **LigneCommande** pour gérer les détails (quantité, date, etc.).

---

## Exercice 7 : Hôpital – Médecins et Patients

**Contexte :** Système de gestion hospitalier pour le suivi des consultations.

**Contraintes principales :**
- Médecins : spécialités, numéros de licence, horaires.
- Patients : dossier médical, antécédents, allergies, assurance médicale.
- Chaque consultation doit être datée et documentée.

### MCD proposé
```plaintext
┌────────────────────────┐           ┌────────────────────────┐
│       Médecin          │           │     Consultation       │           ┌────────────────────────┐
├────────────────────────┤           ├────────────────────────┤           │       Patient          │
│ id_medecin             │<──────────┤ id_consultation        │──────────>│ id_patient             │
│ nom                    │    1,N    │ id_medecin             │    1,N    │ nom                    │
│ prenom                 │           │ id_patient             │           │ prenom                 │
│ specialite             │           │ date_consultation      │           │ dossier_medical        │
│ num_licence            │           │ notes                  │           │ antecedents            │
│ horaires               │           │ diagnostic             │           │ allergies              │
└────────────────────────┘           └────────────────────────┘           │ assurance_medicale     │
                                                                          └────────────────────────┘

```
**Association** :  
- Un médecin peut effectuer plusieurs consultations (1,N)
- Un patient peut avoir plusieurs consultations (1,N)
- Chaque consultation concerne exactement un médecin et un patient

---

## Exercice 8 : École – Étudiants et Cours

**Contexte :** Système de gestion académique pour une université.

**Contraintes principales :**
- Étudiants : numéro unique, coordonnées, résultats académiques.
- Cours : code, intitulé, crédits, département, horaires, salles attribuées.

### MCD proposé
```plaintext
             ┌─────────────────────────┐
             │      Etudiant           │
             ├─────────────────────────┤
             │ id_etudiant             │
             │ nom                     │
             │ prenom                  │
             │ email                   │
             │ adresse                 │
             │ results_academiques     │
             └─────────────────────────┘
                   │    M,N
                   │ suit
                   │
             ┌───────────────────────┐
             │        Cours          │
             ├───────────────────────┤
             │ code_cours            │
             │ intitule              │
             │ credits               │
             │ departement           │
             │ horaire               │
             │ salle                 │
             └───────────────────────┘
```
- **Association** : un étudiant peut suivre plusieurs cours, et un cours peut être suivi par plusieurs étudiants (**M,N**).  
- Les **résultats académiques** peuvent être détaillés dans une autre entité si nécessaire (ex. : Note, date d’examen, etc.).

---

## Notes sur l’Évaluation

Pour chaque exercice, on évalue :
1. **L’exhaustivité** des champs identifiés.
2. La **cohérence du nommage** et des **types de données** (non représentés ici, car on reste au niveau conceptuel).
3. La **pertinence des clés primaires** (identifiant unique pour chaque entité).
4. L’**anticipation des besoins réels** d’utilisation (ex. prévoir une entité intermédiaire si la relation M,N nécessite plus d’informations, comme la date de commande, la quantité, etc.).

Ces MCD simplifiés peuvent ensuite être affinés et enrichis au fur et à mesure que les besoins sont clarifiés, notamment en préparant le **passage au Modèle Logique** (MLD), puis au **Modèle Physique** (tables SQL).

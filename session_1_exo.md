# **Exercices de modélisation des tables simples**

## **Objectif de l'exercice**
L'objectif de cet exercice est de se familiariser avec la modélisation de bases de données en identifiant les **entités**, leurs **champs** et leurs **relations**. Cet exercice vous permettra de développer une approche méthodique dans la définition des structures de données.

Chaque scénario représente un **contexte réel**, et vous devrez identifier les **données à stocker**, définir leurs caractéristiques et créer les tables correspondantes.

---

## **Instructions générales**
Pour **chaque exercice**, vous devez :

1. **Nommer les tables** de manière cohérente.
2. **Lister les données à stocker** pour chaque entité.
3. **Définir les champs de chaque table**, en précisant :
   - **Le nom du champ** (doit suivre une convention uniforme).
   - **Le type de données** (`INT`, `VARCHAR`, `CHAR`, `TEXT`, `DATE`).
   - **Sa longueur** (si applicable).
   - **S’il est obligatoire** ou facultatif.
   - **Tout commentaire pertinent** (exemple : duree en minute, standard ISO, ..).

---

## **Critères d’évaluation**

Cet exercice ne sera pas noté, mais il sera discuté en groupe. Vous devez être capable de justifier vos choix de modélisation et d'expliquer les raisons derrière chaque décision.
- La **clarté** et la **cohérence** de votre modélisation.
- La **pertinence** des types de données choisis.


**Remarque :** Adoptez une approche méthodique et justifiez vos choix lorsque c'est nécessaire.  


## **Tableau guide pour structurer l’exercice**
Utilisez ce tableau pour organiser vos réponses avant de rédiger les scripts SQL.

| Table | Commentaire | Identifiant(s) |
|-----|------------|----------------|
| movie | Contient les informations sur les films | id |

| Champs | Type | Longueur | Obligatoire | Commentaires |
|-----|------|----------|-------------|--------------|
| id | INT | - | Oui | PK auto-inc. |
 | label | VARCHAR | 255 | Oui | Titre original  |
| released | INT | - | Oui | Année de sortie |
| réalisateur | VARCHAR | 150 | Oui | Nom du réalisateur |


---

## Exercice 1 : Cinéma - Films et Acteurs

**Contexte:** Une plateforme de streaming cinématographique nécessite une base de données pour cataloguer ses films et acteurs.

**Contraintes:**
- Les films doivent être classifiés par genre et langue originale
- Les informations de production doivent inclure l'année, le pays et le budget
- Chaque film a une durée, une classification par âge et une note moyenne
- Pour les acteurs, capturer les informations biographiques essentielles

## Exercice 2 : Librairie - Livres et Auteurs

**Contexte:** Une librairie indépendante souhaite digitaliser son inventaire.

**Contraintes:**
- Les livres existent en plusieurs formats (poche, grand format, numérique)
- Chaque livre possède un ISBN unique, un titre, une année de publication
- Le système doit gérer les informations d'inventaire (stock, prix)
- Pour les auteurs, stocker les données biographiques et bibliographiques

## Exercice 3 : Blog - Articles et Éditeurs

**Contexte:** Un média en ligne souhaite moderniser sa plateforme de publication.

**Contraintes:**
- Les articles possèdent un titre, un contenu, une date de publication
- Chaque article a un statut (brouillon, révision, publié, archivé)
- Les éditeurs ont différents rôles et niveaux d'autorisation
- Le système doit permettre la catégorisation des articles

## Exercice 4 : Transport - Pays et Villes

**Contexte:** Une application de planification d'itinéraires internationaux.

**Contraintes:**
- Les pays ont des codes ISO, des langues officielles et des devises
- Les villes possèdent des coordonnées géographiques et des fuseaux horaires
- Les informations démographiques doivent être stockées
- Les codes d'aéroports et de gares sont nécessaires pour les villes principales

## Exercice 5 : Langues du monde

**Contexte:** Une application pour linguistes et traducteurs.

**Contraintes:**
- Chaque langue a un code ISO, une famille linguistique et un statut
- Le système doit stocker les informations sur les systèmes d'écriture
- Pour chaque langue, indiquer le nombre approximatif de locuteurs
- Documenter les régions où la langue est parlée

## Exercice 6 : E-commerce - Clients et Produits

**Contexte:** Une boutique en ligne multi-marchés.

**Contraintes:**
- Les produits ont des références uniques, des descriptions et des prix
- Pour chaque produit, gérer les informations de stock et de disponibilité
- Les clients possèdent des informations de contact et de facturation
- Les données clients doivent inclure l'historique des commandes

## Exercice 7 : Hôpital - Médecins et Patients

**Contexte:** Système de gestion hospitalier pour suivi des consultations.

**Contraintes:**
- Les médecins ont des spécialités, des numéros de licence et des horaires
- Les patients possèdent un dossier médical avec antécédents et allergies
- Chaque consultation doit être datée et documentée
- Les informations d'assurance médicale doivent être enregistrées

## Exercice 8 : École - Étudiants et Cours

**Contexte:** Système de gestion académique pour une université.

**Contraintes:**
- Les étudiants possèdent un numéro d'étudiant unique et des coordonnées
- Les cours ont un code, un intitulé, un nombre de crédits et un département
- Les sessions de cours ont des horaires et des salles attribuées
- Le système doit permettre d'enregistrer les résultats académiques

Pour chaque exercice, votre modélisation sera évaluée sur:
- L'exhaustivité des champs identifiés
- La cohérence du nommage et des types de données
- La pertinence des clés primaires
- L'anticipation des besoins réels d'utilisation

---


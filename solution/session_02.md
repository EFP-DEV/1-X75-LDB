# Séance 3 — Correction de l’exercice de modélisation de la séance 2

[Énoncé actuel](../exo/session_02.md#3-dessiner-et-décrire-des-tables) · [Cours](../session_03.md)

Ce corrigé adapte les exercices 1 à 7 du support de 2025-2026. L’exercice 8 reste à compléter.

Les propositions doivent couvrir les besoins de l’énoncé. Une information multiple ne doit pas être supprimée parce que les relations seront étudiées plus tard. On propose dès maintenant les tables nécessaires et on décrit en français les liens à établir ; les clés étrangères et les cardinalités ne sont pas exigées ici.

Les choix de champs obligatoires sont des propositions à discuter selon les informations disponibles. Pour les textes sans limite justifiée, la longueur reste à déterminer : quelle limite le besoin ou le système impose-t-il ? Les codes normalisés conservent leur longueur propre.

Les exemples de vérification ci-dessous sont fictifs. Ils servent à relire les propositions sur papier, sans SQL.

# Exercice 1 : Cinéma - Films et Acteurs

**Table : film**

**Commentaire :** Contient les informations descriptives des films.

| Champs             | Type      | Longueur | Obligatoire | Commentaires                                    |
| ------------------ | --------- | -------- | ----------- | ----------------------------------------------- |
| title | Texte | À déterminer | Oui | Titre original |
| genre | Texte | À déterminer | Oui | Genre du cas simple ; plusieurs genres à représenter si nécessaire. |
| original_language | Texte | 3 | Oui | 639-2 (3 lettres) |
| release_year | Nombre entier | Sans objet | Oui | Année (ex : 2020) |
| production_country | Texte | 2 | Oui | Code ISO 3166-1 alpha-2 (ex : FR, BE, US) |
| budget | Nombre décimal | Sans objet | Non | En euros |
| duration_minutes | Nombre entier | Sans objet | Oui | Durée en minutes |
| age_rating | Texte | À déterminer | Oui | Exemple : “PG-13”, “16+” |
| average_rating | Nombre décimal | Sans objet | Non | Exemple : 8.4 |


### Discussion et compléments

Une ligne décrit un film. Les champs `genre`, `original_language` et `production_country` décrivent ici un cas simple. Si plusieurs genres, langues originales ou pays de production doivent être conservés, proposer les tables `genre`, `langue` et `pays`, puis noter les liens avec le film. La 1NF ne justifie pas de supprimer ces informations.

Préciser la monnaie du budget, l’échelle de la note moyenne et le système de classification par âge. Une note inconnue n’est pas une note égale à zéro.

---

**Table : acteur**

**Commentaire :** Table des acteurs avec données biographiques essentielles.

| Champs      | Type      | Longueur | Obligatoire | Commentaires                   |
| ----------- | --------- | -------- | ----------- | ------------------------------ |
| full_name | Texte | À déterminer | Oui | Nom complet |
| birth_date | Date | Sans objet | Non | Format ISO 8601 |
| birth_place | Texte | À déterminer | Non | Ville + code ISO pays possible |
| nationality | Texte | 2 | Non | Code ISO 3166-1 alpha-2 |
| biography | Texte | À déterminer | Non | Résumé biographique |


### Discussion et compléments

Une ligne décrit un acteur. Si plusieurs nationalités doivent être conservées, les représenter au moyen des pays et noter le lien avec l’acteur. Le lieu de naissance peut rester un texte si seul son affichage est demandé.

**Vérification fictive :** deux acteurs nommés Alex Martin peuvent avoir des dates de naissance et des biographies différentes. Un film coproduit par deux pays doit conserver les deux pays dans la proposition.

---

# Exercice 2 : Librairie - Livres et Auteurs

**Table : livre**

**Commentaire :** Informations sur les livres vendus par la librairie.

| Champs             | Type      | Longueur | Obligatoire | Commentaires                                          |
| ------------------ | --------- | -------- | ----------- | ----------------------------------------------------- |
| isbn | Texte | 17 | Oui | Format ISBN-13, unique |
| title | Texte | À déterminer | Oui | Titre complet |
| book_format | Texte | À déterminer | Oui | Une seule valeur : `pocket` / `hardcover` / `digital` |
| publication_year | Nombre entier | Sans objet | Oui | Année (ex : 2018) |
| language | Texte | 2 ou 3 | Oui | ISO 639-1 ou 639-2 |
| publishing_country | Texte | 2 | Non | Pays d’édition (ISO 3166-1 alpha-2) |
| price | Nombre décimal | Sans objet | Oui | Prix TTC |
| stock | Nombre entier | Sans objet | Non | Quantité disponible en magasin (null pour digital) |


### Discussion et compléments

Une ligne de `livre` décrit ici une édition dans un format donné. Deux formats d’une même œuvre donnent deux éditions distinctes, avec leurs propres ISBN, prix et stocks. Une table `oeuvre` peut regrouper les éditions : `title` (texte obligatoire, longueur à déterminer). Le lien entre œuvre et éditions reste à formaliser.

Le stock compte des exemplaires physiques ; le traitement des éditions numériques doit être précisé. Le prix est proposé en euros TTC.

---

**Table : auteur**

**Commentaire :** Informations biographiques et bibliographiques des auteurs.

| Champs               | Type      | Longueur | Obligatoire | Commentaires                                            |
| -------------------- | --------- | -------- | ----------- | ------------------------------------------------------- |
| full_name | Texte | À déterminer | Oui | Nom complet |
| birth_date | Date | Sans objet | Non | Format ISO 8601 |
| nationality | Texte | 3 | Non | ISO 3166-1 alpha-3 |
| biography | Texte | À déterminer | Non | Résumé biographique |

### Discussion et compléments

Une ligne décrit un auteur. Sa bibliographie doit pouvoir retrouver ses œuvres et éditions : noter les liens entre `auteur`, `oeuvre` et `livre`. Une notice biographique libre peut compléter ces données. Plusieurs nationalités se traitent comme pour les acteurs.

**Vérification fictive :** une œuvre intitulée Les rives existe en poche et en numérique ; les deux éditions ont des références distinctes. Deux auteurs peuvent contribuer à la même œuvre.

---

# Exercice 3 : Blog - Articles et Éditeurs

### **Table : article**

**Commentaire :** Contient les informations des articles publiés ou en préparation.

| Champs           | Type      | Longueur | Obligatoire | Commentaires                                                  |
| ---------------- | --------- | -------- | ----------- | ------------------------------------------------------------- |
| title | Texte | À déterminer | Oui | Titre de l’article |
| content | Texte | À déterminer | Oui | Texte complet |
| publication_date | Date | Sans objet | Non | Peut être vide si brouillon |
| status | Texte | À déterminer | Oui | Une seule valeur : `draft`, `review`, `published`, `archived` |

### Discussion et compléments

Une ligne décrit un article. Le statut correspond à son état actuel ; la date de publication peut être absente pour un brouillon.

Proposer une table `categorie` avec `name` (texte obligatoire, longueur à déterminer). Noter qu’un article peut être classé dans plusieurs catégories si le besoin le demande ; ne pas supprimer la seconde catégorie.

---

### **Table : editeur**

**Commentaire :** Contient les informations sur les éditeurs / journalistes.

| Champs           | Type      | Longueur | Obligatoire | Commentaires                                                |
| ---------------- | --------- | -------- | ----------- | ----------------------------------------------------------- |
| full_name | Texte | À déterminer | Oui | Nom complet |
| email | Texte | À déterminer | Oui | Unique |

### Discussion et compléments

Une ligne décrit un éditeur. Proposer une table `role` (`name`) et une table `permission` (`name`, `description`). Les noms sont des textes obligatoires ; la description est facultative ; leurs longueurs restent à déterminer. Noter les liens entre éditeurs, rôles et permissions.

Un niveau numérique n’a de sens que si les actions autorisées sont définies. Un nombre plus élevé ne suffit pas à décrire les droits.

**Vérification fictive :** un éditeur est à la fois rédacteur et correcteur ; un article appartient à Culture et Actualités. Les deux rôles et les deux catégories doivent être conservés.

---

# Exercice 4 : Transport - Pays et Villes

### **Table : pays**

**Commentaire :** Informations de base sur les pays.

| Champs            | Type      | Longueur | Obligatoire | Commentaires                        |
| ----------------- | --------- | -------- | ----------- | ----------------------------------- |
| official_name | Texte | À déterminer | Oui | Nom officiel |
| iso_code | Texte | 2 | Oui | ISO 3166-1 alpha-2 |
| population | Nombre entier | Sans objet | Non | Donnée démographique simple |


### Discussion et compléments

Une ligne décrit un pays. Ajouter les tables suivantes :

| Table | Sens d’une ligne | Champs propres à décrire |
|---|---|---|
| `langue` | Une langue | `name` : texte obligatoire ; `code` : texte, convention à préciser. |
| `devise` | Une devise | `name` : texte obligatoire ; `code` : texte de 3 caractères, obligatoire, convention ISO 4217. |

Les longueurs des noms restent à déterminer. Noter les liens d’un pays avec chacune de ses langues officielles et de ses devises. Aucune limite à une seule langue ou devise n’est déduite du niveau du cours. Une population doit être accompagnée de sa date de référence.

---

### **Table : ville**

**Commentaire :** Informations sur les villes de l’application d’itinéraires internationaux.

| Champs       | Type      | Longueur | Obligatoire | Commentaires                   |
| ------------ | --------- | -------- | ----------- | ------------------------------ |
| name | Texte | À déterminer | Oui | Nom de la ville |
| latitude | Nombre décimal | Sans objet | Oui | Coordonnée décimale |
| longitude | Nombre décimal | Sans objet | Oui | Coordonnée décimale |
| timezone | Texte | À déterminer | Oui | Exemple : `Europe/Paris` |
| population | Nombre entier | Sans objet | Non | Démographie |


### Discussion et compléments

Une ligne décrit une ville. Ajouter une table `aeroport` et une table `gare` : chaque ligne décrit un équipement distinct. Chacune possède `name` (texte obligatoire, longueur à déterminer) et `code` (texte facultatif). Pour un code IATA d’aéroport, la longueur est de 3 caractères ; pour une gare, le référentiel et sa longueur restent à préciser.

Noter les liens ville–pays, ville–aéroports et ville–gares. Plusieurs équipements peuvent desservir une même ville. Préciser l’unité des coordonnées (degrés décimaux) et la date de référence de la population.

**Vérification fictive :** le pays A possède deux langues officielles ; la ville B possède deux gares distinctes. Les deux langues et les deux gares restent représentées.

# Exercice 5 : Langues du monde

### **Table : langue**

**Commentaire :** Informations principales sur les langues du monde.

| Champs            | Type      | Longueur | Obligatoire | Commentaires                              |
| ----------------- | --------- | -------- | ----------- | ----------------------------------------- |
| name | Texte | À déterminer | Oui | Nom de la langue |
| iso_code | Texte | 3 | Oui | ISO 639-2 |
| linguistic_family | Texte | À déterminer | Oui | Classification retenue et source à préciser. |
| status | Texte | À déterminer | Oui | Exemple : `vivante`, `en danger`, `morte` |
| speakers | Nombre entier | Sans objet | Non | Nombre approximatif de locuteurs |


---

### Discussion et compléments

Une ligne décrit une langue. Ajouter `systeme_ecriture` et `region`, avec pour chacune `name` (texte obligatoire, longueur à déterminer). Noter les liens d’une langue avec tous ses systèmes d’écriture et toutes les régions où elle est parlée. Deux colonnes « région principale » et « région secondaire » imposeraient une limite injustifiée.

Préciser la convention du code, le sens du statut et la source de la classification linguistique. Le nombre de locuteurs est une estimation : ajouter `estimate_date` (date facultative) et `estimate_source` (texte facultatif, longueur à déterminer). Une estimation inconnue doit pouvoir rester absente.

**Vérification fictive :** une langue A utilise deux systèmes d’écriture et se pratique dans trois régions. Aucun système ni aucune région ne doit être perdu.

---

# Exercice 6 : E-commerce - Clients et Produits

### **Table : produit**

**Commentaire :** Contient les informations des produits vendus en ligne.

| Champs       | Type      | Longueur | Obligatoire | Commentaires                         |
| ------------ | --------- | -------- | ----------- | ------------------------------------ |
| reference | Texte | À déterminer | Oui | Référence produit, unique |
| name | Texte | À déterminer | Oui | Nom ou label produit |
| description | Texte | À déterminer | Non | Description marketing |
| price | Nombre décimal | Sans objet | Oui | Prix en euros |
| stock | Nombre entier | Sans objet | Oui | Quantité disponible |
| availability | Texte | À déterminer | Oui | `en_stock`, `rupture`, `precommande` |
| weight_grams | Nombre entier | Sans objet | Non | Facultatif, utile pour livraison |


### Discussion et compléments

Une ligne décrit un produit commercialisé. La référence distingue les produits ; le stock compte des unités. Le prix est proposé en euros, avec le traitement des taxes à préciser. Si le besoin impose des prix par marché ou des variantes, proposer des tables supplémentaires et préciser leurs liens.

Définir les règles de disponibilité : un stock nul ne signifie pas nécessairement que les précommandes sont interdites.

---

### **Table : client**

**Commentaire :** Une ligne décrit un client ; les commandes sont conservées séparément.

| Champs          | Type      | Longueur | Obligatoire | Commentaires                       |
| --------------- | --------- | -------- | ----------- | ---------------------------------- |
| full_name | Texte | À déterminer | Oui | Nom complet |
| email | Texte | À déterminer | Oui | Unique |
| phone | Texte | À déterminer | Non | Format libre |
| address_line1 | Texte | À déterminer | Oui | Adresse de facturation |
| address_line2 | Texte | À déterminer | Non | Complément |
| city | Texte | À déterminer | Oui | - |
| postal_code | Texte | À déterminer | Oui | - |
| country | Texte | 2 | Oui | ISO 3166-1 alpha-2 |


### Discussion et compléments

Une ligne décrit un client. L’historique repose sur les tables suivantes :

| Table | Sens d’une ligne | Champs propres à décrire |
|---|---|---|
| `commande` | Une commande passée par un client | `ordered_at` : date et heure obligatoires ; `status` : texte obligatoire, longueur à déterminer ; `currency` : texte obligatoire de 3 caractères. |
| `ligne_commande` | Un produit commandé dans une commande | `quantity` : nombre entier obligatoire, strictement positif ; `unit_price` : nombre décimal obligatoire, prix au moment de la commande, taxes à préciser. |

Noter les liens commande–client, ligne–commande et ligne–produit. La monnaie est celle de la commande. Les adresses de facturation et de livraison au moment de la commande sont à conserver si elles doivent rester consultables après un changement d’adresse du client.

Un compteur et une dernière date peuvent être calculés à partir des commandes ; ils ne remplacent pas leurs dates, produits et quantités.

**Vérification fictive :** le même client passe une commande le 2 novembre puis une autre le 9 novembre, avec des produits différents. Les deux commandes et toutes leurs lignes doivent rester consultables.

---

# Exercice 7 : Hôpital - Médecins et Patients

### **Table : medecin**

**Commentaire :** Informations professionnelles des médecins.

| Champs                | Type      | Longueur | Obligatoire | Commentaires                      |
| --------------------- | --------- | -------- | ----------- | --------------------------------- |
| full_name | Texte | À déterminer | Oui | Nom complet |
| license_number | Texte | À déterminer | Oui | Identifiant professionnel unique |
| phone | Texte | À déterminer | Non | - |
| email | Texte | À déterminer | Non | - |


### Discussion et compléments

Une ligne décrit un médecin. Ajouter une table `specialite` (`name` : texte obligatoire, longueur à déterminer) et noter le lien avec les médecins. Un médecin peut avoir plusieurs spécialités.

Pour des horaires exploitables, proposer `creneau` : une ligne décrit une disponibilité, avec `starts_at` et `ends_at` (dates et heures obligatoires). Noter son lien avec le médecin et la règle de fin postérieure au début. Un texte libre peut compléter les horaires.

---

### **Table : patient**

**Commentaire :** Informations médicales et administratives des patients.

| Champs                 | Type      | Longueur | Obligatoire | Commentaires                       |
| ---------------------- | --------- | -------- | ----------- | ---------------------------------- |
| full_name | Texte | À déterminer | Oui | Nom complet |
| birth_date | Date | Sans objet | Oui | Format ISO |
| insurance_name | Texte | À déterminer | Non | Nom de la compagnie |
| insurance_number | Texte | À déterminer | Non | Numéro d’assurance |

### Discussion et compléments

Une ligne décrit un patient. Les informations répétées ou datées sont conservées séparément :

| Table | Sens d’une ligne | Champs propres à décrire |
|---|---|---|
| `antecedent` | Un antécédent documenté d’un patient | `description` : texte obligatoire ; `event_date` : date facultative si inconnue. |
| `allergie_patient` | Une allergie documentée d’un patient | `substance` : texte obligatoire ; `reaction` : texte facultatif ; `recorded_at` : date obligatoire. |
| `consultation` | Une consultation d’un patient par un médecin | `consulted_at` : date et heure obligatoires ; `medical_note` : texte obligatoire pour une consultation documentée. |

Les longueurs des textes restent à déterminer selon les besoins de conservation. Noter les liens de chaque antécédent et allergie avec le patient, et de chaque consultation avec le patient et le médecin. Les informations d’assurance proposées couvrent un contrat courant ; si plusieurs contrats ou leur historique sont nécessaires, proposer une table `assurance_patient` avec organisme, numéro et dates de validité.

Une absence d’allergie enregistrée ne prouve pas l’absence d’allergie. Une valeur inconnue doit être distinguée d’une absence confirmée. Le nombre de consultations et la dernière date peuvent être calculés ; ils ne conservent ni les consultations précédentes ni leurs notes.

**Vérification fictive :** un patient possède deux allergies et deux antécédents. Deux consultations ont lieu à des dates différentes avec des notes différentes. Ajouter la seconde consultation ne doit effacer aucune information de la première.

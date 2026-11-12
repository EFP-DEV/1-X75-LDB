# Séance 2 Corrigé et explications

[Exercice](../exo/session_02.md) · [Cours](../session_02.md)

## Première partie La papeterie jusqu’au choix des types

Le travail porte sur A1 et A2, jusqu’à l’étape 2 incluse. Le classeur `papeterie_champs.xlsx` conserve quatre rubriques dans `champs` : **Champ**, **Exemple relevé**, **Ce que ce champ décrit**, **Type proposé**. La feuille `decisions` conserve les choix et leurs justifications.

### Comprendre les renseignements du lot A

#### Les deux dates de A1

`12 novembre 2026` est la date indiquée sur le document. Le champ peut s'appeler `date_document`. Cette mention ne suffit pas à établir quand le message a été reçu.

`18 novembre 2026` est la date de livraison souhaitée. Le champ peut s'appeler `date_livraison_souhaitee`. La demande ne prouve pas que la livraison aura lieu ou a eu lieu ce jour-là.

Le nom `date` laisserait l'utilisateur choisir entre plusieurs interprétations. La définition doit permettre à une autre personne de comprendre le même événement.

#### Le prix de A1

`12,50 €` désigne le prix **d'un carnet**, TTC et en euros. Le champ `prix_unitaire_ttc_eur` rend ces trois précisions explicites.

Les quatre carnets représentent `4 × 12,50 € = 50 €` d'articles. La quantité et le prix unitaire sont fournis ; le montant de 50 € est calculé. Il ne faut pas le présenter comme une transcription du document, ni comme un total incluant d'éventuels frais de livraison : ces frais ne sont pas renseignés.

#### Le sens de l'adresse

L'adresse de A1 indique où Marie Martin souhaite recevoir la commande. Elle ne permet pas d'affirmer qu'il s'agit de son domicile.

Dans la proposition ci-dessous, le numéro et la voie restent ensemble. Le code postal, la localité et le pays sont séparés pour permettre des contrôles adaptés à la destination. Le nom de contact reste complet : son découpage en prénom et nom n'est pas nécessaire au besoin décrit.

Tous les exemples du tableau suivant viennent de A1. Ce repère figure dans le commentaire de chaque exemple. Les noms de champs et le découpage sont des propositions ; d’autres choix sont recevables s’ils conservent les renseignements et répondent au besoin.

### Sens des champs et types proposés

| Champ | Exemple relevé | Ce que ce champ décrit | Type proposé |
|---|---|---|---|
| `date_document` | `12 novembre 2026` | Jour indiqué sur le document de demande. | Date |
| `nom_contact` | `Marie Martin` | Nom complet de la personne à joindre au sujet de la demande. | Texte |
| `reference_article` | `1000` | Code qui désigne l'article demandé. | Texte |
| `designation_article` | `carnets à couverture bleue` | Description de l'article donnée dans la demande. | Texte |
| `quantite` | `4` | Nombre d'exemplaires de l'article demandé. | Nombre entier |
| `prix_unitaire_ttc_eur` | `12,50 €` | Prix TTC d'un exemplaire de l'article, exprimé en euros. | Nombre décimal |
| `date_livraison_souhaitee` | `18 novembre 2026` | Jour auquel la personne demande à recevoir la commande. | Date |
| `voie_livraison` | `14 rue des Tilleuls` | Numéro et voie indiqués pour la livraison. | Texte |
| `code_postal_livraison` | `1000` | Code postal indiqué pour l'adresse de livraison. | Texte |
| `localite_livraison` | `Bruxelles` | Localité indiquée pour l'adresse de livraison. | Texte |
| `pays_livraison` | `Belgique` | Pays indiqué pour l'adresse de livraison. | Texte |
| `consigne_livraison` | `Merci de sonner à la porte principale.` | Instruction à transmettre pour la remise du colis. | Texte |
| `telephone` | `0470 00 00 11` | Numéro fourni pour joindre la personne au sujet de la demande. | Texte |
| `email` | `marie.martin@example.com` | Adresse email fournie pour joindre la personne. | Texte |

Le prix est un nombre dans le futur champ de données. Son **exemple relevé** reste la transcription `12,50 €`, avec le symbole monétaire. De même, le type Date proposé ne remplace pas la transcription `18 novembre 2026` par un autre affichage dans la colonne des exemples.

Le texte convient aux références, téléphones et codes postaux parce qu’ils désignent quelque chose et que leurs caractères doivent être préservés. La quantité compte des exemplaires ; le prix permet de calculer ; les dates permettent de comparer des jours. Une écriture composée de chiffres ne suffit pas à imposer un type numérique.

Une trace possible dans `decisions` est : « `prix_unitaire_ttc_eur` proposé décimal ; A1 fournit `12,50 €` par carnet ; le montant des articles se calcule avec la quantité 4 ; type maintenu ; le résultat calculé est 50 € et ne renseigne pas les frais de livraison. »

## Seconde partie Corrigé original des exercices de modélisation

Les exercices 1 à 7 reprennent le [corrigé original de 2025-2026](../2025-2026/solution/session_02.md). Celui-ci ne contient pas de correction pour l’exercice 8 ; les repères actuels pour l’école sont conservés à la suite.

**Limites du corrigé original :** les longueurs et les champs obligatoires sont des propositions à justifier. Le type « Numérique » doit être précisé en entier ou décimal selon le champ. Les réductions à une langue, une allergie, deux régions ou un compteur ne couvrent pas tous les besoins des énoncés et ne sont pas imposées par la première forme normale. Les historiques et les valeurs multiples nécessitent des tables supplémentaires dont les relations seront étudiées ensuite. Ces besoins restent à signaler dans le travail demandé.

### Exercice 1 : Cinéma - Films et Acteurs

**Table : film**

**Commentaire :** Contient les informations descriptives des films (sans relations ni multi-valeurs).
**Identifiant :** id

Voici le **tableau refait** : noms de champs en **anglais**, reste en **français**.

| Champs             | Type      | Longueur | Obligatoire | Commentaires                                    |
| ------------------ | --------- | -------- | ----------- | ----------------------------------------------- |
| id                 | Numérique | -        | Oui         | PK auto-inc.                                    |
| title              | Textuel   | 255      | Oui         | Titre original                                  |
| genre              | Textuel   | 50       | Oui         | Un seul genre, 1NF strict                       |
| original_language  | Textuel   | 3        | Oui         | 639-2 (3 lettres) |
| release_year       | Numérique | -        | Oui         | Année (ex : 2020)                               |
| production_country | Textuel   | 2        | Oui         | Code ISO 3166-1 alpha-2 (ex : FR, BE, US)       |
| budget             | Numérique | -        | Non         | En euros                                        |
| duration_minutes   | Numérique | -        | Oui         | Durée en minutes                                |
| age_rating         | Textuel   | 10       | Oui         | Exemple : “PG-13”, “16+”                        |
| average_rating     | Numérique | -        | Non         | Exemple : 8.4                                   |


#### Notes pédagogiques

* Les **langues et pays** utilisent un **standard ISO**, ce qui renforce la rigueur sans introduire de relations.
* 1 seul pays, 1 seule langue, 1 seul genre → **niveau débutant**.

---

**Table : acteur**

**Commentaire :** Table des acteurs avec données biographiques essentielles (sans relations).
**Identifiant :** id

| Champs      | Type      | Longueur | Obligatoire | Commentaires                   |
| ----------- | --------- | -------- | ----------- | ------------------------------ |
| id          | Numérique | -        | Oui         | PK auto-inc.                   |
| full_name   | Textuel   | 150      | Oui         | Nom complet                    |
| birth_date  | Date      | -        | Non         | Format ISO 8601                |
| birth_place | Textuel   | 150      | Non         | Ville + code ISO pays possible |
| nationality | Textuel   | 2        | Non         | Code ISO 3166-1 alpha-2        |
| biography   | Textuel   | 2000     | Non         | Résumé biographique            |


#### Notes pédagogiques

* **Nationalité = 1 code ISO** → évite les listes.
* **Lieu de naissance** laissé textuel pour simplifier (pas encore géodonnées).


---

### Exercice 2 : Librairie - Livres et Auteurs

**Table : livre**

**Commentaire :** Informations sur les livres vendus par la librairie.
**Identifiant :** id

| Champs             | Type      | Longueur | Obligatoire | Commentaires                                          |
| ------------------ | --------- | -------- | ----------- | ----------------------------------------------------- |
| id                 | Numérique | -        | Oui         | PK auto-inc.                                          |
| isbn               | Textuel   | 17       | Oui         | Format ISBN-13, unique                                |
| title              | Textuel   | 255      | Oui         | Titre complet                                         |
| book_format        | Textuel   | 20       | Oui         | Une seule valeur : `pocket` / `hardcover` / `digital` |
| publication_year   | Numérique | -        | Oui         | Année (ex : 2018)                                     |
| language           | Textuel   | 2 ou 3   | Oui         | ISO 639-1 ou 639-2                                    |
| publishing_country | Textuel   | 2        | Non         | Pays d’édition (ISO 3166-1 alpha-2)                   |
| price              | Numérique | -        | Oui         | Prix TTC                                              |
| stock              | Numérique | -        | Non         | Quantité disponible en magasin (null pour digital)    |


#### Notes pédagogiques

* **Un seul format** par livre.
* ISBN est unique mais reste une simple **valeur**, pas un lien.
* Langue + pays via ISO.
* Pas de liste d’auteurs

---

**Table : auteur**

**Commentaire :** Informations biographiques et bibliographiques des auteurs.
**Identifiant :** id

| Champs               | Type      | Longueur | Obligatoire | Commentaires                                            |
| -------------------- | --------- | -------- | ----------- | ------------------------------------------------------- |
| id                   | Numérique | -        | Oui         | PK auto-inc.                                            |
| full_name            | Textuel   | 150      | Oui         | Nom complet                                             |
| birth_date           | Date      | -        | Non         | Format ISO 8601                                         |
| nationality          | Textuel   | 3        | Non         | ISO 3166-1 alpha-3                                      |
| biography            | Textuel   | 2000     | Non         | Résumé biographique                                     |
| bibliography_summary | Textuel   | 2000     | Non         | Quelques titres dans texte simple (pas de liste structurée) |

#### Notes pédagogiques

* Pas de liste d’œuvres (sinon ça violerait la 1NF).
* Une seule nationalité (même si peu réaliste, c’est la règle 1NF pour débutants).

---

### Exercice 3 : Blog - Articles et Éditeurs

#### **Table : article**

**Commentaire :** Contient les informations des articles publiés ou en préparation.
**Identifiant :** id

| Champs           | Type      | Longueur | Obligatoire | Commentaires                                                  |
| ---------------- | --------- | -------- | ----------- | ------------------------------------------------------------- |
| id               | Numérique | -        | Oui         | PK auto-inc.                                                  |
| title            | Textuel   | 255      | Oui         | Titre de l’article                                            |
| content          | Textuel   | -        | Oui         | Texte complet                                                 |
| publication_date | Date      | -        | Non         | Peut être vide si brouillon                                   |
| status           | Textuel   | 20       | Oui         | Une seule valeur : `draft`, `review`, `published`, `archived` |
| category         | Textuel   | 100      | Oui         | Une seule catégorie (1NF strict)                              |

#### Notes pédagogiques

* **Pas de listes de catégories** → on les verra plus tard (1-N ou N-N).
* **Statut unique** → facile et cohérent avec le cycle de vie d'un article.
* **date_publication** facultative → un brouillon n’a pas de date.

---

#### **Table : editeur**

**Commentaire :** Contient les informations sur les éditeurs / journalistes.
**Identifiant :** id

| Champs           | Type      | Longueur | Obligatoire | Commentaires                                                |
| ---------------- | --------- | -------- | ----------- | ----------------------------------------------------------- |
| id               | Numérique | -        | Oui         | PK auto-inc.                                                |
| full_name        | Textuel   | 150      | Oui         | Nom complet                                                 |
| email            | Textuel   | 255      | Oui         | Unique                                                      |
| role             | Textuel   | 100      | Oui         | Rôle principal (ex : rédacteur, correcteur, chef d’édition) |
| permission_level | Numérique | -        | Oui         | 1 = bas, 2 = moyen, 3 = élevé                               |

#### Notes pédagogiques

* **Pas de rôles multiples** (1NF strict).
* **Autorisation simplifiée** → un seul chiffre, facile à comparer, facile à justifier.
* On ne stocke pas l’historique des actions → trop avancé pour le moment.

---

### Exercice 4 : Transport - Pays et Villes

#### **Table : pays**

**Commentaire :** Informations de base sur les pays (sans relations et sans listes).
**Identifiant :** id

| Champs            | Type      | Longueur | Obligatoire | Commentaires                        |
| ----------------- | --------- | -------- | ----------- | ----------------------------------- |
| id                | Numérique | -        | Oui         | PK auto-inc.                        |
| official_name     | Textuel   | 150      | Oui         | Nom officiel                        |
| iso_code          | Textuel   | 2        | Oui         | ISO 3166-1 alpha-2                  |
| official_language | Textuel   | 2        | Non         | ISO 639-1 (1 seule langue pour 1NF) |
| currency          | Textuel   | 3        | Non         | Code ISO 4217 (ex : EUR, USD)       |
| population        | Numérique | -        | Non         | Donnée démographique simple         |


#### Notes pédagogiques

* Normalement un pays a **plusieurs** langues → mais ils ne savent pas faire du 1-N → **donc 1 seule langue officielle**.
* Même chose pour plusieurs devises → **simplifié à 1 devise**.
* C’est volontairement réduit pour respecter la 1NF **sans utiliser de relations**.

---

#### **Table : ville**

**Commentaire :** Informations sur les villes de l’application d’itinéraires internationaux.
**Identifiant :** id

| Champs       | Type      | Longueur | Obligatoire | Commentaires                   |
| ------------ | --------- | -------- | ----------- | ------------------------------ |
| id           | Numérique | -        | Oui         | PK auto-inc.                   |
| name         | Textuel   | 150      | Oui         | Nom de la ville                |
| latitude     | Numérique | -        | Oui         | Coordonnée décimale            |
| longitude    | Numérique | -        | Oui         | Coordonnée décimale            |
| timezone     | Textuel   | 50       | Oui         | Exemple : `Europe/Paris`       |
| population   | Numérique | -        | Non         | Démographie                    |
| airport_code | Textuel   | 3        | Non         | Code IATA (1 seul, 1NF strict) |
| railway_code | Textuel   | 10       | Non         | Code ferroviaire (1 seul)      |


#### Notes pédagogiques

* Les villes ont souvent **plusieurs** aéroports et gares → mais ils ne peuvent pas faire de relation → **donc 1 seul code de chaque type**.
* Latitude / longitude stockés séparément → conforme 1NF
* Fuseau horaire en chaîne, simple à comprendre.



### Exercice 5 : Langues du monde

#### **Table : langue**

**Commentaire :** Informations principales sur les langues du monde (1NF, sans multi-valeurs ni relations).
**Identifiant :** id

| Champs            | Type      | Longueur | Obligatoire | Commentaires                              |
| ----------------- | --------- | -------- | ----------- | ----------------------------------------- |
| id                | Numérique | -        | Oui         | PK auto-inc.                              |
| name              | Textuel   | 150      | Oui         | Nom de la langue                          |
| iso_code          | Textuel   | 3        | Oui         | ISO 639-2                                 |
| linguistic_family | Textuel   | 100      | Oui         | Une seule famille (1NF strict)            |
| status            | Textuel   | 50       | Oui         | Exemple : `vivante`, `en danger`, `morte` |
| writing_system    | Textuel   | 100      | Oui         | Un seul système d’écriture                |
| speakers          | Numérique | -        | Oui         | Nombre approximatif de locuteurs          |
| primary_region    | Textuel   | 100      | Oui         | Une seule région principale               |
| secondary_region  | Textuel   | 100      | Non         | Optionnelle (1 seule valeur)              |


---

#### Notes pédagogiques (à expliquer aux étudiants)

* **Pas de listes** → pas “Afrique, Asie, Europe”.
  → On préfère **region_principale** et **region_secondaire** (facultative).
* **Un seul système d’écriture** même si en vrai ça peut être multiple (ex : serbe).
* **Une seule famille** même si certaines langues sont discutables (créoles, langues mixtes).
* **code_iso** fixe et standard → pas besoin de relation.
* **statut** textuel simple → pas de table des statuts.


---

### Exercice 6 : E-commerce - Clients et Produits

#### **Table : produit**

**Commentaire :** Contient les informations des produits vendus en ligne.
**Identifiant :** id

| Champs       | Type      | Longueur | Obligatoire | Commentaires                         |
| ------------ | --------- | -------- | ----------- | ------------------------------------ |
| id           | Numérique | -        | Oui         | PK auto-inc.                         |
| reference    | Textuel   | 50       | Oui         | Référence produit, unique            |
| name         | Textuel   | 255      | Oui         | Nom ou label produit                 |
| description  | Textuel   | -        | Non         | Description marketing                |
| price        | Numérique | -        | Oui         | Prix en euros                        |
| stock        | Numérique | -        | Oui         | Quantité disponible                  |
| availability | Textuel   | 20       | Oui         | `en_stock`, `rupture`, `precommande` |
| weight_grams | Numérique | -        | Non         | Facultatif, utile pour livraison     |


#### Notes pédagogiques

* 1 référence = 1 valeur
* Pas de variantes produit, pas de tailles/couleurs → pas encore vu
* Disponibilité simplifiée avec 3 statuts textuels

---

#### **Table : client**

**Commentaire :** Informations des clients, avec un historique “simplifié” compatible 1NF.
**Identifiant :** id

| Champs          | Type      | Longueur | Obligatoire | Commentaires                       |
| --------------- | --------- | -------- | ----------- | ---------------------------------- |
| id              | Numérique | -        | Oui         | PK auto-inc.                       |
| full_name       | Textuel   | 150      | Oui         | Nom complet                        |
| email           | Textuel   | 255      | Oui         | Unique                             |
| phone           | Textuel   | 20       | Non         | Format libre                       |
| address_line1   | Textuel   | 150      | Oui         | Adresse de facturation             |
| address_line2   | Textuel   | 150      | Non         | Complément                         |
| city            | Textuel   | 100      | Oui         | -                                  |
| postal_code     | Textuel   | 20       | Oui         | -                                  |
| country         | Textuel   | 2        | Oui         | ISO 3166-1 alpha-2                 |
| order_count     | Numérique | -        | Oui         | Historique simplifié               |
| last_order_date | Date      | -        | Non         | Permet un minimum d’historique 1NF |


#### Notes pédagogiques

* Pas de liste de commandes → interdit en 1NF
* Le compromis pédagogique est :
  * **nombre_commandes**
  * **date_derniere_commande**
  
* C’est la *seule façon* de refléter un historique **sans relations**
* Quand on connaitra les relations, cette table évoluera naturellement vers une **table commande** et une **table ligne_commande**

---

### Exercice 7 : Hôpital - Médecins et Patients

#### **Table : medecin**

**Commentaire :** Informations professionnelles des médecins.
**Identifiant :** id

| Champs                | Type      | Longueur | Obligatoire | Commentaires                      |
| --------------------- | --------- | -------- | ----------- | --------------------------------- |
| id                    | Numérique | -        | Oui         | PK auto-inc.                      |
| full_name             | Textuel   | 150      | Oui         | Nom complet                       |
| specialty             | Textuel   | 100      | Oui         | Une seule spécialité (1NF strict) |
| license_number        | Textuel   | 50       | Oui         | Identifiant professionnel unique  |
| availability_schedule | Textuel   | 100      | Non         | Exemple : “Lun-Ven 9h–17h”        |
| phone                 | Textuel   | 20       | Non         | -                                 |
| email                 | Textuel   | 255      | Non         | -                                 |


#### Notes pédagogiques

* Un médecin peut en vrai avoir plusieurs spécialités, mais on simplifie
* L’horaire est stocké en texte simple

---

#### **Table : patient**

**Commentaire :** Informations médicales et administratives des patients.
**Identifiant :** id

| Champs                 | Type      | Longueur | Obligatoire | Commentaires                       |
| ---------------------- | --------- | -------- | ----------- | ---------------------------------- |
| id                     | Numérique | -        | Oui         | PK auto-inc.                       |
| full_name              | Textuel   | 150      | Oui         | Nom complet                        |
| birth_date             | Date      | -        | Oui         | Format ISO                         |
| main_medical_history   | Textuel   | 255      | Non         | Un seul antécédent (1NF strict)    |
| main_allergy           | Textuel   | 255      | Non         | Une seule allergie                 |
| insurance_name         | Textuel   | 150      | Non         | Nom de la compagnie                |
| insurance_number       | Textuel   | 50       | Non         | Numéro d’assurance                 |
| consultation_count     | Numérique | -        | Oui         | Historique simplifié               |
| last_consultation_date | Date      | -        | Non         | -                                  |
| last_medical_note      | Textuel   | 1000     | Non         | Résumé de la dernière consultation |

#### Notes pédagogiques

* Pas de liste d’antécédents ni d’allergies → trop avancé → **on n’en garde qu’un seul**.
* L’historique complet des consultations n’est pas possible sans relation → donc :
  → **nombre_consultations**
  → **date_derniere_consultation**
  → **derniere_note_medicale**

---

### Exercice 8 École — Repères complémentaires


| Table | Champs à décrire et types proposés |
|---|---|
| `etudiant` | Numéro étudiant, nom et coordonnées : texte. |
| `cours` | Code, intitulé et département : texte ; crédits : entier ou décimal selon les règles de l’établissement. |
| `session_cours` | Début et fin : date et heure ; salle : texte. |
| `resultat` | Note : décimal si l’échelle l’exige ; date d’évaluation : date ; appréciation éventuelle : texte. |

Le numéro étudiant est obligatoire et unique. Le code du cours sert à le retrouver. Chaque résultat devra être rattaché à l’étudiant et à l’enseignement ou à l’évaluation concernés ; il ne suffit pas d’ajouter une unique note à la fiche de l’étudiant. L’échelle de notation et les conditions de présence d’une note restent à préciser. Un résultat non encore établi ne devient pas zéro.

### Vérification et explication attendues

On reprend chaque contrainte du scénario et on indique le champ ou la table qui la couvre. Les deux enregistrements fictifs permettent de comparer les valeurs, les types et les identifiants. Un texte long, une valeur absente ou deux noms identiques permettent d’expliquer les limites des choix.

Une réponse complète précise ce que représente une ligne, justifie les caractéristiques de ses champs et conserve les besoins qui demanderont des relations. Les compteurs, résumés et valeurs principales ne remplacent pas un historique ou une collection complète.

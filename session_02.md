# Session 2 : **Modélisation des Tables Simples (sans relations)**

La modélisation des bases de données commence par la définition des **entités** et des **champs** qui les composent. Même sans relations entre tables, il est essentiel d’adopter une démarche rigoureuse pour structurer correctement les données.

---

# 1. Les concepts fondamentaux

## 1.1. **Entité**

Une entité représente un **objet réel ou abstrait** pour lequel on souhaite stocker des informations.
Chaque entité devient **une table**.

Exemples :

* Film
* Acteur
* Livre
* Auteur
* Article
* Pays
* Produit
* Étudiant

---

## 1.2. **Attribut**

Un attribut est une **information descriptive** liée à une entité.
Il devient **un champ** dans une table.

Exemples :

* Pour un film : titre, durée, budget
* Pour un étudiant : nom, email, numéro d’étudiant

---

## 1.3. **Identifiant (clé primaire – PK)**

Même sans relations, chaque table doit posséder une **clé primaire**, qui sert à identifier ses enregistrements :

Caractéristiques d’une bonne clé primaire :

* Unique
* Obligatoire
* Stable
* Souvent numérique et auto-incrémentée

Exemples :
`id_film`, `id_produit`, `id_client`

---

# 2. Définition des champs : les éléments essentiels

Lorsqu’on modélise une table, chaque champ doit être décrit selon plusieurs critères.

## 2.1. **Nom du champ**

Le nom doit être :

* Clair
* Cohérent
* Informatif
* Suivre une convention (ex. snake_case : `date_publication`)

Éviter les noms ambigus comme *info*, *data*, *valeur*.

---

## 2.2. **Type de données**

Le type doit être choisi selon la nature de la donnée :

| Type                        | Utilisation                      |
| --------------------------- | -------------------------------- |
| **NUMERIQUE (INT, BIGINT)** | Identifiants, quantités, années  |
| **DECIMAL / FLOAT**         | Prix, notes, montants financiers |
| **TEXTUEL (VARCHAR, TEXT)** | Noms, titres, descriptions       |
| **DATE / DATETIME**         | Dates, heures                    |
| **BOOLEAN**                 | Oui/Non                          |

---

## 2.3. **Longueur maximale**

Les champs textuels doivent avoir une limite raisonnable :

* `VARCHAR(50)` pour un prénom
* `VARCHAR(150)` pour un nom d’auteur
* `VARCHAR(255)` pour un titre
* `TEXT` pour du contenu long (biographie, description, article)

---

## 2.4. **Caractère obligatoire**

Un champ peut être :

* **Obligatoire (NOT NULL)** si indispensable
* **Optionnel** si la donnée peut être absente

Exemples de champs obligatoires :

* Titre d’un film
* ISBN d’un livre
* Nom d’un étudiant

Exemples de champs facultatifs :

* Biographie d’un auteur
* Budget d’un film (si inconnu)

---

## 2.5. **Commentaires**

Les commentaires permettent d’apporter des précisions utiles :

* *année au format AAAA*
* *durée du film en minutes*
* *format du code ISO*
* *coordonnées géographiques en degrés décimaux*

---

# 3. Méthodologie de modélisation

Même sans relations, la démarche doit rester méthodique.

## Étape 1 : Identifier les entités

→ Quels sont les objets mentionnés dans le scénario ?
Exemples : film, acteur, livre, auteur, pays, langue, produit, client…

## Étape 2 : Lister les données à stocker pour chaque entité

→ Cela deviendra les champs de la table.

## Étape 3 : Définir l’identifiant principal

→ Le plus souvent : `id` numérique auto-incrémenté.

## Étape 4 : Décrire chaque champ

Pour chaque attribut :

* nom du champ
* type de donnée
* longueur
* obligatoire OU non
* commentaire éventuel

## Étape 5 : Vérifier la cohérence globale

* Les types sont-ils correctement choisis ?
* Les longueurs sont-elles adaptées ?
* Les champs essentiels sont-ils obligatoires ?
* Les noms sont-ils cohérents dans toutes les tables ?

---

# 4. Critères d’une bonne modélisation (hors relations)

Même sans relations, votre modélisation sera évaluée selon :

### ✔ **Exhaustivité**

Toutes les données importantes sont présentes.

### ✔ **Cohérence**

Même logique de nommage et structure similaire entre les tables.

### ✔ **Pertinence des types**

Le type correspond bien à la nature de la donnée.

### ✔ **Clarté**

Les tables sont compréhensibles même pour quelqu’un qui ne connaît pas le contexte.

### ✔ **Simplicité**

Une table doit contenir uniquement les informations liées à l’entité (ni plus, ni moins).

---

# 5. Objectif pédagogique

L’objectif de ce cours est de vous apprendre à :

* Identifier les entités pertinentes dans un contexte réel
* Définir clairement les champs à stocker
* Faire des choix pertinents en termes de type et de format
* Préparer des tables prêtes à être converties en scripts SQL

Ce travail constitue la base indispensable avant de passer aux relations (développées dans un cours ultérieur).

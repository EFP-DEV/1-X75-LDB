# **Exercices Session 9 : Interroger la base de données du projet**

## Objectif de la séance

Dans cette séance, vous allez apprendre à écrire **les requêtes SQL nécessaires au fonctionnement réel de l’interface d’administration** du projet.

 - Vous n’écrivez **pas du SQL “théorique”**.

 - Chaque requête correspond à **une fonctionnalité concrète** du site.

> Si une requête n’existe pas, la fonctionnalité ne peut pas être développée.

---

## Contexte du projet

Vous travaillez sur un **CMS** disposant :

* de contenus (items)
* de catégories, thèmes et tags
* de messages de contact
* d’utilisateurs administrateurs (operators)
* de collections (favoris, wishlist, etc.)

La base de données est **déjà modélisée**.
Vous devez **l’interroger correctement**, sans la modifier.

---

## Tables disponibles (rappel)

Vous disposez notamment des tables suivantes :

* `item`
* `category`
* `theme`
* `tag`
* `taguer`
* `operator`
* `message`
* `collection`
* `collection_item`

Les relations sont **déjà en place** (FK, tables de jointure).

---

## Consignes générales

* N’inventez **aucune donnée**
* Respectez **strictement le modèle existant**
* Les requêtes doivent être **lisibles et structurées**
* `SELECT *` est autorisé **uniquement pour l’apprentissage**
* Chaque requête doit répondre **au besoin décrit**

---

# 1. Gestion des contenus (items)


### Exercice 1 — Liste des contenus (admin)

**Contexte**
Vous êtes dans l’interface d’administration.
Vous devez afficher la liste de tous les contenus existants.

**Exercice**
Écrire une requête qui affiche tous les items avec :

* leur identifiant
* leur label
* leur statut
* leur date de création

---

### Exercice 2 — Fiche détaillée d’un contenu

**Contexte**
Un administrateur clique sur un item pour voir sa fiche complète.

**Exercice**
Écrire une requête qui affiche **un item précis**, identifié par son `id`, avec :

* toutes ses informations
* le label de sa catégorie
* le label de son thème

---

### Exercice 3 — Création d’un contenu

**Contexte**
Un administrateur crée un nouveau contenu via un formulaire.

**Exercice**
Écrire la requête permettant d’insérer un nouvel item avec :

* un slug
* un label
* un statut
* une catégorie
* un thème

---

### Exercice 4 — Modification d’un contenu

**Contexte**
Un contenu existant doit être modifié.

**Exercice**
Écrire une requête permettant de modifier :

* le label
* le statut
* la catégorie ou le thème
  d’un item existant.

---

### Exercice 5 — Suppression d’un contenu

**Contexte**
Un administrateur supprime un contenu.

**Exercice**
Écrire la requête permettant de supprimer un item à partir de son identifiant.

---

# 2. Catégories et tags

---

### Exercice 6 — Liste des catégories

**Contexte**
Écran “gestion des catégories”.

**Exercice**
Écrire une requête qui affiche toutes les catégories, triées par label.

---

### Exercice 7 — Liste des tags

**Contexte**
Écran “gestion des tags”.

**Exercice**
Écrire une requête qui affiche tous les tags, triés par label.

---

### Exercice 8 — Associer un tag à un contenu

**Contexte**
Un administrateur ajoute un tag à un item.

**Exercice**
Écrire la requête permettant d’associer un tag existant à un item existant.

---

### Exercice 9 — Retirer un tag d’un contenu

**Contexte**
Un administrateur retire un tag d’un item.

**Exercice**
Écrire la requête permettant de supprimer l’association entre un item et un tag.

---

### Exercice 10 — Voir les contenus liés à un tag

**Contexte**
Cliquer sur un tag affiche les contenus associés.

**Exercice**
Écrire une requête qui affiche tous les items associés à un tag donné.

---

### Exercice 11 — Tags utilisés / non utilisés

**Contexte**
Le responsable éditorial veut nettoyer les tags inutiles.

**Exercices**

1. Écrire une requête qui affiche les tags utilisés par **au moins un item**
2. Écrire une requête qui affiche les tags **non utilisés**

---

# 3. Messages de contact

---

### Exercice 12 — Liste des messages

**Contexte**
Interface admin → messages reçus via le formulaire de contact.

**Exercice**
Écrire une requête qui affiche tous les messages avec :

* le nom
* l’email
* le sujet
* le statut

---

### Exercice 13 — Tri des messages

**Contexte**
L’admin veut traiter les messages en priorité.

**Exercices**

1. Messages triés par date décroissante
2. Messages non traités en premier

---

### Exercice 14 — Lecture d’un message

**Contexte**
L’admin ouvre un message précis.

**Exercice**
Écrire une requête qui affiche un message à partir de son `id`.

---

### Exercice 15 — Marquer un message comme traité

**Contexte**
Un message a été pris en charge.

**Exercice**
Écrire la requête permettant de modifier le statut d’un message.

---

### Exercice 16 — Suppression d’un message

**Contexte**
Un message indésirable doit être supprimé.

**Exercice**
Écrire la requête permettant de supprimer un message donné.

---

# 4. Authentification (partie SQL)

---

### Exercice 17 — Connexion d’un administrateur

**Contexte**
Un administrateur tente de se connecter.

**Exercice**
Écrire une requête qui récupère un opérateur à partir de son email **uniquement s’il est actif**.

---

### Exercice 18 — Mise à jour de la dernière connexion

**Contexte**
Après une connexion réussie, l’activité est enregistrée.

**Exercice**
Écrire la requête permettant de mettre à jour le champ `last_login`.

---

# 5. Collections (favoris, wishlist…)

---

### Exercice 19 — Liste des collections d’un utilisateur

**Contexte**
Un utilisateur connecté consulte ses collections.

**Exercice**
Écrire une requête qui affiche toutes les collections créées par un opérateur donné.

---

### Exercice 20 — Contenu d’une collection

**Contexte**
Afficher les items d’une collection (favoris).

**Exercice**
Écrire une requête qui affiche tous les items d’une collection donnée.

---

### Exercice 21 — Ajouter un item à une collection

**Contexte**
Un utilisateur ajoute un contenu à ses favoris.

**Exercice**
Écrire la requête permettant d’ajouter un item à une collection.

---

### Exercice 22 — Retirer un item d’une collection

**Contexte**
Un utilisateur retire un favori.

**Exercice**
Écrire la requête permettant de retirer un item d’une collection.

---

# 6. Navigation et recherche

---

### Exercice 23 — Catalogue paginé

**Contexte**
Le catalogue affiche 10 contenus par page.

**Exercices**

1. Afficher les 10 premiers items
2. Afficher les 10 items suivants

---

### Exercice 24 — Navigation par catégorie

**Contexte**
Page listant les contenus d’une catégorie.

**Exercice**
Écrire une requête qui affiche tous les items d’une catégorie donnée.

---

### Exercice 25 — Navigation par thème

**Contexte**
Page thématique.

**Exercice**
Écrire une requête qui affiche tous les items d’un thème donné.

---

### Exercice 26 — Recherche par mot-clé

**Contexte**
Champ de recherche global du site.

**Exercice**
Écrire une requête qui affiche les items dont le label ou le contenu correspond à un mot-clé.

---

# 7. Tableau de bord (dashboard)

---

### Exercice 27 — Statistiques globales

**Contexte**
Page d’accueil de l’admin.

**Exercices**

1. Nombre total d’items
2. Nombre total de messages
3. Nombre total de collections

---

### Exercice 28 — Contenus récents

**Contexte**
Afficher les derniers contenus ajoutés.

**Exercice**
Écrire une requête qui affiche les X derniers items créés.

---

### Exercice 29 — Messages en attente

**Contexte**
Badge “messages à traiter”.

**Exercice**
Écrire une requête qui compte les messages dont le statut n’est pas traité.

---

## À retenir

> Une fonctionnalité = une ou plusieurs requêtes SQL.
> Le SQL est **l’outil qui rend le site possible**, pas une fin en soi.

---
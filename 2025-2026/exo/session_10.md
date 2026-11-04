## Exercice de groupe — Mini système de commandes

### Objectifs pédagogiques

À la fin de l’exercice, les étudiants doivent être capables de :

* identifier les entités pertinentes
* distinguer données globales et données spécifiques
* comprendre pourquoi une table existe
* construire un MCD, un MLD et un MPD
* observer le comportement d’une base sans contraintes
* comprendre l’intérêt des clés étrangères et des règles ON DELETE

---

## Contexte métier

On souhaite modéliser une petite boutique en ligne.

La boutique permet :

* d’enregistrer des clients
* de créer des commandes
* d’ajouter des produits dans chaque commande

Une commande peut contenir plusieurs produits, avec une quantité pour chacun.

---

## Règles métier à respecter

1. Un client peut passer plusieurs commandes
2. Une commande appartient à un seul client
3. Une commande peut contenir plusieurs produits
4. Un produit peut apparaître dans plusieurs commandes
5. Une commande non validée peut être supprimée
6. Une commande validée ne doit pas disparaître par erreur
7. Lorsqu’une commande est supprimée, ses lignes de commande doivent disparaître automatiquement
8. Un client ne peut pas être supprimé s’il a encore des commandes

---

## Partie 1 — MCD (Modèle Conceptuel des Données)

Travail collectif au tableau.

Identifier les entités nécessaires.
Identifier les informatons par entites

Objectif implicite :
Faire émerger la ligne de commande comme association porteuse de données.

---

## Partie 2 — MLD (Modèle Logique des Données)

Transformation du MCD en tables relationnelles.

Tables attendues :

* client
* commande
* produit
* ligne_commande

Points clés à expliciter :

* chaque table possède une clé primaire
* les relations 1,N produisent des clés étrangères
* la relation N,N commande–produit devient une table associative
* la table ligne_commande porte une clé primaire composée

Message clé à faire formuler :
La table commande existe pour porter les données communes à toutes les lignes.

---

## Partie 3 — MPD (Modèle Physique des Données)

Construction progressive de la base.

Étape volontairement naïve :

* création des tables sans clés étrangères
* insertion de données incohérentes :

  * lignes de commande sans commande existante
  * commandes avec des clients inexistants
  * produits référencés nulle part

Observation collective :
La base accepte tout tant qu’aucune contrainte n’est définie.

---

## Partie 4 — Introduction des contraintes

Cours theorique apres exemple

## Conclusion pédagogique attendue

* La normalisation réduit la redondance
* Une table existe pour une raison logique, pas arbitraire
* Les contraintes déplacent la logique métier dans la base
* Une base sans contraintes n’assure aucune cohérence
* Une base avec contraintes protège les données

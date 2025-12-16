# **Exercices Session 8 : Exercice pratique

## Du modèle corrigé à la validation par l’usage réel

---

## Objectif de la séance

Cette séance a pour but de **valider un modèle de données en situation réelle**, après sa correction.

À la fin de la session, l’étudiant doit être capable de :

* traduire un **MLD corrigé** en **MPD fonctionnel**
* créer les tables dans **phpMyAdmin**
* insérer des **données cohérentes**
* vérifier que le modèle fonctionne **sans bricolage**
* comprendre que **si les données entrent naturellement, le modèle est bon**

> Un modèle n’est pas “juste” parce qu’il est joli sur papier,
> il est juste **s’il supporte l’usage réel sans friction**.

---

## Contexte de départ

* Le **MCD** et le **MLD** ont été **corrigés collectivement**
* Les règles métier sont désormais claires :

  * 1 item → 1 catégorie
  * 1 item → 1 thème
  * N items ↔ N tags (tags libres)
* Les tables associatives existent **uniquement au MLD / MPD**
* Le nommage est stabilisé (snake_case, pas de camelCase)

---

## Partie 1 : Création du MPD

### Consigne

À partir du **MLD corrigé**, vous devez :

1. Créer la base de données dans VOTRE **phpMyAdmin**
2. Créer **toutes les tables**
3. Définir correctement :

   * les clés primaires
   * les clés étrangères
   * les contraintes `NOT NULL`, `UNIQUE`
4. Respecter les cardinalités vues en cours

Aucune donnée pour l’instant. On vérifie **la structure**, pas le contenu.

---

## Partie 2 : Génération du jeu de données

Avant d’insérer des contenus, vous devez **définir votre univers**.

### Étape 1 — Définir la classification

* **Catégories = structure**
* **Thèmes = ambiance**
* **Tags = détails libres**

Pour éviter les catégories bancales ou incohérentes, utilisez le prompt fourni :

```prompt
Je travaille sur un projet de classification.
Je dois organiser un ensemble d’éléments (personnages / objets / œuvres / etc.).

Génère pour moi trois listes distinctes :

1. 7 catégories
- exclusives entre elles
- structurantes
- non émotionnelles

2. 7 thèmes
- transversaux
- liés à l’ambiance ou à l’univers
- non techniques

3. 15 tags libres
- descriptifs
- précis
- indépendants des catégories et thèmes

Format strict demandé.
```


## Partie 3 : Insertion des données de référence

### À insérer en priorité :

1. Les **catégories**
2. Les **thèmes**
3. Les **tags**

 - Aucune table associative à ce stade.
 - Vérifiez les contraintes d’unicité.

---

## Partie 4 : Insertion des items

Créez **au minimum 10 items**.

Chaque item doit :

* avoir un **titre unique**
* avoir un **slug unique**
* être lié à **une seule catégorie**
* être lié à **un seul thème**
* avoir un statut valide

> Si vous hésitez sur une catégorie ou un thème,
> c’est souvent que votre classification est mauvaise.

---

## Partie 5 : Tags et tables associatives

Associez ensuite les tags aux items :

* certains items avec **0 tag**
* certains avec **1 tag**
* certains avec **plusieurs tags**

Contraintes à respecter :

* un même tag ne peut pas être lié deux fois au même item
* la table associative ne contient **rien d’autre que les deux clés**

---

## Phase de validation (la plus importante)

Posez-vous les questions suivantes :

* Ai-je dû tricher pour insérer mes données ?
* Ai-je eu envie d’ajouter une colonne “vite fait” ?
* Ai-je été tenté de mettre plusieurs valeurs dans un champ ?
* Les requêtes de lecture sont-elles naturelles à formuler ?

 - Si oui → le modèle est **à revoir**
 - Si non → le modèle est **validé par l’usage**

---

## Ce que cet exercice doit vous apprendre

* Un bon modèle :

  * anticipe l’usage
  * empêche les incohérences
  * guide naturellement la saisie
* Les catégories ne sont **pas des tags**
* Les tags ne sont **pas une hiérarchie**
* La base de données impose une **discipline intellectuelle**

---

##  Résultat attendu

À la fin de la session, vous devez avoir :

* une base fonctionnelle
* des données réalistes
* une classification claire
* un modèle qui **tient sans explication orale**

> Si quelqu’un d’autre peut comprendre votre base
> sans que vous soyez là pour la défendre,
> alors vous avez bien travaillé.

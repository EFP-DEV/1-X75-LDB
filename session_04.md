# Session 3 : Modélisation conceptuelle (MCD – Modèle Entité-Association)

## 1. Introduction à la méthode MERISE

La méthode **MERISE** est une démarche d’analyse et de conception de systèmes d’information.  
Elle propose plusieurs niveaux de modélisation (conceptuel, logique, physique) afin de **séparer** les préoccupations et d’offrir une **vision claire** du projet à chaque étape.

- **Niveau conceptuel** : on décrit la **réalité métier** sans tenir compte des contraintes techniques.
- **Niveau logique** : on décrit la **structure** de la base de données, en restant indépendant du SGBD.
- **Niveau physique** : on définit la **mise en œuvre technique** de la base de données (tables, index, etc.).

[would you like to know more?](more/MERISE.md)

L’étape clé de cette session est la construction du **Modèle Conceptuel des Données (MCD)**, qui permet de représenter **entités**, **associations** et **attributs** avant toute implémentation.

---

## 2. Construction d’un Modèle Conceptuel des Données (MCD)

Le **Modèle Conceptuel des Données (MCD)** est une représentation graphique et sémantique de la logique métier. Il facilite la communication entre **utilisateurs**, **chefs de projet** et **développeurs**.  

### 2.1. Notions fondamentales

1. **Entité**  
   - Représente un **objet** ou un **concept** du domaine (ex. : Client, Produit, Commande).  
   - Peut être vue comme une « classe » ou « table » (lorsqu’on passera au niveau physique).

2. **Attribut**  
   - Représente une **propriété** de l’entité (ex. : nom, adresse, prix).  
   - Se caractérise par un **type** (texte, nombre, date…).

3. **Association (ou relation)**  
   - Représente un **lien** entre des entités (ex. : un client passe une commande).  
   - Se définit par des **cardinalités** (ex. : un client peut passer plusieurs commandes ; une commande est passée par un seul client).

4. **Cardinalités**  
   - **1,1** : L’entité A est liée à exactement un élément de l’entité B.  
   - **1,N** : L’entité A peut être liée à plusieurs éléments de l’entité B, mais B est lié à un seul A.  
   - **M,N** : Les entités A et B peuvent être liées chacune à plusieurs éléments de l’autre.

### 2.2. Méthodologie

1. **Recueillir les exigences** : Comprendre le domaine, interroger les utilisateurs, définir les besoins.  
2. **Identifier les entités** : Faire la liste des objets à gérer (clients, produits, etc.).  
3. **Identifier les attributs** : Pour chaque entité, lister les informations à stocker.  
4. **Identifier les associations** : Déterminer les relations entre entités et leurs cardinalités (1,1), (1,N), (M,N).  
5. **Valider le MCD** : Vérifier auprès des acteurs métier que le modèle reflète la réalité.  

---

## 3. Exemples de MCD

Voici un **exemple simplifié** de MCD pour illustrer la méthode MERISE.  
Il s’agit d’un **système de commande** avec trois entités : **Client**, **Commande** et **Produit**.  


###  Interprétation

1. **Client**  
   - Représente la personne qui passe la commande.  
   - Attributs (ex. : `id`, `nom`, `prenom`, `email`).  

2. **Commande**  
   - Représente la commande effectuée par un client.  
   - Attributs (ex. : `id`, `date_cmd`, `creation`, `livraison`).  

3. **Produit**  
   - Représente chaque produit pouvant être commandé.  
   - Attributs (ex. : `id`, `libelle`, `prix`).  

### Associations et cardinalités

* **PASSE** : Relation entre CLIENT et COMMANDE
   * Cardinalité (0,N) côté CLIENT : Un client passe 0 ou plusieurs commandes
   * Cardinalité (1,1) côté COMMANDE : Une commande est passée par exactement un et un seul client

* **COMPORTE** : Relation entre COMMANDE et PRODUIT
   * Cardinalité (1,N) côté COMMANDE : Une commande doit contenir au moins 1 produits, mais peut en contenir plusieurs
   * Cardinalité (0,N) côté PRODUIT : Un produit peut ne jamais être commandé, ou être commandé dans plusieurs commandes


Ce MCD représente un système simple de gestion de commandes en ligne.

Cet exemple illustre comment on **décrit les entités et leurs attributs** et comment on **définit les cardinalités** des relations.  
Il s’agit d’une base pour comprendre la **démarche MERISE** et préparer la suite (création du Modèle Logique, puis Modèle Physique).


## Autres exemples

Voici quelques exemples supplémentaires de MCD pour différents domaines : 
[would you like to know more?](more/MCD_ASCII.md)

---

## 4. Résumé des points clés

- **MERISE** se découpe en plusieurs niveaux, dont le **niveau conceptuel** (MCD) permet de représenter la logique métier indépendamment de toute considération technique.  
- Un **MCD** se construit en identifiant **entités**, **attributs** et **associations**, tout en précisant leurs **cardinalités**.  
- La **méthodologie** comprend la collecte des besoins, la définition des entités, l’inventaire des attributs, l’étude des relations et la validation du modèle.  
- L’**étude de cas** permet de mettre en pratique ces principes : n’oubliez pas de valider votre MCD avec les **interlocuteurs métier** pour vous assurer de sa pertinence.

Ce travail de modélisation **conceptuelle** servira de base au passage vers le **modèle logique** (MLD), puis **physique** (création des tables SQL).  


## 5. Code Mermaid pour le MCD client commande

```
graph TD
    CLIENT["CLIENT
    id
    nom
    prenom
    email"]
    
    COMMANDE["COMMANDE
    id
    date_cmd
    creation
    livraison"]
    
    PRODUIT["PRODUIT
    id
    libelle
    prix"]
    
    PASSE["PASSE"]
    COMPORTE["COMPORTE"]
    
    CLIENT --- |"0,N"| PASSE
    PASSE --- |"1,1"| COMMANDE
    
    COMMANDE --- |"1,N"| COMPORTE
    COMPORTE --- |"0,N"| PRODUIT
```

---
> Ce cours est distribué sous **licence Creative Commons**. Toute reproduction ou distribution à but commercial est interdite sans l’accord préalable de l’auteur.

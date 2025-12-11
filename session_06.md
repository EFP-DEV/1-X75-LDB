# Session 6 : Exercice pratique

# Analyse du cahier des charges (MCD)

**Objectifs :**
- Identifier les entités principales du projet  
- Déterminer les relations entre ces entités  
- Créer un modèle conceptuel de donnees (MCD)
* PAUSE : 10 minutes
- Convertir le MCD en modèle relationnel  
- Appliquer les règles de normalisation  
- Préparer le script SQL de création des tables  
---

## Plan détaillé

### Analyse collaborative du cahier des charges
- Identification des entités principales
- Établissement de la liste des attributs pour chaque entité  

### Modélisation conceptuelle
- Construction du diagramme entité-association  
- Définition des cardinalités des relations  
- Discussion sur la relation many-to-many entre Items et Tags  

### Validation du modèle
- Vérification de la couverture des besoins fonctionnels  
- Discussion des cas d'utilisation principaux  
- Confirmation que le modèle supporte toutes les fonctionnalités demandées  


### Du MCD au modèle relationnel 
- Rappel des formes normales (1FN, 2FN, 3FN)  
- Traitement spécifique des relations many-to-many  
- Identification des clés primaires et étrangères  

### Définition des types de données et contraintes 
- Choix des types appropriés pour chaque attribut  
- Définition des contraintes (NOT NULL, UNIQUE, etc.)  
- Discussion sur les valeurs par défaut et les auto-incréments  

---

## Resultat final
- Présentation du schéma relationnel final
- Validation des types de données et des contraintes
- Discussion sur les choix de modélisation et leurs justifications
- Rédaction du script SQL pour la création des tables



# Cahier de charge

Ce document décrit toutes les règles que la base de données doit garantir pour assurer la cohérence du contenu, de la classification et des interactions du site.

---

# 1. **Les contenus (items)**

Chaque contenu est une fiche éditoriale soumise aux contraintes suivantes :

1. **Le titre doit être unique.**

2. **Le slug doit être unique.**

3. **Chaque contenu possède un statut clair** (brouillon, publié, archivé).

4. **Chaque contenu doit être lié à un utilisateur créateur** afin d'assurer la responsabilité éditoriale.

5. **Chaque contenu doit être lié à :**

   * un **thème**,
   * une **catégorie**.

6. **Un contenu peut recevoir autant de tags libres qu’on le souhaite**, mais :

   * un **même tag** ne peut pas être associé deux fois au même contenu.

---

# 2. **Les utilisateurs (opérateurs)**

Pour garantir un accès sécurisé :

1. **L’adresse e-mail doit être unique.**
2. **Le mot de passe doit être stocké sous forme sécurisée.**
3. **Un utilisateur peut être actif ou désactivé.**
4. **Les actions de gestion de contenu doivent être rattachées à un utilisateur.**

---

# 3. **Les thèmes**

1. **Chaque thème possède un nom unique.**
2. **Un thème ne peut pas être supprimé tant qu’il est utilisé par au moins un contenu.**

---

# 4. **Les catégories**

1. **Chaque catégorie possède un nom unique.**
2. **Chaque contenu doit appartenir à une catégorie existante.**
3. **Une catégorie ne peut pas être supprimée si elle est encore utilisée.**

---

# 5. **Les tags libres**

Les tags servent à enrichir la description des contenus.

1. **Chaque tag possède un nom unique.**
2. **Un contenu peut avoir plusieurs tags.**
3. **Un même tag ne peut pas apparaître deux fois sur un même contenu.**
4. **Un tag ne peut pas être supprimé s’il est encore utilisé, sauf si un nettoyage au préalable est effectué.**

---

# 6. **Les messages de contact**

Pour assurer un suivi minimal :

1. **Chaque message doit contenir les informations envoyées (nom, e-mail, texte).**
2. **Chaque message doit être daté.**
3. **Chaque message possède un statut : lu ou non lu.**

---

# 7. **Les collections utilisateurs (favoris, wishlist, panier, etc.)**

1. **Chaque collection appartient à un utilisateur.**
2. **Une collection peut contenir plusieurs contenus.**
3. **Un même contenu ne peut apparaître qu’une seule fois dans une même collection.**
4. **Une collection doit pouvoir être identifiée par un type** (ex. favoris, panier, wishlist).


---
> Ce cours est distribué sous **licence Creative Commons**. Toute reproduction ou distribution à but commercial est interdite sans l’accord préalable de l’auteur.

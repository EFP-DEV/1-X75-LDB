# **Session 08 — Correction complète : du cahier des charges au SQL final**

---

# ## 🎯 Objectifs de cette séance

Dans cette session, l'étudiant doit :

* comparer son travail aux bonnes pratiques
* vérifier la cohérence du MCD
* comprendre les transformations du MLD
* lire et analyser un MPD SQL professionnel
* corriger les erreurs typiques rencontrées dans le processus

Cette séance clôt la trilogie de modélisation.

---

# ## 1. Correction de l’analyse du cahier des charges

### Entités attendues

* **Operator**
* **Item**
* **Category**
* **Theme**
* **Tag**
* **Message**
* **Collection**

### Critères de validité

Une bonne analyse doit :

* Séparer clairement rôles / contenus / actions
* Ne pas mélanger logique métier et logique de gestion (ex: “gérer” n’est pas une entité)
* Identifier toutes les relations obligatoires du cahier des charges

### ❌ Erreurs fréquentes des étudiants

* Confondre "admin" et "operator"
* Oublier les tags libres
* Oublier la table d’association item_tag
* Créer des entités inutiles ("GERER", "POSSEDER", "ASSIGNER", etc.)
* Doubler category/theme/tag alors qu’ils ont des attributs identiques

---

# ## 2. Correction du MCD (Modèle Conceptuel de Données)

Voici le **MCD correct**, conforme au cahier des charges ET à Merise.

### ### Règles appliquées

* Item doit avoir **exactement 1** catégorie
* Item doit avoir **exactement 1** thème
* Item peut avoir **0,N** tags libres
* Un operator peut créer **0,N** collections
* Un operator peut être assigné à **0,1** messages
* Relations N,N transformées en entités associatives

### ### MCD corrigé (verbal)

| Entité               | Relations correctes                      |
| -------------------- | ---------------------------------------- |
| **Item**             | 1,1 → Category ; 1,1 → Theme ; 0,N → Tag |
| **Tag**              | N,N via Taguer                           |
| **Collection**       | 1 operator → N collections               |
| **Collection_Item**  | N,N association résolue                  |
| **Message**          | 0,1 → Operator                           |
| **Category / Theme** | Relations 1,N depuis Item                |

### ❌ Erreurs typiques trouvées et corrigées

* “GÉRER” représenté comme entité → supprimé
* Cardinalités imprécises (1,N écrits comme 0,N) → corrigés
* Absence de relation Message→Operator → corrigée
* Catégorie/Thème modélisés comme tables indépendantes sans lien item → corrigé

---

# ## 3. Correction du MLD (Modèle Logique Relationnel)

Le MLD reprend le MCD en suivant ces règles :

### Entité = table

### Clé primaire choisie → AUTO_INCREMENT

### 1,N = FK côté N

### 1,1 = FK NOT NULL

### 0,1 = FK NULLABLE

### N,N = table associative (PK composée)

### Tous les noms d’attributs deviennent SQL-compatibles

### MLD correct attendu

| Table           | Clés                               | Commentaires               |
| --------------- | ---------------------------------- | -------------------------- |
| operator        | id PK                              | —                          |
| collection      | id PK, creator_id FK               | 1 operator = N collections |
| collection_item | (collection_id, item_id) PK        | table associative          |
| message         | id PK, assigned_to FK NULL         | relation 0,1               |
| item            | id PK, category_id FK, theme_id FK | relations 1,1              |
| category        | id PK                              | —                          |
| theme           | id PK                              | —                          |
| tag             | id PK                              | —                          |
| taguer          | (item_id, tag_id) PK               | table associative          |

---

# ## 4. Correction du MPD (Modèle Physique MySQL)

### Bonnes pratiques attendues

* Créer les tables **avant** d’ajouter les clés étrangères
* Utiliser `ALTER TABLE ... ADD CONSTRAINT`
* Utiliser des `ON DELETE` cohérents avec les cardinalités
* Utiliser les bons types SQL
* Encodage utf8mb4
* Noms de contraintes explicites

Les tables **sans FKs** étaient correctes si :

* Les types choisies sont cohérents
* Les attributs obligatoires sont NOT NULL
* slug / email sont bien en UNIQUE

Les tables **avec FKs** doivent respecter les règles MCD :

| Cardinalité MCD | Traduction SQL                   |
| --------------- | -------------------------------- |
| **1,1**         | FK NOT NULL + ON DELETE RESTRICT |
| **0,1**         | FK NULLABLE + ON DELETE SET NULL |
| **1,N**         | FK NOT NULL sur côté N           |
| **N,N**         | table associative PK composée    |

### Résultat : Script SQL final corrigé

(Vu dans la séance précédente, il fait référence pour la correction)

---

# ## 5. Points clés corrigés chez les étudiants

### 1. Trop d’entités inutiles

Beaucoup d’étudiants modélisent :

* Gérer
* Attribuer
* Posséder

→ **Ces termes décrivent des actions, pas des entités.**
→ Elles ne DOIVENT PAS apparaître dans un MCD.

### 2. Mauvaises cardinalités

Exemples fréquents :

* Item → Tag en 1,N au lieu de N,N
* Message → Operator en 1,1 au lieu de 0,1
* Operator → Collection en 0,1 au lieu de 1,N

### 3. Mauvaises clés primaires dans tables associatives

→ Correction : **toujours** `(FK1, FK2)`.

### 4. FKs non cohérentes avec le MCD

→ Correction appliquée :

* NOT NULL pour relations obligatoires
* NULLABLE pour relations optionnelles

### 5. Types SQL non adaptés

→ Correction :

* INT UNSIGNED pour les PK
* VARCHAR(255) pour les slugs, labels, emails

---

# ## 6. Résultat attendu

### Un MCD propre, lisible, sans bruit administratif

### Un MLD normalisé, cohérent, structuré

### Un MPD SQL professionnel avec ALTER TABLE

### Un pipeline complet : **Métier → Concept → Logique → Physique**

---

# ## 7. Mini-correction interactive (15 min)

### **Question 1**

Pourquoi `message.assigned_to` doit-il être NULLABLE ?

**Réponse attendue :**
Parce que la cardinalité est **0,1**, donc un message peut exister sans être assigné à un opérateur.

---

### **Question 2**

Pourquoi `item.category_id` ne doit-il jamais être NULL ?

**Réponse :**
Relation **1,1** : tout item doit obligatoirement appartenir à une catégorie.

---

### **Question 3**

Pourquoi crée-t-on la table `taguer` ?

**Réponse :**
Parce que la relation Item–Tag est **N,N**, impossible à représenter directement dans SQL.

---


# ## 8. Conclusion

Cette correction clôt la trilogie :

1. **Analyse du besoin (Session 06)**
2. **MCD + MLD + MPD (Session 07)**
3. **Correction finale + justification (Session 08)**

# MCD
[MCD Atelier - Mermaid](https://github.com/EFP-DEV/1-X75-Atelier/blob/main/assets/MCD.mermaid)



# MLD

[MLD Atelier - Mermaid](https://github.com/EFP-DEV/1-X75-Atelier/blob/main/assets/MLD.mermaid)


# MPD (Sans relation)

[MPD Atelier - SQL](https://github.com/EFP-DEV/1-X75-Atelier/blob/main/assets/MPD.sql)




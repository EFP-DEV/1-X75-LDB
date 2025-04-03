# Exercice 7
# Démonstration de l'intégrité des données avec les clés étrangères

## Scénario : Système e-commerce avec clients, commandes et produits

<img src="../more/session_7_mcd.svg" alt="MCD" height="800" />

---

## PARTIE 1 : BASE DE DONNÉES SANS CLÉS ÉTRANGÈRES

### Création des tables de base
```sql
CREATE TABLE customer (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE product (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Création des tables de commande SANS contraintes de clés étrangères
CREATE TABLE order_no_fk (
    id INT PRIMARY KEY,
    customer_id INT, -- Pas de contrainte FK, n'importe quelle valeur peut être insérée ici
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE order_item_no_fk (
    id INT PRIMARY KEY,
    order_id INT, -- Pas de contrainte FK, peut référencer des commandes inexistantes
    product_id INT, -- Pas de contrainte FK, peut référencer des produits inexistants
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
```

### Insertion des données d'exemple
```sql
INSERT INTO customer VALUES (1, 'Alice Johnson', 'alice@example.com');
INSERT INTO customer VALUES (2, 'Bob Smith', 'bob@example.com');

INSERT INTO product VALUES (101, 'Laptop', 899.99, 10);
INSERT INTO product VALUES (102, 'Smartphone', 499.99, 20);

-- Insertions de données valides
INSERT INTO order_no_fk VALUES (1001, 1, CURRENT_TIMESTAMP, 899.99);
INSERT INTO order_item_no_fk VALUES (10001, 1001, 101, 1, 899.99);
```

### Exercices Partie 1 :

**Exercice 1.1** : Écrivez une instruction INSERT pour la table `order_no_fk` qui référence un `customer_id` qui n'existe pas dans la table `customer`.
Que se passe-t-il ? Pourquoi est-ce un problème pour l'intégrité des données ?

**Exercice 1.2** : Écrivez une instruction INSERT pour la table `order_item_no_fk` qui référence un `product_id` qui n'existe pas dans la table `product`.
Que se passe-t-il ? Quels problèmes commerciaux cela pourrait-il causer ?

**Exercice 1.3** : Écrivez une instruction DELETE pour supprimer le client avec l'ID 1.
Puis écrivez une instruction SELECT pour vérifier si des commandes font toujours référence à ce client supprimé.
Qu'observez-vous ? Pourquoi est-ce problématique ?

---

## PARTIE 2 : BASE DE DONNÉES AVEC CLÉS ÉTRANGÈRES STANDARD (NO ACTION/RESTRICT)

### Création des tables de commande AVEC contraintes de clés étrangères standard
```sql
CREATE TABLE order_standard_fk (
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id)
    -- Comportement par défaut : ON DELETE/UPDATE NO ACTION (ou RESTRICT dans certains SGBD)
);

CREATE TABLE order_item_standard_fk (
    id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES order_standard_fk(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
```

### Insertion de données valides
```sql
INSERT INTO order_standard_fk VALUES (2001, 2, CURRENT_TIMESTAMP, 499.99);
INSERT INTO order_item_standard_fk VALUES (20001, 2001, 102, 1, 499.99);
```

### Exercices Partie 2 :

**Exercice 2.1** : Essayez d'écrire une instruction INSERT qui référence un client inexistant.
Quel message d'erreur obtenez-vous ?

**Exercice 2.2** : Essayez de supprimer le client avec l'ID 2 qui a des commandes existantes.
Que se passe-t-il ? Pourquoi la base de données empêche-t-elle cette opération ?

**Exercice 2.3** : Essayez de mettre à jour un `customer_id` dans la table `customer` lorsque des commandes y font référence.
Que se passe-t-il ?

---

## PARTIE 3 : ON DELETE CASCADE ET ON UPDATE CASCADE

### Création des tables avec options CASCADE
```sql
CREATE TABLE order_cascade (
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id) 
        ON DELETE CASCADE  -- Quand un client est supprimé, supprime toutes ses commandes
        ON UPDATE CASCADE  -- Quand customer_id est mis à jour, met à jour les références automatiquement
);

CREATE TABLE order_item_cascade (
    id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES order_cascade(id)
        ON DELETE CASCADE  -- Quand une commande est supprimée, supprime tous ses éléments
        ON UPDATE CASCADE, -- Quand order_id est mis à jour, met à jour les références automatiquement
    FOREIGN KEY (product_id) REFERENCES product(id)
        ON DELETE RESTRICT -- Empêche la suppression des produits dans les commandes
        ON UPDATE CASCADE  -- Quand product_id est mis à jour, met à jour les références automatiquement
);
```

### Insertion de données pour la démonstration CASCADE
```sql
INSERT INTO customer VALUES (3, 'Charlie Davis', 'charlie@example.com');
INSERT INTO order_cascade VALUES (3001, 3, CURRENT_TIMESTAMP, 499.99);
INSERT INTO order_item_cascade VALUES (30001, 3001, 102, 1, 499.99);
```

### Exercices Partie 3 :

**Exercice 3.1** : Écrivez une instruction DELETE pour supprimer le client avec l'ID 3.
Puis écrivez des instructions SELECT pour vérifier si les commandes ou les éléments de commande existent toujours pour ce client.
Que s'est-il passé et pourquoi ?

**Exercice 3.2** : Insérez un nouveau client avec l'ID 4, créez une commande et un élément de commande pour lui.
Puis écrivez une instruction UPDATE pour changer l'ID du client de 4 à 44.
Vérifiez ce qui est arrivé aux enregistrements de commande associés. Pourquoi cela s'est-il produit ?

--- 

## PARTIE 4 : ON DELETE SET NULL ET ON UPDATE SET NULL

### Création des tables avec options SET NULL
```sql
CREATE TABLE order_set_null (
    id INT PRIMARY KEY,
    customer_id INT,  -- Doit être nullable pour que SET NULL fonctionne
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id) 
        ON DELETE SET NULL  -- Quand un client est supprimé, met customer_id à NULL
        ON UPDATE SET NULL  -- Quand customer_id est mis à jour, met les références à NULL
);

CREATE TABLE order_item_set_null (
    id INT PRIMARY KEY,
    order_id INT,      -- Doit être nullable pour que SET NULL fonctionne
    product_id INT,    -- Doit être nullable pour que SET NULL fonctionne
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES order_set_null(id)
        ON DELETE SET NULL  -- Quand une commande est supprimée, met order_id à NULL
        ON UPDATE SET NULL, -- Quand order_id est mis à jour, met les références à NULL
    FOREIGN KEY (product_id) REFERENCES product(id)
        ON DELETE SET NULL  -- Quand un produit est supprimé, met product_id à NULL
        ON UPDATE SET NULL  -- Quand product_id est mis à jour, met les références à NULL
);
```

### Insertion de données pour la démonstration SET NULL
```sql
INSERT INTO customer VALUES (5, 'Eve Williams', 'eve@example.com');
INSERT INTO order_set_null VALUES (5001, 5, CURRENT_TIMESTAMP, 899.99);
INSERT INTO order_item_set_null VALUES (50001, 5001, 101, 1, 899.99);
```

### Exercices Partie 4 :

**Exercice 4.1** : Écrivez une instruction DELETE pour supprimer le client avec l'ID 5.
Puis écrivez une instruction SELECT pour vérifier ce qui est arrivé au `customer_id` dans les commandes associées.
Pourquoi cette approche pourrait-elle être utile dans certains scénarios commerciaux ?

**Exercice 4.2** : Supprimez la commande avec l'ID 5001.
Puis vérifiez ce qui est arrivé aux éléments de commande. Quel scénario commercial cette approche pourrait-elle soutenir ?

---

## PARTIE 5 : ON DELETE SET DEFAULT ET ON UPDATE SET DEFAULT
### Création d'un client et d'un produit par défaut pour la démonstration SET DEFAULT
```sql
INSERT INTO customer VALUES (999, 'Client Inconnu', 'unknown@example.com');
INSERT INTO product VALUES (999, 'Produit Inconnu', 0.00, 0);
```

### Création des tables avec options SET DEFAULT
```sql
CREATE TABLE order_set_default (
    id INT PRIMARY KEY,
    customer_id INT DEFAULT 999,  -- Valeur par défaut pour SET DEFAULT
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id) 
        ON DELETE SET DEFAULT  -- Quand un client est supprimé, met à la valeur par défaut
        ON UPDATE SET DEFAULT  -- Quand customer_id est mis à jour, met à la valeur par défaut
);

CREATE TABLE order_item_set_default (
    id INT PRIMARY KEY,
    order_id INT DEFAULT NULL,  -- Valeur par défaut pour SET DEFAULT
    product_id INT DEFAULT 999, -- Par défaut au "Produit Inconnu"
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES order_set_default(id)
        ON DELETE SET DEFAULT
        ON UPDATE SET DEFAULT,
    FOREIGN KEY (product_id) REFERENCES product(id)
        ON DELETE SET DEFAULT
        ON UPDATE SET DEFAULT
);
```

### Insertion de données pour la démonstration SET DEFAULT
```sql
INSERT INTO customer VALUES (6, 'Frank Miller', 'frank@example.com');
INSERT INTO order_set_default VALUES (6001, 6, CURRENT_TIMESTAMP, 499.99);
INSERT INTO order_item_set_default VALUES (60001, 6001, 102, 1, 499.99);
```

### Exercices Partie 5 :

**Exercice 5.1** : Écrivez une instruction DELETE pour supprimer le client avec l'ID 6.
Puis écrivez une instruction SELECT pour vérifier ce qui est arrivé au `customer_id` dans les commandes associées.
En quoi cela diffère-t-il de SET NULL ?

**Exercice 5.2** : Mettez à jour le `product_id` du produit 102 à 222.
Vérifiez ce qui est arrivé au `product_id` dans les éléments de commande.
Quelles sont les implications commerciales de cette approche ?

---
## EXERCICE DE COMPARAISON

**Exercice 6.1** : Créez un tableau de décision comparant toutes les options ON DELETE
(NO ACTION/RESTRICT, CASCADE, SET NULL, SET DEFAULT).
Pour chaque option, décrivez :
- Ce qui se passe lorsque vous supprimez un enregistrement parent
- Quand vous utiliseriez cette option
- Avantages et inconvénients

**Exercice 6.2** : Créez un tableau de décision similaire pour les options ON UPDATE.
Pour chaque option, décrivez :
- Ce qui se passe lorsque vous mettez à jour une clé primaire dans une table parent
- Quand vous utiliseriez cette option
- Avantages et inconvénients

---

## EXERCICE FINAL : APPLICATION PRATIQUE À L'E-COMMERCE

**Exercice 7** : Sur la base de votre compréhension des différentes options ON DELETE et ON UPDATE,
lesquelles recommanderiez-vous pour les relations suivantes dans un système e-commerce, et pourquoi ?

**7.1** : Pour la relation entre `customer` et `order` :
- Quelle option ON DELETE choisiriez-vous ? Pourquoi ?
- Quelle option ON UPDATE choisiriez-vous ? Pourquoi ?

**7.2** : Pour la relation entre `order` et `order_item` :
- Quelle option ON DELETE choisiriez-vous ? Pourquoi ?
- Quelle option ON UPDATE choisiriez-vous ? Pourquoi ?

**7.3** : Pour la relation entre `product` et `order_item` :
- Quelle option ON DELETE choisiriez-vous ? Pourquoi ?
- Quelle option ON UPDATE choisiriez-vous ? Pourquoi ?

**7.4** : Pour la relation entre `shipping_address` et `order` :
- Quelle option ON DELETE choisiriez-vous ? Pourquoi ?
- Quelle option ON UPDATE choisiriez-vous ? Pourquoi ?

Justifiez vos choix avec des exigences commerciales spécifiques et des préoccupations d'intégrité des données.
N'oubliez pas que différentes relations peuvent nécessiter différentes options.

---
## RÉSULTATS ATTENDUS ET POINTS CLÉS

### Options ON DELETE - Différences clés :
1. **NO ACTION/RESTRICT** : Empêche la suppression du parent si des enfants existent
   - Option la plus sûre, empêche totalement les enregistrements orphelins
   - Force l'application à gérer explicitement les relations

2. **CASCADE** : Supprime automatiquement tous les enregistrements enfants liés
   - Maintient l'intégrité de la base de données automatiquement
   - Bon pour les relations de "propriété" (par ex., les éléments de commande appartiennent aux commandes)
   - Risque : Peut supprimer plus de données que prévu si les relations sont complexes

3. **SET NULL** : Met la clé étrangère dans les enregistrements enfants à NULL
   - Préserve les enregistrements enfants tout en supprimant la relation
   - Bon pour les relations optionnelles
   - Nécessite des colonnes de clé étrangère nullables
   - Risque : Les données deviennent déconnectées, perdant un contexte important

4. **SET DEFAULT** : Met la clé étrangère à une valeur par défaut
   - Similaire à SET NULL mais maintient une référence à un enregistrement par défaut
   - Bon pour maintenir l'intégrité des données tout en supprimant une relation spécifique
   - Nécessite que des enregistrements par défaut appropriés existent
   - Utile pour les enregistrements historiques où la référence originale est supprimée

### Les options ON UPDATE fonctionnent de manière similaire mais s'appliquent lorsque les clés primaires sont mises à jour.
Cela est moins courant dans les bases de données bien conçues car les clés primaires sont généralement
des identifiants stables qui ne changent pas.

### Implications commerciales - exemples :
- **CASCADE** : Lorsqu'un compte client est fermé, supprimez automatiquement toutes ses données
- **SET NULL** : Lorsqu'un produit est discontinué, conservez l'historique des commandes mais marquez-le comme non lié
- **SET DEFAULT** : Lors de la fusion de comptes clients, déplacez les commandes orphelines vers un compte générique
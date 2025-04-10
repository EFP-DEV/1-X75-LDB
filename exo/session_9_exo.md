# Exercice 7
# Démonstration de l'intégrité des données avec les clés étrangères

- [1. Base sans clés étrangères](#1-base-sans-clés-étrangères)
- [2. Base avec clés étrangères standard](#2-base-avec-clés-étrangères-standard)
- [3. ON DELETE CASCADE et ON UPDATE CASCADE](#3-on-delete-cascade-et-on-update-cascade)
- [4. ON DELETE SET NULL et ON UPDATE SET NULL](#4-on-delete-set-null-et-on-update-set-null)
- [5. ON DELETE SET DEFAULT et ON UPDATE SET DEFAULT](#5-on-delete-set-default-et-on-update-set-default)
- [6. Exercice final](#6-exercice-final)
- [7. Résultats attendus](#7-résultats-attendus)

---

## Scénario : Système e-commerce avec clients, commandes et produits

<img src="../more/session_7_mcd.svg" alt="MCD" height="800" />

---

## 1. Base sans clés étrangères

### Création des tables
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

-- Tables de commande SANS contraintes de clés étrangères
CREATE TABLE order_no_fk (
    id INT PRIMARY KEY,
    customer_id INT, -- Pas de contrainte FK
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE order_item_no_fk (
    id INT PRIMARY KEY,
    order_id INT, -- Pas de contrainte FK
    product_id INT, -- Pas de contrainte FK
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
```

### Données d'exemple
```sql
INSERT INTO customer VALUES (1, 'Alice Johnson', 'alice@example.com');
INSERT INTO customer VALUES (2, 'Bob Smith', 'bob@example.com');

INSERT INTO product VALUES (101, 'Laptop', 899.99, 10);
INSERT INTO product VALUES (102, 'Smartphone', 499.99, 20);

-- Insertions valides
INSERT INTO order_no_fk VALUES (1001, 1, CURRENT_TIMESTAMP, 899.99);
INSERT INTO order_item_no_fk VALUES (10001, 1001, 101, 1, 899.99);
```

### Exercices 1

**1.1** : Écrivez un INSERT pour `order_no_fk` référençant un `customer_id` inexistant.
Que se passe-t-il ? Pourquoi est-ce problématique ?

**1.2** : Écrivez un INSERT pour `order_item_no_fk` référençant un `product_id` inexistant.
Que se passe-t-il ? Quels problèmes cela pourrait-il causer ?

**1.3** : Supprimez le client avec l'ID 1, puis vérifiez si des commandes y font toujours référence.
Qu'observez-vous ? Pourquoi est-ce problématique ?

---

## 2. Base avec clés étrangères standard

### Tables avec contraintes
```sql
CREATE TABLE order_standard_fk (
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE order_item_standard_fk (
    id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
```

```sql
ALTER TABLE order_standard_fk
ADD CONSTRAINT fk_order_customer
FOREIGN KEY (customer_id) REFERENCES customer(id);  -- Par défaut : ON DELETE/UPDATE NO ACTION

ALTER TABLE order_item_standard_fk
ADD CONSTRAINT fk_order_item_order
FOREIGN KEY (order_id) REFERENCES order_standard_fk(id);

ALTER TABLE order_item_standard_fk
ADD CONSTRAINT fk_order_item_product
FOREIGN KEY (product_id) REFERENCES product(id);
```

### Données valides
```sql
INSERT INTO order_standard_fk VALUES (2001, 2, CURRENT_TIMESTAMP, 499.99);
INSERT INTO order_item_standard_fk VALUES (20001, 2001, 102, 1, 499.99);
```

### Exercices 2

**2.1** : Essayez d'insérer une commande référençant un client inexistant.
Quel message d'erreur obtenez-vous ?

**2.2** : Essayez de supprimer le client avec l'ID 2 qui a des commandes.
Que se passe-t-il ? Pourquoi ?

**2.3** : Essayez de modifier un `customer_id` référencé par des commandes.
Que se passe-t-il ?

---

## 3. ON DELETE CASCADE et ON UPDATE CASCADE

### Tables avec CASCADE
```sql
CREATE TABLE order_cascade (
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE order_item_cascade (
    id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
```
```sql
ALTER TABLE order_cascade
ADD CONSTRAINT fk_order_cascade_customer
FOREIGN KEY (customer_id) REFERENCES customer(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE order_item_cascade
ADD CONSTRAINT fk_order_item_cascade_order
FOREIGN KEY (order_id) REFERENCES order_cascade(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE order_item_cascade
ADD CONSTRAINT fk_order_item_cascade_product
FOREIGN KEY (product_id) REFERENCES product(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;
```

### Données pour CASCADE
```sql
INSERT INTO customer VALUES (3, 'Charlie Davis', 'charlie@example.com');
INSERT INTO order_cascade VALUES (3001, 3, CURRENT_TIMESTAMP, 499.99);
INSERT INTO order_item_cascade VALUES (30001, 3001, 102, 1, 499.99);
```

### Exercices 3

**3.1** : Supprimez le client avec l'ID 3, puis vérifiez si les commandes existent toujours.
Que s'est-il passé et pourquoi ?

**3.2** : Insérez un client ID 4 avec commande, puis modifiez l'ID du client de 4 à 44.
Vérifiez les commandes associées. Pourquoi cela s'est-il produit ?

--- 

## 4. ON DELETE SET NULL et ON UPDATE SET NULL

### Tables avec SET NULL
```sql
CREATE TABLE order_set_null (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE order_item_set_null (
    id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
```
```sql
ALTER TABLE order_set_null
ADD CONSTRAINT fk_order_set_null_customer
FOREIGN KEY (customer_id) REFERENCES customer(id)
ON DELETE SET NULL
ON UPDATE SET NULL;

ALTER TABLE order_item_set_null
ADD CONSTRAINT fk_order_item_set_null_order
FOREIGN KEY (order_id) REFERENCES order_set_null(id)
ON DELETE SET NULL
ON UPDATE SET NULL;

ALTER TABLE order_item_set_null
ADD CONSTRAINT fk_order_item_set_null_product
FOREIGN KEY (product_id) REFERENCES product(id)
ON DELETE SET NULL
ON UPDATE SET NULL;
```

### Données pour SET NULL
```sql
INSERT INTO customer VALUES (5, 'Eve Williams', 'eve@example.com');
INSERT INTO order_set_null VALUES (5001, 5, CURRENT_TIMESTAMP, 899.99);
INSERT INTO order_item_set_null VALUES (50001, 5001, 101, 1, 899.99);
```

### Exercices 4

**4.1** : Supprimez le client avec l'ID 5, puis vérifiez le `customer_id` dans les commandes.
Pourquoi cette approche peut-elle être utile ?

**4.2** : Supprimez la commande ID 5001, puis vérifiez les éléments de commande.
Quel scénario commercial cette approche pourrait-elle soutenir ?

---
## 5. ON DELETE SET DEFAULT et ON UPDATE SET DEFAULT

### Client et produit par défaut
```sql
INSERT INTO customer VALUES (999, 'Client Inconnu', 'unknown@example.com');
INSERT INTO product VALUES (999, 'Produit Inconnu', 0.00, 0);
```

### Tables avec SET DEFAULT
```sql
CREATE TABLE order_set_default (
    id INT PRIMARY KEY,
    customer_id INT DEFAULT 999,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE order_item_set_default (
    id INT PRIMARY KEY,
    order_id INT DEFAULT NULL,
    product_id INT DEFAULT 999,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
```
```sql
ALTER TABLE order_set_default
ADD CONSTRAINT fk_order_set_default_customer
FOREIGN KEY (customer_id) REFERENCES customer(id)
ON DELETE SET DEFAULT
ON UPDATE SET DEFAULT;

ALTER TABLE order_item_set_default
ADD CONSTRAINT fk_order_item_set_default_order
FOREIGN KEY (order_id) REFERENCES order_set_default(id)
ON DELETE SET DEFAULT
ON UPDATE SET DEFAULT;

ALTER TABLE order_item_set_default
ADD CONSTRAINT fk_order_item_set_default_product
FOREIGN KEY (product_id) REFERENCES product(id)
ON DELETE SET DEFAULT
ON UPDATE SET DEFAULT;
```

### Données pour SET DEFAULT
```sql
INSERT INTO customer VALUES (6, 'Frank Miller', 'frank@example.com');
INSERT INTO order_set_default VALUES (6001, 6, CURRENT_TIMESTAMP, 499.99);
INSERT INTO order_item_set_default VALUES (60001, 6001, 102, 1, 499.99);
```

### Exercices 5

**5.1** : Supprimez le client ID 6, puis vérifiez le `customer_id` dans les commandes.
En quoi cela diffère-t-il de SET NULL ?

**5.2** : Mettez à jour le `product_id` 102 à 222, puis vérifiez les éléments de commande.
Quelles sont les implications commerciales ?

---

## 6. Exercice final

Sur la base de votre compréhension des options ON DELETE et ON UPDATE, lesquelles recommanderiez-vous pour :

**6.1** : Relation entre `customer` et `order` :
- Option ON DELETE ? Pourquoi ?
- Option ON UPDATE ? Pourquoi ?

**6.2** : Relation entre `order` et `order_item` :
- Option ON DELETE ? Pourquoi ?
- Option ON UPDATE ? Pourquoi ?

**6.3** : Relation entre `product` et `order_item` :
- Option ON DELETE ? Pourquoi ?
- Option ON UPDATE ? Pourquoi ?

**6.4** : Relation entre `shipping_address` et `order` :
- Option ON DELETE ? Pourquoi ?
- Option ON UPDATE ? Pourquoi ?

Justifiez vos choix avec des exigences commerciales et des préoccupations d'intégrité.

---
## 7. Résultats attendus

### Options ON DELETE
1. **NO ACTION/RESTRICT** : Empêche la suppression du parent si des enfants existent
   - Option la plus sûre
   - Force la gestion explicite des relations

2. **CASCADE** : Supprime automatiquement tous les enfants liés
   - Maintient l'intégrité automatiquement
   - Bon pour les relations de "propriété"
   - Risque : Peut supprimer plus de données que prévu

3. **SET NULL** : Met la clé étrangère à NULL
   - Préserve les enfants tout en supprimant la relation
   - Bon pour les relations optionnelles
   - Nécessite des colonnes FK nullables
   - Risque : Perte de contexte

4. **SET DEFAULT** : Met la clé étrangère à une valeur par défaut
   - Maintient une référence à un enregistrement par défaut
   - Nécessite des enregistrements par défaut
   - Utile pour les enregistrements historiques

### Options ON UPDATE
Fonctionnent de manière similaire mais s'appliquent lors de la modification des clés primaires.
Moins courant car les PK sont généralement stables.

### Implications commerciales
- **CASCADE** : Suppression automatique de toutes les données d'un client lors de la fermeture de compte
- **SET NULL** : Conservation de l'historique des commandes pour produits discontinués
- **SET DEFAULT** : Transfert des commandes vers un compte générique lors d'une fusion de clients



---
> Ce cours est distribué sous **licence Creative Commons**. Toute reproduction ou distribution à but commercial est interdite sans l’accord préalable de l’auteur.
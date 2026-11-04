-- Création des tables

-- Table department (3NF)
CREATE TABLE department (
    department_ID VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Table category (3NF)
CREATE TABLE category (
    category_ID VARCHAR(10) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Table customer (2NF)
CREATE TABLE customer (
    customer_ID VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_phone VARCHAR(20) NOT NULL
);

-- Table seller (3NF)
CREATE TABLE seller (
    seller_ID VARCHAR(10) PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    department_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (department_ID) REFERENCES department(department_ID)
);

-- Table product (3NF)
CREATE TABLE product (
    product_ID VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_ID VARCHAR(10) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (category_ID) REFERENCES category(category_ID)
);

-- Table sale (2NF)
CREATE TABLE sale (
    sale_ID INT PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_ID VARCHAR(10) NOT NULL,
    seller_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_ID) REFERENCES customer(customer_ID),
    FOREIGN KEY (seller_ID) REFERENCES seller(seller_ID)
);

-- Table sale_detail (2NF)
CREATE TABLE sale_detail (
    sale_ID INT,
    product_ID VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (sale_ID, product_ID),
    FOREIGN KEY (sale_ID) REFERENCES sale(sale_ID),
    FOREIGN KEY (product_ID) REFERENCES product(product_ID)
);

-- Insertion des données

-- Insertion dans department
INSERT INTO department (department_ID, department_name) VALUES
('D001', 'Informatique'),
('D002', 'Audio');

-- Insertion dans category
INSERT INTO category (category_ID, category_name) VALUES
('C001', 'Informatique'),
('C002', 'Périphériques'),
('C003', 'Audio'),
('C004', 'Stockage');

-- Insertion dans customer
INSERT INTO customer (customer_ID, customer_name, customer_email, customer_phone) VALUES
('C001', 'Dupont Martin', 'dupont@email.com', '0123456789'),
('C002', 'Durand Sophie', 'durand@email.com', '0234567890');

-- Insertion dans seller
INSERT INTO seller (seller_ID, seller_name, department_ID) VALUES
('V001', 'Lefebvre Alice', 'D001'),
('V002', 'Moreau Jean', 'D002');

-- Insertion dans product
INSERT INTO product (product_ID, product_name, category_ID, unit_price) VALUES
('P001', 'Ordinateur portable', 'C001', 500.00),
('P002', 'Souris sans fil', 'C002', 50.00),
('P003', 'Casque audio', 'C003', 750.00),
('P004', 'Clé USB', 'C004', 25.00),
('P005', 'PC de bureau', 'C001', 1200.00);

-- Insertion dans sale
INSERT INTO sale (sale_ID, sale_date, customer_ID, seller_ID) VALUES
(1, '2025-03-10', 'C001', 'V001'),
(2, '2025-03-11', 'C002', 'V002'),
(3, '2025-03-11', 'C001', 'V001');

-- Insertion dans sale_detail
INSERT INTO sale_detail (sale_ID, product_ID, quantity) VALUES
(1, 'P001', 1),
(1, 'P002', 2),
(2, 'P002', 1),
(2, 'P003', 1),
(2, 'P004', 3),
(3, 'P001', 1),
(3, 'P005', 1);

-- Requête pour obtenir l'historique des achats du client C001 (version 3NF)
SELECT s.sale_ID, s.sale_date, dv.product_ID, p.product_name, c.category_name, 
       p.unit_price, dv.quantity, vend.seller_name, dept.department_name
FROM sale s
JOIN sale_detail dv ON s.sale_ID = dv.sale_ID
JOIN product p ON dv.product_ID = p.product_ID
JOIN category c ON p.category_ID = c.category_ID
JOIN seller vend ON s.seller_ID = vend.seller_ID
JOIN department dept ON vend.department_ID = dept.department_ID
WHERE s.customer_ID = 'C001';

-- Requête pour obtenir un résultat similaire à la version non normalisée
SELECT 
    s.sale_ID,
    s.sale_date,
    GROUP_CONCAT(dv.product_ID ORDER BY dv.product_ID SEPARATOR ', ') AS products,
    GROUP_CONCAT(p.product_name ORDER BY dv.product_ID SEPARATOR ', ') AS products_names,
    GROUP_CONCAT(c.category_name ORDER BY dv.product_ID SEPARATOR ', ') AS products_categories,
    GROUP_CONCAT(CONCAT(p.unit_price, '€') ORDER BY dv.product_ID SEPARATOR ', ') AS unit_prices,
    GROUP_CONCAT(dv.quantity ORDER BY dv.product_ID SEPARATOR ', ') AS quantities,
    vend.seller_name
FROM sale s
JOIN sale_detail dv ON s.sale_ID = dv.sale_ID
JOIN product p ON dv.product_ID = p.product_ID
JOIN category c ON p.category_ID = c.category_ID
JOIN seller vend ON s.seller_ID = vend.seller_ID
WHERE s.customer_ID = 'C001'
GROUP BY s.sale_ID, s.sale_date, vend.seller_name;
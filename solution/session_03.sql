-- 1. Créer un nouvel employé
INSERT INTO `employee` (`id`, `firstname`, `lastname`, `role`, `department`) 
VALUES (NULL, 'John', 'Doe', 'Ingénieur Logiciel', 'IT');

-- Alternative plus concise
INSERT INTO employee (firstname, lastname, role, department) 
VALUES ('John', 'Doe', 'Ingénieur Logiciel', 'IT');

-- 2. Lire toutes les informations des employés
SELECT * FROM `employee` WHERE `department` = 'IT';

-- 3. Lire les informations spécifiques d'un employé
SELECT `firstname`, `lastname` FROM `employee` WHERE `department` = 'HR';

-- 4. Mettre à jour le rôle d'un employé
UPDATE `employee` SET `role` = 'Cannibal Love Interest' WHERE `id` = 15;

-- 5. Supprimer un enregistrement d'employé
DELETE FROM `employee` WHERE `id` = 15;

-- 6. Lire les employés ordonnés par nom de famille
SELECT * FROM `employee` ORDER BY `lastname` ASC;

-- 7. Compter le nombre d'employés dans un département
SELECT COUNT(*) FROM `employee` WHERE `department` = 'IT';

-- 8. Mettre à jour le département pour plusieurs employés
UPDATE `employee` SET `department` = 'Sales' WHERE `department` = 'Legal';

-- 9. Trouver les employés sans département
SELECT * FROM `employee` WHERE `department` IS NULL;

-- 10. Insérer plusieurs nouveaux employés
INSERT INTO `employee` 
    (`firstname`, `lastname`, `role`, `department`) 
VALUES
    ('Alice', 'Bob', 'cryptographe', 'Data Science'),
    ('Bono', NULL, 'Chef de Produit', 'Product'),
    ('Madonna', NULL, 'Virgin Airlines CEO', 'Health and Safety');

-- 11. Modifier le nom de famille d'un employé
UPDATE `employee` SET `lastname` = 'Smith' WHERE `firstname` = 'John';

-- 12. Ajouter le salaire
ALTER TABLE `employee` ADD `salary` FLOAT NOT NULL DEFAULT '10000' COMMENT 'ZNB' AFTER `department`;

-- 13. Augmenter le salaire des employés d'un département
UPDATE `employee` 
SET `salary` = `salary` * 1.1
WHERE `department` = 'Health & Wellness';

-- 14. Supprimer les employés d'un département spécifique
DELETE FROM `employee` WHERE `department` = 'Human Resources' OR `department` = 'HR';

-- 15. Lister les employés par ordre alphabétique inverse
SELECT * FROM `employee` ORDER BY `lastname` DESC;

-- 16. Sélectionner des employés sans nom de famille
SELECT * FROM `employee` WHERE `lastname` IS NULL;

-- 17. Ajouter une colonne à la table
ALTER TABLE `employee` ADD `modus` VARCHAR(255) NULL AFTER `salary`;

-- 18. Calculer le nombre total d'employés
SELECT COUNT(*) FROM `employee`;

-- 19. Trouver l'employé avec le plus ancien 'id'
SELECT * FROM `employee` ORDER BY `id` ASC LIMIT 0,1;

-- Variante 1
SELECT * FROM employee WHERE id = (SELECT MIN(id) FROM employee);

-- Variante 2
SELECT * FROM employee ORDER BY id LIMIT 1;

-- 20. Mettre à jour le mode opératoire de tous les employés
UPDATE `employee` SET `modus` = 'Remote Work';
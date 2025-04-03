# **Exercices CRUD**

Ci-dessous sont présentés **20 exercices** centrés sur les opérations CRUD (Create, Retrieve, Update, Delete) sur une seule table d'une base de données.
Ces exercices sont progressifs et sont conçus pour vous aider à vous familiariser avec **l’interface de phpMyAdmin** ainsi qu’avec les **opérations élémentaires** des bases de données:

- Insertion de données simples et multiples
- Requêtes de sélection avec filtres et tri
- Mises à jour de données spécifiques ou en masse
- Suppressions ciblées
- Modifications de structure (ajout de colonnes)
- Agrégations (COUNT)

---

## Create Table Statement

```sql
CREATE TABLE `employee` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(50) NOT NULL,
    `lastname` VARCHAR(50),
    `role` VARCHAR(100) NOT NULL,
    `department` VARCHAR(50)
);
```

---

## Insert Statements

```sql
INSERT INTO employee
    (firstname, lastname, role, department)
VALUES
    ('Rick', 'Blaine', 'Casablanca Negotiator', 'Customer Relations'),
    ('Indiana', 'Jones', 'Artifact Acquisition Expert', 'Procurement'),
    ('Norman', 'Bates', 'Hospitality Supervisor', 'Customer Service'),
    ('Scarlett', 'O’Hara', 'Dramatic Change Manager', 'Human Resources'),
    ('Atticus', 'Finch', 'Ethics and Compliance Officer', 'Legal'),
    ('Vito', 'Corleone', 'Family Business Strategist', 'Executive'),
    ('Marty', 'McFly', 'Temporal Innovation Specialist', 'Research & Development'),
    ('Ellen', 'Ripley', 'Alien Relations Specialist', 'HR'),
    ('Dorothy', 'Gale', 'Tornado Disaster Planner', 'Health & Wellness'),
    ('Jack', 'Sparrow', 'Nautical Acquisitions Specialist', 'Logistics'),
    ('Forrest', 'Gump', 'Inspirational Running Coach', 'Health & Wellness'),
    ('Ferris', 'Bueller', 'Day Off Coordinator', 'Human Resources'),
    ('Rose', 'Dewitt Bukater', 'Iceberg Awareness Consultant', 'Health & Safety'),
    ('Tony', 'Montana', 'Import/Export Manager', 'Operations'),
    ('Clarice', 'Starling', 'Behavioral Analysis Expert', null);
```

---

## Liste des requêtes SQL

### Exercice 1 : Créer un nouvel employé

Quelle requête SQL permet d’ajouter un nouvel employé à la table _employee_ ?  
 Le nom du nouvel employé est John Doe, qui est un Ingénieur Logiciel dans le département IT.

### Exercice 2 : Lire toutes les informations des employés

Quelle requête SQL permet de récupérer toutes les colonnes pour tous les employés de la table _employee_ ?

### Exercice 3 : Lire les informations spécifiques d’un employé

Quelle requête SQL permet de sélectionner le _firstname_ et le _lastname_ de tous les employés qui travaillent dans le département 'HR' ?

### Exercice 4 : Mettre à jour le rôle d’un employé

Quelle requête SQL permet de changer le rôle d’un employé ?  
Supposez que vous souhaitez promouvoir Clarice Starling au poste de Cannibal Love Interest.

### Exercice 5 : Supprimer un enregistrement d’employé

Quelle requête SQL permet de supprimer un employé de la table _employee_, celui qui picole au boulot ?

### Exercice 6 : Lire les employés ordonnés par nom de famille

Quelle requête SQL permet de sélectionner toutes les informations des employés de la table *employee*, ordonnées par leur *lastname* dans l’ordre ascendant ?

### Exercice 7 : Compter le nombre d’employés dans un département

Quelle requête SQL permet de compter combien d’employés travaillent dans le département IT ?

### Exercice 8 : Mettre à jour le département pour plusieurs employés

Quelle requête SQL permet de déplacer tous les employés du département 'Legal' au département 'Sales' ?
### Exercice 9 : Trouver les employés sans département
Quelle requête SQL permet de sélectionner tous les employés qui n’ont pas de département assigné ?
### Exercice 10 : Insérer plusieurs nouveaux employés
Quelle requête SQL permet d’ajouter trois nouveaux employés en même temps dans la table _employee_ ?
Supposez que les employés sont :
- Alice Bob, cryptographe dans le département Data Science.
- Bono, un Chef de Produit dans le département Product.
- Madonna, Virgin Airlines CEO, dans le département Health and Safety.
### Exercice 11 : Modifier le nom de famille d’un employé
Quelle requête SQL permet de mettre à jour le nom de famille de 'Doe' en 'Smith' pour tous les employés nommés 'John' ?
### Exercice 12 : Ajouter le salaire
Quelle requête SQL permet d’ajouter une colonne _salary_, obligatoire et, par défaut, représentant 10.000 ZNB ?
Précisez la monnaie en commentaire.
### Exercice 13 : Augmenter le salaire des employés d’un département
Quelle requête SQL permet d’augmenter de 10% le salaire de tous les employés du département 'Health and Wellness' ?
### Exercice 14 : Supprimer les employés d’un département spécifique
Quelle requête SQL permet de supprimer tous les employés qui travaillent dans le département ressources humaines ?
### Exercice 15 : Lire les employés par ordre alphabétique inverse
Quelle requête SQL permet de lister tous les employés par ordre alphabétique inverse de leur nom de famille ?
### Exercice 16 : Sélectionner les employés sans nom de famille
Quelle requête SQL permet de sélectionner tous les employés qui n’ont pas de nom de famille enregistré (en supposant que _lastname_ peut être null) ?
### Exercice 17 : Ajouter une colonne à la table
Quelle requête SQL permet d’ajouter une colonne 'modus' à la table _employee_ ?
### Exercice 18 : Calculer le nombre total d’employés
Quelle requête SQL permet de calculer le nombre total d’employés dans la table ?
### Exercice 19 : Trouver l’employé avec le plus ancien ‘id’
Quelle requête SQL permet de trouver l’employé qui a le plus ancien ‘id’ ?
### Exercice 20 : Mettre à jour le mode opératoire de tous les employés
Quelle requête SQL permet de mettre à jour les employés en 'Remote Work' ?

---

## Bonnes Pratiques des Opérations CRUD

- **Create** : Lors de l’ajout de nouvelles données, assurez-vous qu’elles respectent les contraintes de la table et qu’elles n’introduisent pas de doublons ou d’incohérences.
- **Read** : L’utilisation de requêtes optimisées et l’indexation appropriée des colonnes peuvent considérablement améliorer les performances de lecture.
- **Update** : Lors de la modification des données, assurez-vous que les changements respectent les contraintes de la table et ne créent pas de données incohérentes.
- **Delete** : La suppression de données est une opération délicate. La technique de **soft delete** consiste à marquer les données comme supprimées sans les effacer physiquement. Pour cela, vous pouvez ajouter une colonne _deleted_at_ et y inscrire la date de suppression.

---
> Ce cours est distribué sous **licence Creative Commons**. Toute reproduction ou distribution à but commercial est interdite sans l’accord préalable de l’auteur.

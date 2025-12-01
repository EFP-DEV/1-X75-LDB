Qu’est-ce qu’un SGBD (Système de Gestion de Base de Données) ?  
- Un logiciel qui convertit un site web en application mobile  
- Un ensemble de tables et de schémas au format CSV  
- ✗ Un logiciel permettant de stocker, manipuler et gérer des données de manière structurée  
- Une plateforme qui génère automatiquement du code HTML  

Parmi les propositions suivantes, laquelle caractérise le mieux les bases de données relationnelles ?  
- Elles stockent les données sous forme de documents JSON  
- ✗ Elles utilisent des tables reliées entre elles par des clés primaires et étrangères  
- Elles ne contiennent jamais de relations entre les enregistrements  
- Elles exigent un serveur web pour fonctionner  

Dans une base de données relationnelle, qu’est-ce qu’une table ?  
- Un simple fichier texte contenant un tableau  
- ✗ Une structure constituée de lignes et de colonnes pour stocker des données  
- Un script qui décrit la logique métier d’une application  
- Un diagramme qui représente uniquement les liaisons entre entités  

Dans un modèle conceptuel, une « entité » correspond généralement à quoi ?  
- À une propriété unique comme un nom ou un prénom  
- ✗ À un ensemble d’objets du monde réel que l’on souhaite représenter (ex. : Client)  
- Au type de fichier utilisé pour sauvegarder des données  
- À une ligne spécifique dans une table  

Quelle caractéristique n’est pas requise pour une clé primaire ?  
- Être unique pour chaque enregistrement  
- Ne pas contenir de valeur NULL  
- ✗ Être nécessairement de type entier auto‑incrémenté  
- Identifier de façon unique chaque ligne  

Quel est l’avantage principal de définir une clé étrangère entre deux tables ?  
- Accélérer automatiquement toutes les requêtes SELECT  
- Forcer le moteur de base de données à autoriser les données orphelines  
- ✗ Garantir l’intégrité référentielle entre les tables liées  
- Définir un identifiant unique pour chaque ligne  

Que signifie la cardinalité 1:N (un‑à‑plusieurs) entre deux entités A et B ?  
- ✗ Un enregistrement de A est relié à zéro ou plusieurs enregistrements de B, et chaque B est relié à exactement un A  
- Un enregistrement de A correspond exactement à un enregistrement de B  
- Chaque enregistrement de B peut être relié à plusieurs A  
- Toutes les réponses sont vraies  

Dans un Modèle Conceptuel des Données (MCD), à quoi servent principalement les associations ?  
- À définir les clés primaires  
- ✗ À décrire le lien entre deux ou plusieurs entités ainsi que leurs règles (cardinalités)  
- À stocker toutes les données textuelles  
- À déterminer le type de requêtes SQL autorisées  

Qu'impose principalement la Première Forme Normale (1NF) ?  
- Que chaque table ait un champ auto‑incrémenté  
- Que toutes les colonnes contiennent des listes séparées par des virgules  
- ✗ Que chaque colonne ne contienne qu’une seule valeur « atomique »  
- Que chaque table dispose d’au moins cinq colonnes  

Pourquoi justifier la normalisation (3NF) malgré le coût en performance lié aux jointures ?  
- Elle interdit les requêtes complexes  
- ✗ Elle garantit une cohérence et une intégrité des données en réduisant la redondance  
- Elle permet de stocker davantage d’images dans la base  
- Elle supprime l’usage de clés étrangères  

 À quoi sert la clause `SELECT` ?  
- À insérer de nouvelles données dans une table  
- ✗ À sélectionner les colonnes que l’on souhaite voir apparaître dans le résultat d’une requête  
- À renommer une base de données  
- À décrire la structure d’une table  

Quelle est la fonction de la clause `WHERE` dans une requête SQL ?  
- Déterminer l’ordre de tri des résultats  
- Limiter le nombre de lignes retournées  
- ✗ Filtrer les lignes sur la base de conditions logiques  
- Supprimer des enregistrements dans plusieurs tables  

En SQL, à quoi sert la clause `ORDER BY` ?  
- Réduire les enregistrements retournés à 10  
- ✗ Trier les résultats en ordre croissant ou décroissant  
- Créer une nouvelle table « ORDER »  
- Stocker un nouvel index  

Quelle est la différence principale entre `INNER JOIN` et `LEFT JOIN` ?  
- `INNER JOIN` retourne toutes les lignes de la table de gauche, alors que `LEFT JOIN` ne retourne que celles de la table de droite  
- ✗ `INNER JOIN` ne retourne que les correspondances entre les deux tables, tandis que `LEFT JOIN` retourne toutes les lignes de la table de gauche, même sans correspondance  
- `INNER JOIN` est réservé à MySQL et `LEFT JOIN` à Oracle  
- Il n’y a aucune différence, ce sont des synonymes  

Dans une relation 1:1 (un‑à‑un) entre deux tables A et B, que signifie-t-elle ?  
- La table A ne peut pas avoir de clé primaire  
- ✗ Chaque enregistrement de A est associé à un unique enregistrement de B, et réciproquement  
- On associe chaque enregistrement de A à plusieurs enregistrements de B  
- On ne peut pas utiliser de clés étrangères  

Comment modélise-t-on généralement une relation N:M (plusieurs‑à‑plusieurs) entre deux tables ?  
- En ajoutant simplement une colonne "list" dans l’une des deux tables  
- ✗ En créant une table de liaison (table associative) contenant les clés étrangères vers chacune des deux tables  
- En dupliquant les enregistrements dans la même table pour chaque association  
- En interdisant l’usage de clés primaires  

Que se passe-t-il si on tente de supprimer dans la table B une ligne référencée par une clé étrangère dans la table A ?  
- La base accepte toujours la suppression sans vérification  
- ✗ Cela dépend des règles de suppression (ON DELETE CASCADE, RESTRICT, etc.) définies pour la clé étrangère  
- La clé primaire de B disparaît aussi dans la table A  
- Le SGBD renomme automatiquement la clé étrangère en “NULL”  

Pourquoi définir une clé étrangère plutôt que de stocker simplement l’ID de référence ?  
- Pour éviter la création d’index  
- ✗ Pour que le SGBD applique automatiquement l’intégrité référentielle et empêche les valeurs invalides  
- Pour diminuer la taille de chaque table  
- Pour qu’aucune validation ne soit effectuée au niveau du SGBD  

Dans la définition d’une table, que signifie la contrainte `UNIQUE` ?  
- Que la colonne doit obligatoirement être remplie  
- ✗ Que la colonne ne peut pas contenir deux fois la même valeur  
- Qu’on ne peut pas utiliser d’autres colonnes comme clé primaire  
- Qu’on ne peut pas effectuer de jointure sur cette colonne  

Les commandes `INSERT`, `UPDATE` et `DELETE` sont souvent regroupées sous quel terme ?  
- ✗ CRUD (Create, Read, Update, Delete)  
- DDL (Data Definition Language)  
- FCT (Fonctions Composées Transactionnelles)  
- CAST (Convert And Store Transactions)  

Quelle requête SQL sélectionne tous les utilisateurs majeurs (age ≥ 18) habitant en France et trie le résultat par nom croissant ?  
- `SELECT * FROM utilisateur ORDER BY nom ASC WHERE age >= 18 AND pays = 'France'`  
- `SELECT FROM utilisateur WHERE age >= 18, pays = 'France' GROUP BY nom`  
- ✗ `SELECT * FROM utilisateur WHERE age >= 18 AND pays = 'France' ORDER BY nom ASC`  
- `ORDER BY nom ASC SELECT age, pays FROM utilisateur`  

Quel est l’inconvénient majeur de stocker toutes les informations (clients, commandes, produits, etc.) dans une seule table « master » ?  
- La table sera plus rapide à interroger dans tous les cas  
- Il n’y aura aucune redondance de données  
- ✗ Les modifications risquent de provoquer des anomalies et la table deviendra très volumineuse  
- On ne pourra plus insérer de données  

Que fait la requête suivante pour le client identifié par 'C001' ?  
```sql
SELECT s.nom, o.seller_name, p.product_name
FROM sale s
JOIN seller o ON s.seller_id = o.id
JOIN sale_detail sd ON s.sale_id = sd.sale_id
JOIN produit p ON sd.product_id = p.id
WHERE s.customer_id = 'C001';
```  
- Affiche le nom de la vente, le nom du vendeur et le nom du produit pour toutes les ventes  
- ✗ Retourne les informations de la vente, du vendeur et des produits commandés pour le client 'C001'  
- Insère de nouvelles lignes dans les tables sale, seller et produit  
- Met à jour le champ seller_name dans la table seller  

Que fait la requête suivante ?  
```sql
SELECT u.nom, o.order_date, p.product_name
FROM utilisateur u
JOIN commande o ON u.id = o.user_id
JOIN produit p ON o.product_id = p.id
WHERE u.age >= 18 AND u.pays = 'France'
ORDER BY o.order_date DESC
LIMIT 5;
```  
- Affiche les 5 premières commandes sans filtre particulier  
- Affiche tous les utilisateurs majeurs triés par date  
- ✗ Affiche les 5 dernières commandes des utilisateurs majeurs résidant en France, avec nom, date et produit  
- Met à jour la table produit pour les utilisateurs français  

Dans les tables `client` et `commande` (1:N), comment identifier facilement toutes les commandes d’un client « Dupont » ?  
- Mettre le champ `client.nom` comme clé primaire dans la table commande  
- ✗ Utiliser un identifiant unique (`client.id`) comme clé étrangère (`client_id`) dans la table commande  
- Dupliquer toutes les informations du client dans la table commande  
- Rendre la table commande anonyme  

Pourquoi réaliser des tests d’intégrité relationnelle avant la mise en production ?  
- Parce que cela augmente le temps de développement et rassure le client  
- ✗ Pour vérifier que les contraintes et les règles métiers fonctionnent correctement et empêchent les anomalies  
- Pour remplir artificiellement la base de données avec des valeurs incorrectes  
- Pour désactiver temporairement toutes les clés étrangères et simplifier la maintenance  

Quel est l’objectif de la requête suivante ?  
```sql
SELECT nom FROM utilisateur WHERE age > 18 AND pays = 'France' ORDER BY nom ASC;
```  
- Mettre à jour la colonne nom pour les utilisateurs majeurs français  
- ✗ Afficher la liste des noms des utilisateurs de plus de 18 ans résidant en France, triés par ordre alphabétique  
- Supprimer les utilisateurs résidant en France  
- Insérer de nouvelles lignes dans la table utilisateur  

Que permet la requête suivante ?  
```sql
SELECT c.nom, co.id FROM client c INNER JOIN commande co ON c.id = co.client_id;
```  
- Retourner tous les clients, même ceux sans commande  
- ✗ Afficher uniquement les clients ayant au moins une commande, avec nom et identifiant de commande  
- Mettre à jour l’ID des commandes  
- Supprimer les lignes sans correspondance entre les tables  

Que fait la requête suivante ?  
```sql
SELECT departement, COUNT(*) AS nombre_employes 
FROM employe 
GROUP BY departement 
HAVING COUNT(*) > 5;
```  
- Affiche tous les départements indépendamment du nombre d’employés  
- ✗ Affiche le nombre d’employés par département pour ceux ayant plus de 5 employés  
- Affiche les départements ayant exactement 5 employés  
- Affiche tous les employés avec leur département  

Que fait la requête suivante ?  
```sql
SELECT c.nom, co.montant, co.date_commande
FROM client c
JOIN commande co ON c.id = co.client_id
WHERE co.montant > 100
ORDER BY co.montant ASC
LIMIT 3;
```  
- ✗ Affiche les 3 commandes > 100, triées par montant croissant, avec le nom du client  
- Affiche tous les clients ayant des commandes sans filtre sur le montant  
- Met à jour le montant des commandes > 100  
- Supprime les 3 commandes les moins élevées  

Quel est l’objectif de la requête suivante ?  
```sql
SELECT p.product_name, COUNT(*) AS total
FROM commande c
JOIN sale_detail sd ON c.id = sd.commande_id
JOIN produit p ON sd.product_id = p.id
WHERE c.date_commande >= '2025-03-01'
GROUP BY p.product_name
ORDER BY total DESC
LIMIT 10;
```  
- Afficher les 10 produits les moins commandés depuis le 1er mars 2025  
- ✗ Afficher les 10 produits les plus commandés depuis le 1er mars 2025, avec le nombre total de commandes, triés du plus au moins commandé  
- Afficher uniquement le produit le plus commandé  
- Afficher toutes les commandes regroupées par produit sans limite  

Quelle approche adopter pour représenter une hiérarchie (relation parent‑enfant) au sein d’une même table ?
- ✗ Une colonne parent_id en auto‑référence
- Dupliquer les enregistrements enfants dans une table séparée
- Utiliser une table d’association externe pour chaque niveau
- Stocker la hiérarchie sous forme de liste JSON dans un attribut unique


Comment choisir entre modéliser une association 1:N directement via une clé étrangère ou via une table d’association (N:N) simplifiée ?
- ✗ Si chaque B n’appartient qu’à un seul A, utiliser une clé étrangère 1:N
- Si A et B doivent rester strictement indépendants
- Si l’on veut interroger très rarement la relation
- Si l’on a besoin d’ajouter des attributs propres à la relation elle‑même
# Transactions SQL

## 1. Introduction aux transactions

Une transaction SQL est une unité atomique de travail qui peut contenir plusieurs opérations de base de données. Elle représente un changement cohérent d'état dans la base de données.

### 1.1 Définition

Une transaction est une séquence d'opérations SQL traitée comme une unité unique et indivisible. Soit toutes les opérations réussissent (commit), soit aucune ne prend effet (rollback).

### 1.2 Syntaxe de base

```sql
START TRANSACTION; -- Débute une transaction
-- Opérations SQL (INSERT, UPDATE, DELETE, etc.)
COMMIT;           -- Valide la transaction
-- ou
ROLLBACK;         -- Annule la transaction
```

## 2. Propriétés ACID

Les transactions respectent les propriétés ACID, garantissant la fiabilité des opérations en base de données:

### 2.1 Atomicité (Atomicity)

Chaque transaction est atomique - elle est traitée entièrement ou pas du tout.

```sql
START TRANSACTION;
    UPDATE comptes SET solde = solde - 1000 WHERE id = 1;
    UPDATE comptes SET solde = solde + 1000 WHERE id = 2;
    -- Si une mise à jour échoue, aucune modification n'est appliquée
COMMIT;
```

### 2.2 Cohérence (Consistency)

Une transaction transforme la base de données d'un état cohérent à un autre état cohérent.

```sql
-- Exemple: transfert d'argent qui doit maintenir le solde total
START TRANSACTION;
    -- Vérification préalable
    DECLARE @total_avant DECIMAL;
    SELECT @total_avant = SUM(solde) FROM comptes;
    
    -- Opérations
    UPDATE comptes SET solde = solde - 100 WHERE id = 1;
    UPDATE comptes SET solde = solde + 100 WHERE id = 2;
    
    -- Vérification après
    DECLARE @total_apres DECIMAL;
    SELECT @total_apres = SUM(solde) FROM comptes;
    
    -- Annulation si incohérence
    IF @total_avant <> @total_apres
        ROLLBACK;
    ELSE
        COMMIT;
```

### 2.3 Isolation (Isolation)

Les transactions sont isolées les unes des autres jusqu'à leur validation.

```sql
-- Configuration du niveau d'isolation
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Autres niveaux: READ UNCOMMITTED, REPEATABLE READ, SERIALIZABLE
```

### 2.4 Durabilité (Durability)

Une fois validée, une transaction persiste même en cas de panne système.

## 3. Niveaux d'isolation des transactions

Les niveaux d'isolation déterminent comment les transactions interagissent entre elles.

### 3.1 READ UNCOMMITTED

Niveau le plus bas: une transaction peut lire les modifications non validées d'autres transactions.

```sql
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;
    -- Risque de lecture sale (dirty read)
    SELECT * FROM produits;
COMMIT;
```

**Problèmes possibles**: lectures sales, lectures non reproductibles, lectures fantômes

### 3.2 READ COMMITTED

Une transaction ne peut lire que les données validées par d'autres transactions.

```sql
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
    -- Évite les lectures sales mais pas les lectures non reproductibles
    SELECT * FROM produits;
COMMIT;
```

**Problèmes possibles**: lectures non reproductibles, lectures fantômes

### 3.3 REPEATABLE READ

Garantit que si une transaction lit une donnée, elle relira la même valeur si elle y accède à nouveau.

```sql
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
    -- Première lecture
    SELECT prix FROM produits WHERE id = 1;
    
    -- ... (autre transaction modifie le prix et valide)
    
    -- Deuxième lecture - retourne la même valeur que la première lecture
    SELECT prix FROM produits WHERE id = 1;
COMMIT;
```

**Problèmes possibles**: lectures fantômes

### 3.4 SERIALIZABLE

Le niveau le plus élevé d'isolation: les transactions s'exécutent comme si elles étaient séquentielles.

```sql
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
    -- Aucun problème d'isolation, mais performances réduites
    SELECT * FROM produits WHERE categorie = 'Électronique';
COMMIT;
```

## 4. Gestion des erreurs et points de sauvegarde

### 4.1 Gestion des erreurs

```sql
-- PostgreSQL
BEGIN;
    -- Opérations
    SAVEPOINT avant_operation_risquee;
    
    -- Tentative d'opération risquée
    INSERT INTO orders (product_id, quantity) VALUES (1, 100);
    
    -- Gestion d'erreur
    EXCEPTION
        WHEN insufficient_privilege THEN
            ROLLBACK TO avant_operation_risquee;
        WHEN unique_violation THEN
            ROLLBACK;
COMMIT;

-- SQL Server
BEGIN TRY
    BEGIN TRANSACTION;
        -- Opérations
        INSERT INTO orders (product_id, quantity) VALUES (1, 100);
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    -- Gestion de l'erreur
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
```

### 4.2 Points de sauvegarde (SAVEPOINT)

Les points de sauvegarde permettent d'annuler partiellement une transaction.

```sql
START TRANSACTION;
    INSERT INTO clients (nom) VALUES ('Dupont');
    
    SAVEPOINT ajout_client;
    
    INSERT INTO commandes (client_id, produit) VALUES (LAST_INSERT_ID(), 'A');
    
    -- Si problème avec la commande
    ROLLBACK TO ajout_client;
    
    -- Continuer avec d'autres opérations
    INSERT INTO commandes (client_id, produit) VALUES (LAST_INSERT_ID(), 'B');
COMMIT;
```

## 5. Transactions distribuées

Les transactions distribuées s'étendent sur plusieurs bases de données ou serveurs.

### 5.1 Protocole two-phase commit (2PC)

```sql
-- Phase de préparation
PREPARE TRANSACTION 'transaction_id';

-- Phase de validation
COMMIT PREPARED 'transaction_id';
-- ou
ROLLBACK PREPARED 'transaction_id';
```

## 6. Transactions implicites vs explicites

### 6.1 Transactions implicites

Chaque instruction SQL individuelle est automatiquement une transaction.

```sql
-- Activer les transactions implicites (SQL Server)
SET IMPLICIT_TRANSACTIONS ON;

-- Chaque instruction est une transaction
UPDATE produits SET prix = prix * 1.1;
-- Commit implicite ici
```

### 6.2 Transactions explicites

Le développeur définit explicitement le début et la fin d'une transaction.

```sql
START TRANSACTION;
    -- Opérations multiples formant une unité logique
    DELETE FROM commandes WHERE client_id = 5;
    DELETE FROM clients WHERE id = 5;
COMMIT;
```

## 7. Verrous et concurrence

### 7.1 Types de verrous

```sql
-- Verrou en lecture (partagé)
SELECT * FROM produits WHERE id = 1 LOCK IN SHARE MODE;

-- Verrou en écriture (exclusif)
SELECT * FROM produits WHERE id = 1 FOR UPDATE;
```

### 7.2 Gestion des deadlocks

```sql
-- Configuration du timeout (PostgreSQL)
SET lock_timeout = '10s';

-- Configuration du timeout (SQL Server)
SET LOCK_TIMEOUT 10000; -- milliseconds
```

## 8. Bonnes pratiques

### 8.1 Transactions courtes

Gardez les transactions aussi courtes que possible pour minimiser les contentions de verrous.

### 8.2 Ordre des opérations

Standardisez l'ordre des opérations sur les tables pour éviter les deadlocks.

```sql
-- Toujours accéder aux tables dans le même ordre
START TRANSACTION;
    -- D'abord clients, puis commandes
    UPDATE clients SET statut = 'VIP' WHERE id = 1;
    UPDATE commandes SET priorite = 'Haute' WHERE client_id = 1;
COMMIT;
```

### 8.3 Niveau d'isolation approprié

Choisissez le niveau d'isolation en fonction des besoins réels de cohérence vs performance.

### 8.4 Traitement des exceptions

Utilisez systématiquement des blocs try-catch (ou équivalent) pour gérer les erreurs.

## 9. Différences entre systèmes de gestion de bases de données

### 9.1 MySQL/MariaDB

```sql
START TRANSACTION;
    -- Opérations
COMMIT;
```

### 9.2 PostgreSQL

```sql
BEGIN;
    -- Opérations
COMMIT;
```

### 9.3 SQL Server

```sql
BEGIN TRANSACTION;
    -- Opérations
COMMIT TRANSACTION;
```

### 9.4 Oracle

```sql
-- Transactions implicites, commit explicite
-- Opérations
COMMIT;
```

## 10. Exercices pratiques

### 10.1 Transfert bancaire sécurisé

```sql
START TRANSACTION;
    -- Vérifier solde suffisant
    DECLARE @solde DECIMAL;
    SELECT @solde = solde FROM comptes WHERE id = 1;
    
    IF @solde >= 1000 THEN
        -- Effectuer le transfert
        UPDATE comptes SET solde = solde - 1000 WHERE id = 1;
        UPDATE comptes SET solde = solde + 1000 WHERE id = 2;
        
        -- Enregistrer l'opération
        INSERT INTO transactions (compte_source, compte_dest, montant, date)
        VALUES (1, 2, 1000, NOW());
        
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
```

### 10.2 Gestion d'inventaire

```sql
START TRANSACTION;
    -- Vérifier disponibilité
    DECLARE @stock INT;
    SELECT @stock = quantite FROM inventaire WHERE produit_id = 1;
    
    IF @stock >= 5 THEN
        -- Mettre à jour l'inventaire
        UPDATE inventaire SET quantite = quantite - 5 WHERE produit_id = 1;
        
        -- Créer la commande
        INSERT INTO commandes (client_id, date) VALUES (42, NOW());
        
        -- Ajouter les détails
        INSERT INTO commande_details (commande_id, produit_id, quantite)
        VALUES (LAST_INSERT_ID(), 1, 5);
        
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
```

## Conclusion

Les transactions SQL sont essentielles pour maintenir l'intégrité des données en garantissant que les opérations complexes sont exécutées de manière atomique, cohérente, isolée et durable. La maîtrise des transactions et de leurs niveaux d'isolation est fondamentale pour développer des applications de base de données robustes et performantes.
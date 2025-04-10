# Séance 11 – Modélisation, création et tests de la base de données Atelier

## Contexte

Dans ce projet, vous concevez la base de données d’un site web dynamique.  
Tous les utilisateurs (visiteurs connectés ou administrateurs) sont gérés dans la **même table `operator`**, avec un champ `role` (`admin`, `user`, etc.).  
Il n’y a **pas d’utilisateur anonyme** ni de `visitor_token`.  

Le **cahier des charges est commun à tous** : vous **ne pouvez pas supprimer** de tables par rapport à celui-ci.  
En revanche, vous avez le droit **d’ajouter des tables supplémentaires** si elles sont justifiées par votre projet. Vous devez alors **les modéliser clairement** dans votre MCD et MPD.

---

## Partie 1 : Structuration finale & test d’intégrité

### Objectifs
- Finaliser votre modèle de données
- Créer une base relationnelle propre et cohérente
- Tester que tout fonctionne : aucune erreur possible, aucune incohérence

### Déroulement

1. **Élaborez votre MCD avec les derniers changements.**  
   - Représentez toutes les entités et leurs attributs, y compris les éventuelles tables supplémentaires propres à votre projet.
   - Vérifiez que toutes les relations sont présentes.
   - Définissez clairement les **cardinalités** (1-1, 1-N, N-N).

2. **Transformez le MCD en MPD.**  
   - Choisissez les bons types pour chaque champ.
   - Ajoutez les **clés primaires** et **clés étrangères**.
   - Appliquez les contraintes nécessaires :
     - `NOT NULL` sur les champs obligatoires
     - `DEFAULT` si utile
     - `UNIQUE` :
       - pour les identifiants naturels (ex : email, slug…)
       - **pour garantir la partie "1" d’une relation 1-N si votre logique l’exige**
     - `ON DELETE` / `ON UPDATE` pour chaque clé étrangère

3. **Vérifiez la normalisation jusqu’à la 3NF.**  
   - Aucune redondance inutile.
   - Aucun champ qui dépend d’autre chose qu’une clé.
   - Les relations N-N sont bien transformées en entités associatives.

4. **Exportez votre structure dans un fichier `.sql`.**  
   - Ce fichier ne doit contenir **que la structure des tables**.
   - Vous le conserverez pour versionner votre base ou la réimporter proprement.

5. **Réalisez les tests d’intégrité relationnelle.**  
   Suivez le protocole ci-dessous pour vérifier que votre base résiste à toutes les erreurs logiques ou utilisateurs.

### Protocole de test d’intégrité relationnelle

#### Étape 1 – Relecture & vérification
- Faites relire votre MPD et vos choix de contraintes par un autre apprenant **et par le formateur**.
- Vérifiez :
  - Clés primaires bien définies
  - Clés étrangères présentes et fonctionnelles
  - Contraintes `NOT NULL`, `UNIQUE`, `DEFAULT` correctement appliquées
  - Champ `role` cohérent dans `operator` (`admin`, `user`, etc.)

#### Étape 2 – Insertion de données de test
- Un `operator` de rôle `admin`
- Un `operator` de rôle `user`
- Trois `tags`
- Deux `items` complets
- Lien entre les `items` et les `tags`
- Une `collection` associée au `user`
- Des `items` dans cette collection
- Un `message` envoyé par un `operator`
- Une ligne dans `search` si vous utilisez cette table

#### Étape 3 – Tests relationnels à réaliser

**Suppressions critiques**
- Supprimez un `tag` lié à un `item`
- Supprimez un `item` présent dans une `collection`
- Supprimez un `operator` ayant des messages ou des collections

**Insertions incohérentes**
- Insertion d’une `collection` avec un `operator_id` inexistant
- Insertion d’un `item_tag` avec un `item_id` ou `tag_id` inexistant
- Insertion de deux `items` avec le même `slug`
- Insertion de deux `operators` avec le même email
- Insertion d’un `message` vide ou sans email

**Modifications sensibles**
- Modifier un `id` de `tag` ou `item` utilisé ailleurs
- Changer le `role` d’un `operator`
- Modifier un `slug` ou un `email`

**Cas métier à interpréter**
- Supprimer tous les `items` d’un `tag` : le tag reste-t-il utile ?
- Supprimer tous les `collection_items` d’une collection : faut-il la conserver ?
- Créer une collection vide : est-ce logique ?
- Supprimer tous les messages d’un utilisateur : reste-t-il des données liées ?

#### Étape 4 – Documentation des tests
- Conservez vos requêtes SQL dans un fichier `tests.sql`
- Notez les résultats attendus et obtenus
- Expliquez les problèmes rencontrés et comment vous les avez résolus

---

## Partie 2 : Rédaction des requêtes & finalisation

### Objectifs
- Identifier toutes les requêtes SQL utiles au fonctionnement de votre projet
- Les rédiger, les tester, et les organiser proprement
- Finaliser vos livrables SQL dans le dépôt Git

### Déroulement

1. **Dressez la liste des besoins fonctionnels.**
   - Que faut-il afficher, trier, filtrer ?
   - Que peut-on insérer, modifier ou supprimer ?
   - Quelles sont les interactions côté utilisateur / côté admin ?
   - Intégrez aussi les besoins de statistiques ou d’exports si nécessaire

2. **Rédigez les requêtes utiles au projet.**
   - Utilisez `SELECT`, `JOIN`, `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING`, etc.
   - Utilisez `INSERT`, `UPDATE`, `DELETE` pour la gestion des données
   - Testez des requêtes avec fonctions d’agrégation : `COUNT`, `MAX`, `AVG`, etc.
   - Utilisez des sous-requêtes si nécessaire

3. **Testez toutes vos requêtes.**
   - Exécutez-les dans phpMyAdmin
   - Vérifiez leur efficacité, leur lisibilité, et la pertinence des résultats
   - Testez les cas limites (base vide, valeurs inattendues, etc.)

4. **Organisez vos requêtes dans un fichier propre.**
   - Fichier `queries.sql` ou `requêtes.md`
   - Classement par usage : affichage public, administration, maintenance
   - Chaque requête doit être commentée (but, contexte d’usage)

5. **Finalisez vos livrables.**
   - Export complet de la base (`.sql` structure + données)
   - Intégration dans le dépôt Git
   - Ajout éventuel d’un README explicatif pour les tests ou l’importation
   - Faites relire votre travail si possible

---

## Checklist des livrables à déposer dans le dépôt Git

- [ ]  MCD complet, clair, avec toutes les entités du cahier des charges + tables supplémentaires si besoin
- [ ]  MPD fidèle au MCD, avec toutes les contraintes correctement définies
- [ ]  Fichier `.sql` contenant uniquement la structure des tables
- [ ]  Jeu de données de test inséré dans phpMyAdmin
- [ ]  Protocole de test appliqué, avec retours notés
- [ ]  Fichier `tests.sql` contenant toutes les requêtes utilisées pour les tests
- [ ]  Fichier `queries.sql` ou `requêtes.md` complet, organisé et commenté
- [ ]  Export `.sql` complet de la base (structure + données)
- [ ]  Tous les fichiers sont présents dans votre **dépôt Git personnel**, avec commits clairs

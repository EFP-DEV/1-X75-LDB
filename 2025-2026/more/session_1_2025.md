# Leçon 0 : Pourquoi une Base de Données ?

## Les 32 Fiches Cartonnées (avec bruit réaliste)

```
Della Bella
16/08/2024
€47.50
Via Roma 23
Table 7
```

```
EnergyPlus
July 2024
Due: 15/08
€89.20
Customer ID: 45782
```

```
SuperMart
05/03/2024
€23.67
Cashier: Maria
Receipt #4459
```

```
Mario's Pizza
18.08.2024
€31.80
Delivery: 20 min
Happy customer!
```

```
Dr. Rossi
Appointment: 22/08
14:30
Via Verdi 45
Room 302
CONFIRMED
```

```
Vodafone
€45.00/month
Due: 28/08
Contract expires Dec 2025
```

```
Milano Library
Card renewal
Expires: 12/2025
3 books checked out
Valid ID required
```

```
Shell Gas Station
2024-08-19
€58.90
Pump #3
Weather: Sunny
```

```
Parking Fine
Vehicle: AB123CD
03/05/24
€25.00
Zone B restricted
Officer: Bianchi
```

```
Water Company
August 2024
Due: 20/09
€34.75
Meter reading: 2847
```

```
Business Card
Marco Electrician
348-555-0123
Emergency repairs
Available 24/7
License #EL-4578
```

```
SuperMart
21/08/2024
€45.20
Store #15
Manager on duty
```

```
Direct Insurance
Policy renewal
Due: 09/30/2024
€156.00
Agent: Mr. Smith
Policy #INS-9847
```

```
Job Interview
TechCorp SRL
Date: 07/09/2024
Time: 10:00
Via Milano 45
HR Manager: Sara
```

```
McDonald's
Aug 17, 2024
€12.15
Drive-thru
Order #78
Kids happy meal x2
```

```
Meeting Reminder
Project Alpha review
07/11/24
09:15
Conference room B
All stakeholders invited
```

```
TIM Mobile
Juli 2024
Fällig: 25.08.2024
€38.50
Data usage: 15GB
Roaming charges
```

```
DELLA BELLA
2024/08/23
€52.30
Same place as before
Pizza was cold :(
```

```
Warranty Card
Samsung TV
Purchase: 02-04-2024
2 years coverage
Serial: STV-998847
Keep in safe place
```

```
Taxi Service
20/8/24
€28.00
From airport
Driver spoke English
Tip included
```

```
Gas Company
July 2024
Due: 12/06/2024
€67.80
Previous reading: 1205
Current: 1587
```

```
Birthday Invitation
Anna's 30th!
25.08.24 - 19:00
Trattoria Luna
RSVP by 20/08
Dress code: casual
```

```
Library Fine
3 overdue books
4,50€
Librarian was nice
Extension granted
```

```
Milano Dentist
Appointment: 26-08-2024
16:00
€95.00
Via San Marco 8
Next appt: 6 months
```

```
Prescription
Dr. Martinez
Medication: Antibiotics
Take 2x daily
Pickup ready
Pharmacy: Verde
```

```
Amazon
Order #12345
19.Aug.2024
€89.99
Delivered by Marco
Prime shipping
1-day delivery
```

```
Gym Membership
FitClub Milano
Valid until: 01/09/25
Access card #1247
Classes included
Locker #89
```

```
Roma Coffee Bar
14/8/2024
€8.40
Best espresso in town
Barista: Luigi
```

```
Shopping List
- Milk
- Bread  
- Eggs
- Pasta
Don't forget detergent!
```

```
Train Ticket
Milano-Roma
Aug 24 2024
€45.60
Platform 9
Seat 24A
On time!
```

```
Pizza Express
11/04/24
€22.75
Takeaway
Ready in 15 min
Extra cheese
```

```
Appointment Confirmation
Dr. Rossi
30/08/24 - 11:45
Please arrive 10min early
Bring insurance card
Parking available
```

**Variété des types de documents :**
- **Avec montants :** Factures, reçus, amendes (18 cartes)
- **Rendez-vous :** Confirmations sans montant (4 cartes)
- **Informations :** Cartes de visite, garanties, invitations (6 cartes)
- **Rappels :** Listes, prescriptions, abonnements (4 cartes)


## Activité 3 : Défis de Requêtes (25 minutes)

### Requêtes de Base

**1. "Trouvez le reçu de Della Bella du 16/08"**
```sql
SELECT * FROM documents 
WHERE business = 'Della Bella' AND date = '2024-08-16';
```

**2. "Montrez-moi tous les éléments d'août"**
```sql
SELECT * FROM documents 
WHERE date LIKE '%-08-%';
```

**3. "Quelles factures sont dues avant septembre ?"**
```sql
SELECT * FROM documents 
WHERE due_date < '2024-09-01' AND due_date IS NOT NULL;
```

**4. "Listez tous les montants supérieurs à 50€"**
```sql
SELECT * FROM documents 
WHERE amount > 50 AND amount IS NOT NULL;
```

**5. "Trouvez tous les rendez-vous médicaux"**
```sql
SELECT * FROM documents 
WHERE business LIKE '%Dr.%' OR category = 'medical';
```

### Requêtes Intermédiaires

**6. "Quel est le montant de facture le plus élevé ?"**
```sql
SELECT MAX(amount) FROM documents 
WHERE amount IS NOT NULL;
```

**7. "Combien avons-nous dépensé au total en août ?"**
```sql
SELECT SUM(amount) FROM documents 
WHERE date LIKE '%-08-%' AND amount IS NOT NULL;
```

**8. "Montrez la dépense moyenne par type d'entreprise"**
```sql
SELECT category, AVG(amount) FROM documents 
WHERE amount IS NOT NULL
GROUP BY category;
```

**9. "Combien de documents n'ont pas de montant ?"**
```sql
SELECT COUNT(*) FROM documents 
WHERE amount IS NULL;
```

### Filtrage Complexe

**10. "Trouvez tous les reçus de restaurant d'août supérieurs à 30€"**
```sql
SELECT * FROM documents 
WHERE category = 'restaurant' 
AND date LIKE '%-08-%' 
AND amount > 30;
```

**11. "Montrez les factures en retard mais inférieures à 100€"**
```sql
SELECT * FROM documents 
WHERE due_date < CURDATE() 
AND due_date IS NOT NULL
AND amount < 100 
AND amount IS NOT NULL;
```

**12. "Listez tous les rendez-vous entre 09:00 et 15:00"**
```sql
SELECT * FROM documents 
WHERE time BETWEEN '09:00' AND '15:00' 
AND time IS NOT NULL;
```

**13. "Trouvez les entreprises où nous sommes allés plusieurs fois"**
```sql
SELECT business, COUNT(*) FROM documents 
WHERE business IS NOT NULL
GROUP BY business 
HAVING COUNT(*) > 1;
```

### Requêtes Avancées

**14. "Montrez tous les documents qui contiennent un numéro de téléphone"**
```sql
SELECT * FROM documents 
WHERE content LIKE '%348-%' 
OR content LIKE '%+39%' 
OR content REGEXP '[0-9]{3}-[0-9]{3}-[0-9]{4}';
```

**15. "Trouvez les rendez-vous confirmés sans montant"**
```sql
SELECT * FROM documents 
WHERE (business LIKE '%Dr.%' OR content LIKE '%Appointment%')
AND amount IS NULL 
AND (content LIKE '%CONFIRMED%' OR content LIKE '%Confirmation%');
```

**16. "Listez les documents avec des dates ambiguës (format MM/DD vs DD/MM)"**
```sql
SELECT * FROM documents 
WHERE date REGEXP '^[0-1][0-9]/[0-1][0-9]/[0-9]{2,4}$'
AND SUBSTRING(date, 1, 2) <= '12' 
AND SUBSTRING(date, 4, 2) <= '12';
```

**17. "Calculez le total des dépenses par mois, uniquement pour les documents avec montant"**
```sql
SELECT 
  SUBSTRING(date, 4, 2) as month,
  SUM(amount) as total,
  COUNT(*) as count
FROM documents 
WHERE amount IS NOT NULL 
AND date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{2,4}$'
GROUP BY SUBSTRING(date, 4, 2)
ORDER BY total DESC;
```

### Observations Pédagogiques

Ces requêtes révèlent progressivement :
- **Données manquantes** nécessitent des vérifications `IS NULL`
- **Formats inconsistants** compliquent les recherches par date
- **Informations non-structurées** rendent les recherches textuelles difficiles
- **Ambiguïtés** dans les formats de date cassent l'ordonnancement chronologique
- **Agrégations** deviennent impossibles avec des données hétérogènes


---

### Approche 3 : Organisation avec Index et Clés Primaires

**Méthode :** **Système d'index avec identifiants uniques**

**Processus d'organisation (45-60 minutes) :**

1. **Attribuer un numéro unique (Clé Primaire) à chaque carte :**
   ```
   1: Della Bella, 16/08/2024, €47.50
   2: EnergyPlus, July 2024, Due: 15/08, €89.20
   3: SuperMart, 05/03/2024, €23.67
   ...
   32: Dr. Rossi Appointment Confirmation
   ```

2. **Maintenir les cartes dans l'ordre numérique** (ordre physique fixe)

3. **Créer des index sur papier séparé :**

   **Index ENTREPRISE :**
   ```
   Amazon → 26
   Della Bella → 1, 18
   Dr. Bianchi → 16
   Dr. Rossi → 5, 32
   EnergyPlus → 2
   McDonald's → 15
   SuperMart → 3, 12, 27
   ```

   **Index MONTANT :**
   ```
   €4.50 → 23
   €8.40 → 28
   €12.15 → 15
   €22.75 → 31
   €25.00 → 9
   €28.00 → 20
   ...
   €180.00 → 29
   ```

   **Index MOIS :**
   ```
   JUILLET → 2, 17, 21
   AOÛT → 1, 3, 5, 8, 9, 12, 15, 18, 20, 24, 28, 29, 30, 31, 32
   SEPTEMBRE → 10, 13
   ```

**Performance :**
- Organisation initiale : **45-60 minutes**
- Recherche simple : **5-10 secondes** (consulter index → aller au numéro)
- Recherche complexe : **15-30 secondes** (croiser plusieurs index)

**Processus de recherche :**
1. **"Trouvez Della Bella du 16/08"**
   - Index ENTREPRISE → "Della Bella → 1, 18"
   - Vérifier cartes 1 et 18 → carte 1 correspond

2. **"Montants > 50€"**
   - Index MONTANT → 8, 18, 26, 29, 2, 13, 24
   - Récupérer ces cartes numérotées

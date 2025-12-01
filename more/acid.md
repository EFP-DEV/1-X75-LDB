# Les propriétés ACID des bases de données

# 1 | Introduction

Une **transaction** en base de données est un ensemble d'opérations qui doivent être traitées comme une seule unité logique. Les propriétés **ACID** (**A**tomicité, **C**ohérence, **I**solation, **D**urabilité) constituent le cadre qui garantit la fiabilité des transactions, même dans des environnements complexes.


# 2 | Pourquoi les propriétés ACID sont essentielles

Dans des systèmes critiques comme les applications bancaires, les sites de e-commerce ou les plateformes de réservation, les données doivent rester cohérentes même face à:

- Des pannes matérielles ou logicielles
- Des accès simultanés par de multiples utilisateurs
- Des erreurs dans le code ou les requêtes

Sans ces garanties, des conséquences graves peuvent survenir:
- Transactions financières incomplètes
- Données incohérentes (inventaire erroné, double réservation)
- Perte de données critiques

Ces problèmes affectent non seulement l'intégrité technique du système, mais aussi la confiance des utilisateurs.


# 3 | Les 4 propriétés ACID en détail

## Atomicité

**Définition**  
L'atomicité garantit qu'une transaction est indivisible. Elle est soit entièrement exécutée, soit entièrement annulée.

**Exemple**  
Virement bancaire:
- Opération 1: Débit de 100€ du compte A
- Opération 2: Crédit de 100€ sur le compte B

Si une panne survient après l'opération 1 mais avant l'opération 2, le système annule automatiquement le débit pour maintenir la cohérence.

**Impact en l'absence d'atomicité**  
Sans cette propriété, l'argent pourrait être débité sans être crédité ailleurs, créant une perte nette dans le système.

## Cohérence

**Définition**  
La cohérence assure que la transaction respecte toutes les règles définies dans la base de données. La base passe uniquement d'un état valide à un autre état valide.

**Exemple**  
Système d'inventaire:
- Règle: La quantité en stock ne peut pas être négative
- Action: Tentative de retrait de 5 unités d'un stock de 2
- Résultat: La transaction est rejetée car elle violerait la règle de cohérence

**Impact en l'absence de cohérence**  
Des données invalides pourraient être enregistrées, comme des stocks négatifs ou des comptes clients ne respectant pas les soldes minimums requis.

## Isolation

**Définition**  
L'isolation garantit que les transactions simultanées n'interfèrent pas entre elles. Le résultat final doit être identique à celui obtenu si les transactions avaient été exécutées séquentiellement.

**Exemple**  
E-commerce:
- Deux clients tentent d'acheter le dernier exemplaire d'un produit simultanément
- L'isolation assure que seul l'un d'eux finalisera l'achat
- Le second client recevra une notification de stock épuisé

**Impact en l'absence d'isolation**  
Des problèmes de "lecture sale" ou de "mise à jour perdue" pourraient survenir, conduisant à des incohérences dans les données.

## Durabilité

**Définition**  
La durabilité garantit que les modifications apportées par une transaction validée sont permanentes, même en cas de défaillance du système.

**Exemple**  
Système de réservation:
- Un client réserve un billet et reçoit une confirmation
- Une panne système survient immédiatement après
- Au redémarrage, la réservation reste enregistrée dans la base de données

**Impact en l'absence de durabilité**  
Les transactions confirmées pourraient disparaître lors de pannes, créant confusion et perte de confiance chez les utilisateurs.


# 4 | Niveaux d'application des propriétés ACID

## Systèmes traditionnels (RDBMS)

Les systèmes de gestion de bases de données relationnelles comme MySQL, PostgreSQL ou Oracle implémentent rigoureusement les propriétés ACID, privilégiant la fiabilité des données.

## Systèmes distribués et NoSQL

Certains systèmes NoSQL et bases de données distribuées assouplissent ces propriétés pour améliorer:
- La scalabilité horizontale
- Les performances à grande échelle
- La disponibilité en cas de partitionnement réseau

Ces systèmes s'appuient souvent sur le modèle **BASE** (**B**asically **A**vailable, **S**oft state, **E**ventually consistent):
- **Basically Available**: Le système reste disponible même en cas de panne partielle
- **Soft state**: L'état du système peut changer sans intervention externe
- **Eventually consistent**: Le système deviendra cohérent au fil du temps, mais pas nécessairement immédiatement

Le choix entre ACID et BASE dépend des exigences spécifiques du projet en termes de cohérence, disponibilité et tolérance au partitionnement (théorème CAP).


# 5 | Applications pratiques

## Scénario de développement: Application de paiement mobile

Pour chaque propriété ACID, voici les risques associés et les stratégies d'implémentation:

| Propriété | Risques si négligée | Stratégie d'implémentation |
|-----------|---------------------|----------------------------|
| Atomicité | Paiements partiels, argent "perdu" | Utiliser des transactions de base de données, implémenter un système de compensation |
| Cohérence | Soldes négatifs, limites de crédit dépassées | Définir des contraintes d'intégrité, valider les règles métier avant la transaction |
| Isolation | Double paiement, concurrence sur le même compte | Utiliser des verrous appropriés, gérer les niveaux d'isolation |
| Durabilité | Perte de l'historique des transactions après incident | Configurer correctement les journaux de transactions, utiliser la réplication |


# Ω

| Propriété  | Objectif principal                                    | Conséquence si absente                             |
|------------|-------------------------------------------------------|---------------------------------------------------|
| Atomicité  | Transactions indivisibles: tout ou rien               | Opérations partielles, données incohérentes       |
| Cohérence  | Respect des règles et contraintes                     | Violation de l'intégrité des données              |
| Isolation  | Transactions simultanées sans interférence            | Problèmes de concurrence, mises à jour perdues    |
| Durabilité | Persistance des modifications validées                | Perte de données après défaillance                |

Les propriétés ACID fournissent un cadre essentiel pour garantir la fiabilité des systèmes de bases de données, et leur compréhension est fondamentale pour tout développeur travaillant avec des données critiques.
# Séance 2 : Protocole de modélisation de base de données pour débutants

## 1. Identifier les entités
Les entités sont les objets fondamentaux de votre base de données. Chaque entité représente un concept ou un objet du monde réel qui peut être identifié, classifié et décrit. Une entité deviendra généralement une table dans votre base de données. [would you like to know more?](more/entity_identification.md)

- [ ] Quels objets, concepts, type de personne devez-vous suivre dans votre système?
- [ ] Pouvez-vous nommer ces éléments avec des **noms** simples? (Utilisateur, Produit, Commande)
- [ ] Pourriez-vous expliquer chaque entité en une phrase?
- [ ] Si vous dessiniez chaque entité comme une boîte, aurait-elle un sens par elle-même?

## 2. Identifier les attributs
Les attributs sont les caractéristiques qui décrivent chaque entité. Ils deviendront les colonnes de vos tables et doivent être choisis avec soin pour représenter précisément les données que vous souhaitez stocker. 

- [ ] Quelles informations avez-vous besoin de connaître sur chaque entité?
- [ ] Quel(s) attribut(s) identifie(nt) de façon unique chaque enregistrement? (ID)
- [ ] Quelqu'un pourrait-il remplir tous ces champs avec des données réelles?
- [ ] Demandez-vous une seule information par attribut? (pas de liste) [would you like to know more?](more/entity_NF_1_atomicity.md)
- [ ] Quel type de données chaque attribut contiendra? (texte, nombre, date) [would you like to know more?](more/entity_attributes_types.md)
- [ ] Quels attributes ne peuvent pas etre vides ?
- [ ] Pourriez-vous trier ou rechercher par attributs importants?

### Vérifier vos attributs
La vérification des attributs permet d'assurer la qualité de votre modèle. Cette étape vise à éliminer les redondances et à garantir que chaque donnée est stockée de manière optimale.

- [ ] Chaque information est-elle stockée à un seul endroit?
- [ ] Avez-vous évité de stocker des listes dans un seul champ? [would you like to know more?](more/entity_NF_1_atomicity.md)
- [ ] Tous les attributs décrivent-ils vraiment leur entité?  [would you like to know more?](more/entity_NF_2.md)

## 3. Relations de base
Les relations définissent comment vos entités interagissent entre elles. Elles créent des connexions logiques qui reflètent la façon dont les objets du monde réel sont liés, permettant de naviguer entre différentes tables de données.

- [ ] Quelles entités ont besoin de connaître d'autres entités? (ex: client et commande)
- [ ] Pour chaque connexion: est-ce qu'une entité possède plusieurs exemplaires d'une autre, ou juste un?
- [ ] Quel verbe peut on utiliser pour exprimer la fonction de la relation ?
- [ ] Pouvez-vous expliquer chaque relation en une phrase simple? ("Un client passe plusieurs commandes")

## 4. Vérifications simples
Cette étape consiste à évaluer la cohérence globale de votre modèle. Elle vous permet de confirmer que votre conception répond aux besoins spécifiques de votre application.

- [ ] Votre conception est-elle spécifique à vos besoins, pas un modèle générique?
- [ ] Avez-vous évité de créer des tables uniquement pour des valeurs calculées?
- [ ] Pourriez-vous expliquer votre conception à quelqu'un qui ne connaît pas les bases de données?
- [ ] Avez-vous créé un diagramme simple montrant les entités et les connexions?
- [ ] Cette conception prendra-t-elle en charge toutes les tâches de base dont votre système a besoin?

## Tester votre conception
Le test de votre modèle avec des données et des scénarios réels est crucial pour valider sa pertinence avant l'implémentation. Cette étape révèle souvent des problèmes qui n'étaient pas évidents lors de la conception initiale.

- [ ] Pouvez-vous noter 3 exemples de données pour chaque entité?
- [ ] Votre conception peut-elle gérer des scénarios réels?
- [ ] Si vous changiez quelque chose à un endroit, auriez-vous besoin de le mettre à jour ailleurs aussi?
- [ ] Le stockage de vos données actuelles s'adapte-t-il à ce modèle?

# Projet commun du module LDB

Le projet repose sur une application centrée sur les collections. Les étudiants choisissent un sujet qui les intéresse et développent une application de collections, un réseau social de type Facebook ou Instagram, ou une boutique. Les étudiants sans idée de projet peuvent partir d’un exemple fourni.

## Socle commun

Les différentes applications partagent les mêmes éléments :

- **Utilisateurs** : profils, publications et compte de crédits internes.
- **Éléments publiés** : livres, mangas, restaurants, publications ou produits, avec un titre, une description et un utilisateur responsable.
- **Médias** : photos et vidéos hébergées sur un service externe, comme YouTube ou Cloudinary, et référencées par leur URL.
- **Collections** : ensembles d’éléments appartenant à un utilisateur, comme une liste de lecture, des favoris, un panier ou une liste d’emprunts.
- **Interactions** : mentions « j’aime », commentaires et abonnements entre utilisateurs, selon les besoins du projet.
- **Crédits internes** : coût des éléments et historique des mouvements liés aux échanges.

Les collections constituent le point commun du backend et du frontend : créer une collection, y ajouter des éléments, les consulter, les retirer et, lorsque cela s’applique, confirmer un échange.

## Déclinaisons possibles

| Application | Utilisation du socle commun |
|---|---|
| Application de collections | Organiser, conserver, partager ou emprunter des éléments autour d’un intérêt : livres, mangas, restaurants, etc. |
| Réseau social | Publier des textes, des photos et des vidéos, suivre des utilisateurs, aimer et commenter des publications. |
| Boutique | Publier des produits, constituer un panier et effectuer des échanges en crédits internes. |

Les règles propres à chaque usage complètent la structure commune : quantités dans un panier, ordre des éléments dans une collection, dates et retours pour les emprunts, disponibilité pour les échanges.

## Médias et crédits

La base conserve les références et les métadonnées des médias : type, URL, texte alternatif ou légende et position dans la publication. Les fichiers restent hébergés par le service externe. Pour la première version, les étudiants peuvent renseigner directement leurs URL. Supprimer une référence dans la base ne supprime pas le fichier hébergé.

Les crédits internes fournissent un mécanisme commun pour les échanges. Un coût nul permet les usages gratuits. Un achat dépense des crédits ; un emprunt peut en réserver, puis les libérer au retour, selon les règles retenues.

Chaque mouvement est enregistré dans un historique. La confirmation d’un échange vérifie le solde et la disponibilité, conserve le coût convenu et applique les changements dans une transaction. Les paiements réels et les intégrations comme Stripe restent des extensions facultatives.

## Utilisation dans le cours

Le même projet accompagne la progression : organiser les données, les rechercher et les modifier, relier les tables, observer les anomalies, normaliser, modéliser, poser les contraintes et maintenir la base. Les étudiants réalisent les opérations, vérifient leurs résultats et expliquent leurs choix, conformément au référentiel.

Les collections et les interactions offrent des situations concrètes pour étudier les relations un-à-plusieurs et plusieurs-à-plusieurs, les tables d’association, l’unicité, les agrégations et les règles de suppression. Les thèmes et les catégories deviennent des extensions facultatives ; leur définition ne conditionne plus l’entrée dans le projet.

## Données de départ et reprise en séance 2

Les exercices du cours utilisent d’abord le [corpus commun de 42 documents culturels](asset/session_01/README.md). Chaque document sert de point de départ à une fiche d’élément à publier dans l’application. Son numéro permet de le retrouver d’une séance à l’autre. Deux documents consacrés à la même œuvre restent deux éléments distincts : le programme, le livret DVD et le billet de *La Cantatrice chauve* conservent ainsi les numéros 12, 13 et 17.

Pour la séance 2, chaque groupe reprend :

- les 42 documents et leurs descriptions dans le [support HTML](exo/session_01.html) ;
- son fichier `observations-classement.md`, avec les réponses justifiées aux [treize questions de la séance 1](session_01.md#5-rechercher-dans-le-classement) et les trois inventaires de comptage ;
- les captures du classement, les noms et les règles des regroupements, ainsi que les documents difficiles à placer.

Les premières données à organiser sont les numéros des documents, leurs titres ou désignations, leur nature, les personnes mentionnées et leurs rôles, les lieux, les dates et les horaires lorsqu’ils sont indiqués. On conserve aussi la référence de l’image et sa description complète, y compris les mentions nécessaires aux treize questions : prix et monnaie, référence imprimée, inscription, logo, puissance du moteur, durée, placement et année. Ces informations doivent rester retrouvables dans les tableaux ; leur transcription conserve les signes, les unités et la notation présents dans les documents. Une donnée absente reste signalée comme telle ; on ne la déduit pas d’une connaissance de l’œuvre. Les regroupements servent à proposer des collections décrites par un nom, une règle et la liste des numéros des documents retenus.

La séance 2 produit des tableaux, un dictionnaire des données et des exports CSV. Les réponses aux treize questions et les inventaires de la séance 1 permettent de vérifier que les informations ont été conservées. Ces fichiers sont repris à la séance 3.

À partir de la séance 3, le formateur fournit des données fictives de fonctionnement de l’application : utilisateurs responsables, statuts et dates de publication. L’artiste mentionné sur un document et l’utilisateur qui publie sa fiche ont des rôles distincts ; la date d’un concert et la date de publication de sa fiche également. Les interactions et les crédits sont introduits au fil des opérations qui les nécessitent. Le même socle peut ensuite être adapté au sujet choisi pour l’atelier ADB.

Le [programme](readme.md) organise cette progression selon les compétences du [référentiel](referentiel.md).

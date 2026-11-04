# Identification des entités dans un modèle de données

# Table des matières
- [Identification des entités](#identification-des-entités)
- [Principes fondamentaux](#principes-fondamentaux)
  - Examiner les noms communs dans les spécifications
  - Identifier les éléments nécessitant stockage dans le système
  - Analyser ce que les utilisateurs mentionnent régulièrement
- [Sources d'identification](#sources-didentification)
  - Documents d'exigences
  - Formulaires existants
  - Interviews utilisateurs
  - Systèmes similaires
- [Méthode pratique](#méthode-pratique)
  - Lister tous les substantifs des descriptions
  - Éliminer les synonymes et regrouper les concepts
  - Différencier entités et attributs
  - Vérifier la multiplicité des instances
- [Questions clés](#questions-clés)
  - Sur quoi portent les recherches utilisateurs?
  - Quelles listes sont nécessaires?
  - Quels éléments nécessitent un historique?
  - Quels rapports seront générés?
- [Validation](#validation)
  - Concept distinct?
  - Identification unique possible?
  - Plusieurs attributs?
  - Pertinence pour les objectifs?
- [Erreurs courantes](#erreurs-courantes)
  - Confusion entité/attribut
  - Entités trop génériques/spécifiques
  - Oubli des entités de jointure
  - Modélisation de concepts inutiles

---

## Identification des entités

L'identification des entités constitue l'étape fondamentale de toute modélisation de données. Cette phase détermine les objets principaux qui structureront votre base de données et, par extension, l'architecture de votre application.

Les entités représentent les objets, personnes, concepts ou événements distincts qui nécessitent un stockage de données. Chaque entité devient généralement une table dans le modèle relationnel.

---

## Principes fondamentaux

### Examiner les noms communs dans les spécifications

Les substantifs présents dans les documents de spécification révèlent souvent les entités potentielles. Par exemple, dans un système de gestion de bibliothèque, les termes "livre", "auteur", "emprunteur" et "prêt" suggèrent des entités essentielles.

L'analyse linguistique systématique des documents permet d'extraire ces candidats potentiels. Chaque nom commun mérite d'être évalué comme entité possible.

### Identifier les éléments nécessitant stockage dans le système

Les données persistantes qui doivent être conservées entre les sessions utilisateurs ou sur une longue durée indiquent des entités. Posez-vous la question : "Quelles informations doivent survivre à l'exécution d'un processus?"

Les éléments transitoires ou calculés ne constituent généralement pas des entités à part entière, mais plutôt des attributs ou des résultats de requêtes.

### Analyser ce que les utilisateurs mentionnent régulièrement

Les concepts récurrents dans le discours des utilisateurs finaux révèlent souvent les entités essentielles du domaine métier. Lorsque les utilisateurs parlent de "commandes", "clients" ou "produits", ces termes méritent une attention particulière.

La fréquence d'apparition d'un concept dans les discussions métier est un indicateur fiable de son importance en tant qu'entité potentielle.

---

## Sources d'identification

### Documents d'exigences

Les cahiers des charges, spécifications fonctionnelles et autres documents d'exigences constituent la source primaire d'identification. Ces documents formalisent les besoins et contraintes du système.

Une lecture attentive permet d'extraire non seulement les entités explicites mais aussi celles qui sont implicites dans les descriptions des processus métier.

### Formulaires existants

Les formulaires papier ou électroniques préexistants offrent un aperçu précieux des données déjà collectées et organisées. Chaque section d'un formulaire correspond souvent à une entité ou à un groupe d'attributs.

L'analyse des formulaires révèle également les relations entre entités, notamment lorsque des références sont faites entre différentes sections.

### Interviews utilisateurs

Les entretiens avec les futurs utilisateurs du système permettent d'identifier les concepts métier essentiels. Les experts du domaine utilisent naturellement le vocabulaire spécifique qui révèle les entités clés.

Les questions ouvertes comme "Quelles informations consultez-vous régulièrement?" ou "Quels éléments suivez-vous dans le temps?" font émerger des entités pertinentes.

### Systèmes similaires

L'étude de systèmes comparables dans le même domaine ou dans des secteurs analogues fournit des modèles de référence. Cette approche permet d'éviter certaines erreurs de conception et d'identifier des entités potentiellement oubliées.

Les patterns récurrents dans ces systèmes indiquent souvent des entités fondamentales du domaine métier.

---

## Méthode pratique

### Lister tous les substantifs des descriptions

La première étape consiste à extraire systématiquement tous les noms communs des spécifications et interviews. Cette liste brute constitue le réservoir initial de candidats.

Pour un système de gestion hospitalière, on pourrait obtenir : patient, médecin, consultation, chambre, médicament, traitement, ordonnance, service, etc.

### Éliminer les synonymes et regrouper les concepts

Consolidez la liste en éliminant les doublons sémantiques. Par exemple, "client" et "acheteur" peuvent désigner la même entité dans certains contextes.

Regroupez également les concepts apparentés. "Facture", "devis" et "avoir" pourraient être regroupés sous une entité plus générique "document commercial" avec un attribut discriminant.

### Différencier entités et attributs

Distinguez les véritables entités des simples attributs. Une entité possède généralement plusieurs attributs descriptifs et mérite une existence indépendante.

Par exemple, "adresse" pourrait être une entité séparée dans un système où les adresses sont partagées entre plusieurs personnes, mais un simple attribut si chaque personne a une adresse unique.

### Vérifier la multiplicité des instances

Évaluez si le concept identifié existe en plusieurs exemplaires dans le système. Une entité valide possède généralement plusieurs instances distinctes.

Questionnez-vous : "Combien d'occurrences de cet élément existeront dans le système?" Si la réponse est "une seule", il s'agit probablement d'un paramètre plutôt que d'une entité.

---

## Questions clés

### Sur quoi portent les recherches utilisateurs?

Les critères de recherche fréquemment utilisés révèlent souvent des entités importantes. Si les utilisateurs recherchent par "projet", "client" ou "produit", ces éléments constituent probablement des entités centrales.

La façon dont les utilisateurs naviguent dans les données indique également la structure naturelle du domaine.

### Quelles listes sont nécessaires?

Les tableaux, listes ou catalogues requis dans le système correspondent généralement à des collections d'instances d'une même entité.

Identifiez les éléments qui doivent être présentés sous forme de liste dans l'interface utilisateur pour découvrir des entités potentielles.

### Quels éléments nécessitent un historique?

Les objets dont l'évolution doit être tracée dans le temps constituent souvent des entités importantes. Le besoin de conserver un historique suggère une importance particulière.

Par exemple, si l'évolution des statuts d'une commande doit être suivie, "commande" représente une entité clé du système.

### Quels rapports seront générés?

Les rapports et tableaux de bord prévus révèlent les entités qui feront l'objet d'analyses. Les dimensions d'analyse dans ces rapports correspondent fréquemment à des entités.

Analysez les en-têtes de colonnes et les critères de filtrage des rapports envisagés pour identifier des entités pertinentes.

---

## Validation

### Concept distinct?

Une entité valide représente un concept clairement délimité, distinct des autres entités. Vérifiez que chaque entité candidate possède une définition précise dans le contexte métier.

Évitez les chevauchements conceptuels qui créeraient des ambiguïtés dans le modèle.

### Identification unique possible?

Chaque instance d'une entité doit pouvoir être identifiée de manière unique. Si aucun identifiant naturel n'existe, un identifiant artificiel devra être créé.

Vérifiez que vous pouvez répondre à la question : "Comment distinguer deux instances différentes de cette entité?"

### Plusieurs attributs?

Une entité valide possède généralement plusieurs attributs descriptifs. Un concept représenté par un seul attribut est rarement une entité à part entière.

Analysez la richesse descriptive du concept pour confirmer son statut d'entité.

### Pertinence pour les objectifs?

Évaluez si l'entité contribue directement aux objectifs du système. Une entité doit participer aux processus métier ou aux fonctionnalités principales de l'application.

Éliminez les entités périphériques qui n'apportent pas de valeur ajoutée aux fonctionnalités attendues.

---

## Erreurs courantes

### Confusion entité/attribut

L'erreur la plus fréquente consiste à élever un simple attribut au rang d'entité, ou inversement à réduire une entité complexe à un attribut.

Exemple : Dans un système RH, "compétence" pourrait être une entité distincte avec ses propres attributs (niveau, certification, date d'acquisition) plutôt qu'un simple champ texte dans l'entité "employé".

### Entités trop génériques/spécifiques

Un niveau d'abstraction inapproprié peut conduire à des entités trop générales ou trop spécifiques. Les entités trop génériques manquent de précision, tandis que les entités trop spécifiques fragmentent inutilement le modèle.

Exemple : "Document" pourrait être trop générique, tandis que "FactureClientParticulierInternational" serait excessivement spécifique.

### Oubli des entités de jointure

Les relations many-to-many nécessitent souvent des entités intermédiaires (tables de jointure) qui sont fréquemment omises dans l'analyse initiale.

Ces entités de jointure peuvent porter des attributs propres à la relation. Par exemple, dans une relation entre "Étudiant" et "Cours", l'entité "Inscription" pourrait contenir la date d'inscription et la note obtenue.

### Modélisation de concepts inutiles

L'inclusion d'entités non pertinentes pour les objectifs du système complexifie inutilement le modèle de données et l'application résultante.

Concentrez-vous sur les entités qui apportent une valeur ajoutée aux fonctionnalités requises et éliminez celles qui n'interviennent pas dans les processus métier principaux.

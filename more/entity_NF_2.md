La Deuxième Forme Normale (2NF) est une étape importante dans le processus de normalisation des bases de données qui s'appuie sur la Première Forme Normale (1NF).

**Définition de la 2NF:**
Une table est en 2NF si et seulement si:
1. Elle est déjà en 1NF (attributs atomiques)
2. Tous les attributs non-clés dépendent entièrement de la clé primaire

Plus précisément, la 2NF élimine les dépendances partielles - c'est-à-dire lorsqu'un attribut non-clé dépend seulement d'une partie d'une clé primaire composite (composée de plusieurs attributs).

**Exemple concret:**
Considérons une table non-normalisée de résultats d'examens:

```
Examen(Étudiant_ID, Cours_ID, Étudiant_Nom, Cours_Titre, Note)
```

Avec la clé primaire composite (Étudiant_ID, Cours_ID).

Problème: Cette table viole la 2NF car:
- Étudiant_Nom dépend uniquement de Étudiant_ID (pas de Cours_ID)
- Cours_Titre dépend uniquement de Cours_ID (pas de Étudiant_ID)
- Seule Note dépend entièrement de la clé primaire composite

**Solution pour atteindre la 2NF:**
Décomposer la table en trois tables:

```
Étudiant(Étudiant_ID, Étudiant_Nom)
Cours(Cours_ID, Cours_Titre)
Résultat(Étudiant_ID, Cours_ID, Note)
```

**Avantages de la 2NF:**
- Élimine la redondance des données
- Réduit l'espace de stockage
- Prévient les anomalies de mise à jour (où modifier une donnée nécessiterait des changements multiples)
- Améliore l'intégrité des données

**Quand s'inquiéter de la 2NF:**
La 2NF est particulièrement importante lorsque vous travaillez avec des clés primaires composites. Si votre table a une clé primaire simple (un seul attribut), et qu'elle est déjà en 1NF, alors elle est automatiquement en 2NF.

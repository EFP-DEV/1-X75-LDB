# Exercice de Modélisation Conceptuelle des Données (MCD)

## Consignes
1. **Analyse du besoin** :  
   - Identifiez les entités principales nécessaires
   - Déterminez les attributs essentiels pour chaque entité
   - Définissez les associations entre ces entités et leurs cardinalités

2. **Création du MCD** :  
   - Représentez chaque entité avec ses attributs
   - Indiquez clairement les identifiants (clés primaires nommées "id")
   - Établissez les associations entre entités avec leurs cardinalités
   - Vérifiez la cohérence globale du modèle

3. **Génération avec IA** :
   - Utilisez une intelligence artificielle pour générer le schéma MCD avec la syntaxe Mermaid (graph TD)
   - Vérifiez que le schéma généré correspond bien à votre modélisation
   - Apportez les ajustements nécessaires pour améliorer la lisibilité

4. **Documentation** :  
   - Expliquez vos choix de modélisation
   - Justifiez les cardinalités choisies
   - Décrivez brièvement le fonctionnement du système modélisé


## Éléments attendus
- Le schéma du MCD avec entités, attributs et associations
- Le code Mermaid correspondant au schéma
- Une explication écrite des choix de modélisation
- La justification de la structure proposée par rapport aux besoins exprimés


## Évaluation
Votre modélisation sera évaluée sur :
- La précision et la pertinence des entités et attributs choisis
- La justesse des cardinalités et des associations
- La capacité du modèle à répondre efficacement aux besoins exprimés
- La simplicité et la clarté du modèle
- La qualité et la lisibilité du schéma généré avec Mermaid

--- 

## Exercice 1 : clinique médicale
Vous êtes chargé(e) de concevoir le système d'information d'une clinique médicale de taille moyenne. Cette clinique propose des consultations avec différents spécialistes et souhaite informatiser la gestion des consultations médicales.

### Besoins exprimés par la clinique
- Enregistrer les informations de base des patients
- Gérer les différents médecins et leurs spécialités
- Documenter les consultations médicales incluant horaires, durée et diagnostic
- Suivre le statut des consultations (planifiée, terminée, annulée)


### Contraintes métier à respecter
- Un patient peut avoir plusieurs consultations
- Un médecin est rattaché à une seule spécialité
- Une consultation concerne toujours un seul patient et un seul médecin
- Les informations de diagnostic et de tarification doivent être enregistrées pour chaque consultation
- Tous les identifiants doivent être nommés "id"


---

## Exercice 2 : cinéma multiplex
Vous êtes chargé(e) de concevoir le système d'information d'un cinéma multiplex. Ce cinéma projette plusieurs films chaque jour dans différentes salles et souhaite gérer les réservations de places et les ventes de billets.

### Besoins exprimés par le cinéma
- Enregistrer les films projetés avec leurs détails (titre, genre, durée)
- Gérer les séances de projection (date, heure, salle)
- Suivre les réservations de places pour chaque séance
- Gérer les clients et leurs informations de contact
- Suivre les ventes de billets et les paiements

### Contraintes métier à respecter
- Un film peut être projeté dans plusieurs séances
- Une salle peut accueillir plusieurs séances à différents horaires
- Une séance concerne toujours un seul film dans une seule salle
- Un billet est toujours associé à une séance spécifique
- Les informations sur le tarif et le placement doivent être enregistrées pour chaque billet
- Tous les identifiants doivent être nommés "id"

---
> Ce cours est distribué sous **licence Creative Commons**. Toute reproduction ou distribution à but commercial est interdite sans l’accord préalable de l’auteur.

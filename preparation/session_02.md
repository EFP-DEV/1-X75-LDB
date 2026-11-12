# Préparation de la séance 2

[Exercice](../exo/session_02.md) · [Cours](../session_02.md) · [Aide à la conduite](session_02_conduite.md) · [Corrigé](../solution/session_02.md) · [Référentiel](../referentiel.md)

## Première partie réalisée avec la papeterie

La classe a réalisé les étapes **1. Lot A — Relever les champs utiles** et **2. Préciser le sens, puis proposer un type**, incluses. Le travail se limite à A1 et A2.

Le fichier `papeterie_champs.xlsx` contient les feuilles `champs` et `decisions`. Les quatre rubriques de `champs` sont **Champ**, **Exemple relevé**, **Ce que ce champ décrit** et **Type proposé**. Les commentaires des exemples indiquent A1 ou A2. La feuille `decisions` conserve les choix discutés et les informations manquantes.

Les acquis à reprendre sont le sens précis d’un champ, l’unité d’une valeur, la distinction entre donnée fournie et donnée calculée, et le choix du type selon l’usage. Les deux dates de A1 décrivent des événements différents ; son prix est unitaire ; son adresse est une destination de livraison.

## Seconde partie consacrée aux tables

La suite reprend les **huit scénarios de l’exercice de 2025-2026**, intégrés dans l’[exercice actuel](../exo/session_02.md#3-dessiner-et-décrire-des-tables). Les archives restent inchangées. Les lots B, C et D ne constituent plus la suite de la séance ; ils restent disponibles comme documents complémentaires.

Faire conserver le classeur de la première partie, puis commencer `session_02_tables` sur papier ou dans un document. Chaque scénario demande des cadres de tables, le sens d’une ligne, un identifiant proposé et la description des champs : nom, type, longueur, caractère obligatoire et commentaire. Deux enregistrements fictifs permettent une vérification manuelle et une justification.

Les contextes sont : cinéma, librairie, blog, transport, langues du monde, commerce, hôpital et école. Le tableau guide sert de modèle de présentation. Les propositions sont discutées après leur construction ; le corrigé reste un support de restitution.

## Points de vigilance

- Distinguer la ligne du dictionnaire, qui décrit un champ, de la ligne de données, qui décrit un objet ou un événement.
- Faire expliquer pourquoi un titre ou un nom ne suffit pas toujours à identifier une ligne. Le champ `id` proposé doit être unique, présent et stable.
- Accepter une longueur « à déterminer » avec une question précise. Une limite habituelle n’est pas automatiquement justifiée.
- Faire préciser les unités et les règles ; une absence de valeur ne devient pas zéro.
- Conserver les besoins multiples et les historiques. Les tables supplémentaires peuvent être nommées et décrites ; leurs relations seront approfondies ensuite.
- Faire noter les hypothèses, les exemples inventés et les décisions en attente.

## Écart de progression dans le support ancien

L’ancien exercice annonce des tables simples, mais plusieurs contraintes exigent des relations : langues officielles multiples, commandes d’un client, consultations, résultats académiques. La séance actuelle demande d’identifier ces besoins et de proposer les tables ; elle n’exige pas encore les clés étrangères, les cardinalités ou le SQL.

Le corrigé ancien réduit parfois ces besoins à une valeur principale ou à un compteur. Ces réductions ne couvrent pas les scénarios complets. Le corrigé actuel les signale comme des besoins à poursuivre, conformément au référentiel sur la modélisation, les relations et la normalisation.

L’identifiant est introduit ici pour distinguer les lignes du dessin ; la séance 3 l’approfondira. Les relations et la normalisation conservent leur place dans la progression. Les règles de contenu, la conservation des valeurs et les contrôles restent travaillés à travers les exemples des huit scénarios, sans dépendre des lots B à D.

## Bilan attendu

Chaque étudiant explique une table, son identifiant, deux types, une décision sur la longueur ou le caractère obligatoire et un besoin de relation. La vérification doit citer les valeurs examinées et le résultat constaté. Les deux travaux sont conservés pour la suite du module.

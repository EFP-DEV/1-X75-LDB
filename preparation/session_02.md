# Préparation de la séance 2

[Exercice](../exo/session_02.md) · [Cours](../session_02.md) · [Aide à la conduite](session_02_conduite.md) · [Corrigé](../solution/session_02.md) · [Référentiel](../referentiel.md)

## Première partie réalisée avec la papeterie

La classe a réalisé les étapes **1. Lot A — Relever les champs utiles** et **2. Préciser le sens, puis proposer un type**, incluses. Le travail se limite à A1 et A2.

Le fichier `papeterie_champs.xlsx` contient les feuilles `champs` et `decisions`. Les quatre rubriques de `champs` sont **Champ**, **Exemple relevé**, **Ce que ce champ décrit** et **Type proposé**. Les commentaires des exemples indiquent A1 ou A2. La feuille `decisions` conserve les choix discutés et les informations manquantes.

Les acquis à reprendre sont le sens précis d’un champ, l’unité d’une valeur, la distinction entre donnée fournie et donnée calculée, et le choix du type selon l’usage. Les deux dates de A1 décrivent des événements différents ; son prix est unitaire ; son adresse est une destination de livraison.

## Seconde partie consacrée aux tables

Avant les scénarios, prévoir **10 minutes** pour le passage du dictionnaire aux données avec A1 et A2 uniquement. Faire conserver `champs` et `decisions`, puis créer `commandes` dans le même classeur : les noms de champs choisis deviennent les en-têtes, les deux commandes occupent deux lignes. Faire expliciter qu’une ligne de `champs` décrit un champ, tandis qu’une ligne de `commandes` décrit une commande ; chaque colonne correspond à un champ et chaque cellule contient sa valeur pour cette commande.

Faire comparer les enregistrements aux sources pour vérifier le sens et la précision des valeurs. Les types proposés ne configurent pas automatiquement les cellules d’Excel. Faire noter dans `decisions` les définitions à revoir et leur justification, puis ajuster le dictionnaire et les en-têtes concernés. Ce bref retour sur la saisie ne remplace pas la correction collective des scénarios, prévue à l’ouverture de la séance 3 pendant 40 minutes.

La suite reprend les **huit scénarios de l’exercice de 2025-2026**, intégrés dans l’[exercice actuel](../exo/session_02.md#3-dessiner-et-décrire-des-tables). Les lots B, C et D ne constituent plus la suite de la séance ; ils restent disponibles comme documents complémentaires.

Faire conserver le classeur de la première partie, puis commencer `session_02_tables` sur papier ou dans un document. Chaque binôme choisit un seul scénario parmi les huit. Le minimum est de décrire deux tables principales : cadres, sens d’une ligne et description de chaque champ (nom, type, longueur, caractère obligatoire et commentaire). Deux enregistrements fictifs par table, soit quatre au total, permettent une vérification manuelle et une justification. Les autres tables et relations nécessaires sont simplement notées.

Après ce minimum vérifié, les binômes peuvent approfondir le même scénario ou en choisir un autre avec la même démarche sur deux tables. Ces prolongements sont facultatifs ; les huit scénarios ne sont pas un ensemble à terminer. Aucun devoir ni achèvement à domicile n’est demandé : apporter les travaux, même inachevés, et les questions en séance 3.

Les contextes sont : cinéma, librairie, blog, transport, langues du monde, commerce, hôpital et école. Le tableau guide sert de modèle de présentation. Pendant les exercices de séance 2, les retours brefs servent à préciser un champ, vérifier un exemple ou débloquer un binôme. Ils ne remplacent pas la correction collective à l’ouverture de la séance 3. Les propositions y sont reprises dans une conversation fondée sur des situations concrètes ; le corrigé guide les questions, les relances et les décisions qui conduisent aux tables.

## Points de vigilance

- Distinguer la ligne du dictionnaire, qui décrit un champ, de la ligne de données, qui décrit un objet ou un événement.
- Faire relier chaque champ à un usage du scénario et préciser ce qu’il décrit.
- Accepter une longueur « à déterminer » avec une question précise. Une limite habituelle n’est pas automatiquement justifiée.
- Faire préciser les unités et les règles ; une absence de valeur ne devient pas zéro.
- Conserver les besoins multiples et les historiques. Les tables supplémentaires sont nommées ; leur description détaillée est facultative et leurs relations seront approfondies ensuite.
- Faire noter les hypothèses, les exemples inventés et les décisions en attente.

## Écart de progression dans le support ancien

L’ancien exercice annonce des tables simples, mais plusieurs contraintes exigent des relations : langues officielles multiples, commandes d’un client, consultations, résultats académiques. La séance actuelle demande d’identifier ces besoins et de proposer les tables ; elle n’exige pas encore les clés étrangères, les cardinalités ou le SQL.

Le corrigé ancien réduit parfois ces besoins à une valeur principale ou à un compteur. Ces réductions ne couvrent pas les scénarios complets. Le guide actuel fait émerger ces besoins par des questions sur des situations successives, conformément au référentiel sur la modélisation, les relations et la normalisation.

La séance 2 porte sur les propriétés, leur représentation et leur regroupement en tables. Après la correction collective, la séance 3 porte sur le choix des champs et la pratique du CRUD sur une seule table. Les clés et les relations seront introduites en séance 5 ; la normalisation conserve sa place dans la progression. Les règles de contenu, la conservation des valeurs et les contrôles restent travaillés à travers les exemples des huit scénarios, sans dépendre des lots B à D.

## Bilan attendu

Chaque étudiant explique ce que représente une ligne d’une des deux tables de son binôme, le sens de ses champs, deux types, une décision sur la longueur ou le caractère obligatoire et un besoin de relation. La vérification doit citer les valeurs examinées et le résultat constaté. Les deux travaux sont conservés pour la suite du module.

## Préparer l’ouverture de la séance 3 — correction collective, 40 minutes

La correction collective ouvre la séance 3 et porte sur les huit scénarios, sans supposer que chaque binôme les a tous préparés. Elle reprend aussi les propositions inachevées et conserve 40 minutes : cinéma 15, librairie 5, blog 4, transport 3, langues 7, commerce 2, hôpital 2 et école 2. Cette allocation de Zipf arrondie privilégie le cinéma, qui installe la démarche, puis les langues, qui approfondissent la recherche documentaire.

Partir des usages des étudiants, demander ce que le service doit savoir pour y répondre, puis distinguer les sujets et les événements décrits. Les réponses possibles du guide servent de relances ; elles ne constituent pas un dialogue à faire réciter. Les étudiants formulent progressivement eux-mêmes les questions.

Pour le transport, proposer les questions d’une recherche sur le déplacement d’une voiture vers le lieu où l’on voudrait vivre. Pour les langues, interrompre la routine avec les trois acronymes LBA, LDB, LPB, puis engager le parcours Wikipédia, Library of Congress et source officielle ISO 639-3. Le détail de cette investigation sera développé séparément. Ne pas présenter des réponses encore inconnues comme des faits établis.

Conserver pour chaque scénario la situation, les questions, les informations nécessaires, les regroupements justifiés et les points à rechercher. La description technique des champs prolonge ce raisonnement.

# Séance 2 : Des documents aux champs

[Documents de la Papeterie du Canal](session_02_documents.html) · [Cours](../session_02.md)

La papeterie reçoit ses commandes par mail, courrier et téléphone. Elle souhaite conserver les renseignements nécessaires pour préparer les articles, joindre la personne et livrer à la bonne adresse. Chaque demande de cet exercice concerne un seul article, commandé en plusieurs exemplaires si nécessaire. Tous les prix sont unitaires, en euros TTC.

Les commandes, personnes et coordonnées du dossier sont fictives. Les variations et erreurs de transcription font partie de l’exercice. Une information manquante ou incertaine doit être signalée ; aucune correction ne doit inventer ce que la personne voulait dire.

**Ouvrez chaque lot et ajoutez les colonnes uniquement au signal du professeur.** Travaillez à deux : une personne manipule le classeur, l’autre relit les documents et examine les propositions. Échangez les rôles à chaque lot.

## 1. Lot A — Relever les champs utiles

Ouvrez uniquement le **lot A**, puis créez `papeterie_champs.xlsx` avec une feuille nommée `champs`.

Commencez avec deux colonnes :

| Champ | Exemple relevé |
|---|---|
| | |

**Une ligne décrit un champ, pas une personne ni une commande.** Choisissez les champs nécessaires pour préparer les articles, joindre la personne et livrer. Pour chacun, recopiez un exemple exact de A1 ou A2. Indiquez le repère du document dans un commentaire de la cellule contenant l’exemple.

Comparez chaque exemple au document. Avez-vous conservé ses signes, ses espaces et sa précision ? Si Excel a modifié une valeur, cherchez comment la conserver telle qu’elle apparaît dans le document, puis vérifiez le résultat. Chaque champ répond-il à un besoin de la papeterie ?

**Arrêtez-vous pour l’échange en classe.**

## 2. Préciser le sens, puis proposer un type

Au signal du professeur, reprenez A1 et répondez :

1. Deux dates apparaissent. Que représente chacune ? Vos noms de champs permettent-ils de les distinguer ?
2. Le montant `12,50 €` concerne-t-il un carnet ou les quatre carnets ? Votre champ permet-il de le comprendre ?
3. L’adresse donnée permet-elle de connaître le domicile de Marie ? Que sait-on exactement de cette adresse ?

Ajoutez **« Ce que ce champ décrit »**. Définissez chaque champ en une phrase, en précisant l’unité si nécessaire. Renommez les champs dont le sens reste ambigu.

Faites relire trois définitions par un autre binôme. Il doit expliquer ce qu’il comprend sans votre aide. Reprenez les formulations qui entraînent une interprétation différente de la vôtre.

Créez maintenant une feuille `decisions` pour garder la trace des choix discutés :

| Champ et proposition | Document et valeur examinée | Conséquence observée | Décision et justification | Vérification ou information manquante |
|---|---|---|---|---|
| | | | | |

Au signal suivant, ajoutez **« Type proposé »** dans `champs`. Choisissez pour chaque champ une représentation : texte, nombre entier, nombre décimal ou date. Préparez une justification fondée sur l’usage de la valeur. Conservez vos propositions avant d’ouvrir le lot B.

## 3. Lot B — Confronter les types aux nouvelles valeurs

Ouvrez **B1 et B2**. Gardez votre tableau et confrontez vos choix aux nouvelles valeurs.

Pour chaque champ concerné :

1. relevez une valeur nouvelle et son document ;
2. appliquez votre type proposé : permet-il de conserver la valeur sans l’altérer et de réaliser l’usage attendu ?
3. notez toute perte, tout refus ou toute difficulté ;
4. maintenez ou modifiez votre proposition, puis reprenez les valeurs de A1 et A2 pour vérifier le choix retenu.

Conservez les exemples initiaux. Les nouvelles valeurs qui justifient vos décisions figurent dans `decisions`.

**Préparez votre échange.** Choisissez une décision que vous maintenez et une décision que vous avez modifiée ou laissée en attente. Appuyez chaque explication sur une valeur précise du dossier. Si vous hésitez, indiquez entre quelles options et quelle information vous manque.

Après l’échange, ajoutez **« Format retenu »**. Décrivez l’écriture ou l’affichage envisagé pour les dates, les montants et les téléphones. Pour toute transformation proposée, indiquez comment vous vérifieriez que l’information est conservée. La colonne « Exemple relevé » garde la transcription exacte.

## 4. Proposer des règles de contenu et de longueur

Avant d’ouvrir le lot C, ajoutez **« Contenu et longueur »**.

Pour le nom de contact, la référence d’article et la consigne de livraison, proposez les caractères admis et les éventuelles longueurs minimale et maximale. Précisez l’unité de longueur et justifiez chaque restriction.

Si vous ne disposez pas d’éléments suffisants pour fixer une limite, écrivez « à déterminer » et notez l’information nécessaire. Conservez ces premières propositions pour pouvoir expliquer les changements.

## 5. Lot C — Examiner les textes à conserver

Ouvrez **C1 à C3**. Testez vos règles de contenu et de longueur sur les textes tels qu’ils sont écrits.

1. Votre représentation conserve-t-elle chaque nom et chaque consigne en entier ?
2. Quels caractères ou quelles longueurs mettent vos règles en difficulté ? Citez les valeurs exactes.
3. Si une valeur dépasse votre limite, que feriez-vous concrètement ?
4. Si toutes les valeurs tiennent, votre limite est-elle pour autant justifiée pour les prochaines commandes ?

Consignez les conséquences et les décisions dans `decisions`, puis mettez à jour `champs`. Après une modification, appliquez à nouveau votre règle aux textes des lots A, B et C.

## 6. Écrire les règles de validation

Avant d’ouvrir le lot D, ajoutez **« Règles de validation »**.

Formulez au moins une règle pour chacun de ces champs : quantité, prix unitaire et date de livraison souhaitée. Donnez un exemple accepté et un exemple refusé avec une explication. Vous pouvez construire des exemples pour éprouver les règles ; identifiez-les comme des exemples inventés dans `decisions`.

Vérifiez que la règle peut être appliquée par une autre personne. « Valeur correcte » ne précise pas les conditions à examiner. Si la règle repose sur une pratique de la papeterie qui n’est pas indiquée, signalez l’hypothèse.

Vous contrôlez les règles manuellement dans cet exercice. Leur rédaction ne crée pas de protection automatique dans Excel.

## 7. Lot D — Examiner les saisies et décider de la suite

Ouvrez **D1 à D3**. Pour chaque valeur qui vous fait hésiter, consignez dans `decisions` :

- le document et la valeur exacte ;
- votre constat : acceptable selon la règle, incompatible avec elle ou interprétation incertaine ;
- la règle ou la convention qui justifie ce constat ;
- l’action à entreprendre et l’information éventuellement nécessaire.

**Une valeur incompatible peut aussi nécessiter une confirmation pour être corrigée.** Conservez la transcription reçue. Ne choisissez pas une valeur de remplacement sans élément qui la justifie.

Pour D3, explicitez votre lecture de la date et la convention sur laquelle elle repose. Distinguez les renseignements fournis par ce message de ceux qu’il faudrait demander pour préparer la commande.

Après toute modification d’une règle, reprenez des valeurs des lots précédents : la règle accepte-t-elle toujours les valeurs légitimes ? Repère-t-elle le problème qui a motivé sa révision ?

## 8. Relire, expliquer et conserver

Ajoutez **« Décisions à confirmer »** dans `champs`. Précisez pour chaque point ouvert l’information manquante et la source auprès de laquelle vous chercheriez la réponse. Indiquez « aucune à ce stade » lorsque vous n’avez pas de question ouverte pour le champ.

Échangez votre classeur avec un autre binôme. Sans explication orale, demandez-lui de :

1. reformuler le sens de trois champs ;
2. appliquer une règle à une valeur acceptable et à une valeur problématique du dossier ;
3. expliquer une décision laissée en attente.

Comparez les résultats aux vôtres. Corrigez les définitions ou les règles peu claires, puis reprenez les mêmes valeurs. Notez le résultat de cette vérification dans `decisions`.

**Question de clôture.** Choisissez un champ de votre tableau. Expliquez son sens, son type, les valeurs qu’il accepte et une règle utile pour contrôler la saisie. Appuyez votre justification sur une valeur du dossier et sur la vérification réalisée. Présentez aussi une décision qui reste à confirmer.

Enregistrez **`papeterie_champs.xlsx`**, avec les feuilles `champs` et `decisions`. Le [cours](../session_02.md) récapitule le rôle de chaque rubrique du dictionnaire.

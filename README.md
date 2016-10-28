# Document-segmentation-TP

  On dispose d’une chaine de numérisation de laquelle sortent régulièrement des documents qu’il faut
traiter, et en particulier reconnaitre leur type : facture, lettre de réclamation, etc ... Dans ce TP, nous
n’aurons bien sûr pas le temps de réaliser ce processus en entier, mais nous allons nous attaquer à la
séparation en bloc distincts du document, ainsi qu’à la reconnaissance des éléments constituant ces
blocs. Vous travaillerez dans un premier avec l’image sample 1
.
• Après avoir chargé l’image dans Matlab, appliquez lui des traitements de base de correction et
de binarisation.

• Adoptez une approche top-down, et extrayez les différentes zones (rectangulaires) de texte et
d’image du document avec l’algorithme xy-cut.

• Prenez maintenant une approche bottom-up, et déterminez les composantes connexes de ce document.
Les résultats obtenus sont-ils compatibles avec l’approche précédente ? Essayez d’obtenir
le "meilleur" des mondes.

• En vous aidant de critères de votre choix, essayez de déterminer de manière automatique si
l’élément est une image ou du texte, et identifiez clairement le résultat par des rectangles de
couleurs sur l’image.

• Réalisez un programme complet d’extraction dans lequel on ne passe en paramètre que le nom
de l’image analysée.

• Ajoutez du bruit à l’image avec les fonctions de Matlab (poivre et sel, bruit gaussien, multiplicatif).
Quelles remarques pouvez faire ?


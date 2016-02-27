# parsingcodes
Parser les références aux textes normatifs applicables en France

* Cherche le pattern "le code X" avec regex, retourne le premier match
* Puis cherche si code X est dans la liste des codes présents sur Légifrance
* Si oui, ajoute un lien vers le code Légifrance en vigueur à la date désirée
* Si non (par exemple : Code de procédure civile de la Nouvelle-Calédonie), rien
* Concatène les données déjà analysées puis boucle sur le restant jusqu'à ne plus rien trouver

[Voir aussi le code PHP de younes0 bien plus complet : https://github.com/younes0/reglex ]

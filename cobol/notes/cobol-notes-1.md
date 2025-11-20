# Développement COBOL 1

## Objectifs de la formation COBOL
La formation vise à fournir une maîtrise complète du langage COBOL et de ses applications pratiques.

- Maîtrise de la syntaxe et de la structure d'un programme COBOL.
- Compréhension des instructions arithmétiques et des expressions conditionnelles.
- Gestion des fichiers et manipulation des données en COBOL.
- Création de fonctions et utilisation de RDZ.
- Familiarisation avec les apports de la version 6 de COBOL.

## Plan de la formation COBOL
Le programme de formation est structuré sur deux semaines, abordant divers aspects du langage COBOL.

- Formation se déroulant du 10 au 24 novembre 2025.
- Couvre des sujets allant de la structure générale de COBOL à la gestion des fichiers et des impressions.
- Comprend des sessions pratiques sur la gestion des fichiers et l'utilisation de RDZ.

## Structure d'un programme COBOL
Ce chapitre présente les différentes divisions qui composent un programme COBOL et les règles de codage.

- Un programme COBOL est composé de quatre divisions : IDENTIFICATION, ENVIRONMENT, DATA, et PROCEDURE.
- La division IDENTIFICATION fournit des informations de base sur le programme.
- La division ENVIRONMENT spécifie l'environnement d'exécution et les fichiers utilisés.
- La division DATA définit les variables et leur structure, tandis que la division PROCEDURE contient la logique de traitement.

## Déclarations des variables en COBOL
Les variables en COBOL sont déclarées dans la DATA DIVISION et sont essentielles pour le traitement des données.

- Les variables peuvent être de différents types : groupes, isolées, tableaux, et redefinitions.
- Chaque déclaration doit inclure un numéro de niveau, un nom, un format, et éventuellement une valeur initiale.
- Les niveaux de déclaration varient de 01 à 77, avec des spécificités pour les variables de condition et de remplissage.

## Règles de codage et syntaxe COBOL
Les règles de codage en COBOL sont cruciales pour assurer la clarté et la fonctionnalité du code.

- Les lignes de code doivent respecter des positions spécifiques pour les numéros de ligne, les indicateurs, et les instructions.
- Les mots clés et les littéraux doivent être utilisés correctement pour éviter les erreurs de compilation.
- Les commentaires sont essentiels pour la documentation et doivent être signalés par un astérisque en colonne 7.

## Interface ISPF et commandes de base
L'interface ISPF est un outil essentiel pour la création et la gestion des programmes COBOL sur mainframe. ​

- Permet la création, modification, et exécution de programmes COBOL.
- Offre des commandes pour copier, insérer, déplacer, et répéter des lignes dans l'éditeur.
- Les utilisateurs doivent se familiariser avec les commandes de base pour une utilisation efficace de l'interface.

## Exercice pratique sur COBOL
Des exercices pratiques sont proposés pour appliquer les connaissances acquises en COBOL.

- Les participants doivent saisir, compiler, et exécuter des programmes COBOL.
- Vérification des résultats et correction des erreurs de compilation sont des étapes clés.
- Les exercices incluent la création de membres dans les bibliothèques et l'utilisation de JCL pour l'exécution.

## Déclaration et Utilisation des Variables Décimales
Ce chapitre traite de la déclaration et de l'utilisation des variables décimales en COBOL, y compris les points décimaux explicites et implicites.

- Le point (.) est utilisé pour l'affichage des valeurs décimales, sans impact sur les calculs.
- Les variables avec un point décimal explicite sont déclarées avec la clause PIC, par exemple, PIC 9(5).999. ​
- Le point décimal implicite est représenté par un « V » dans la clause PIC, par exemple, PIC 9(4)V9(2). ​
- Les variables signées utilisent le « S » pour indiquer le signe, par exemple, PIC S9(4)V9(2).

## Édition des Valeurs Numériques
Ce chapitre explique comment éditer les valeurs numériques pour un affichage formaté.

- Les caractères d'édition incluent Z, *, $, -, +, /, B, et 0.
- Le caractère Z remplace les zéros à gauche par des espaces.
- Le caractère * remplace les zéros à gauche par des astérisques.
- Le caractère $ est utilisé pour afficher des valeurs monétaires.
- Le caractère - indique les valeurs négatives, tandis que + indique les valeurs positives.
- Le caractère / est utilisé pour formater les dates.

## Redéfinition des Données avec REDEFINES
Ce chapitre aborde la clause `REDEFINES` pour permettre plusieurs définitions d'une même donnée.

- La clause `REDEFINES` permet de référencer le même stockage avec différentes structures de données. ​
- Les numéros de niveau doivent être identiques pour les éléments redéfinis. ​
- Les éléments redéfinis ne peuvent pas utiliser la clause VALUE.
Un exemple montre comment redéfinir une date en utilisant des champs séparés pour l'année, le mois et le jour.

## Opérations Arithmétiques en COBOL
Ce chapitre traite des opérations arithmétiques disponibles en COBOL pour manipuler les données.

- Les verbes arithmétiques incluent `ADD`, `SUBTRACT`, `MULTIPLY`, `DIVIDE`, et `COMPUTE`. ​
- L'instruction `ADD` permet d'ajouter des valeurs à une variable cible.
- L'instruction `SUBTRACT` soustrait des valeurs d'une variable.
`MULTIPLY` et `DIVIDE` effectuent des multiplications et des divisions respectivement.
L'instruction COMPUTE permet des calculs plus complexes avec plusieurs opérations. ​

## Exercices Pratiques sur les Variables
Ce chapitre propose des exercices pour appliquer les concepts de déclaration et d'opérations sur les variables.

- Les exercices incluent la déclaration d'enregistrements avec des sous-groupes et l'utilisation de la clause VALUE.
- Les exercices demandent également d'initialiser des champs groupés et d'utiliser des opérations arithmétiques pour calculer des totaux de factures.
- Les résultats des exercices doivent être affichés pour vérification.

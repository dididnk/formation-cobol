# Introduction au langage COBOL

Le langage est composé de 80 colonnes par ligne.

- 1 à 6 : Zone de numérotation des lignes (optionnelle) on y retrouve le commentaire (*) mais encore la compilation "D".
- 8 à 11 : Structure du programme (DIVISION, SECTION, PARAGRAPH).
- 12 à 72 : Zone de code exécutable. (exemple : DISPLAY "Bonjour le monde").
- 73 à 80 : Zone de contrôle reservée pour le système.

## Structure d'un programme COBOL

DIVISION -> SECTIONS -> PARAGRAPHS -> PHRASES -> DECLARATIONS

`Paragraphe`est une action spécifique dans une section.
`Section` est un ensemble de paragraphes liés (block de code qui permet d'améliorer la structure du programme en gros une sorte de fonction).

On a 4 divisions principales :

- IDENTIFICATION DIVISION : Informations sur le programme (nom, auteur, date).
- ENVIRONMENT DIVISION : Définition de l'environnement d'exécution (fichiers, périphériques).
- DATA DIVISION : Déclaration des variables et structures de données.
- PROCEDURE DIVISION : Contient le code exécutable du programme.

## Exemple de programme COBOL

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HelloWorld.
       AUTHOR. Emmanuel.
       DATE-WRITTEN. 2024-06-15.

       PROCEDURE DIVISION.
           DISPLAY "Bonjour à tous".
           STOP RUN.
```

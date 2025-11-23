       IDENTIFICATION DIVISION. 
       PROGRAM-ID. PG15CH10.
      * Somme de E1 et E2 via un sous-programme SUBPGADD
      * Résultat dans E3
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  E1       PIC 9(4) VALUE 2000.
       01  E2       PIC 9(4) VALUE 25.
       01  E3       PIC 9(4) VALUE ZEROES.
       PROCEDURE DIVISION.
           DISPLAY "Début du programme PG15CH10".
           DISPLAY "===========================".
           CALL "PGADD" USING E1, E2, E3
           DISPLAY "LA SOMME DE (" E1 ") + (" E2 ") = " E3.
           DISPLAY "Fin du programme PG15CH10".
           DISPLAY "===========================".
           STOP RUN.




       
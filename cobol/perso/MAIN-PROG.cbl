       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN-PROG.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  A       PIC 9(4) VALUE 10.
       01  B       PIC 9(4) VALUE 20.
       01  R       PIC 9(5).

       PROCEDURE DIVISION.
       DEBUT.
           DISPLAY "Début du programme principal"
           CALL "CALC-SOMME" USING A, B, R
           DISPLAY "RESULTAT = " R
           DISPLAY "Fin du programme principal"
           STOP RUN.
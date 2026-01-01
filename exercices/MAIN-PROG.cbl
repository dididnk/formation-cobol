       IDENTIFICATION DIVISION.
       PROGRAM-ID. ATEST1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  A       PIC 9(4) VALUE ZERO.
       01  B       PIC 9(4) VALUE ZERO.
       01  R       PIC 9(5).
       PROCEDURE DIVISION.
       DEBUT.
           DISPLAY "Début du programme principal"
           CALL "PJ151CRE" USING A, B.
           COMPUTE  R = A + B.
           DISPLAY "RESULTAT = " R
           DISPLAY "Fin du programme principal"
           STOP RUN.

           
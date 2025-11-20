       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXO1SOLUTION.
       AUTHOR. Emmanuel.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  A-NUM        PIC 9(9) VALUE 0.
       01  B-NUM        PIC 9(9) VALUE 0.
       01  C-NUM        PIC 9(9) VALUE 0.
       01  N-NUM        PIC 9(9) VALUE 0.
       01  COUNT-NUM    PIC 9(9) VALUE 0.
       01  TEMP-NUM     PIC 9(9) VALUE 0.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY "Entrez A (entier) : " WITH NO ADVANCING
           ACCEPT A-NUM
           DISPLAY "Entrez B (entier) : " WITH NO ADVANCING
           ACCEPT B-NUM
           DISPLAY "Entrez C (entier, non nul) : " WITH NO ADVANCING
           ACCEPT C-NUM

           IF C-NUM = 0
              DISPLAY "Erreur : C ne peut pas etre 0."
              STOP RUN
           END-IF

           IF A-NUM > B-NUM
              MOVE A-NUM TO TEMP-NUM
              MOVE B-NUM TO A-NUM
              MOVE TEMP-NUM TO B-NUM
           END-IF

           MOVE 0 TO COUNT-NUM

           DISPLAY "Entiers entre " WITH NO ADVANCING
           DISPLAY A-NUM WITH NO ADVANCING
           DISPLAY " et " WITH NO ADVANCING
           DISPLAY B-NUM WITH NO ADVANCING
           DISPLAY " divisibles par " WITH NO ADVANCING
           DISPLAY C-NUM

           PERFORM VARYING N-NUM FROM A-NUM BY 1 UNTIL N-NUM > B-NUM
              IF FUNCTION MOD (N-NUM, C-NUM) = 0
                 DISPLAY N-NUM
                 ADD 1 TO COUNT-NUM
              END-IF
           END-PERFORM

           DISPLAY "Nombre total : " WITH NO ADVANCING
           DISPLAY COUNT-NUM

           STOP RUN.

       END PROGRAM EXO1SOLUTION.

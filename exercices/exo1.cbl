       IDENTIFICATION DIVISION. 
       PROGRAM-ID. EXO1.
       AUTHOR E NGBAME.

       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION.

       DATA DIVISION. 
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01  WS-OLD      PIC 9(3) VALUE ZERO.
       01  MAX      PIC 9(2) VALUE 18.

       PROCEDURE DIVISION.
           PERFORM INIT.
           PERFORM TRAIT.
           PERFORM FIN.
       
       INIT.
           DISPLAY "*********** DEBUT PROGRAMME ***********".
           MOVE 26 TO WS-OLD.
       
       TRAIT.
           IF WS-OLD >= MAX THEN
              DISPLAY "Congrats you can learn cobol :)"
           ELSE
              DISPLAY "Sorry, you can not learn cobol at your age"
           END-IF.
           EXIT.

       FIN.
           DISPLAY "*********** FIN PROGRAMME ***********".
           STOP RUN.



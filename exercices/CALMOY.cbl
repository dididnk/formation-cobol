       IDENTIFICATION DIVISION. 
       PROGRAM-ID. CALMOY.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 NOTE1     PIC 9(2)V99.
       01 NOTE2     PIC 9(2)V99.
       01 MOYENNE   PIC 9(2)V99.
       01 RESULTAT  PIC 9(2)V99  VALUE 12.50.
       PROCEDURE DIVISION.
           MOVE 15.0 TO NOTE1.
           MOVE 10.0 TO NOTE2.
           COMPUTE MOYENNE = (NOTE1 + NOTE2)/2.
           IF MOYENNE = RESULTAT THEN 
               DISPLAY "TEST CORRECT "
           ELSE       
               DISPLAY "TEST INCORRECT"
           END-IF.
           STOP RUN.
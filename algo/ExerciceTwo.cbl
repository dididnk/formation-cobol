       IDENTIFICATION DIVISION. 
       PROGRAM-ID. ExerciceTwo.
       AUTHOR. Emmanuel.
       DATE-WRITTEN. 2024-06-10.

       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       01 WS-USER-NAME PIC X(12).


       PROCEDURE DIVISION.
           DISPLAY "Hello!".
           DISPLAY "What is your name ?".

           ACCEPT WS-USER-NAME.

           DISPLAY "Welcome to COBOL programming! " WS-USER-NAME.

           STOP RUN.



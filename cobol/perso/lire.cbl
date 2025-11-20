       IDENTIFICATION DIVISION.
       PROGRAM-ID. LIRE-FICHIER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT DONNEES ASSIGN TO "donnees"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  DONNEES.
       01  LIGNE        PIC X(80).

       WORKING-STORAGE SECTION.
       01  EOF          PIC X VALUE "N".

       PROCEDURE DIVISION.
       DEBUT.
           DISPLAY "Collègues de classe POEI".
           DISPLAY "=========================".
           OPEN INPUT DONNEES

           PERFORM UNTIL EOF = "O"
               READ DONNEES
                   AT END
                       MOVE "O" TO EOF
                   NOT AT END
                       DISPLAY "LIGNE LUE : " LIGNE
               END-READ
           END-PERFORM

           CLOSE DONNEES
           STOP RUN.

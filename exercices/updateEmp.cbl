       IDENTIFICATION DIVISION.
       PROGRAM-ID. UPDATE-EMP.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPFILE ASSIGN TO "FORM1011.FILES.SOURCESESDS"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  EMPFILE.
       01  EMP-REC.
           05 EMP-NO        PIC 9(5).
           05 FILLER        PIC X VALUE SPACE.
           05 EMP-NAME      PIC X(10).
           05 FILLER        PIC X VALUE SPACE.
           05 EMP-CITY      PIC X(12).
           05 FILLER        PIC X VALUE SPACE.
           05 EMP-SAL       PIC 9(5).

       WORKING-STORAGE SECTION.
       01  WS-EOF           PIC X VALUE "N".

       01 NEW-REC.
           05 N-EMP-NO      PIC 9(5) VALUE 00021.
           05 FILLER        PIC X VALUE SPACE.
           05 N-EMP-NAME    PIC X(10) VALUE "NGBAME".
           05 FILLER        PIC X VALUE SPACE.
           05 N-EMP-CITY    PIC X(12) VALUE "BORDEAUX".
           05 FILLER        PIC X VALUE SPACE.
           05 N-EMP-SAL     PIC 9(5) VALUE 21000.

       PROCEDURE DIVISION.
       MAIN-LOGIC.

           DISPLAY "AJOUT D'UN ENREGISTREMENT..."

      * OUVERTURE EN I-O POUR AJOUT
           OPEN I-O EMPFILE

      * LIRE JUSQU'A LA FIN POUR SE POSITIONNER @EOF
           PERFORM UNTIL WS-EOF = "Y"
              READ EMPFILE
                 AT END MOVE "Y" TO WS-EOF
              END-READ
           END-PERFORM

      * AJOUT NOUVEL ENREGISTREMENT
           WRITE EMP-REC FROM NEW-REC

           CLOSE EMPFILE

           DISPLAY "LECTURE COMPLETE DU FICHIER:"
           DISPLAY "------------------------------------"

      * OUVERTURE LECTURE POUR AFFICHAGE
           OPEN INPUT EMPFILE
           MOVE "N" TO WS-EOF

           PERFORM UNTIL WS-EOF = "Y"
              READ EMPFILE
                 AT END MOVE "Y" TO WS-EOF
                 NOT AT END DISPLAY EMP-REC
              END-READ
           END-PERFORM

           CLOSE EMPFILE

           STOP RUN.

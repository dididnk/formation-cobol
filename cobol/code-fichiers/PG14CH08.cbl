       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG14CH08.
       AUTHOR. E NGBAME.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ESDSFILE ASSIGN TO "FORM1011.FILES.EMP.ESDS"
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FS.

       DATA DIVISION.
       FILE SECTION.
       FD ESDSFILE
           RECORDING MODE IS F
           RECORD CONTAINS 80 CHARACTERS.
       01 ESDS-REC    PIC X(80).

       WORKING-STORAGE SECTION.
       01 FS PIC XX.
       01 WS-COMPTEUR PIC 9(5) VALUE 21.

       PROCEDURE DIVISION.
       MAIN-PARA.
      * Ouvrir en mode EXTEND pour ajouter à la fin du fichier
           OPEN EXTEND ESDSFILE
           IF FS NOT = "00"
              DISPLAY "ERREUR OPEN EXTEND : " FS
              STOP RUN
           END-IF

      * Préparer et écrire le nouvel enregistrement
           MOVE ALL SPACES TO ESDS-REC
           MOVE WS-COMPTEUR TO ESDS-REC(1:5)
           MOVE "NOUVEAU" TO ESDS-REC(7:13)
           MOVE "PARIS" TO ESDS-REC(21:11)
           MOVE "15000" TO ESDS-REC(33:10)

           WRITE ESDS-REC
           IF FS NOT = "00"
              DISPLAY "ERREUR WRITE : " FS
           ELSE
              DISPLAY "ENREGISTREMENT AJOUTE AVEC SUCCES"
           END-IF

           CLOSE ESDSFILE
           STOP RUN.
       IDENTIFICATION DIVISION.
       PROGRAM-ID.   PG03CH01.
       AUTHOR.       EMMANUEL NGBAME.
      *---------------------------------------------------------------*
      * PROGRAMME QUI FAIT UN CHAMP GROUPE                            *
      *---------------------------------------------------------------*
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01  GENDER                 PIC X.
           88  HOMME              VALUE 'H'.
           88  FEMME              VALUE 'F'.

       01  EMPLOYE.
           05  NOM                PIC X(10) VALUE "MESSI".
           05  PRENOM             PIC X(10) VALUE "LIONEL".
           05  DEPART             PIC X(10) VALUE "CATALAN".
           05  VILLE              PIC X(10) VALUE "BARCELONE".

       66  EMPLOYE-1              RENAMES NOM THRU VILLE.

       PROCEDURE DIVISION.
           PERFORM INIT.
           PERFORM TRAIT.
           PERFORM FIN.
           STOP RUN.

       INIT.
           SET FEMME TO TRUE.
           EXIT.

       TRAIT.
           DISPLAY "JE SUIS BIEN DANS LE MODE DEBUGGING".
           DISPLAY "CHAMP DEPARTEMENT DE L'EMPLOYE : " DEPART.
           DISPLAY "CONCAT INFOS EMPLOYE-1 : " EMPLOYE-1.
           IF HOMME
               DISPLAY "JE SUIS UN HOMME"
           END-IF.
           IF FEMME
               DISPLAY "JE SUIS UNE FEMME"
           END-IF.
           EXIT.

       FIN.
           DISPLAY "--- FIN DU PROGRAMME PG03CH01 ---".
           EXIT.

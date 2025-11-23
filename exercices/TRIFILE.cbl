       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRIFILE.
       AUTHOR. E NGBAME.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILE-IN    ASSIGN TO "FINPUT.dat"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT FILE-OUT   ASSIGN TO "FOUTPUT.dat"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT FILE-WK    ASSIGN TO "FWORK.dat".

       DATA DIVISION.
       FILE SECTION.

      * ===== STRUCTURE DU FICHIER D'ENTRÉE =====
       FD FILE-IN
           RECORDING MODE IS F
           RECORD CONTAINS 80 CHARACTERS.
       01 PERS-INP.
           02 ID-PERS-INP     PIC 9(6).
           02 NOM-PERS        PIC X(20).
           02 VILLE-PERS      PIC X(20).
           02 PHONE-PERS      PIC X(10).
           02 EXTRA-FILLER    PIC X(24).

      * ===== STRUCTURE DU FICHIER DE SORTIE =====
       FD FILE-OUT
           RECORDING MODE IS F
           RECORD CONTAINS 80 CHARACTERS.
       01 PERS-OUT.
           02 OUT-ID          PIC 9(6).
           02 OUT-NOM         PIC X(20).
           02 OUT-VILLE       PIC X(20).
           02 OUT-PHONE       PIC X(10).
           02 OUT-FILLER      PIC X(24).

      * ===== STRUCTURE DU FICHIER DE TRAVAIL POUR LE TRI =====
       SD FILE-WK.
       01 PERS-WRK.
           02 ID-PERS-WRK       PIC 9(6).
           02 INF-PERS-WRK      PIC X(74).

       WORKING-STORAGE SECTION.
       01 EOF-FLAG      PIC X VALUE "N".

       PROCEDURE DIVISION.
       DEBUT.
           DISPLAY "----------------------------------------".
           DISPLAY "   TRI DU FICHIER PERSONNEL EN COURS... ".
           DISPLAY "----------------------------------------".
      * Ept1: On recopie tout proprement dans le fichier de travail     
           SORT FILE-WK
                ON ASCENDING KEY ID-PERS-WRK
                USING FILE-IN
                GIVING FILE-OUT
      * Ept2: On gère les erreurs de tri  
           IF SORT-RETURN > 0
              DISPLAY "ERREUR : SORT ECHEC, CODE = " SORT-RETURN
           ELSE
              DISPLAY "TRI EFFECTUÉ AVEC SUCCÈS"
           END-IF.
      * Opt : ici j'ouvre mon fichier trié et j'affiche son contenu
           DISPLAY "----------------------------------------".
           DISPLAY "   CONTENU DU FICHIER TRIÉ :".
           DISPLAY "----------------------------------------".
      * Ept3: Lecture et affichage du fichier trié   
           OPEN INPUT FILE-OUT
           PERFORM UNTIL EOF-FLAG = "Y"
              READ FILE-OUT
                 AT END MOVE "Y" TO EOF-FLAG
                 NOT AT END
                    DISPLAY OUT-ID " | " OUT-NOM " | " OUT-VILLE
              END-READ
           END-PERFORM
           CLOSE FILE-OUT.
           DISPLAY "----------------------------------------".
           DISPLAY "         FIN DU TRI DU FICHIER".
           DISPLAY "----------------------------------------".
           STOP RUN.

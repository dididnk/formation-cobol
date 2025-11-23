       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG05CH03.
       AUTHOR. EMMANUEL NGBAME.
      * PROGRAMME QUI CALCULE LA MOYENNE DES ÉTUDIANTS
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Définition des variables
       01  WS-LG-NOTES-TRIM.
           05  WS-TRIMESTRE       PIC 9(5).
           05  WS-MATIERE         PIC 9(2).
           05  WS-ID-ELEVE        PIC 9(5).
           05  WS-DS1             PIC 9(2)V9(2).
           05  WS-DS2             PIC 9(2)V9(2).
           05  WS-INT1            PIC 9(2)V9(2).
           05  WS-INT2            PIC 9(2)V9(2).
           05  WS-MOY             PIC 9(2)V9(2).
      * Variables temporaires
       77  WS-LG1-NOTES-TRIM      PIC X(32).
       77  WS-LG2-NOTES-TRIM      PIC X(32).
       01  WS-MOY-TRIM            PIC 9(2)V9(2).
      * Variable qui va stocker la moyenne
       01  WE-MOY-CLASSE          PIC 9(2)V9(2) VALUE ZEROES.
       PROCEDURE DIVISION.
           PERFORM INIT.
           PERFORM TRAIT.
           PERFORM FIN.
           STOP RUN.
       INIT.
      * INITIALISATION DES VARIABLES
           INITIALIZE WS-LG-NOTES-TRIM.
      * Données avec des notes différentes pour avoir 3 moyennes distinctes
           MOVE "0000101000011250125011001000" TO WS-LG1-NOTES-TRIM.
           MOVE "0000201000021350175018001200" TO WS-LG2-NOTES-TRIM.
           EXIT.
       TRAIT.
      * CALCUL DE LA MOYENNE DES ÉTUDIANTS   
           DISPLAY "---------- ELEVE 1 ----------".
           MOVE WS-LG1-NOTES-TRIM TO WS-LG-NOTES-TRIM.           
           COMPUTE WS-MOY-TRIM = (
              ( WS-DS1 + WS-DS2 ) * 3  +
              ( WS-INT1 + WS-INT2 ) * 2 ) / 6.
           MOVE WS-MOY-TRIM TO WE-MOY-CLASSE.
           DISPLAY "ID Student : " WS-ID-ELEVE.
           DISPLAY "Moyenne : " WE-MOY-CLASSE.  

           DISPLAY "---------- ELEVE 2 ----------".
           MOVE WS-LG2-NOTES-TRIM TO WS-LG-NOTES-TRIM.           
           COMPUTE WS-MOY-TRIM = (
              ( WS-DS1 + WS-DS2 ) * 3  +
              ( WS-INT1 + WS-INT2 ) * 2 ) / 6.
           MOVE WS-MOY-TRIM TO WE-MOY-CLASSE.
           DISPLAY "ID Student : " WS-ID-ELEVE.
           DISPLAY "Moyenne : " WE-MOY-CLASSE.
           EXIT.                                                                                                                                                                                 
       FIN.
           DISPLAY "--- FIN DU PROGRAMME PG05CH03 ---".
           EXIT.
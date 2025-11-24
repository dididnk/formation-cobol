       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG18CH12.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FCLIENT ASSIGN TO FCLTDD
               ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY IS CLIENT-KEY
               ALTERNATE RECORD KEY IS AGENCE-KEY WITH DUPLICATES
               FILE STATUS IS WS-FS.
           SELECT FPRINT  ASSIGN TO PRCLTDD
               ORGANIZATION IS SEQUENTIAL
               FILE STATUS IS WS-FS-PR.
       DATA DIVISION.
       FILE SECTION.
       FD  FCLIENT.
       01  FCLIENT-REC.
           05 CLIENT-KEY       PIC X(08).   
           05 AGENCE-KEY       PIC X(20).  
           05 CLIENT-NUMBER    PIC 9(15).   
           05 FILLER           PIC X(37).  
       FD  FPRINT.
       01  PRINT-REC           PIC X(80).
       WORKING-STORAGE SECTION.
       01  WS-FS               PIC XX.            
       01  WS-FS-PR            PIC XX.            
       01  WS-FIN              PIC X VALUE "N".
       01  WS-SEARCH-AGENCE    PIC X(20) VALUE "AGENCE ETOILE".
       01  WS-LINE             PIC X(80).
       PROCEDURE DIVISION.
       MAIN-START.
           OPEN INPUT FCLIENT OUTPUT FPRINT.
           MOVE WS-SEARCH-AGENCE TO AGENCE-KEY.
           START FCLIENT KEY IS >= AGENCE-KEY.
           IF WS-FS NOT = "00"
               DISPLAY "START ERREUR: " WS-FS
               GO TO FIN-PGM
           END-IF.
       LECTURE-SEQ.
           READ FCLIENT NEXT RECORD
               AT END MOVE "O" TO WS-FIN
           END-READ.
           IF WS-FIN = "O"
               GO TO FIN-PGM
           END-IF.
           DISPLAY "CLE PRIMAIRE  : " CLIENT-KEY.
           DISPLAY "CLE SECONDAIRE : " AGENCE-KEY.
      * --- construire la ligne d'impression correctement ---
           STRING "PRIM:" DELIMITED BY SIZE
                  CLIENT-KEY DELIMITED BY SIZE
                  "  AGEN:" DELIMITED BY SIZE
                  AGENCE-KEY DELIMITED BY SIZE
                  INTO WS-LINE
           END-STRING.
           MOVE WS-LINE TO PRINT-REC.
           WRITE PRINT-REC.
           GO TO LECTURE-SEQ.
       FIN-PGM.
           CLOSE FCLIENT FPRINT.
           STOP RUN.

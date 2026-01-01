       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRWRSPL2.

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       COPY MAPWRIT.

       01  WS-RESCODE      PIC S9(08) COMP.                             
       01  WS-REC-LEN      PIC S9(04) VALUE 80 COMP.                    
       01  WS-KEY-LEN      PIC S9(03) VALUE 003 COMP.                   
       01  WS-REC-KEY      PIC 9(03).                        

       01  WS-REC-DATA.
           05 WS-CDECLT   PIC X(3).
           05 WS-CODEREG  PIC 99.
           05 WS-NATCPT   PIC 99.
           05 WS-NOMCPT   PIC X(10).
           05 WS-PRNCPT   PIC X(10).
           05 WS-DTNCPT   PIC 9(08).
           05 WS-SEXCPT   PIC X(01).
           05 WS-APRCPT   PIC 9(02).
           05 WS-SOCCPT   PIC X(01).
           05 WS-ADRCPT   PIC X(10).
           05 WS-SLDCPT   PIC 9(10).
           05 WS-POSCPT   PIC X(02).
           05 FILLER      PIC X(19).

       PROCEDURE DIVISION.
       MAIN-PARA.

      * --- 1. AFFICHER L'ÉCRAN DE SAISIE ---
           EXEC CICS SEND MAP('MAP1')
               MAPSET('MAPWRIT') MAPONLY FREEKB ERASE
           END-EXEC.

      * --- 2. RÉCUPÉRER LA SAISIE UTILISATEUR ---
           EXEC CICS RECEIVE MAP('MAP1')
               MAPSET('MAPWRIT')
           END-EXEC.

      * EXTRAIRE LA CLÉ SAISIE
           MOVE KEYIN TO WS-REC-KEY.

      * --- 3. VERIFIER SI LA CLE EXISTE DEJA ---
           EXEC CICS READ FILE('FCLIENT') INTO(WS-REC-DATA)
                LENGTH(WS-REC-LEN)
                RIDFLD(WS-REC-KEY)
                KEYLENGTH(WS-KEY-LEN)
                RESP(WS-RESCODE)
           END-EXEC.

           IF WS-RESCODE = DFHRESP(NORMAL)
                MOVE "CLE DEJA EXISTANTE" TO MSGINFO
                GO TO AFFICHER-MSG
           END-IF.

      * --- 4. REMPLIR LES DONNEES ALEATOIRES ---
           MOVE "777"        TO WS-CDECLT.
           MOVE 01           TO WS-CODEREG.
           MOVE 01           TO WS-NATCPT.
           MOVE "FERNANDEZ " TO WS-NOMCPT.
           MOVE "ANNE JULI " TO WS-PRNCPT.
           MOVE 12345678     TO WS-DTNCPT.
           MOVE "M"          TO WS-SEXCPT.
           MOVE 01           TO WS-APRCPT.
           MOVE "1"          TO WS-SOCCPT.
           MOVE "1DEGAULE "  TO WS-ADRCPT.
           MOVE 0000012345   TO WS-SLDCPT.
           MOVE "FR"         TO WS-POSCPT.

      * --- 5. ECRITURE VSAM ---
           EXEC CICS WRITE FILE('FCLIENT') FROM(WS-REC-DATA)
                LENGTH(WS-REC-LEN)
                RIDFLD(WS-REC-KEY)
                KEYLENGTH(WS-KEY-LEN)
                RESP(WS-RESCODE)
           END-EXEC.

           IF WS-RESCODE = DFHRESP(NORMAL)
                MOVE "ECRITURE REUSSIE" TO MSGINFO
           ELSE
                MOVE "ERREUR ECRITURE" TO MSGINFO
           END-IF.

      * --- 6. AFFICHER LE MESSAGE ---
       AFFICHER-MSG.
           EXEC CICS SEND MAP('MAP3')
               MAPSET('MAPWRIT') DATAONLY FREEKB
           END-EXEC.

           EXEC CICS RETURN END-EXEC.

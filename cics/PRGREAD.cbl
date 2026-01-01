       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRGREAD.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       COPY MAPREAD.                             
       01  WS-REC-LEN      PIC S9(04) COMP.             
       01  WS-KEY-LEN      PIC S9(03) COMP.             
       01  WS-REC-KEY      PIC 9(03).                   
       01  WS-REC-DATA.
           05  WS-CDECLT           PIC  X(3).
           05  WS-CODEREG          PIC  99.
           05  WS-NATCPT           PIC  99.
           05  WS-NOMCPT           PIC  X(10).
           05  WS-PRNCPT           PIC  X(10).
           05  WS-DTNCPT           PIC  9(08).
           05  WS-SEXCPT           PIC  X(01).
           05  WS-APRCPT           PIC  9(02).
           05  WS-SOCCPT           PIC  X(01).
           05  WS-ADRCPT           PIC  X(10).
           05  WS-SLDCPT           PIC  9(10).
           05  WS-POSCPT           PIC  X(02).
           05  FILLER              PIC  X(19).
       PROCEDURE DIVISION.                                              
       MAIN-PARA.                                                       
      * Longueur physique réelle
           MOVE 80 TO WS-REC-LEN.
      * Clé recherchée
           MOVE 001 TO WS-REC-KEY.
      * Longueur de la clé
           MOVE 3 TO WS-KEY-LEN.
           EXEC CICS SEND MAP('MAP1')
               MAPSET('MAPREAD') MAPONLY FREEKB ERASE
           END-EXEC. 
           EXEC CICS READ FILE('FCLIENT') 
               INTO (WS-REC-DATA)
               LENGTH(WS-REC-LEN)
               RIDFLD(WS-REC-KEY)
               KEYLENGTH(WS-KEY-LEN)
           END-EXEC.                                                  
           EXEC CICS                                                    
                RETURN                                                  
           END-EXEC. 

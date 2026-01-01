       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PROGDELT.
      *****************************************************************                                              
      * DELETE : PROGRAMME QUI SUPPRIME UN ENREGISTREMENT (ID: 001).  *
      *****************************************************************
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.                                                 
       01  WS-RESCODE      PIC S9(08) COMP.  
       01  WS-MSG          PIC X(60)  VALUE SPACES.                           
       01  WS-REC-LEN      PIC S9(04) VALUE 80 COMP.                    
       01  WS-KEY-LEN      PIC S9(03) VALUE 003 COMP.                   
       01  WS-REC-KEY      PIC 9(03)  VALUE 001.                        
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
           05  FILLER              PIC  X(19) VALUE SPACES.                          
       PROCEDURE DIVISION.                                              
       MAIN-PARA.
      * LECTURE DU FICHIER AVEC UPDATE                                                       
           EXEC CICS READ
               FILE('FCLIENT')
               INTO(WS-REC-DATA)
               RIDFLD(WS-REC-KEY)
               UPDATE
               RESP(WS-RESCODE)
           END-EXEC. 
      * VÉRIFIE SI L'ID DU CLIENT N'EXISTE PAS    
           IF WS-RESCODE NOT = DFHRESP(NORMAL)
               MOVE 'ERREUR LECTURE - 001 NON TROUVE' TO WS-MSG
               EXEC CICS SEND TEXT
                   FROM(WS-MSG)
                   LENGTH(60)
                   ERASE
               END-EXEC
               EXEC CICS RETURN END-EXEC
           END-IF.    
      * SUPPRIMER L'ENREGISTREMENT
           EXEC CICS DELETE FILE('FCLIENT')
               RESP(WS-RESCODE)
           END-EXEC.  
      * AFFICHER LE RESULTAT
           INITIALIZE WS-MSG.
           IF WS-RESCODE = DFHRESP(NORMAL)
               MOVE "CLIENT 001 SUPPRIMÉ AVEC SUCCES" TO WS-MSG
           ELSE
              MOVE "DELETE A ECHOUÉ" TO WS-MSG 
           END-IF.
      * ON ENVOIE LE MESSAGE D'ERREUR À L'ECRAN
           EXEC CICS SEND TEXT FROM(WS-MSG) LENGTH(60) ERASE END-EXEC.                                     
           EXEC CICS RETURN END-EXEC.   

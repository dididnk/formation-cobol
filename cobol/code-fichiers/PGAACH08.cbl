       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PGAACH08.                                            
       ENVIRONMENT DIVISION.                                            
       INPUT-OUTPUT SECTION.                                            
       FILE-CONTROL.                                                    
           SELECT FBUFFER ASSIGN TO BUFFER                              
           ORGANIZATION IS SEQUENTIAL                                   
           ACCESS MODE IS SEQUENTIAL                                    
           FILE STATUS IS FS-BUFFER.                                    
                                                                        
           SELECT FAGENCE ASSIGN TO AGENCE                              
           ORGANIZATION IS INDEXED                                      
           ACCESS MODE IS RANDOM
           RECORD KEY IS CODE-TAG                                      
           FILE STATUS IS FS-AGENCE.                                   
                                                                        
       DATA DIVISION.                                                  
       FILE SECTION.                                                   
       FD  FAGENCE.                                                     
       01  ENR-TAG.                                                     
           10 CODE-TAG    PIC 9(7).                                     
           10 LIBELLE-TAG PIC X(30).                                    
       FD  FBUFFER.                                                     
       01  ENR-BUFFER.                                                  
           10 ID-TAB  PIC X.                                            
           10 LIGNE-AG.                                                 
              15 CODE-AG PIC 9(7).                                      
              15 CODEAG  REDEFINES CODE-AG.                             
                 20 CODEAG-6    PIC 9(6).                               
                 20 CODEAG-CLE  PIC 9.                                  
              15 LIBELLE-AG PIC X(30).                                  
              15 FILLER PIC X(42).                                      
       WORKING-STORAGE SECTION.                                         
       01  WS-BUFFER-EOF PIC X VALUE 'N'.                               
       77  CLE-AG  PIC 9.                                               
       01  WRESTE  PIC 9.                                               
       01  FS-AGENCE   PIC XX VALUE ZERO.                               
       01  FS-BUFFER   PIC XX VALUE ZERO.                               
       01  WQUOT  PIC 9.                                                
       PROCEDURE DIVISION.                                              
       PROG.                                                            
           PERFORM DEBUT.                                               
           PERFORM TRAITEMENT UNTIL WS-BUFFER-EOF = 'O'.                
           PERFORM FIN.                                                 
      *---------------------NIVEAU 1                                    
       DEBUT.                                                           
           MOVE 'N' TO WS-BUFFER-EOF.                                   
           OPEN INPUT FBUFFER.                                          
           OPEN OUTPUT FAGENCE.                         
           IF FS-BUFFER = '00' AND FS-AGENCE = '00'
           THEN DISPLAY 'DEBUT PROGRAMME - TEST AGENCE SEULE'                                        
                PERFORM LECTURE                                         
           ELSE DISPLAY 'ERREUR OUVERTURE FICHIERS'                 
                DISPLAY 'FICHIER BUFFER: ' FS-BUFFER                 
                DISPLAY 'FICHIER AGENCE: ' FS-AGENCE                 
           END-IF.                                                      
       TRAITEMENT.                                                      
           IF ID-TAB = "A" THEN                                         
              DIVIDE CODEAG-6 BY 7 GIVING WQUOT REMAINDER WRESTE        
               COMPUTE CLE-AG = 7 - WRESTE                               
               DISPLAY 'CLE CALCULEE: ' CLE-AG 
               DISPLAY 'CLE BUFFER: ' CODEAG-CLE     
               IF CLE-AG NOT = CODEAG-CLE THEN                           
                  DISPLAY 'CODE AGENCE ERRONE: ' CODE-AG                 
               ELSE 
                  PERFORM CHG-LGTAG
                  DISPLAY 'AGENCE TRAITEE: ' CODE-AG
               END-IF                                                    
            ELSE
               DISPLAY 'ENREGISTREMENT NON AGENCE - TYPE: ' ID-TAB
            END-IF.                                                      
            PERFORM LECTURE.                                             
        FIN.                                                             
            CLOSE FBUFFER FAGENCE.                       
            DISPLAY 'FIN PROGRAMME - AGENCE SEULE'
            STOP RUN.                                                    
      *-----------------NIVEAU 2------------------                      
      *    ECRITURE ENREGISTREMENTS AGENCE       *                      
      ********************************************                      
       CHG-LGTAG.                                                       
           MOVE CODE-AG   TO CODE-TAG.                                  
           MOVE LIBELLE-AG TO LIBELLE-TAG.                              
           WRITE ENR-TAG                                                
           INVALID KEY 
              DISPLAY 'ERREUR ECRITURE AGENCE: ' FS-AGENCE
              DISPLAY 'CODE AGENCE: ' CODE-TAG
           NOT INVALID KEY 
              DISPLAY 'ENREGISTREMENT AGENCE OK: ' CODE-TAG            
           END-WRITE.                                                   
      *-----------LECTURE INITIALE & COURANTE CONFONDUES----------------
       LECTURE.                                                         
           READ FBUFFER                                                 
           AT END 
              MOVE 'O' TO WS-BUFFER-EOF
              DISPLAY 'FIN DE FICHIER BUFFER'                             
           END-READ.                                                    
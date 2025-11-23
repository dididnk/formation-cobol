       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG15CH08.  

       ENVIRONMENT DIVISION.  

       INPUT-OUTPUT SECTION.                                            
       FILE-CONTROL.                                                    
           SELECT FBUFFER ASSIGN TO AS-BUFFER                           
           ORGANIZATION IS SEQUENTIAL                                   
           ACCESS MODE IS SEQUENTIAL                                    
           FILE STATUS IS FS-BUFFER.                                    
                                                                        
           SELECT FMVTC   ASSIGN TO AS-MVTC                             
           ORGANIZATION IS SEQUENTIAL                                   
           ACCESS MODE IS SEQUENTIAL                                    
           FILE STATUS IS FS-MVTC.                                      
                                                                        
           SELECT FAGENCE ASSIGN TO DD-AGENCE                           
           ORGANIZATION IS INDEXED                                      
           ACCESS MODE IS RANDOM                                    
           RECORD KEY IS CODE-TAG                                       
           FILE STATUS IS FS-AGENCE.                                    
                                                                        
           SELECT FCLT    ASSIGN TO DD-CLT                              
           ORGANIZATION IS INDEXED                                      
           ACCESS MODE IS RANDOM                                    
           RECORD KEY IS CODE-TCLT                                      
           FILE STATUS IS FS-CLT.                                       
                                                                        
           SELECT FRIB     ASSIGN TO DD-RIB                             
           ORGANIZATION IS INDEXED                                      
           ACCESS MODE IS RANDOM                                    
           RECORD KEY IS CLT-TRIB                                       
           FILE STATUS IS FS-RIB.                                       
                                                                        
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       FD  FAGENCE.                                                     
       01  ENR-TAG.                                                     
           10 CODE-TAG    PIC 9(7).                                     
           10 LIBELLE-TAG PIC X(30).         
       FD  FCLT.                                                        
       01  ENR-TCLT.                                                    
           10 CODE-TCLT   PIC 9(5).                                     
           10 NOM-TCLT    PIC X(20).                                    
           10 PRENOM-TCLT PIC X(20).                                    
           10 CODEAG-TCLT PIC 9(7).                                     
       FD  FRIB.                                                        
       01  ENR-TRIB.                                                    
           10 CLT-TRIB    PIC 9(5).                                     
           10 CPTE-TRIB   PIC X(23).                                    
           10 DATE-TRIB   PIC 9(8).                                     
           10 SOLDE-TRIB  PIC 9(9)V9(2).                                
           10 SENS-TRIB   PIC X.                                        
       FD  FMVTC.                                                       
       01  ENR-TMVTC.                                                   
           10 CLT-TMVTC    PIC 9(5).                                    
           10 DATE-TMVTC   PIC 9(8).                                    
           10 MONT-TMVTC   PIC 9(9)V9(2).                               
           10 SENS-TMVTC   PIC X.                                       
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

           10 LIGNE-CLT REDEFINES LIGNE-AG.
              15 CODE-CLT PIC 9(5).
              15 NOM-CLT  PIC X(20).
              15 PRENOM-CLT PIC X(20).
              15 CODEAG-CLT PIC 9(7).
              15 FILLER PIC X(27).

           10 LIGNE-RIB REDEFINES LIGNE-AG.
              15 CLT-RIB    PIC 9(5).
              15 CPTE-RIB   PIC X(23).
              15 DATE-RIB   PIC 9(8).
              15 SOLDE-RIB  PIC 9(9)V9(2).
              15 SENS-RIB   PIC X.
              15 FILLER PIC X(31).

           10 LIGNE-MVTC REDEFINES LIGNE-AG.
              15 CLT-MVTC    PIC 9(5).
              15 DATE-MVTC   PIC 9(8).
              15 MONT-MVTC   PIC 9(9)V9(2).
              15 SENS-MVTC   PIC X.
              15 FILLER PIC X(54).
                                     
       WORKING-STORAGE SECTION.                                         
       01  WS-BUFFER-EOF PIC X VALUE 'N'.                               
       77  CLE-AG  PIC 9.                                               
       01  WRESTE  PIC 9.                                               
       01  FS-AGENCE   PIC XX VALUE ZERO.                               
       01  FS-BUFFER   PIC XX VALUE ZERO.                               
       01  FS-RIB      PIC XX VALUE ZERO.                               
       01  FS-MVTC     PIC XX VALUE ZERO.                               
       01  FS-CLT      PIC XX VALUE ZERO.                               
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
           OPEN OUTPUT FCLT FAGENCE FRIB FMVTC.                         
           IF FS-BUFFER = '00' AND FS-AGENCE = '00' AND FS-CLT = '00'   
           AND FS-RIB = '00' AND FS-MVTC = '00'                         
           THEN DISPLAY 'DEB PG'                                        
                PERFORM LECTURE                                         
           ELSE DISPLAY 'ERR. OUV FILES: FB ' FS-BUFFER                 
                DISPLAY 'ERR. OUV FILES: FA ' FS-AGENCE                 
                DISPLAY 'ERR. OUV FILES: FC ' FS-CLT                    
                DISPLAY 'ERR. OUV FILES: FR ' FS-RIB                    
                DISPLAY 'ERR. OUV FILES: FM ' FS-MVTC                   
           END-IF.                                                      
       TRAITEMENT.                                                      
           IF ID-TAB = "A" THEN                  
              DIVIDE CODEAG-6 BY 7 GIVING WQUOT REMAINDER WRESTE        
              COMPUTE CLE-AG = 7 - WRESTE                               
              DISPLAY 'CLE CAL: ' CLE-AG ' CLE BUFFER: ' CODEAG-CLE     
              IF CLE-AG NOT = CODEAG-CLE THEN                           
                 DISPLAY 'CODE AGENCE ERRONE: ' CODE-AG                 
              ELSE PERFORM CHG-LGTAG                                    
              END-IF                                                    
           END-IF.                                                      
           IF ID-TAB = "C" THEN                                         
              PERFORM CHG-LGTCLT.                                       
           IF ID-TAB = "M" THEN                                         
              PERFORM CHG-LGTMVTC.                                      
           IF ID-TAB = "R" THEN                                         
              PERFORM CHG-LGTRIB.                                       
           PERFORM LECTURE.                                             
       FIN.                                                             
           CLOSE FBUFFER FAGENCE FCLT FMVTC FRIB.                       
           STOP RUN.                                                    
      *-----------------NIVEAU 2------------------                      
      *    ECRITURE ENREGISTREMENTS AGENCE       *                                             
      ********************************************                      
       CHG-LGTAG.                                                       
           MOVE CODE-AG   TO CODE-TAG.                                  
           MOVE LIBELLE-AG TO LIBELLE-TAG.                              
           WRITE ENR-TAG                                                
           INVALID KEY DISPLAY 'ERR. ECR. AGENCE: ' FS-AGENCE           
           NOT INVALID KEY DISPLAY 'ENR AGENCE OK: ' ENR-TAG            
           END-WRITE.                                                   
      ********************************************                      
      *    ECRITURE ENREGISTREMENTS CLIENT       *                      
      ********************************************                      
       CHG-LGTCLT.                                                      
           MOVE CODE-CLT    TO CODE-TCLT.                               
           MOVE NOM-CLT     TO NOM-TCLT.                                
           MOVE PRENOM-CLT  TO PRENOM-TCLT.                             
           MOVE CODEAG-CLT  TO CODEAG-TCLT.                             
           WRITE ENR-TCLT                                               
           INVALID KEY DISPLAY 'ERR. ECR. CLIENT: ' FS-CLT              
           NOT INVALID KEY DISPLAY 'ENR CLIENT OK: ' ENR-TCLT           
           END-WRITE.                        
      ********************************************                      
      *    ECRITURE ENREGISTREMENTS RIB          *                      
      ********************************************                      
       CHG-LGTRIB.                                                      
           MOVE CLT-RIB   TO CLT-TRIB.                                  
           MOVE CPTE-RIB  TO CPTE-TRIB.                                 
           MOVE DATE-RIB  TO DATE-TRIB.                                 
           MOVE SOLDE-RIB TO SOLDE-TRIB.                                
           MOVE SENS-RIB  TO SENS-TRIB.                                 
           WRITE ENR-TRIB                                               
           INVALID KEY DISPLAY 'ERR. ECR. CLIENT: ' FS-RIB              
           NOT INVALID KEY DISPLAY 'ENR RIB    OK: ' ENR-TRIB           
           END-WRITE.                                                   
      ************************************************                  
      *    ECRITURE ENREGISTREMENTS MOUVEMENTS COMPTE*                  
      ************************************************                  
       CHG-LGTMVTC.                                                     
           MOVE CLT-MVTC   TO CLT-TMVTC.                                
           MOVE DATE-MVTC  TO DATE-TMVTC.                               
           MOVE MONT-MVTC  TO MONT-TMVTC.    
           MOVE SENS-MVTC  TO SENS-TMVTC.                               
           WRITE ENR-TMVTC.                                             
      *-----------LECTURE INITIALE & COURANTE CONFONDUES----------------
       LECTURE.                                                         
           READ FBUFFER                                                 
           AT END MOVE 'O' TO WS-BUFFER-EOF                             
           END-READ.                                                    
                                                                                                                                                            
       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG17CH12.                                            
       AUTHOR.     E NGBAME.                                             
      * PROGRAMME D'EDITION                                             
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
       SOURCE-COMPUTER. XXX-ZOS WITH DEBUGGING MODE.                    
       INPUT-OUTPUT SECTION.                                            
       FILE-CONTROL.                                                    
      *DEFINITION FICHIER ECRAN/IPRIMANTE                               
           SELECT FPRINT ASSIGN TO DDPRINT                              
           ORGANIZATION IS SEQUENTIAL                                   
           ACCESS MODE IS SEQUENTIAL                                    
           FILE STATUS IS FS-PRINT.                                     
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
      * FILE DEFINITION DU BUFFER                                       
       FD  FPRINT.                                                      
       01  REC-PRT. 
            05 LG-PRT       PIC X(80).                                   
       WORKING-STORAGE SECTION.                                         
      * LIGNE TITRE                                                     
       01 LG-VIDE     PIC X(80) VALUE SPACES.                           
       01 LG-TITRE.                                                     
          05 FILLER PIC X(20) VALUE SPACES.                             
          05 WE-NTITRE PIC X(15) VALUE 'RELEVE BANCAIRE'.               
          05 FILLER PIC X(28) VALUE SPACES.                             
          05 FILLER PIC X(3)  VALUE 'DU '.                              
          05 WE-DTEDIT PIC X(10) VALUE '31/10/2025'.                    
                                                                        
       01 LG-CLIENT.                                                    
          05 FILLER        PIC X(26) VALUE '                CLIENT : '. 
          05 WE-IDCLT      PIC X(5)    VALUE '00001'.                   
          05 FILLER        PIC X(2) VALUE SPACES.                       
          05 WE-NOMCLT     PIC X(16) VALUE ' M. LE PRESIDENT'.          
                                                                        
       01 LG-TRAC.                                                      
          05 FILLER        PIC X(5) VALUE '     '.                      
          05 FILLER        PIC X(16) VALUE '*--------------*'.          
          05 FILLER        PIC X(21) VALUE '--------------------*'.     
          05 FILLER        PIC X(16) VALUE '---------------*'.          
          05 FILLER        PIC X(16) VALUE '---------------*'.          
       01 LG-ENT-DET.                                                   
          05 FILLER        PIC X(5) VALUE '     '.                      
          05 FILLER        PIC X(16) VALUE 'I DATE MVT     I'.          
          05 FILLER        PIC X(21) VALUE '     MOUVEMENT      I'.     
          05 FILLER        PIC X(16) VALUE '     DEBIT     I'.          
          05 FILLER        PIC X(16) VALUE '    CREDIT     I'.          
       01 LG-TOT-DET.                                                   
          05 FILLER        PIC X(5) VALUE '     '.                      
          05 FILLER        PIC X(16) VALUE '                '.          
          05 FILLER        PIC X(23) VALUE '  ======> TOTAUX :  I  '.   
          05 WE-TDEBIT     PIC +ZZZBZZ9.99.                             
          05 FILLER        PIC X(5) VALUE '  I  '.                      
          05 WE-TCREDIT    PIC +ZZZBZZ9.99.                             
       01 LG-SOL-DET.                                                   
          05 FILLER        PIC X(5) VALUE '     '.                      
          05 FILLER        PIC X(16) VALUE '                '.          
          05 FILLER        PIC X(23) VALUE '    =======> SOLDE: I  '.    
          05 WE-SDEBIT     PIC +ZZZBZZ9.99.                             
          05 FILLER        PIC X(5) VALUE '  I  '.                      
          05 WE-SCREDIT    PIC +ZZZBZZ9.99.                             
                                                                        
       01 LG-DET.                                                       
          05 FILLER        PIC X(8) VALUE '     I  '.                   
          05 WE-JJMVT      PIC 9(2) VALUE  01.                          
          05 FILLER        PIC X     VALUE '/'.                         
          05 WE-MMMVT      PIC 9(2)  VALUE 10.                          
          05 FILLER        PIC X     VALUE '/'.                         
          05 WE-AAMVT      PIC 9(4)  VALUE 2025.                        
          05 FILLER        PIC X(4)  VALUE '  I '.                      
          05 WE-LIBOP      PIC X(18).                                   
          05 FILLER        PIC X(4)  VALUE ' I  '.                      
          05 WE-DEBIT      PIC +ZZZBZZ9.99.                             
          05 FILLER        PIC X(5)  VALUE '  I  '.                     
          05 WE-CREDIT     PIC S9(7)V99 SIGN LEADING SEPARATE.                   
          05 FILLER        PIC X(3)  VALUE '  I'.                       
                                                                        
       01 LG-PIEDPG.                                                    
          05 FILLER PIC X(60) VALUE SPACES.                             
          05 FILLER PIC X(9)  VALUE 'N° PAGE: '.                        
          05 WE-NUMPG PIC ZZ9.                                          
                                                                        
       01 FS-PRINT   PIC XX     VALUE '00'.                             
       01 WS-NBLG-ED PIC 9(2)   VALUE 12.                               
       01 WS-CUMUL-DEB PIC S9(7)V9(2)  VALUE ZEROES.                    
       01 WS-CUMUL-CRE PIC S9(7)V9(2)  VALUE ZEROES.                    
       01 WS-SOLDE     PIC S9(7)V9(2)  VALUE ZEROES.                    
       PROCEDURE DIVISION.                                              
       PRINCIPAL.                                                       
           PERFORM INIT.                                                
           IF FS-PRINT = '00'                                           
           THEN                                                         
             PERFORM TRAIT.                                             
           PERFORM FIN.                                                 
       INIT.                                                            
           OPEN OUTPUT FPRINT.                                          
       TRAIT.                                                           
           WRITE REC-PRT FROM LG-VIDE  AFTER ADVANCING PAGE.             
           WRITE REC-PRT FROM LG-TITRE AFTER ADVANCING 3 LINE.          
           WRITE REC-PRT FROM LG-CLIENT AFTER ADVANCING 3 LINE.         
           WRITE REC-PRT FROM LG-TRAC   AFTER ADVANCING 5 LINE.         
           WRITE REC-PRT FROM LG-ENT-DET.                               
           WRITE REC-PRT FROM LG-TRAC.                                  
           MOVE 'VERS. CHQ NUM 1567' TO WE-LIBOP.                       
           ADD +12524     TO WS-CUMUL-CRE.                              
           MOVE  +12524   TO WE-CREDIT.                                 
           MOVE  ZEROES   TO WE-DEBIT.                                  
           WRITE REC-PRT FROM LG-DET.                                   
           MOVE 'ACHAT CB AMAZONE' TO WE-LIBOP.                         
           ADD -897     TO WS-CUMUL-DEB.                                
           MOVE   -897   TO WE-DEBIT.                                   
           MOVE  ZEROES   TO WE-CREDIT.                                 
           WRITE REC-PRT FROM LG-DET.                                   
           WRITE REC-PRT FROM LG-TRAC.                                  
           MOVE WS-CUMUL-DEB TO WE-TDEBIT.                              
           MOVE WS-CUMUL-CRE TO WE-TCREDIT.                             
           WRITE REC-PRT FROM LG-TOT-DET.                               
           WRITE REC-PRT FROM LG-TRAC.                                  
           IF (WS-CUMUL-DEB * (-1)) > WS-CUMUL-CRE                      
           THEN COMPUTE WS-SOLDE = (WS-CUMUL-DEB * (-1)) - WS-CUMUL-CRE 
                   MOVE WS-SOLDE TO WE-SDEBIT                           
                   MOVE ZEROES   TO WE-SCREDIT                          
              ELSE COMPUTE WS-SOLDE = WS-CUMUL-DEB + WS-CUMUL-CRE       
                   MOVE WS-SOLDE TO WE-SCREDIT                          
                   MOVE ZEROES   TO WE-SDEBIT                           
           END-IF.                                                      
           WRITE REC-PRT FROM LG-SOL-DET.                               
           WRITE REC-PRT FROM LG-TRAC.                                  
           WRITE REC-PRT FROM LG-PIEDPG AFTER WS-NBLG-ED.               
       FIN.                                                             
           CLOSE FPRINT.                                                
           STOP RUN.                                                    
       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG12CH08.                                            
       AUTHOR.  E NGBAME.                                             
      * PROGRAMME LECTURE FICHIER ESDS                                  
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
       SOURCE-COMPUTER. XXX-ZOS WITH DEBUGGING MODE.                    
       INPUT-OUTPUT SECTION.                                            
       FILE-CONTROL.                                                    
           SELECT EMPFILE ASSIGN TO MYFILE                            
           ORGANIZATION IS SEQUENTIAL                                   
           ACCESS MODE IS SEQUENTIAL                                    
           FILE STATUS IS WS-FSEMP.                                     
                                                                        
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       FD  EMPFILE.                                                     
      *    RECORDING MODE IS F                                          
      *    RECORD CONTAINS 80 CHARACTERS                                
      *    BLOCK CONTAINS 0 RECORDS.                                    
       01  EMPREC.                                                      
          05 EMPID    PIC X(5).                                        
          05 FILLER   PIC X(2).                                        
          05 EMPNOM   PIC X(10).                                       
          05 FILLER   PIC X(2).                                        
          05 EMPVILLE PIC X(10).                                       
          05 FILLER   PIC X(2).                                        
          05 EMPSAL   PIC 9(5).                                        
          05 FILLER   PIC X(44).                                       
       WORKING-STORAGE SECTION.                                         
       77  WS-FSEMP   PIC X(2) VALUE '00'.                              
       77  FFEMP      PIC X    VALUE 'N'.                               
       01  WS-ENR     PIC 9(3) VALUE 0.                                 
       PROCEDURE DIVISION.                                              
       P-PG12CH08.                                                      
           PERFORM INIT.                                                
           IF WS-FSEMP = '00'                                           
           THEN                                                         
             READ EMPFILE                                              
             MOVE 'N' TO FFEMP                                         
             PERFORM TRAIT UNTIL FFEMP = 'O'                           
           ELSE                                                         
             DISPLAY 'PB OUVERTURE FICHIER EMPLOYE: ' WS-FSEMP.        
           PERFORM FIN.                                                 
       INIT.                                                            
           OPEN INPUT EMPFILE.                                          
       TRAIT.                                                           
     D     DISPLAY 'ENR= '  EMPREC.                                     
     D     DISPLAY 'LECTURE COURANTE'.                                  
           ADD 1 TO WS-ENR.                                             
           READ EMPFILE.                                                
           IF WS-FSEMP NOT = '00'                                       
           THEN MOVE 'O' TO FFEMP                                       
              DISPLAY 'FIN DE FICHIER ATTEINTE OU PB RENC: ' WS-FSEMP.
       FIN.                                                             
           CLOSE EMPFILE.                                               
     D     DISPLAY 'NBRE ENR AFFICHES: ' WS-ENR.                        
           STOP RUN.                                                    

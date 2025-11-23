       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG01CH01.                                            
       AUTHOR.     Emmanuel NGBAME.                                            
      * PROGRAMME D'AFFICHAGE (LE DISPLAY)                              
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
       SOURCE-COMPUTER. XXX-ZOS WITH DEBUGGING MODE.                    
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       WORKING-STORAGE SECTION.                                         
       01 NOTE-EXAM      PIC 9(2).                                      
       01 NOTE-STAGE     PIC 9(2).                                      
       01 NOTE-DISCI     PIC 9(2).                                      
       01 DECISION       PIC X(30).                                     
       PROCEDURE DIVISION.                                              
           PERFORM INIT.                                                
           PERFORM TEST-EVALUATE.                                       
           PERFORM FIN.                                                 
       INIT.                                                            
           MOVE 8             TO NOTE-EXAM.                             
           MOVE 16            TO NOTE-STAGE.                            
           MOVE 4             TO NOTE-DISCI.                            
       TEST-EVALUATE.                                                   
      D    DISPLAY 'JE SUIS BIEN DANS LE MODE DEBUGGING'.               
           EVALUATE NOTE-EXAM ALSO NOTE-STAGE ALSO NOTE-DISCI           
           WHEN 10 THRU 20 ALSO 10 THRU 20 ALSO 10 THRU 20              
               MOVE 'RECU' TO DECISION                                  
           WHEN  9 THRU 10 ALSO 12 THRU 20 ALSO 9 THRU 10               
               MOVE 'RATTRAPE PAR LE STAGE' TO DECISION                 
           WHEN 0  THRU 10 ALSO 14 THRU 20 ALSO 0 THRU 10               
               MOVE 'RATTRAPE PAR L''EXAM MAIS INDISCIPLINE' TO DECISION
           WHEN OTHER                                                   
               MOVE 'ELIMINE' TO DECISION                               
           END-EVALUATE.                                                
       FIN.                                                             
           DISPLAY DECISION.                                            
           STOP RUN.                                                    
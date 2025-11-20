       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG09CH05.                                            
       AUTHOR.     E NGBAME.                                            
      * PROGRAMME D'AFFICHAGE (LE DISPLAY)                              
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
       SOURCE-COMPUTER. XXX-ZOS WITH DEBUGGING MODE.                    
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       WORKING-STORAGE SECTION.                                         
       01 VAR1           PIC 9(2)   VALUE 0.                            
       01 VAR2           PIC 9(2)   VALUE 0.                            
       01 VAR3           PIC 9(2)   VALUE 0.                            
       PROCEDURE DIVISION.                                              
           PERFORM INIT.                                                
           PERFORM BOUCLE-VAR1 UNTIL VAR1 > 4.                          
           PERFORM FIN.                                                 
       INIT.                                                            
           DISPLAY 'LES BOUCLES C''EST RIGOLO.'.                        
       BOUCLE-VAR3.                                                     
           ADD 1 TO VAR3.                                               
           DISPLAY 'VAR1 = ' VAR1 ', VAR2= ' VAR2 ', VAR3 = ' VAR3.     
       BOUCLE-VAR2.                                                     
           DISPLAY '************  VAR2  ******************'.            
           ADD 1 TO VAR2.                                               
           MOVE 0 TO VAR3.                                              
           PERFORM BOUCLE-VAR3 UNTIL VAR3 > 4.                          
       BOUCLE-VAR1.                                                     
           DISPLAY '************  VAR1  ******************'.            
           ADD 1 TO VAR1.                                               
           MOVE 0 TO VAR2.                                              
           PERFORM BOUCLE-VAR2 UNTIL VAR2 > 4.                          
       FIN.                                                             
           STOP RUN.    
       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG02CH01.                                            
       AUTHOR.     Emmanuel NGBAME.                                             
      * PROGRAMME D'AFFICHAGE: - SEPARATEUR DU NOMBRE DECIMAL (. OU ,)  
      *                        - NOMBRES SIGNES                         
      *                                                                 
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
      *SPECIAL-NAMES.                                                   
      *    DECIMAL-POINT IS COMMA.                                      
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       WORKING-STORAGE SECTION.                                         
       01  NBDEC1        PIC 9(2)V9(2).                                 
       01  NBDEC2        PIC 9(2)V9(2) VALUE ZEROES.                    
       01  NBDEC3        PIC 9(2)V9(2).                                 
       01  NBR1          PIC S9(3).                                     
       01  NBR2          PIC S9(3).                                     
       01  NBDEC1-E      PIC Z9.9(2).                                   
       01  NBR-E1        PIC +Z9(2).                                    
       01  NBR-E2        PIC -Z9(2).                                    
       PROCEDURE DIVISION.                                              
           PERFORM INIT.                                                
           PERFORM TRAIT.                                               
           PERFORM FIN.                                                 
       INIT.                                                            
           MOVE  9.42 TO NBDEC1.                                        
           MOVE 25.0  TO NBDEC2.                                        
           MOVE 9.000 TO NBDEC3.                                        
           MOVE +71  TO NBR1.                                           
           MOVE -362  TO NBR2.                                          
       TRAIT.                                                           
      *    MOVE NBDEC1 TO NBDEC1-E.                                     
           DISPLAY 'LE NOMBRE DECIMAL 9.42: ' NBDEC1.                   
      *    MOVE NBDEC2 TO NBDEC1-E.                                     
           DISPLAY 'LE NOMBRE DECIMAL 25. : ' NBDEC2.                   
      *    MOVE NBDEC3 TO NBDEC1-E.                                     
           DISPLAY 'LE NOMBRE DECIMAL 9.000 : ' NBDEC3.                 
      *    MOVE NBR1   TO NBR-E1.                                       
           DISPLAY 'LE NOMBRE SIGNE (+)  +71  : ' NBR1.                 
      *    MOVE NBR2   TO NBR-E1.                                       
           DISPLAY 'LE NOMBRE SIGNE (+) -362  : ' NBR2.                 
      *    MOVE NBR1   TO NBR-E2.                                       
      *    DISPLAY 'LE NOMBRE SIGNE (-)  +71  : ' NBR-E2.               
      *    MOVE NBR2   TO NBR-E2.                                       
      *    DISPLAY 'LE NOMBRE SIGNE (-) -362  : ' NBR-E2.               
       FIN.                                                             
           STOP RUN.                                                    
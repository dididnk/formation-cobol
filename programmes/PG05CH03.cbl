       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG04CH01.                                                                                                                 
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
      *SOURCE-COMPUTER. XXX-ZOS WITH DEBUGGING MODE.                                                                                      
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       WORKING-STORAGE SECTION.                                         
       01  LIGNE-FICHIER.                                               
         05 MAT          PIC 9(2).                                      
         05 PERIOD       PIC 9(5).                                      
         05 ID-ELEVE     PIC 9(5).                                      
         05 DS1          PIC 9(2)V9(2).                                 
         05 DS2          PIC 9(2)V9(2).
         05 TEST1        PIC 9(2)V9(2).                                 
         05 TEST2        PIC 9(2)V9(2).                                 
         05 MOY-TRIM     PIC 9(2)V9(2).                                                                                                         
       77 LIGNE1 PIC X(32).                                             
       77 LIGNE2 PIC X(32).                                             
       01 WE-MOYENNE     PIC 9(2).9(2).                                                                                              
       PROCEDURE DIVISION.                                              
           PERFORM INIT.                                                
           PERFORM TRAIT.                                               
           PERFORM FIN.                                                 
       INIT.                                                            
           INITIALIZE LIGNE-FICHIER.                                    
           MOVE 'PS25261124631400180013001500' TO LIGNE1.               
           MOVE 'PS25261474891800150016001300' TO LIGNE2.
       TRAIT.                                                           
            MOVE LIGNE1 TO LIGNE-FICHIER.                               
            COMPUTE MOY-TRIM = ((DS1 + DS2) * 2 + TEST1 + TEST2) / 6.   
            MOVE MOY-TRIM TO WE-MOYENNE.                                
            DISPLAY "LA MOYENNE DE L'ELEVE " ID-ELEVE ' EST : '.        
            DISPLAY WE-MOYENNE.                                         
                                                                        
            MOVE LIGNE2 TO LIGNE-FICHIER.                               
            COMPUTE MOY-TRIM = ((DS1 + DS2) * 2 + TEST1 + TEST2) / 6.   
            MOVE MOY-TRIM TO WE-MOYENNE.                                
            DISPLAY "LA MOYENNE DE L'ELEVE " ID-ELEVE ' EST : '.        
            DISPLAY WE-MOYENNE.                                         
        FIN.                                                            
           STOP RUN.
       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG13CH10.                                            
      *PROG PRINCIPAL QUI APPEL UN SOUS PROG DE CALCUL DU SALAIRE ANNUEL
      *ON RENVOIE LE SALAIRE ANNUEL AU PROG PRINCIPAL ET ON DISPLAY     
      *VERSION + DURE : ON éCRIT LE SALAIRE ANNUEL DANS UN AUTRE/NEW PS 
                                                                        
       ENVIRONMENT DIVISION.                                            
       INPUT-OUTPUT SECTION.                                            
       FILE-CONTROL.                                                    
           SELECT EMPFILE ASSIGN TO "UT-S-EMPDD.dat"                         
           ORGANIZATION IS SEQUENTIAL                                   
           FILE STATUS IS WS-FSEMP.                                     
                                                                        
           SELECT SALFILE ASSIGN TO "UT-S-SALDD.dat"                          
           ORGANIZATION IS SEQUENTIAL                                   
           FILE STATUS IS WS-FSALFILE.                                  
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       FD EMPFILE.                                                      
       01 EMPREC.                                                       
         05 EMPID        PIC X(5).                                      
         05 FILLER       PIC X(2).                                      
         05 EMPNOM       PIC X(10).                                     
         05 FILLER       PIC X(2).                                      
         05 EMPVILLE     PIC X(10).                                     
         05 FILLER       PIC X(2).                                      
         05 EMPSAL       PIC 9(5).                                      
         05 FILLER       PIC X(44).                                     
       FD SALFILE.                                                      
       01 SALREC.                                                       
         05 SALID        PIC X(5).                                      
         05 FILLER       PIC X(2).                                      
         05 SALNOM       PIC X(10).                                     
         05 FILLER       PIC X(2).                                      
         05 SALVILLE     PIC X(10).                                     
         05 FILLER       PIC X(2).                                      
         05 SALMONTH     PIC 9(5).                                      
         05 FILLER       PIC X(2).                                      
         05 SALANN       PIC 9(10).                                     
         05 FILLER       PIC X(32).                                     
       WORKING-STORAGE SECTION.                                         
       01 WS-FSEMP       PIC X(2) VALUE ZERO.                           
       01 WS-EMPSAL      PIC 9(5).                                      
       01 WS-FSALFILE    PIC X(2) VALUE ZERO.                           
       01 WS-SALANN      PIC 9(10).                                     
       PROCEDURE DIVISION.                                              
           PERFORM INIT.                                                
      *    PERFORM LECTURE-CALCUL.                                      
      *    PERFORM MOVE-VALUE.                                          
      *    PERFORM ECRITURE UNTIL WS-FSALFILE NOT = '00'                
           PERFORM FIN.                                                 
       INIT.                                                            
           OPEN INPUT EMPFILE.                                          
           OPEN EXTEND SALFILE.                                         
           DISPLAY 'FILE STATUS PS EMPLOYES : ' WS-FSEMP.               
           DISPLAY 'FILE STATUS PS SALAIRES ANNUELS : ' WS-FSALFILE.    
                                                                        
           IF WS-FSEMP = '00' AND WS-FSALFILE = '00' THEN               
           PERFORM TRAITEMENT UNTIL WS-FSEMP NOT = '00'.                
       TRAITEMENT.                                                      
                READ EMPFILE                                            
                     NOT AT END DISPLAY 'CURRENT RECORD : ' EMPREC      
                          MOVE EMPSAL TO WS-EMPSAL                      
                          CALL 'YEARSAL' USING WS-EMPSAL, WS-SALANN     
                          DISPLAY 'SALAIRE ANNUEL : ' WS-SALANN         
                          PERFORM MOVE-VALUE                            
                          PERFORM ECRITURE                              
                END-READ.                                               
       MOVE-VALUE.                                                      
           MOVE EMPID TO SALID.                                         
           MOVE EMPNOM TO SALNOM.                                       
           MOVE EMPVILLE TO SALVILLE.                                   
           MOVE EMPSAL TO SALMONTH.                                     
           MOVE WS-SALANN TO SALANN.                                    
       ECRITURE.                                                        
           WRITE SALREC.                                                
           DISPLAY "FOLLOWING RECORD INSERTED : " SALREC.               
                                                                        
       FIN.                                                             
           CLOSE EMPFILE.                                               
           CLOSE SALFILE.                                               
           STOP RUN.                                                    
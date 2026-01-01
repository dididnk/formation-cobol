       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG02DB2.                                             
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.                                         
           EXEC SQL INCLUDE SQLCA END-EXEC.                             
           EXEC SQL INCLUDE EMPLOYEE END-EXEC.                          
       PROCEDURE DIVISION.                                              
       PROG-P.                                                          
           MOVE 7369 TO EMP-NUM.                                        
           EXEC SQL                                                     
            SELECT EMP_NOM,POSTE,SAL                                    
            INTO :EMP-NOM,:POSTE,:SAL                                   
            FROM EMPLOYEE                                               
            WHERE EMP_NUM=:EMP-NUM                                      
           END-EXEC.                                                    
           IF SQLCODE=0                                                 
              DISPLAY "NOM : " EMP-NOM                                  
              DISPLAY "POSTE : " POSTE                                  
              DISPLAY "SALAIRE : " SAL                                  
           ELSE                                                         
              DISPLAY "ERREUR SQLCODE : " SQLCODE                       
           END-IF.                                                      
           EXEC SQL                                                     
              COMMIT                                                    
           END-EXEC.                                                    
           DISPLAY "*** FIN DU PROGRAMME PG02DB2 ***".                  
           STOP RUN.                                                    
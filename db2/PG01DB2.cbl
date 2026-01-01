	       IDENTIFICATION DIVISION.                                         
	       PROGRAM-ID. PG01DB2.                                             
	       DATA DIVISION.                                                   
	       WORKING-STORAGE SECTION.                                         
	           EXEC SQL INCLUDE SQLCA END-EXEC.                             
	           EXEC SQL INCLUDE DEPT  END-EXEC.                             
	       PROCEDURE DIVISION.                                              
	       PROG-P.                                                          
	           MOVE 30 TO DEPT-NUM.                                         
	           EXEC SQL                                                     
	            SELECT DEPT_NUM,DEPT_NOM,LOC                                
	            INTO :DEPT-NUM,:DEPT-NOM,:LOC                               
	            FROM DEPT                                                   
	            WHERE DEPT_NUM=:DEPT-NUM                                    
	           END-EXEC.                                                    
	           IF SQLCODE=0                                                 
              DISPLAY "DEPARTEMENT TROUVE : " DEPT-NOM                  
           ELSE                                                         
              DISPLAY "ERREUR SQLCODE : " SQLCODE                       
           END-IF.                                                      
           EXEC SQL                                                     
              COMMIT                                                    
           END-EXEC.                                                    
           DISPLAY "*** FIN DU PROGRAMME PG01DB2 ***".                  
           STOP RUN.                                                    
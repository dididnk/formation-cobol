       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PROGTEST.                                            
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.                                         
       COPY MAPTEST.                                                    
       PROCEDURE DIVISION.                                              
       MAIN-PARA.                                                       
           EXEC CICS SEND MAP('MAP1')                                   
                MAPSET('MAPTEST')                                       
                MAPONLY                                                 
                ERASE                                                   
           END-EXEC.                                                    
           EXEC CICS                                                    
                RETURN                                                  
           END-EXEC.                                                    
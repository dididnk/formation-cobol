       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PROGNAME.                                            
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.                                         
       COPY MAPNAME.                                                    
       PROCEDURE DIVISION.                                              
       MAIN-PARA.                                                       
           EXEC CICS SEND MAP('MAP1')                                   
               MAPSET('MAPNAME') MAPONLY FREEKB ERASE                                                    
           END-EXEC.                                                    
           EXEC CICS  RECEIVE MAP('MAP1') 
           MAPSET('MAPNAME')                                                  
           END-EXEC.    
           STRING '***HELLO ' DELIMITED SIZE
                  NAMEINI      DELIMITED SPACE 
                  ' ***'      DELIMITED SIZE 
                  INTO NAMEOUTO
           END-STRING. 
           EXEC CICS SEND MAP('MAP1')  
               MAPSET('MAPNAME') DATAONLY FREEKB
           END-EXEC.
           EXEC CICS RETURN END-EXEC.
           GOBACK.                                             
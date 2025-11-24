       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG12CH07.                                            
      *PROGRAMME OUVERTURE ET LECTURE D'UN PS + ECRITURE DES RECORDS    
                                                                        
       ENVIRONMENT DIVISION.                                            
       INPUT-OUTPUT SECTION.                                            
       FILE-CONTROL.                                                    
           SELECT EMPFILE ASSIGN TO "FORM1011.FILES.SOURCESPS"                          
           ORGANIZATION IS SEQUENTIAL                                   
           FILE STATUS IS WS-FSEMP.                                     
                                                                        
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
                                                                        
       WORKING-STORAGE SECTION.                                         
       01 WS-FSEMP       PIC X(2) VALUE ZERO.                           
       PROCEDURE DIVISION.                                              
           OPEN INPUT EMPFILE.                                          
           PERFORM UNTIL WS-FSEMP NOT = '00'                            
                READ EMPFILE                                            
                     NOT AT END DISPLAY 'CURRENT RECORD : ' EMPREC      
                END-READ                                                
           END-PERFORM.                                                 
           CLOSE EMPFILE.                                               
                                                                        
           STOP RUN.                                                    
       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. YEARSAL.                                             
      *SOUS PROGRAMME APPELE PAR PG13CH10                               
      *CALCUL LE SALAIRE ANNUEL DES EMPLOYéS                            
                                                                        
       ENVIRONMENT DIVISION.                                            
                                                                        
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.                                         
       77 MONTH          PIC 9(2) VALUE 12.                             
       LINKAGE SECTION.                                                 
       01 LS-EMPSAL      PIC 9(5).                                      
       01 LS-SALANN      PIC 9(10).                                     
                                                                        
       PROCEDURE DIVISION USING LS-EMPSAL, LS-SALANN.                   
           MULTIPLY LS-EMPSAL BY MONTH GIVING LS-SALANN.                
                                                                        
           EXIT.                                                        
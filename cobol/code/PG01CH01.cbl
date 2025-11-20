       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG01CH01.                                            
       AUTHOR.     Emmanuel NGBAME.                                             
      * PROGRAMME D'AFFICHAGE (LE DISPLAY)                              
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
       SOURCE-COMPUTER. XXX-ZOS WITH DEBUGGING MODE.                    
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       WORKING-STORAGE SECTION.                                         
       01  WMESSAGE      PIC X(35).                                     
       01  WMESSAGE2     PIC X(35).                                     
       01  WMESSAGE3     PIC X(35).                                     
       01  WMESSAGE4     PIC X(99).                                     
       PROCEDURE DIVISION.                                              
           PERFORM INIT.                                                
           PERFORM TRAIT.                                               
           PERFORM FIN.                                                 
       INIT.                                                            
           MOVE 'BIENVENUE A LA FORMATION COBOL'   TO WMESSAGE.         
           MOVE 'ON VA S"INITIER AU LGGE COBOL'    TO WMESSAGE2.        
           MOVE 'ON S''AMELIORERA JOUR APRES JOUR'  TO WMESSAGE3.       
           MOVE 'AU 10EME JOUR DE LA FORMATION, NOUS SERONS DES PROGRAMM
      -    'EURS OPERATIONNELS' TO WMESSAGE4.                           
       TRAIT.                                                           
           DISPLAY 'JE SUIS BIEN DANS LE MODE DEBUGGING'.               
           DISPLAY 'LE MESSAGE1 : ' WMESSAGE.                           
           DISPLAY 'LE MESSAGE2 : ' WMESSAGE2.                          
           DISPLAY 'LE MESSAGE3 : ' WMESSAGE3.                          
           DISPLAY 'LE MESSAGE4 : ' WMESSAGE4.                          
       FIN.                                                             
           STOP RUN.                                                    

       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG11CH06.                                            
       AUTHOR.     E NGBAME.                                            
      * PROGRAMME D'AFFICHAGE (LE DISPLAY)                              
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
       SOURCE-COMPUTER. XXX-ZOS WITH DEBUGGING MODE.                    
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       WORKING-STORAGE SECTION.
       01 T-BUFFER.
           05 LG-BUFFER OCCURS 20.             
              10 ID-TAB           PIC X.
              10 ENR-BUF          PIC X(54).
       77 X                       PIC 9(2) VALUE 1. 
       77 Y                       PIC 9(2) VALUE 1.                        
       PROCEDURE DIVISION.                                              
           PERFORM INIT.                                                
           PERFORM CHARGER-TAB UNTIL X > 20.                         
           PERFORM FIN.                                                 
       INIT.
           DISPLAY "************ EXERCICE 1 DU CHAPITRE 6 ************".    
       CHARGER-TAB.    
           MOVE "A0000016AGENCE ASTRE                  000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "A0007222AGENCE PRISME                 000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "A0000140AGENCE ETOILE                 000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "A0000217AGENCE NOUVELLE GENERATION    000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "C00001MAVINGA KINAVIDI    HERITIER            0000217"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "C00321SERVETTAZ           MORGAN              0000217"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "C01210VAZ                 PIERRE              0000016"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "C72521POKAM               JOEL                0000016"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "R00321123456789012345678901232025043000000542357C0000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "R01210113456789012345678901232025043000000122309C0000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "M012102025050100000005623D000000000000000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "M012102025050200000075031D000000000000000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "M012102025050300000003215D000000000000000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "M012102025050400000008573D000000000000000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "M012102025051000000005623D000000000000000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "M012102025051100000004200D000000000000000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "M012102025052100000010562D000000000000000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "M012102025052200000005417D000000000000000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "M012102025052300000000601D000000000000000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X.
           MOVE "M012102025052900000275411C000000000000000000000000000"
              TO LG-BUFFER(X).
            ADD 1 TO X. 
           PERFORM AFFICHER-TAB UNTIL Y > 20.
       AFFICHER-TAB.
           DISPLAY LG-BUFFER(Y).
           ADD 1 TO Y.
       FIN.  
           DISPLAY "************ FIN PROGRAMME  ************".                                                           
           STOP RUN.    
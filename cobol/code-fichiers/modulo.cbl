       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG11CH06.                                            
       AUTHOR.     C ZANKOC.                                            
      * PROGRAMME D'AFFICHAGE (LE DISPLAY)                              
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
      *SOURCE-COMPUTER. XXX-ZOS WITH DEBUGGING MODE.                    
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       WORKING-STORAGE SECTION.                                         
       01 TABLE-BUFFER.                                                 
         05 LG-TAB OCCURS 20 TIMES.                                     
           10 CODE-ENR               PIC X.                               
           10 ENR                    PIC X(54).                         
           10 ENR-AGENCE REDEFINES ENR.                                 
             20 CODE-TAG       PIC 9(7).                                
             20 LIBELLE-TAG    PIC X(30).                               
             20 FILLER         PIC X(17).                               
           10 ENR-CLIENT REDEFINES ENR.                                 
             20 CODE-TCLT      PIC 9(7).                                
             20 NOM-TCLT       PIC X(20).                               
             20 PRENOM-TCLT    PIC X(20).                               
             20 CODEAG-TCLT    PIC 9(7).                                
           10 ENR-RIB    REDEFINES ENR.                                 
             20 CLT-TRIB       PIC 9(7).                                
             20 CPTE-TRIB      PIC X(23).                               
             20 DATE-TRIB      PIC 9(8).                                
             20 SOLDE-TRIB     PIC 9(9)V9(2).                           
             20 SENS-TRIB      PIC X.                                   
             20 FILLER         PIC X(4).                                
           10 ENR-TMVTC  REDEFINES ENR.                                 
             20 CLT-TMVTC      PIC 9(7).                                
             20 DATE-TMVTC     PIC 9(8).                                
             20 MONT-TMVTC     PIC 9(9)V9(2).                           
             20 SENS-TMVTC     PIC X.                                   
             20 FILLER         PIC X(27).                               
       01 CLIENT.                                                       
         05 LG-CLT OCCURS 4 TIMES.                                      
           10 CODE-TCLT-T      PIC 9(7).                                
           10 NOM-TCLT-T       PIC X(20).                               
           10 PRENOM-TCLT-T    PIC X(20).                               
           10 CODEAG-TCLT-T    PIC 9(7).                                
       01 AGENCE.                                                       
         05 LG-AG OCCURS 4 TIMES.                                       
           10 CODE-TAG-T       PIC 9(7).                                
           10 CODE-TEST  REDEFINES CODE-TAG-T.                          
             15 CODE6          PIC 9(6).                                
             15 CODE1          PIC 9(1).                                
           10 LIBELLE-TAG-T    PIC X(30).                               
       01 RIB.                                                          
         05 LG-RIB OCCURS 2 TIMES.                                      
           10 CLT-TRIB-T       PIC 9(7).                                
           10 CPTE-TRIB-T      PIC X(23).                               
           10 DATE-TRIB-T      PIC 9(8).                                
           10 SOLDE-TRIB-T     PIC 9(9)V9(2).                           
           10 SENS-TRIB-T      PIC X.                                   
       01 TMVTC.                                                        
         05 LG-TMVTC OCCURS 10 TIMES.                                   
           10 CLT-TMVTC-T      PIC 9(7).                                
           10 DATE-TMVTC-T     PIC 9(8).                                
           10 MONT-TMVTC-T     PIC 9(9)V9(2).                           
           10 SENS-TMVTC-T     PIC X.                                   
       01 WS-BUFFER        PIC 9(2).                                    
       01 WS-CLIENT        PIC 9(2).                                    
       01 WS-AGENCE        PIC 9(2).                                    
       01 WS-TMVTC         PIC 9(2).                                    
       01 WS-RIB           PIC 9(2).                                    
       01 TEST-CODE        PIC 9(1).                                    
       PROCEDURE DIVISION.                                              
           PERFORM INIT.                                                
           PERFORM ECRIRE-DONNEES.                                      
           PERFORM CHARGER-LIGNE-DONNEES UNTIL WS-BUFFER > 19.          
           PERFORM FIN.                                                 
       INIT.                                                            
           MOVE 0 TO WS-BUFFER.                                         
           MOVE 0 TO WS-CLIENT.                                         
           MOVE 0 TO WS-AGENCE.                                         
           MOVE 0 TO WS-RIB.                                            
           MOVE 0 TO WS-TMVTC.                                          
       ECRIRE-DONNEES.                                                  
           MOVE "A0000016AGENCE ASTRE                  000000000000000" 
            TO LG-TAB(1).                                               
           MOVE 'A0007222AGENCE PRISME                 000000000000000' 
            TO LG-TAB(2).                                               
           MOVE 'A0000140AGENCE ETOILE                 000000000000000' 
            TO LG-TAB(3).                                               
           MOVE 'A0000217AGENCE NOUVELLE GENERATION    000000000000000' 
            TO LG-TAB(4).                                               
           MOVE 'C00001MAVINGA KINAVIDI    HERITIER            0000217' 
            TO LG-TAB(5).                                               
           MOVE 'C00321SERVETTAZ           MORGAN              0000217' 
            TO LG-TAB(6).                                               
           MOVE 'C01210VZA                 PIERRE              0000016' 
            TO LG-TAB(7).                                               
           MOVE 'C72521POKAM               JOEL                0000016' 
            TO LG-TAB(8).                                               
           MOVE 'R00321123456789012345678901232025043000000542357C0000' 
            TO LG-TAB(9).                                               
           MOVE 'R01210113456789012345678901232025043000000122309C0000' 
            TO LG-TAB(10).                                              
           MOVE 'M012102025050100000005623D000000000000000000000000000' 
            TO LG-TAB(11).                                              
           MOVE 'M012102025050200000075031D000000000000000000000000000' 
            TO LG-TAB(12).                                              
           MOVE 'M012102025050300000003215D000000000000000000000000000' 
            TO LG-TAB(13).                                              
           MOVE 'M012102025050400000008573D000000000000000000000000000' 
            TO LG-TAB(14).                                              
           MOVE 'M012102025051000000005623D000000000000000000000000000' 
            TO LG-TAB(15).                                             
           MOVE 'M012102025051100000004200D000000000000000000000000000'
            TO LG-TAB(16).                                             
           MOVE 'M012102025052100000010562D000000000000000000000000000'
            TO LG-TAB(17).                                             
           MOVE 'M012102025052200000005417D000000000000000000000000000'
            TO LG-TAB(18).                                             
           MOVE 'M012102025052300000000601D000000000000000000000000000'
            TO LG-TAB(19).                                             
           MOVE 'M012102025052900000275411C000000000000000000000000000'
            TO LG-TAB(20).                                             
       LIRE-LIGNE-DONNEES-BRUTES.                                      
           ADD 1 TO WS-BUFFER.                                          
           DISPLAY LG-TAB(WS-BUFFER).                                   
       CHARGER-LIGNE-DONNEES.                                           
           ADD 1 TO WS-BUFFER.                                          
           EVALUATE CODE-ENR(WS-BUFFER)                                 
             WHEN 'A'                                                   
      D        DISPLAY 'AGENCE'                                         
               ADD 1 TO WS-AGENCE                                       
               MOVE ENR(WS-BUFFER) TO LG-AG(WS-AGENCE)                  
               COMPUTE TEST-CODE = 7 - FUNCTION MOD(CODE6(WS-AGENCE), 7)
      D            DISPLAY TEST-CODE  CODE1(WS-AGENCE)                  
               IF TEST-CODE NOT EQUAL TO CODE1(WS-AGENCE)               
                 THEN                                                   
      D            DISPLAY TEST-CODE  CODE1(WS-AGENCE)                  
                   SUBTRACT 1 FROM WS-AGENCE                            
               END-IF                                                   
             WHEN 'C'                                                   
      D        DISPLAY 'CLIENT'                                         
               ADD 1 TO WS-CLIENT                                       
               MOVE ENR(WS-BUFFER) TO LG-CLT(WS-CLIENT)                 
             WHEN 'M'                                                   
      D        DISPLAY 'TMVTC'                                          
               ADD 1 TO WS-TMVTC                                        
               MOVE ENR(WS-BUFFER) TO LG-TMVTC(WS-TMVTC)                
             WHEN 'R'                                                   
      D        DISPLAY 'RIB'                                            
               ADD 1 TO WS-RIB                                          
               MOVE ENR(WS-BUFFER) TO LG-RIB(WS-RIB)                    
           END-EVALUATE.                                                
       FIN.                                                             
           DISPLAY '*************** CLIENT ************'                
           DISPLAY CLIENT.                                              
           DISPLAY '***********************************'                
           DISPLAY '*************** AGENCE ************'                
           DISPLAY AGENCE.                                              
           DISPLAY '***********************************'                
           DISPLAY '***************  MVTC  ************'                
           DISPLAY TMVTC.                                               
           DISPLAY '***********************************'                
           DISPLAY '***************   RIB  ************'                
           DISPLAY RIB.                                                 
           DISPLAY '***********************************'                
           DISPLAY LG-AG(1).                                            
           DISPLAY CODE-TAG-T(1).                                       
           DISPLAY LIBELLE-TAG-T(1).                                    
           STOP RUN.     
       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG12CH06.                                            
       AUTHOR.     E NGBAME.                                            
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
       SOURCE-COMPUTER. XXX-ZOS WITH DEBUGGING MODE.                    
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.
      * Mes tableaux
       01 T-AGENCE.
           05 TAG OCCURS 4 TIMES.             
              10 CODE-TAG             PIC 9(7).
              10 LIBELLE-TAG          PIC X(30).

       01 T-CLIENT.
           05 TCLT OCCURS 4 TIMES.             
              10 CODE-TCLT            PIC 9(7).
              10 NOM-TCLT             PIC X(20).
              10 PRENOM-TCLT          PIC X(20).
              10 CODEAG-TCLT          PIC 9(7).
       
       01 T-RIB.
           05 TRIB OCCURS 2 TIMES.             
              10 CLT-TRIB             PIC 9(7).
              10 CPTE-TRIB            PIC X(23).
              10 DATE-TRIB            PIC 9(8).
              10 SOLDE-TRIB           PIC 9(9)V9(2).
              10 SENS-TRIB            PIC X.      

       01 T-MVTC.
           05 TMVTC OCCURS 10 TIMES.             
              10 CLT-TMVTC            PIC 9(7).
              10 DATE-TMVTC           PIC 9(8).
              10 MONT-TMVTC           PIC 9(9)V9(2). 
              10 SENS-TMVTC           PIC X.
      
      * Définition de mon buffer 
       01 BUFFER.
           05 LG-BUFFER OCCURS 20 TIMES.
              10 T-ENR                PIC X.
              10 ENR                  PIC X(54).

      * Mes variables temporaires
       01 CPT                         PIC 9(2) VALUE 1. 
       01 IDX                         PIC 9(2) VALUE 1. 

       77 CPT-AG                      PIC 9(1) VALUE 1.
       77 CPT-CL                      PIC 9(1) VALUE 1.
       77 CPT-RB                      PIC 9(1) VALUE 1. 
       77 CPT-MV                      PIC 9(1) VALUE 1.

       PROCEDURE DIVISION.                                              
           PERFORM INIT.
           PERFORM CHARGER-BUFFER.
           PERFORM RANGER-DATA UNTIL CPT > 20.                                               
           PERFORM AFFICHER-DATA.                                                
           PERFORM FIN.                                                 

       INIT.
           DISPLAY "*********** EXERCICE 12 DU CHAP 6 ***********". 

       CHARGER-BUFFER.
      * On charge le buffer directement sans boucle
           MOVE "A0000016AGENCE ASTRE                  00000000000000"
            TO LG-BUFFER(1).
           MOVE "A0007222AGENCE PRISME                 00000000000000"
            TO LG-BUFFER(2).
           MOVE "A0000140AGENCE ETOILE                 00000000000000"
            TO LG-BUFFER(3).
           MOVE "A0000217AGENCE NOUVELLE GENERATION    00000000000000"
            TO LG-BUFFER(4).
      
           MOVE "C00001MAVINGA KINAVIDI    HERITIER            0000217"
            TO LG-BUFFER(5).
           MOVE "C00321SERVETTAZ           MORGAN              0000217"
            TO LG-BUFFER(6).
           MOVE "C01210VAZ                 PIERRE              0000016"
            TO LG-BUFFER(7).
           MOVE "C72521POKAM               JOEL                0000016"
            TO LG-BUFFER(8).
      
           MOVE "R00321123456789012345678901232025043000000542357C0000"
            TO LG-BUFFER(9).
           MOVE "R01210113456789012345678901232025043000000122309C0000"
            TO LG-BUFFER(10).
      
           MOVE "M012102025050100000005623D000000000000000000000000000"
            TO LG-BUFFER(11).
           MOVE "M012102025050200000075031D000000000000000000000000000"
            TO LG-BUFFER(12).
           MOVE "M012102025050300000003215D000000000000000000000000000"
            TO LG-BUFFER(13).
           MOVE "M012102025050400000008573D000000000000000000000000000"
            TO LG-BUFFER(14).
           MOVE "M012102025051000000005623D000000000000000000000000000"
            TO LG-BUFFER(15).
           MOVE "M012102025051100000004200D000000000000000000000000000"
            TO LG-BUFFER(16).
           MOVE "M012102025052100000010562D000000000000000000000000000"
            TO LG-BUFFER(17).
           MOVE "M012102025052200000005417D000000000000000000000000000"
            TO LG-BUFFER(18).
           MOVE "M012102025052300000000601D000000000000000000000000000"
            TO LG-BUFFER(19).
           MOVE "M012102025052900000275411C000000000000000000000000000"
            TO LG-BUFFER(20).

       RANGER-DATA.
      * ICI on range les datas dans les tab appropriés
           EVALUATE T-ENR(CPT)
               WHEN 'A'
                   IF CPT-AG <= 4
                       MOVE ENR(CPT)(1:7)    TO CODE-TAG(CPT-AG)
                       MOVE ENR(CPT)(8:30)   TO LIBELLE-TAG(CPT-AG)
                       ADD 1 TO CPT-AG
                   END-IF
               WHEN 'C'
                   IF CPT-CL <= 4
                       MOVE ENR(CPT)(1:7)    TO CODE-TCLT(CPT-CL)
                       MOVE ENR(CPT)(8:20)   TO NOM-TCLT(CPT-CL)
                       MOVE ENR(CPT)(28:20)  TO PRENOM-TCLT(CPT-CL)
                       MOVE ENR(CPT)(48:7)   TO CODEAG-TCLT(CPT-CL)
                       ADD 1 TO CPT-CL
                   END-IF
               WHEN 'R'
                   IF CPT-RB <= 2
                       MOVE ENR(CPT)(1:7)    TO CLT-TRIB(CPT-RB)
                       MOVE ENR(CPT)(8:23)   TO CPTE-TRIB(CPT-RB)
                       MOVE ENR(CPT)(31:8)   TO DATE-TRIB(CPT-RB)
                       MOVE ENR(CPT)(39:11)  TO SOLDE-TRIB(CPT-RB)
                       MOVE ENR(CPT)(50:1)   TO SENS-TRIB(CPT-RB)
                       ADD 1 TO CPT-RB
                   END-IF
               WHEN 'M'
                   IF CPT-MV <= 10
                       MOVE ENR(CPT)(1:7)    TO CLT-TMVTC(CPT-MV)
                       MOVE ENR(CPT)(8:8)    TO DATE-TMVTC(CPT-MV)
                       MOVE ENR(CPT)(16:10)  TO MONT-TMVTC(CPT-MV)
                       MOVE ENR(CPT)(26:1)   TO SENS-TMVTC(CPT-MV)
                       ADD 1 TO CPT-MV
                   END-IF
           END-EVALUATE.
           ADD 1 TO CPT.

       AFFICHER-DATA.
           DISPLAY "=== AFFICHAGE DES AGENCES ===".
           MOVE 1 TO IDX.
           PERFORM UNTIL IDX > 4
              DISPLAY "Agence " IDX ": " 
                      CODE-TAG(IDX) " - " 
                      LIBELLE-TAG(IDX)
              ADD 1 TO IDX
           END-PERFORM.

       FIN.  
           DISPLAY "************ FIN PROGRAMME  ************".                                                           
           STOP RUN.
       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. PG01CH04.                                            
      *PROGRAMME CALCUL FACTURE                                         
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
      *SOURCE-COMPUTER. XXX-ZOS WITH DEBUGGING MODE.                    
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       WORKING-STORAGE SECTION.                                         
       01  ARTICLES.                                                    
         05 ARTICLE-1.                                                  
           10 ART1       PIC 9V9(2) VALUE 3.75.                         
           10 WE-ART1    PIC $9.9(2).                                   
           10 ART1-HT    PIC 9V9(2).                                    
           10 WE-ART1-HT PIC $9.9(2).                                   
         05 ARTICLE-2.                                                  
           10 ART2       PIC 9V9(2) VALUE 2.15.                         
           10 WE-ART2    PIC $9.9(2).                                   
           10 ART2-HT    PIC 9V9(2).                                    
           10 WE-ART2-HT PIC $9.9(2).                                   
       01 TOTAUX.                                                       
         05 TOTAL-HT     PIC 9(3)V9(2).                                 
         05 WE-TOTAL-HT  PIC $9(3).9(2).                                
         05 TOTAL-AT     PIC 9(3)V9(2).                                 
         05 WE-TOTAL-AT  PIC $9(3).9(2).                                
                                                                        
       PROCEDURE DIVISION.                                              
           PERFORM PRIX-HT.                                             
           PERFORM TOTAUX-FACTURES.                                     
           PERFORM AFFICHAGE.                                           
           PERFORM FIN.                                                 
                                                                        
       PRIX-HT.                                                         
      * ON UTILISE LA TVA 20% COMME VALEUR POUR LA TAXE DANS CET EXO    
           COMPUTE ART1-HT = ART1 * 0.8.                                
           MOVE ART1-HT TO WE-ART1-HT.                                  
           COMPUTE ART2-HT = ART2 * 0.8.                                
           MOVE ART2-HT TO WE-ART2-HT.                                  
                                                                        
       TOTAUX-FACTURES.                                                 
           COMPUTE TOTAL-HT = ((ART1-HT * 100) * ( 1 - (5 / 100))) +    
      -    ((ART2-HT * 10) * ( 1 - (15 / 100))).                        
                                                                        
           COMPUTE TOTAL-AT = ((ART1 * 100) * (1 - (15 / 100))) +       
      -    ((ART2 * 10) * (1 - (15 / 100))).                            
       AFFICHAGE.                                                       
           DISPLAY 'PRIX ARTICLE 1 HORS TAXE : ' WE-ART1-HT.            
           DISPLAY 'PRIX ARTICLE 2 HORS TAXE : ' WE-ART2-HT.            
           MOVE TOTAL-HT TO WE-TOTAL-HT.                                
           DISPLAY 'MONTANT DE LA FACTURE HORS TAXE : ' WE-TOTAL-HT.    
           MOVE ART1 TO WE-ART1.                                        
           MOVE ART2 TO WE-ART2.                                        
           DISPLAY 'PRIX ARTICLE 1 AVEC TAXE : ' WE-ART1.               
           DISPLAY 'PRIX ARTICLE 2 AVEC TAXE : ' WE-ART2.               
           MOVE TOTAL-AT TO WE-TOTAL-AT.                                
           DISPLAY 'MONTANT DE LA FACTURE AVEC TAXE : ' WE-TOTAL-AT.    
                                                                        
       FIN.                                                             
           STOP RUN.                                                                                                                                                                                          
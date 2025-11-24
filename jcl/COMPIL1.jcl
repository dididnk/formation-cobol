//COMPIL1  JOB COMPIL1,'COMPIL1',MSGLEVEL=(1,1),REGION=4M,              
//           MSGCLASS=A,CLASS=A,NOTIFY=&SYSUID                          
//*-----------------------------------------------------------          
//*       JCL DE COMPILATION & EDITION DE LIEN PROGRAMME                
//*-----------------------------------------------------------          
//COMPIL1  EXEC IGYWCL                                                  
//COBOL.SYSIN  DD DSN=FORM1011.FILES.EMP(PG17CH12),DISP=SHR             
//LKED.SYSLMOD DD DSN=FORM1011.COBOL.LOAD(PG17CH12),DISP=SHR            
//*--- DEFINITION DU FICHIER DE SORTIE ---                              
//DDPRINT   DD  SYSOUT=A                                                
/*                                                                      
//                                                                      
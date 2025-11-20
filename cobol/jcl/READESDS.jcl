//READESDS JOB (PRINT),'PRINT ESDS',CLASS=A,MSGCLASS=X,       
//         MSGLEVEL=(1,1),NOTIFY=&SYSUID                      
//*===============================================*           
//*        AFFICHE LE CONTENU DE L'ESDS           *           
//*===============================================*           
//STEP1 EXEC PGM=IDCAMS                                       
//SYSPRINT DD SYSOUT=*                                        
//SYSIN    DD *                                               
  PRINT INDATASET(FORM1011.FILES.EMP.ESDS) CHARACTER          
/*                                                            
//                                                            
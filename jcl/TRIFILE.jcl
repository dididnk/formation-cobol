//JB18CH11 JOB JB18CH11,'JB18CH11',MSGLEVEL=(1,1),REGION=4M,            
//           MSGCLASS=A,CLASS=A,NOTIFY=&SYSUID                          
//*----------------------------------------------------------------*    
//* JCL DE COMPILATION POUR UN PROGRAMME DE TRI AVEC SORT          *    
//*----------------------------------------------------------------*    
//JOBLIB   DD DSN=FORM1011.COBOL.LOAD,DISP=SHR                          
//COMPIL   EXEC PGM=PG16CH11                                            
//FINPUT   DD DSN=FORM1011.FILES.EMP.PS,DISP=SHR                       
//FOUTPUT  DD DSN=FORM1011.FILES.EMP.TR,DISP=(NEW,CATLG,DELETE),       
//            UNIT=3390,SPACE=(TRK,(4,1),RLSE),                         
//            DCB=(LRECL=80,BLKSIZE=800,RECFM=FB)                       
//FWORK    DD DSN=FORM1011.FILES.EMP.WK,DISP=(NEW,DELETE,DELETE),      
//            UNIT=3390,SPACE=(TRK,(4,1),RLSE),                         
//            DCB=(LRECL=80,BLKSIZE=800,RECFM=FB)                       
//SYSOUT   DD SYSOUT=*                                                  
//SYSPRINT DD SYSOUT=C     
/*                                                                      
//  
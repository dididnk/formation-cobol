//JB13CH07 JOB JB13CH07,'JB13CH07',MSGLEVEL=(1,1),REGION=4M,         
//           MSGCLASS=A,CLASS=A,NOTIFY=&SYSUID                       
//*---------------------------------------------                     
//*EXECUTION PROGRAMME PG13CH07                                      
//*---------------------------------------------                     
//ETAPEXE      EXEC PGM=PG12CH07                                     
//EMPDD        DD DSN=FORM1011.FILES.EMP.PS,DISP=SHR                 
//STEPLIB      DD DSN=FORM1011.COBOL.LOAD(PG12CH07),DISP=SHR         
//SYSPRINT     DD SYSOUT=*                                           
/*                                                                   
//                                                                   
                                                                     
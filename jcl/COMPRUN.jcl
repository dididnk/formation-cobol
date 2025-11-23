//COMPRUN  JOB (COMPRUN),'COMPIL COBOL',
//           MSGLEVEL=(1,1),REGION=8M,MSGCLASS=A,
//           CLASS=A,NOTIFY=&SYSUID
//*-------------------------------------------------------------------
//* JCL D'EXECUTION DU PROGRAMME 
//*-------------------------------------------------------------------
//STEPTEST EXEC PGM=PG15CH10
//STEPLIB  DD DSN=FORM1011.COBOL.LOAD,DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//
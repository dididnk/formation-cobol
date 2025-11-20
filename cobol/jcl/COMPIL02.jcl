//COMPIL2  JOB (COMPIL2),'COMPIL COBOL',
//           MSGLEVEL=(1,1),REGION=8M,MSGCLASS=A,
//           CLASS=A,NOTIFY=&SYSUID
//*-------------------------------------------------------------------
//* JCL D'EXECUTION DU PROGRAMME PG01CH01
//*-------------------------------------------------------------------
//STEPTEST EXEC PGM=PG01CH01
//STEPLIB  DD DSN=FORM1011.COBOL.LOAD,DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//
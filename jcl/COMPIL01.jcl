//COMPIL1  JOB (COMPIL1),'COMPIL COBOL',
//           MSGLEVEL=(1,1),REGION=8M,MSGCLASS=A,
//           CLASS=A,NOTIFY=&SYSUID
//*-------------------------------------------------------------------
//* JCL DE COMPILATION & EDITION DE LIEN PROGRAMME PG01CH01
//*-------------------------------------------------------------------
//COMPIL1  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=FORM1011.COBOL.SOURCES(PG01CH01),DISP=SHR
//LKED.SYSLMOD DD DSN=FORM1011.COBOL.LOAD(PG01CH01),DISP=OLD
/*
//
//EFILEPH JOB (EFILEPH),'EFILEPH CLIENT',MSGLEVEL=(1,1),
//         MSGCLASS=C,CLASS=A,PRTY=4,NOTIFY=&SYSUID
//*===================================================*
//*   CREATION DU PATH POUR L'AIX CLIENT
//*===================================================*
//STEPPATH EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
   DEFINE PATH (NAME(FORM1011.FILES.CLIENT.PATH) -
                PATHENTRY(FORM1011.FILES.CLIENT.AIX))
/*

//EFILEDB JOB (EFILEDB),'EFILEDB CLIENT',MSGLEVEL=(1,1),
//         MSGCLASS=C,CLASS=A,PRTY=4,NOTIFY=&SYSUID
//*===================================================*
//*   CREATION DU KSDS CLIENT BUILD
//*===================================================*
//STEPBUILD EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
   DEFINE CLUSTER (NAME(FORM1011.FILES.CLIENT.BUILD) -
                   INDEXED -
                   VOLUMES(FDDBAS) -
                   TRACKS(1 1) -
                   KEYS(7 0) -
                   RECORDSIZE(80 80) -
                   CISZ(4096) -
                   NOREUSE) -
         DATA (NAME(FORM1011.FILES.CLIENT.BUILD.DATA)) -
         INDEX(NAME(FORM1011.FILES.CLIENT.BUILD.INDEX))
/*

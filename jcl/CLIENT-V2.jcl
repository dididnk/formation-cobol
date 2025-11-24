//EFILEKS JOB (EFILEKS),'EFILEKS CLIENT',MSGLEVEL=(1,1),
//         MSGCLASS=C,CLASS=A,PRTY=4,NOTIFY=&SYSUID
//*===================================================*
//*   CREATION DU KSDS CLIENT + AIX + PATH + BUILD
//*===================================================*

/* ===================== DELETE EXISTANTS ===================== */
//DELKSDS EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
   DELETE FORM1011.FILES.CLIENT.KSDS CLUSTER PURGE
   DELETE FORM1011.FILES.CLIENT.AIX CLUSTER PURGE
   DELETE FORM1011.FILES.CLIENT.PATH CLUSTER PURGE
   DELETE FORM1011.FILES.CLIENT.BUILD CLUSTER PURGE
/*

/* ===================== CREATE KSDS ===================== */
//STEPDEF EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
   DEFINE CLUSTER (NAME(FORM1011.FILES.CLIENT.KSDS) -
                   INDEXED -
                   VOLUMES(FDDBAS) -
                   TRACKS(1 1) -
                   KEYS(8 0) -
                   RECORDSIZE(80 80) -
                   CISZ(4096) -
                   NOREUSE) -
         DATA (NAME(FORM1011.FILES.CLIENT.KSDS.DATA)) -
         INDEX(NAME(FORM1011.FILES.CLIENT.KSDS.INDEX))
/*

/* ===================== CREATE AIX ===================== */
//STEPAIX EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
   DEFINE CLUSTER (NAME(FORM1011.FILES.CLIENT.AIX) -
                   INDEXED -
                   VOLUMES(FDDBAS) -
                   TRACKS(1 1) -
                   KEYS(10 0) -
                   RECORDSIZE(100 100) -
                   CISZ(4096) -
                   NOREUSE) -
         DATA (NAME(FORM1011.FILES.CLIENT.AIX.DATA)) -
         INDEX(NAME(FORM1011.FILES.CLIENT.AIX.INDEX))
/*

/* ===================== CREATE PATH ===================== */
//STEPPATH EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
   DEFINE CLUSTER (NAME(FORM1011.FILES.CLIENT.PATH) -
                   INDEXED -
                   VOLUMES(FDDBAS) -
                   TRACKS(1 1) -
                   KEYS(12 0) -
                   RECORDSIZE(120 120) -
                   CISZ(4096) -
                   NOREUSE) -
         DATA (NAME(FORM1011.FILES.CLIENT.PATH.DATA)) -
         INDEX(NAME(FORM1011.FILES.CLIENT.PATH.INDEX))
/*

/* ===================== CREATE BUILD ===================== */
//STEPBUILD EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
   DEFINE CLUSTER (NAME(FORM1011.FILES.CLIENT.BUILD) -
                   INDEXED -
                   VOLUMES(FDDBAS) -
                   TRACKS(1 1) -
                   KEYS(8 0) -
                   RECORDSIZE(80 80) -
                   CISZ(4096) -
                   NOREUSE) -
         DATA (NAME(FORM1011.FILES.CLIENT.BUILD.DATA)) -
         INDEX(NAME(FORM1011.FILES.CLIENT.BUILD.INDEX))
/*

/* ===================== LOAD DONNEES KSDS ===================== */
//STEPLOAD EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//ENTDATA DD *
A0000016AGENCE ASTRE                  000000000000000
A0007222AGENCE PRISME                 000000000000000
A0000140AGENCE ETOILE                 000000000000000
A0000217AGENCE NOUVELLE GENERATION    000000000000000
/*
//SYSIN DD *
   REPRO INFILE(ENTDATA) OUTDATASET(FORM1011.FILES.CLIENT.KSDS)
/*
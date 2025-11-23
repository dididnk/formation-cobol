//FILEPS JOB (FILEPS),'FILEPS',MSGLEVEL=(1,1),
//         MSGCLASS=C,CLASS=A,PRTY=4,NOTIFY=&SYSUID
//*------------------------------------------------------------------*
//*     CREATION DU PS (SUPPRESSION SI EXISTANT + RECREATION)       *
//*------------------------------------------------------------------*
//CRTPS    EXEC PGM=IEFBR14
//DD1      DD  DSN=FORM1011.FILES.EMP.PS,
//             DISP=(MOD,DELETE,CATLG),
//             UNIT=SYSDA,
//             SPACE=(TRK,(1,1)),
//             DCB=(RECFM=FB,LRECL=80,BLKSIZE=800)
//*------------------------------------------------------------------*
//*     3. CHARGEMENT AVEC IEBGENER (DATA INSTREAM)                  *
//*------------------------------------------------------------------*
//LOADPS   EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSIN    DD DUMMY
//SYSUT1   DD *
00001  COLUCCI     PARIS       00000
00002  DELANOE     PARIS       05500
00003  GOLDMAN     PARIS       15500
00004  HIDALGO     PARIS       12300
00005  CURIE       PARIS       00000
00006  PAGNOL      MARSEILLE   12000
00007  BEJART      MARSEILLE   09500
00008  TAPIE       MARSEILLE   00000
00009  CISSE       MARSEILLE   04325
00010  MASSALIA    MARSEILLE   00000
00011  ABIDAL      LYON        06750
00012  RENARD      LYON        08250
00013  BRAZIER     LYON        04500
00014  FRAY        LYON        02300
00015  MAGNIN      LYON        19000
00016  BENGUIGUI   LILLE       04090
00017  DE GAULLE   LILLE       00000
00018  HAMIDOU     LILLE       75000
00019  FOURATI     LILLE       11000
00020  DEGROOT     LILLE       14500
/*
//SYSUT2   DD DSN=FORM1011.FILES.EMP.PS,DISP=SHR
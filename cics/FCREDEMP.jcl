//FCREDEMP JOB (FCREDEMP),'FCREDEMP',MSGLEVEL=(1,1),                       
//         MSGCLASS=C,CLASS=A,PRTY=4,NOTIFY=&SYSUID                     
//*------------------------------------------------------------------*
//*   ETAPE 1 : JCL DE DEFINITION DE VSAM ESDS CLUSTER               *
//*------------------------------------------------------------------*  
//ETAPE3 EXEC PGM=IDCAMS                                                
//SYSPRINT DD SYSOUT=*                                                  
//SYSIN DD *   
     DELETE FTEST.CICS.CREDEMP.KSDS PURGE
     IF LASTCC<= 8 THEN                                                  
          SET MAXCC=0 
     DEFINE CLUSTER (NAME(FTEST.CICS.CREDEMP.KSDS) -
                    INDEXED                       -
                    VOL(FDDBAS)                   -
                    TRACKS(1 1)                   -
                    KEYS(3 0)                     -
                    RECORDSIZE(80 80)             -
                    CISZ(4096)                    -
                    NOREUSE)                      -
           DATA (NAME(FTEST.CICS.CREDEMP.KASDS.DATA)) -
           INDEX(NAME(FTEST.CICS.CREDEMP.KASDS.INDEX))
/*
//*------------------------------------------------------------------*
//*           ETAPE 2 : REMPLI LES DATAS DANS MON KSDS               *
//*------------------------------------------------------------------*                       
//ETAPE4   EXEC PGM=IDCAMS                                              
//SYSPRINT DD   SYSOUT=*                                                
//INPUT    DD   *
001Abonnnement SNCF000000008000000500000000000008
002Achat GTA6 Ultra000000010000000001250000004520
003Cours Udemy JAVA000000005000075385000000000145
004Licence Prof MMA000000050012355582000001234455                                       
/*                    
//OUTPUT   DD   DSN=FTEST.CICS.CREDEMP.KSDS,DISP=SHR                     
//SYSIN DD *                                                            
      REPRO  -                                                          
           INFILE(INPUT) -                                              
           OUTFILE(OUTPUT)                                              
/* 
//*------------------------------------------------------------------*
//*               ETAPE 3 : PRINT VSAM FILE                          *
//*------------------------------------------------------------------*                                                                                              
//ETAPE5 EXEC PGM=IDCAMS                                                
//SYSPRINT DD SYSOUT=*                                                  
//SYSOUT   DD SYSOUT=*                                                  
//INDD  DD DSN=FTEST.CICS.CREDEMP.KSDS,DISP=SHR                          
//SYSIN DD *                                                            
     PRINT -                                                            
     INFILE(INDD) -                                                     
     CHAR                                                               
/*                                                                      
//
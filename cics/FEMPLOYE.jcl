//FEMPLOYE JOB (FEMPLOYE),'FEMPLOYE',MSGLEVEL=(1,1),                       
//         MSGCLASS=C,CLASS=A,PRTY=4,NOTIFY=&SYSUID                     
//*------------------------------------------------------------------*
//*   ETAPE 1 : JCL DE DEFINITION DE VSAM ESDS CLUSTER               *
//*------------------------------------------------------------------*  
//ETAPE3 EXEC PGM=IDCAMS                                                
//SYSPRINT DD SYSOUT=*                                                  
//SYSIN DD *   
     DELETE FTEST.CICS.EMPLOYE.KSDS PURGE
     IF LASTCC<= 8 THEN                                                  
          SET MAXCC=0 
     DEFINE CLUSTER (NAME(FTEST.CICS.EMPLOYE.KSDS) -
                    INDEXED                       -
                    VOL(FDDBAS)                   -
                    TRACKS(1 1)                   -
                    KEYS(3 0)                     -
                    RECORDSIZE(80 80)             -
                    CISZ(4096)                    -
                    NOREUSE)                      -
           DATA (NAME(FTEST.CICS.EMPLOYE.KASDS.DATA)) -
           INDEX(NAME(FTEST.CICS.EMPLOYE.KASDS.INDEX))
/*
//*------------------------------------------------------------------*
//*           ETAPE 2 : REMPLI LES DATAS DANS MON KSDS               *
//*------------------------------------------------------------------*                       
//ETAPE4   EXEC PGM=IDCAMS                                              
//SYSPRINT DD   SYSOUT=*                                                
//INPUT    DD   *
001RONALDINHO671000000000N
002LEO MESSI 921234567890N
003RONALDO JR949876543210N
004NGBAME DJO910000050000N                                        
/*                    
//OUTPUT   DD   DSN=FTEST.CICS.EMPLOYE.KSDS,DISP=SHR                     
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
//INDD  DD DSN=FTEST.CICS.EMPLOYE.KSDS,DISP=SHR                          
//SYSIN DD *                                                            
     PRINT -                                                            
     INFILE(INDD) -                                                     
     CHAR                                                               
/*                                                                      
//
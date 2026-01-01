//FILEKSDS JOB (FILEKSDS),'FILEKSDS',MSGLEVEL=(1,1),                       
//         MSGCLASS=C,CLASS=A,PRTY=4,NOTIFY=&SYSUID                     
//*------------------------------------------------------------------*
//*   ETAPE 1 : JCL DE DEFINITION DE VSAM ESDS CLUSTER               *
//*------------------------------------------------------------------*  
//ETAPE3 EXEC PGM=IDCAMS                                                
//SYSPRINT DD SYSOUT=*                                                  
//SYSIN DD *   
     DELETE FTEST.CLIENT.KSDS PURGE
     IF LASTCC<= 8 THEN                                                  
          SET MAXCC=0 
     DEFINE CLUSTER (NAME(FTEST.CLIENT.KSDS) -
                    INDEXED                       -
                    VOL(FDDBAS)                   -
                    TRACKS(1 1)                   -
                    KEYS(3 0)                     -
                    RECORDSIZE(80 80)             -
                    CISZ(4096)                    -
                    NOREUSE)                      -
           DATA (NAME(FTEST.CLIENT.KASDS.DATA)) -
           INDEX(NAME(FTEST.CLIENT.KASDS.INDEX))
/*
//*------------------------------------------------------------------*
//*           ETAPE 2 : REMPLI LES DATAS DANS MON KSDS               *
//*------------------------------------------------------------------*                       
//ETAPE4   EXEC PGM=IDCAMS                                              
//SYSPRINT DD   SYSOUT=*                                                
//INPUT    DD   *
0010101Fernandez Anne Juli 19900101F0111 De Gaule0000012345FR                   
0020202Fernandez Kari Jobe 19851212F28N2 De Gaule0009876543BE                   
0030303Day-Lewis Nico Ange 20020120M22O3 De Gaule0001122334CM                   
0040404Hernandez Djo Santi 19990715M31N4 De Gaule0005566778CI                   
0050505Hernandez Bill Gate 19830303M27O5 De Gaule0009988776FR                                              
/*                    
//OUTPUT   DD   DSN=FTEST.CLIENT.KSDS,DISP=SHR                     
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
//INDD  DD DSN=FTEST.CLIENT.KSDS,DISP=SHR                          
//SYSIN DD *                                                            
     PRINT -                                                            
     INFILE(INDD) -                                                     
     CHAR                                                               
/*                                                                      
//
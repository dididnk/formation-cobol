//JB13CH08  JOB (JB13CH08),'JB13CH08',MSGLEVEL=(1,1),                   
//          MSGCLASS=A,CLASS=A,NOTIFY=&SYSUID                           
//*=====================================================================
//*                 DEL/DEFINITION D'UN ESDS                            
//*=====================================================================
//STEP01   EXEC PGM=IDCAMS                                              
//SYSPRINT DD  SYSOUT=*                                                 
//SYSIN    DD  *                                                        
    DELETE FORM1011.BUFFER.ESDS PURGE                                   
    DEFINE CLUSTER (NAME(FORM1011.BUFFER.ESDS)    -                     
                    TRACKS ( 1 1 )                -                     
                    VOL    (FDDBAS)               -                     
                    CISZ   (4096)                 -                     
                    RECORDSIZE (80   80)           -                    
                    SHAREOPTIONS (1  3)           -                     
                    NONINDEXED                    -                     
                    REUSE                         -                     
                    )                             -                     
           DATA (NAME(FORM1011.BUFFER.ESDS.DATA))                       
/*                                                                      
//STEP02   EXEC  PGM=IDCAMS                                             
//SYSPRINT DD SYSOUT=*                                                  
//FILEOUT  DD DSN=FORM1011.BUFFER.ESDS,DISP=MOD                         
//ENTDATA  DD *                                                         
A0000016AGENCE ASTRE                  000000000000000                   
A0007222AGENCE PRISME                 000000000000000                   
A0000140AGENCE ETOILE                 000000000000000                   
A0000217AGENCE NOUVELLE GENERATION    000000000000000                   
C00001MAVINGA KINAVIDI    HERITIER            0000217                   
C00321SERVETTAZ           MORGAN              0000217                   
C01210VAZ                 PIERRE              0000016                   
C72521POKAM               JOEL                0000016                   
R00321123456789012345678901232025043000000542357C0000                   
R01210113456789012345678901232025043000000122309C0000                   
M012102025050100000005623D000000000000000000000000000                   
M012102025050200000075031D000000000000000000000000000                   
M012102025050300000003215D000000000000000000000000000                   
M012102025050400000008573D000000000000000000000000000                   
M012102025051000000005623D000000000000000000000000000                   
M012102025051100000004200D000000000000000000000000000                   
M012102025052100000010562D000000000000000000000000000                   
M012102025052200000005417D000000000000000000000000000                   
M012102025052300000000601D000000000000000000000000000                   
M012102025052900000275411C000000000000000000000000000                   
/*                                                                      
//SYSIN    DD   *                                                       
   IF LASTCC = 0 THEN                               -                   
   REPRO INFILE(ENTDATA)               -                                
         OUTFILE(FILEOUT)                                               
/*                                                                      
//                                                                      

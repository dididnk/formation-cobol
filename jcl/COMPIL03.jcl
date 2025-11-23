//*=====================================================================
//*          EXECUTION PROGRAMME D'INITIALISATION DES 4 FICHIERS        
//*=====================================================================
//RUN      EXEC PGM=PG14CH08                                            
//BUFFER   DD DSN=FORM1011.BUFFER.ESDS,DISP=SHR                         
//MVTC     DD DSN=FORM1011.MVTC.ESDS,DISP=SHR                           
//AGENCE   DD DSN=FORM1011.AGENCE.KSDS,DISP=SHR           
//CLT      DD DSN=FORM1011.CLT.KSDS,DISP=SHR                            
//RIB      DD DSN=FORM1011.RIB.KSDS,DISP=SHR                            
//STEPLIB  DD DSN=FORM1011.COBOL.LOAD(PG14CH08),DISP=SHR                
//SYSPRINT DD SYSOUT=*                                                  
//SYSOUT   DD SYSOUT=*                                                  
/*                                                                      

//RUNDB2   JOB (2025),'RUNDB2',MSGCLASS=X,CLASS=A,                       
//         MSGLEVEL=(1,1),NOTIFY=&SYSUID                                
//JOBLIB   DD DSN=DSNA10.SDSNLOAD,DISP=SHR                              
//         DD DSN=FORM1112.FINANCE.LOAD,DISP=SHR                            
//         DD DSN=FORM1112.FINANCE.DBRM,DISP=SHR                            
//OUT1     OUTPUT OUTDISP=(KEEP,KEEP)                                   
//STEP1    EXEC PGM=IKJEFT01,DYNAMNBR=20                                
//SYSTSPRT DD SYSOUT=*                                                  
//SYSPRINT DD SYSOUT=T,OUTPUT=*.OUT1                                    
//SYSPRINT DD DUMMY                                                     
//SYSTSIN  DD *                                                         
    DSN SYSTEM(DBAG)                                                    
    RUN PROG(PG01DB2) PLAN(PG01DB2)                                     
    END                                                                 
/* 
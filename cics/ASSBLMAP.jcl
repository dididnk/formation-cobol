//ASSBLMAP  JOB 'ASSEMBL',CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1),            
//          NOTIFY=&SYSUID                                              
//PROCMAN   JCLLIB ORDER=(DFH510.CICS.SDFHPROC,FTEST.CICS.SOURCE,       
//          FTEST.CICS.LKED,FTEST.CICS.LOAD)                            
//ASSEM     EXEC DFHMAPS,INDEX='DFH510.CICS',                           
//          MAPLIB='FTEST.CICS.LOAD',                                   
//          DSCTLIB='FTEST.CICS.LKED',                                  
//          MAPNAME='MAPNAME',RMODE=24                                  
//SYSPRINT  DD SYSOUT=A                                                 
//SYSUT1    DD DSN=FTEST.CICS.SOURCE(MAPNAME),DISP=SHR                  
/*                                                                      
//                                                                      
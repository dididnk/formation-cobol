//COBLOAD JOB COBLOAD,'COBLOAD',MSGLEVEL=(1,1),REGION=4M,               
//           MSGCLASS=A,CLASS=A,NOTIFY=&SYSUID                          
//*----------------------------------------------------------------     
//* JCL DE COMPILATION POUR UN PROGRAMME APPELANT UN SOUS-PROG          
//*----------------------------------------------------------------     
//COMPIL1 EXEC IGYWCL                                                   
//COBOL.SYSIN  DD DSN=FORM1011.COBOL.SOURCES(PG15CH10),DISP=SHR         
//COBOL.SYSLIB DD DSN=FORM1011.COBOL.LINK,DISP=SHR                      
//LKED.SYSLIB DD DSN=FORM1011.COBOL.LOAD,DISP=SHR                       
//LKED.SYSLMOD DD DSN=FORM1011.COBOL.LOAD(PG15CH10),DISP=SHR            
/*                                                                      
//                                                                      
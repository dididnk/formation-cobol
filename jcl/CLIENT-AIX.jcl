//EFILEAX JOB (EFILEAX),'EFILEAX CLIENT',MSGLEVEL=(1,1),
//         MSGCLASS=C,CLASS=A,PRTY=4,NOTIFY=&SYSUID
//*===================================================*
//*   CREATION DU CLIENT + AIX 
//*===================================================*
//STEPAIX EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
	DEFINE AIX (NAME(FORM1011.FILES.CLIENT.AIX)  -               
	         RELATE (FTEST.KSDS)       -               
	         TRACKS (1 1)              -               
	         VOL (FDDBAS)              -               
	         CISZ (4096)               -               
	         RECORDSIZE (80 80)        -               
	         KEYS (07 45)              -               
	         FREESPACE (10 10)         -               
	         REUSE                     -               
	         UPGRADE                   -               
	         NONUNIQUEKEY    )         -               
	     DATA (NAME(FORM1011.FILES.CLIENT.AIX.DATA))  -           
	     INDEX (NAME(FORM1011.FILES.CLIENT.AIX.INDEX))              
   IF LASTCC=0   THEN  -                               
	  LISTCAT NAME ENTRIES (FORM1011.FILES.CLIENT.AIX)     
/*       
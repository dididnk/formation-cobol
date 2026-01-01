MAPNAME  DFHMSD TYPE=MAP,MODE=INOUT,LANG=COBOL,STORAGE=AUTO,           X
               TIOAPFX=YES,MAPATTS=(COLOR,HILIGHT,OUTLINE),            X
               DSATTS=(COLOR,HILIGHT)
                                                                        
MAP1     DFHMDI SIZE=(24,80),LINE=01,COLUMN=1,CTRL=(PRINT,FREEKB)       
         DFHMDF POS=(10,20),LENGTH=16,                                 X
               INITIAL='ENTRER VOTRE NOM :'                             
                                                                        
NAMEIN   DFHMDF POS=(10,38),ATTRB=(UNPROT,BRT,IC),LENGTH=20,           X
               COLOR=GREEN,OUTLINE=BOX,HILIGHT=REVERSE,CASE=MIXED,     X
               INITIAL='--------------------'                           
         DFHMDF POS=(10,59),LENGTH=1,ATTRB=PROT   

NAMEOUT  DFHMDF POS=(15,30),LENGTH=40,COLOR=BLUE,ATTRB=(PROT,BRT)       
MAPNAME  DFHMSD TYPE=FINAL                                              
         END  
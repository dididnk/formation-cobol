MAPWRITE  DFHMSD TYPE=MAP,                                             X
               MODE=INOUT,LANG=COBOL,                                  X
               STORAGE=AUTO,                                           X
               TIOAPFX=YES                                              
MAP1     DFHMDI SIZE=(24,80),                                          X
               LINE=01,COLUMN=01,                                      X
               CTRL=(PRINT,FREEKB)                                      
         DFHMDF POS=(9,23),                                            X
               ATTRB=(ASKIP,NORM),LENGTH=34,                           X
               INITIAL='WELCOME TO THE MAGIC WORLD IN CICS'             
         DFHMDF POS=(12,27),                                           X
               ATTRB=(ASKIP,NORM),                                     X
               LENGTH=26,                                              X
               INITIAL='MAY THE FORCE BE WITH YOU'                      
MAPWRITE  DFHMSD TYPE=FINAL                                              
         END                                                            
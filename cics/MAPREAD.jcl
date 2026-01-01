MAPREAD  DFHMSD TYPE=MAP,MODE=INOUT,LANG=COBOL,STORAGE=AUTO,TIOAPFX=YES

MAP1     DFHMDI SIZE=(24,80),LINE=01,COLUMN=01,CTRL=(PRINT,FREEKB)
*-----------------------------------------------------------------------
*             CHAMP DE SAISIE POUR LA CLE (3 caractères)
*-----------------------------------------------------------------------
         DFHMDF POS=(15,10),ATTRB=(UNPROT,IC),LENGTH=3,FIELD=KEYIN
         DFHMDF POS=(15,5),ATTRB=(ASKIP,NORM),LENGTH=4,                X
               INITIAL='KEY:'
*-----------------------------------------------------------------------
*  ZONES D'AFFICHAGE Chaque zone correspond exactement à WS-REC-DATA
*-----------------------------------------------------------------------
         DFHMDF POS=(17,5),ATTRB=(ASKIP,NORM),LENGTH=10,               X                               X
               INITIAL='CDECLT    :'
         DFHMDF POS=(17,20),ATTRB=(PROT,NORM),LENGTH=3,FIELD=CDECLTOUT

         DFHMDF POS=(18,5),ATTRB=(ASKIP,NORM),LENGTH=10,               X  
               INITIAL='CODEREG   :'
         DFHMDF POS=(18,20),ATTRB=(PROT,NORM),LENGTH=2,FIELD=CODEREGOUT

         DFHMDF POS=(19,5), ATTRB=(ASKIP,NORM),LENGTH=10,              X
               INITIAL='NATCPT   :'
         DFHMDF POS=(19,20),ATTRB=(PROT,NORM),LENGTH=2,FIELD=NATCPTOUT

         DFHMDF POS=(20,5), ATTRB=(ASKIP,NORM),LENGTH=10,              X
               INITIAL='NOMCPT   :'
         DFHMDF POS=(20,20), ATTRB=(PROT,NORM),LENGTH=10,FIELD=NOMCPTOUT

         DFHMDF POS=(21,5),ATTRB=(ASKIP,NORM),LENGTH=10,               X
               INITIAL='PRNCPT   :'
         DFHMDF POS=(21,20),ATTRB=(PROT,NORM),LENGTH=10,FIELD=PRNCPTOUT

         DFHMDF POS=(22,5), ATTRB=(ASKIP,NORM),LENGTH=10,              X
               INITIAL='DTNCPT   :'
         DFHMDF POS=(22,20),ATTRB=(PROT,NORM),LENGTH=8,FIELD=DTNCPTOUT
MAPREAD  DFHMSD TYPE=FINAL
         END

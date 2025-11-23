       IDENTIFICATION DIVISION. 
       PROGRAM-ID. PGMEDIT1.
       AUTHOR. E NGBAME.
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
       SOURCE-COMPUTER. IBM-370.
       OBJECT-COMPUTER. IBM-370.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
           SELECT FPRINT ASSIGN TO DOPRINT
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FS.
       DATA DIVISION. 
       FILE SECTION. 
       PO FPRINT.
       01  REC-PRT.
           05 ENG-PRT    PIC X(130).
       WORKING-STORAGE SECTION. 
       01  LIGNE-01.
           05 TRACAGE01  PIC  X(20)  VALUE "********************".
           05 TRACAGE02  PIC  X(20)  VALUE "********************".
           05 TRACAGE03  PIC  X(20)  VALUE "********************".
       02  LIGNE-02.
           05 FILLER     PIC  X(10)  VALUE "**EDITION ".
           05 TYPE-EDIT  PIC  X(20).
           05 FILLER     PIC  X(100) VALUE "           ****".
       01  WS-INSR-SIMPLE1.
           05 FILLER     PIC  X(15)  VALUE "X10/XX      :".
           05 VAR1       PIC  X(10)/XX.
           05 FILLER     PIC  X(05)  VALUE "       ".
           05 FILLER     PIC  X(15)  VALUE "X(5)BX(7)   :".
           05 VAR2       PIC  X(5)BX(7).
       01  WS-INSR-SIMPLE2.
           05 FILLER     PIC  X(15)  VALUE "99.B999.B000 :".
           05 VAR3       PIC  99.B999.B000.
           05 FILLER     PIC  X(05)  VALUE "       ".
           05 FILLER     PIC  X(15)  VALUE "99B999       :".
           05 VAR4       PIC  99B999.
       01  WS-INSR-SPECIALE1. 
           05 FILLER     PIC  X(15)  VALUE "999.99  :".
           05 VAR1-SPE   PIC  999.9.
           05 FILLER     PIC  X(05)  VALUE "        ".
           05 FILLER     PIC  X(15)  VALUE "999.99  :".
           05 VAR2-SPE   PIC  999.9.
           05 FILLER     PIC  X(05)  VALUE "        ".
           05 FILLER     PIC  X(15)  VALUE "999.99  :".
           05 VAR3-SPE   PIC  999.99.
       01 WS-INSR-SPECIAL2.
           05 FILLER     PIC  X(15)  VALUE "999.99  :".
           05 VAR4-SPE   PIC  999.9.
           05 FILLER     PIC  X(05)  VALUE "        ".
           05 FILLER     PIC  X(15)  VALUE "+999.99E+99  :".
           05 VAR5-SPE   PIC  +999.99E99.
       01  WS-INSR-FIXE1.
           05 FILLER     PIC  X(15)  VALUE "+999.99E+99  :".
           05 VAR1-FIXE  PIC  +999.99E99.
           05 FILLER     PIC  X(05)  VALUE "        ".
           05 FILLER     PIC  X(15)  VALUE "+999.99E+99  :".
           05 VAR2-FIXE  PIC  +999.99E99.
           05 FILLER     PIC  X(05)  VALUE "        ".
           05 FILLER     PIC  X(15)  VALUE "+999.99.   :".
           05 VAR3-FIXE  PIC  +999.99.
       01  WS-VAR-FIXE2.
           05 FILLER       PIC X(15)   VALUE '$9999.99'.
           05 VAR4-FIXE    PIC X(15)   VALUE '$999.99'.
           05 FILLER     PIC  X(05)  VALUE "        ".
           05 FILLER     PIC  X(15)  VALUE "-999.99  :".
           05 VAR5-FIXE  PIC  -999.99.
           05 FILLER     PIC  X(05)  VALUE "        ".
           05 FILLER     PIC  X(15)  VALUE "-$999.99  :".
           05 VAR6-FIXE  PIC  -$999.99.
       01 WS-INSR-FIXE3.
           05 FILLER     PIC  X(15)  VALUE '$9999.99CR :'.
           05 VAR7-FIXE  PIC  $9999.99CR.
           05 FILLER     PIC  X(05)  VALUE "        ".
           05 FILLER     PIC  X(15)  VALUE '$9999.99CR :'.
           05 VAR8-FIXE  PIC  $9999.99CR. 
       01  WS-VAR-FLOT1.
           05 FILLER     PIC  X(15)  VALUE "$$$$.99     :".
           05 VAR1-FLOT  PIC  $$$$.99.
           05 FILLER    PIC  X(05)  VALUE "        ".
           05 FILLER     PIC  X(15)  VALUE "$$$$,$$.99  :".   
           05 VAR2-FLOT2 PIC  $$$$,$$.99.
       

      
           


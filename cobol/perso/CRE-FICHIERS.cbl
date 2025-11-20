       IDENTIFICATION DIVISION.
       PROGRAM-ID. CRE-FICHIERS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FAGENCE ASSIGN TO "DD-AGENCE.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS CODE-TAG
               FILE STATUS IS FS-AGENCE.

           SELECT FCLT ASSIGN TO "DD-CLT.idx"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS CODE-TCLT
               FILE STATUS IS FS-CLT.

           SELECT FRIB ASSIGN TO "DD-RIB.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS CLT-TRIB
               FILE STATUS IS FS-RIB.

           SELECT FMVTC ASSIGN TO "AS-MVTC.idx"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS CLT-TMVTC
               FILE STATUS IS FS-MVTC.

       DATA DIVISION.
       FILE SECTION.

       FD  FAGENCE.
       01  ENR-TAG.
           10 CODE-TAG    PIC 9(7).
           10 LIBELLE-TAG PIC X(30).

       FD  FCLT.
       01  ENR-TCLT.
           10 CODE-TCLT   PIC 9(5).
           10 NOM-TCLT    PIC X(20).
           10 PRENOM-TCLT PIC X(20).
           10 CODEAG-TCLT PIC 9(7).

       FD  FRIB.
       01  ENR-TRIB.
           10 CLT-TRIB    PIC 9(5).
           10 CPTE-TRIB   PIC X(23).
           10 DATE-TRIB   PIC 9(8).
           10 SOLDE-TRIB  PIC 9(9)V9(2).
           10 SENS-TRIB   PIC X.

       FD  FMVTC.
       01  ENR-TMVTC.
           10 CLT-TMVTC   PIC 9(5).
           10 DATE-TMVTC  PIC 9(8).
           10 MONT-TMVTC  PIC 9(9)V9(2).
           10 SENS-TMVTC  PIC X.

       WORKING-STORAGE SECTION.
       01 FS-AGENCE PIC XX.
       01 FS-CLT    PIC XX.
       01 FS-RIB    PIC XX.
       01 FS-MVTC   PIC XX.

       PROCEDURE DIVISION.
       DEBUT.
           DISPLAY "CREATION DES FICHIERS INDEXED ...".

           OPEN OUTPUT FAGENCE FCLT FRIB FMVTC.

           DISPLAY "FS-AGENCE: " FS-AGENCE.
           DISPLAY "FS-CLT    : " FS-CLT.
           DISPLAY "FS-RIB    : " FS-RIB.
           DISPLAY "FS-MVTC   : " FS-MVTC.

           CLOSE FAGENCE FCLT FRIB FMVTC.

           DISPLAY "CREATION TERMINEE !".
           STOP RUN.

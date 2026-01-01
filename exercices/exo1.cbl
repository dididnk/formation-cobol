       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. EXO1.                                                00020000
       AUTHOR E NGBAME.                                                 00030000
       DATA DIVISION.                                                   00040000
       WORKING-STORAGE SECTION.                                         00050000
       01  WS-OLD   PIC 9(3) VALUE 26.                                  00060000
       PROCEDURE DIVISION.                                              00070000
           IF WS-OLD >= 18 THEN                                         00080000
              DISPLAY "CONGRATS YOU CAN LEARN COBOL :)"                 00090000
           ELSE                                                         00100000
              DISPLAY "SORRY, YOU CAN NOT LEARN COBOL AT YOUR AGE."     00110000
           END-IF.                                                      00120000
           DISPLAY "*********** FIN PROGRAMME ***********".             00130000
           STOP RUN.                                                    00140000
                                                                        00150000
       
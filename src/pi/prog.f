C     PI.F                                                              1       
C     COPYRIGHT (C) 2020 HUGH COLEMAN                                   2       
C                                                                       3       
C     THIS FILE IS PART OF HUGHCOLEMAN/FORTRAN, AN ATTEMPT TO           4       
C     INVESTIGATE THE FORTRAN PROGRAMMING LANGUAGE AND LEARN ABOUT THE  5       
C     EARLY DAYS OF COMPUTING. IT IS RELEASED UNDER THE MIT LICENSE (SEE6       
C     LICENSE.)                                                         7       
                                                                        8       
 10   FORMAT ( 1F12.9 )                                                 9       
                                                                        10      
C     THIS PROGRAM COMPUTES AN APPROXIMATION OF PI USING LEIBNIZ'       11      
C     FORMULA.                                                          12      
C                                                                       13      
C         PI/4 = SUM(K=0,INF) (-1)**K / 2K + 1                          14      
                                                                        15      
      RHSUM = 0.0                                                       16      
                                                                        17      
C     THE NUMERATOR AND DENOMINATOR OF THE TERMS.                       18      
      TNUM = 1.0                                                        19      
      TDEN = 1.0                                                        20      
                                                                        21      
C     32768 IS THE FIXED-POINT INTEGER LIMIT - ANY MORE ITERATIONS AND  22      
c     THE PROGRAM WILL FREEZE AT RUNTIME. WHY? I DON'T KNOW.            23      
      DO 30 I = 0, 32765                                                24      
          RHSUM = RHSUM + (TNUM / TDEN)                                 25      
                                                                        26      
C         NOW, PREPARE THE NUMERATOR AND DENOMINATOR VARIABLES FOR THE  27      
c         NEXT TERM.                                                    28      
          TNUM = -1.0 * TNUM                                            29      
          TDEN = TDEN + 2.0                                             30      
 30   CONTINUE                                                          31      
                                                                        32      
C     SOLVE FOR PI BY MULTIPLYING THE RIGHT-HAND SIDE BY FOUR.          33      
      PI = RHSUM * 4.0                                                  34      
      PRINT 10, PI                                                      35      
                                                                        36      
 9999 STOP                                                              37      

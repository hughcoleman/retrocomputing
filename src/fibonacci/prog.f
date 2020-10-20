C     FIBONACCI.F                                                       1       
C     COPYRIGHT (C) 2020 HUGH COLEMAN                                   2       
C                                                                       3       
C     THIS FILE IS PART OF HUGHCOLEMAN/FORTRAN, AN ATTEMPT TO           4       
C     INVESTIGATE THE FORTRAN PROGRAMMING LANGUAGE AND LEARN ABOUT THE  5       
C     EARLY DAYS OF COMPUTING. IT IS RELEASED UNDER THE MIT LICENSE (SEE6       
C     LICENSE.)                                                         7       
                                                                        8       
      DIMENSION IFIB(23)                                                9       
                                                                        10      
 10   FORMAT ( 1I2 )                                                    11      
 11   FORMAT ( 1I3, 1I6 )                                               12      
 12   FORMAT ( 1I3, 11H TOO LARGE. )                                    13      
 13   FORMAT ( 9H  N  F(N) )                                            14      
                                                                        15      
C     PRECOMPUTE FIRST 23 FIBONACCI NUMBERS, AS THEY ARE THE ONLY ONES  16      
C     THAT ARE SMALL ENOUGH TO FIT IN AN INTEGER TYPE VARIABLE.         17      
      IFIB(1) = 0                                                       18      
      IFIB(2) = 1                                                       19      
      DO 20 I = 3, 23                                                   20      
          IFIB(I) = IFIB(I-1) + IFIB(I-2)                               21      
 20   CONTINUE                                                          22      
                                                                        23      
      PRINT 13                                                          24      
                                                                        25      
C     READ A 2 DIGIT INTEGER FROM THE CARD READER. EXIT THE PROGRAM IF  26      
C     THE QUERIED INTEGER IS 0. REJECT QUERIES THAT ARE TOO LARGE.      27      
 30   READ 10, N                                                        28      
      IF (N) 9999, 9999, 31                                             29      
 31   IF (N-23) 40, 40, 50                                              30      
                                                                        31      
 40   PRINT 11, N, IFIB(N)                                              32      
      GOTO 30                                                           33      
                                                                        34      
 50   PRINT 12, N                                                       35      
      GOTO 30                                                           36      
                                                                        37      
 9999 STOP                                                              38      

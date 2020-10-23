C     FIBONACCI.F                                                       1       
C     COPYRIGHT (C) 2020 HUGH COLEMAN                                   2       
C                                                                       3       
C     THIS FILE IS PART OF HUGHCOLEMAN/FORTRAN, AN ATTEMPT TO           4       
C     INVESTIGATE THE FORTRAN PROGRAMMING LANGUAGE AND LEARN ABOUT THE  5       
C     EARLY DAYS OF COMPUTING. IT IS RELEASED UNDER THE MIT LICENSE (SEE6       
C     LICENSE.)                                                         7       
                                                                        8       
      DIMENSION FIB(41)                                                 9       
                                                                        10      
 10   FORMAT ( 1I2 )                                                    11      
 11   FORMAT ( 14H  N       F(N) )                                      12      
 12   FORMAT ( 1I3, 1F11.0 )                                            13      
 13   FORMAT ( 1I3, 11H TOO LARGE. )                                    14      
                                                                        15      
      PRINT 11                                                          16      
                                                                        17      
C     PRE-COMPUTE FIBONACCI SEQUENCE AND STORE IN THE FIB() VECTOR.     18      
      FIB(1) = 0                                                        19      
      FIB(2) = 1                                                        20      
                                                                        21      
      DO 20 N=3, 41                                                     22      
          FIB(N) = FIB(N - 1) + FIB(N - 2)                              23      
 20   CONTINUE                                                          24      
                                                                        25      
C     READ A 2 DIGIT INTEGER FROM THE CARD READER. EXIT THE PROGRAM IF  26      
C     THE QUERIED INTEGER IS -1. REJECT QUERIES THAT ARE TOO LARGE.     27      
 30   READ 10, N                                                        28      
      NC = N                                                            29      
      IF (N+1) 9999, 9999, 31                                           30      
 31   IF (N-40) 120, 120, 130                                           31      
                                                                        32      
 120  PRINT 12, NC, FIB(N+1)                                            33      
      GOTO 30                                                           34      
                                                                        35      
C     "TOO LARGE."                                                      36      
 130  PRINT 13, NC                                                      37      
      GOTO 30                                                           38      
                                                                        39      
 9999 STOP                                                              40      

C     FIBONACCI.F                                                       1       
C     COPYRIGHT (C) 2020 HUGH COLEMAN                                   2       
C                                                                       3       
C     THIS FILE IS PART OF HUGHCOLEMAN/FORTRAN, AN ATTEMPT TO           4       
C     INVESTIGATE THE FORTRAN PROGRAMMING LANGUAGE AND LEARN ABOUT THE  5       
C     EARLY DAYS OF COMPUTING. IT IS RELEASED UNDER THE MIT LICENSE (SEE6       
C     LICENSE.)                                                         7       
                                                                        8       
 10   FORMAT ( 1I2 )                                                    9       
 11   FORMAT ( 14H  N       F(N) )                                      10      
 12   FORMAT ( 1I3, 1F11.0 )                                            11      
 13   FORMAT ( 1I3, 11H TOO LARGE. )                                    12      
                                                                        13      
      PRINT 11                                                          14      
                                                                        15      
C     READ A 2 DIGIT INTEGER FROM THE CARD READER. EXIT THE PROGRAM IF  16      
C     THE QUERIED INTEGER IS -1. REJECT QUERIES THAT WILL LEAD TO       17      
C     FLOATING-POINT OVERFLOWS.                                         18      
 20   READ 10, N                                                        19      
      NC = N                                                            20      
      IF (N+1) 9999, 9999, 21                                           21      
 21   IF (N-40) 30, 30, 130                                             22      
                                                                        23      
 30   FACC = 0                                                          24      
      FNXT = 1                                                          25      
 31   IF (N) 9999, 120, 32                                              26      
 32   FTMP = FNXT                                                       27      
      FNXT = FACC + FNXT                                                28      
      FACC = FTMP                                                       29      
      N = N - 1                                                         30      
      GO TO 31                                                          31      
                                                                        32      
 120  PRINT 12, NC, FACC                                                33      
      GOTO 20                                                           34      
                                                                        35      
 130  PRINT 13, NC                                                      36      
      GOTO 20                                                           37      
                                                                        38      
 9999 STOP                                                              39      

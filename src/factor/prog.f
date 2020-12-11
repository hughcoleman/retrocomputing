C     FACTOR.F                                                          1       
C     COPYRIGHT (C) 2020 HUGH COLEMAN                                   2       
C                                                                       3       
C     THIS FILE IS PART OF HUGHCOLEMAN/FORTRAN, AN ATTEMPT TO           4       
C     INVESTIGATE THE FORTRAN PROGRAMMING LANGUAGE AND LEARN ABOUT THE  5       
C     EARLY DAYS OF COMPUTING. IT IS RELEASED UNDER THE MIT LICENSE (SEE6       
C     LICENSE.)                                                         7       
                                                                        8       
C     THIS IMPLEMENTS A BASIC ITERATIVE ALGORITHM TO FIND THE PRIME     9       
C     FACTORS OF A GIVEN INTEGER N.                                     10      
                                                                        11      
 10   FORMAT ( 1I5 )                                                    12      
 11   FORMAT ( 24H PRIME FACTORIZATION OF 1I5 )                         13      
 12   FORMAT ( 1H 1I5 )                                                 14      
                                                                        15      
C     GET THE QUERIED INTEGER FROM STANDARD INPUT, IF IT IS ONE OR LESS 16      
C     EXIT THE PROGRAM.                                                 17      
 20   READ 10, N                                                        18      
      IF (N - 1) 9999, 9999, 21                                         19      
 21   PRINT 11, N                                                       20      
                                                                        21      
C     DIVIDE OUT AS MANY FACTORS OF TWO AS POSSIBLE                     22      
      IFAC = 2                                                          23      
 30   IF (XMODF(N, IFAC)) 9999, 31, 40                                  24      
 31   N = N / 2                                                         25      
      PRINT 12, IFAC                                                    26      
      GOTO 30                                                           27      
                                                                        28      
C     DIVIDE OUT ODD INTEGERS FROM 3 TO SQRT(N).                        29      
 40   DO 50 IFAC = 3, 32767, 2                                          30      
C         CHECK IF IFAC SQUARED EXCEEDS N                               31      
          IF (IFAC**2 - N) 41, 41, 60                                   32      
 41       IF (XMODF(N, IFAC)) 9999, 42, 50                              33      
 42       N = N / IFAC                                                  34      
          PRINT 12, IFAC                                                35      
          GOTO 41                                                       36      
 50   CONTINUE                                                          37      
                                                                        38      
C     IF N IS STILL GREATER THAN ONE, THEN N IS ALSO A PRIME FACTOR.    39      
 60   IF (N-1) 70, 70, 61                                               40      
 61   PRINT 12, N                                                       41      
                                                                        42      
 70   GOTO 20                                                           43      
                                                                        44      
 9999 STOP                                                              45      

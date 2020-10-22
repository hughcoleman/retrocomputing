C     PRIME.F                                                           1       
C     COPYRIGHT (C) 2020 HUGH COLEMAN                                   2       
C                                                                       3       
C     THIS FILE IS PART OF HUGHCOLEMAN/FORTRAN, AN ATTEMPT TO           4       
C     INVESTIGATE THE FORTRAN PROGRAMMING LANGUAGE AND LEARN ABOUT THE  5       
C     EARLY DAYS OF COMPUTING. IT IS RELEASED UNDER THE MIT LICENSE (SEE6       
C     LICENSE.)                                                         7       
                                                                        8       
 10   FORMAT ( 1I5 )                                                    9       
 11   FORMAT ( 1I5, 9H IS PRIME )                                       10      
 12   FORMAT ( 1I5, 13H IS NOT PRIME )                                  11      
                                                                        12      
C     READ AN 5 DIGIT INTEGER FROM THE CARD READER. EXIT THE PROGRAM IF 13      
C     THE QUERIED INTEGER IS -1. THEN, CONSIDER THE PRIMALITY EDGE-CASES14      
C     SUCH AS 1 (NOT PRIME) AND 2 (PRIME.)                              15      
 20   READ 10, N                                                        16      
      IF (N+1) 9999, 9999, 21                                           17      
 21   IF (N-1) 9999, 120, 22                                            18      
 22   IF (N-2) 9999, 110, 30                                            19      
                                                                        20      
C     FIRST, CHECK IF N IS EVEN. THIS QUICKLY ELIMINATES A LARGE PORTION21      
C     OF THE SEARCH SPACE.                                              22      
 30   IF (XMODF(N, 2)) 9999, 120, 40                                    23      
                                                                        24      
C     THEN, LOOP OVER ODD INTEGERS FROM 3 TO SQRT(N) AND CONSIDER EACH  25      
C     ONE AS A POTENTIAL FACTOR.                                        26      
 40   IFAC = 3                                                          27      
 41   IF (N - IFAC**2) 110, 42, 42                                      28      
C         IF IFAC DIVIDES N THEN N IS NOT PRIME.                        29      
 42       IF (XMODF(N, IFAC)) 9999, 120, 43                             30      
C         OTHERWISE, IFAC DOES NOT DIVIDE N AND WE CONSIDER THE NEXT    31      
C         LARGEST POSSIBLE FACTOR.                                      32      
 43       IFAC = IFAC + 2                                               33      
      GOTO 41                                                           34      
                                                                        35      
 110  PRINT 11, N                                                       36      
      GOTO 20                                                           37      
 120  PRINT 12, N                                                       38      
      GOTO 20                                                           39      
                                                                        40      
 9999 STOP                                                              41      

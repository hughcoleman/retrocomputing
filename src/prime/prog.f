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
C     THE QUERIED INTEGER IS 0. THEN, CONSIDER THE PRIMALITY EDGE-CASES 14      
C     SUCH AS 1 (NOT PRIME) AND 2 (PRIME.)                              15      
 20   READ 10, N                                                        16      
      IF (N) 9999, 9999, 21                                             17      
 21   IF (N-1) 9999, 120, 22                                            18      
 22   IF (N-2) 9999, 110, 30                                            19      
                                                                        20      
C     FOR SOME REASON, MOD() IS NOT A FUNCTION AVAILABLE TO FORTRAN. SO 21      
C     INSTEAD, MODULO OPERATIONS ARE PERFORMED THROUGH REPEATED         22      
C     SUBTRACTION.                                                      23      
                                                                        24      
C     FIRST, CHECK IF N IS EVEN. THIS QUICKLY ELIMINATES A LARGE PORTION25      
C     OF THE SEARCH SPACE.                                              26      
 30   IREM = N                                                          27      
 31   IREM = IREM - 2                                                   28      
      IF (IREM) 32, 31, 31                                              29      
 32   IREM = IREM + 2                                                   30      
                                                                        31      
      IF (IREM) 9999, 120, 40                                           32      
                                                                        33      
C     THEN, LOOP OVER ODD INTEGERS FROM 3 TO SQRT(N) AND CONSIDER EACH  34      
C     ONE AS A POTENTIAL FACTOR.                                        35      
 40   IFAC = 3                                                          36      
 50   IF (N - IFAC**2) 110, 60, 60                                      37      
C         COMPUTE (IREM := N MOD IFAC) VIA REPEATED SUBTRACTION.        38      
 60       IREM = N                                                      39      
 61       IREM = IREM - IFAC                                            40      
          IF (IREM) 62, 61, 61                                          41      
 62       IREM = IREM + IFAC                                            42      
                                                                        43      
C         IF IREM = 0, THEN IFAC DIVIDES N AND N IS NOT PRIME.          44      
          IF (IREM) 9999, 120, 70                                       45      
C         OTHERWISE, IFAC DOES NOT DIVIDE N AND WE CONSIDER THE NEXT    46      
C         LARGEST POSSIBLE FACTOR.                                      47      
 70       IFAC = IFAC + 2                                               48      
      GOTO 50                                                           49      
                                                                        50      
 110  PRINT 11, N                                                       51      
      GOTO 20                                                           52      
 120  PRINT 12, N                                                       53      
      GOTO 20                                                           54      
                                                                        55      
 9999 STOP                                                              56      

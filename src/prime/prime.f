C     PRIME.F                                                               
C     COPYRIGHT (C) 2020 HUGH COLEMAN                                           
C                                                                               
C     THIS FILE IS PART OF HUGHCOLEMAN/FORTRAN, AN ATTEMPT TO INVESTIGATE THE   
C     FORTRAN PROGRAMMING LANGUAGE AND LEARN ABOUT THE EARLY DAYS OF COMPUTING. 
C     IT IS RELEASED UNDER THE MIT LICENSE (SEE LICENSE.)                       
                                                                                
 10   FORMAT ( 1I5 )                                                            
 11   FORMAT ( 1I5, 9H IS PRIME )
 12   FORMAT ( 1I5, 13H IS NOT PRIME )

C     READ AN 5 DIGIT INTEGER FROM THE CARD READER. EXIT THE PROGRAM IF THE
C     QUERIED INTEGER IS 0. ALSO, 1 IS NOT PRIME. BUT 2 IS PRIME.
 20   READ 10, N
      IF (N) 9999, 9999, 21
 21   IF (N-1) 9999, 120, 22
 22   IF (N-2) 9999, 110, 30
 
C     FIRST, CHECK IF N IS EVEN BY REPEATEDLY SUBTRACTING TWO
 30   IREM = N
 31   IREM = IREM - 2
      IF (IREM) 32, 31, 31
 32   IREM = IREM + 2

      IF (IREM) 9999, 120, 40
 
C     THEN, LOOP OVER ODD INTEGERS FROM 3 TO SQRT(N) AND CONSIDER EACH ONE AS A 
C     POTENTIAL FACTOR
 40   IFAC = 3
 50   IF (N - IFAC**2) 110, 60, 60

C     COMPUTE (IREM := N MOD IFAC) VIA REPEATED SUBTRACTION
 60       IREM = N
 61       IREM = IREM - IFAC
          IF (IREM) 62, 61, 61
 62       IREM = IREM + IFAC

C         IF IREM = 0, THEN IT IFAC DIVIDES N AND N IS NOT PRIME
          IF (IREM) 9999, 120, 70
C         OTHERWISE, IFAC DOES NOT DIVIDE N AND WE CONSIDER THE NEXT LARGEST
C         POSSIBLE FACTOR
 70       IFAC = IFAC + 2
      GOTO 50
 
 110  PRINT 11, N
      GOTO 20
 120  PRINT 12, N
      GOTO 20

 9999 STOP   
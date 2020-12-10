C0000*------------------------------------------------------------------00000000
C     THE FAST FOURIER TRANSFORM
C0000*------------------------------------------------------------------00000000

C0000 GLOBALLY ACCESSIBLE FORMAT STATEMENTS AND ADDITIONAL DATA

C     COMPLEX NUMBER FORMATS
 0100 FORMAT ( 2F10.5 )
 0110 FORMAT ( 4H RE=,1F10.5,6H IMAG=,1F10.5 )
 
C1000 PSEUDORANDOM INPUT GENERATION USING A LINEAR CONGRUENTIAL
C     GENERATOR

C     READ A SEED VALUE FOR THE LCG FROM STANDARD INPUT, USE 1954 AS THE
C     SEED IF SUPPLIED SEED IS NEGATIVE
 1100 FORMAT ( 1I5 )
      READ 1100, ISEED
 1110 IF (ISEED) 1120, 1120, 1130 
 1120 ISEED = 1954
 1130 CONTINUE

C     EACH ROW OF THIS MATRIX REPRESENTS A SINGLE POINT, WITH THE REAL
C     COMPONENT IN THE FIRST SUBSCRIPT AND THE IMAGINARY COMPONENT IN 
C     THE SECOND
      DIMENSION PTS(64)(2)

C3000 LOGARITHMS

C7000 A NAIVE IMPLEMENTATION OF THE DISCRETE FOURIER TRANSFORM.

C8000 A RECURSIVE IMPLEMENTATION OF THE COOLEY-TUKEY FAST FOURIER 
C     TRANSFORM ALGORITHM.

C9000 AN ITERATIVE IMPLEMENTATION OF THE COOLEY-TUKEY FAST FOURIER
C     TRANSFORM ALGORITM

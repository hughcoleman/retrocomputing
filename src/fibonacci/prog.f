C     FIBONACCI.F                                                       1       
C     COPYRIGHT (C) 2020 HUGH COLEMAN                                   2       
C                                                                       3       
C     THIS FILE IS PART OF HUGHCOLEMAN/FORTRAN, AN ATTEMPT TO           4       
C     INVESTIGATE THE FORTRAN PROGRAMMING LANGUAGE AND LEARN ABOUT THE  5       
C     EARLY DAYS OF COMPUTING. IT IS RELEASED UNDER THE MIT LICENSE (SEE6       
C     LICENSE.)                                                         7       
                                                                        8       
 10   FORMAT ( 1I6 )                                                    9       
                                                                        10      
C     READ A 6 DIGIT INTEGER FROM THE CARD READER. EXIT THE PROGRAM IF  11      
C     THE QUERIED INTEGER IS 0.                                         12      
 20   READ 10, N                                                        13      
      IF (N) 9999, 9999, 30                                             14      
                                                                        15      
C     COMPUTE THE FIBONACCI SEQUENCE BY MAINTAINING TWO INTEGER         16      
C     VARIABLES IPREV (PREVIOUS) AND IACCM (ACCUMULATOR). EACH ITERATION17    
C     OF THE LOOP, SET IPREV TO IACCM AND IACCM TO IACCM + IPREV        18      
 30   IPREV = 0                                                         19      
      IACCM = 1                                                         20      
      DO 40 I=1, N                                                      21      
      ITMP = IACCM                                                      22      
      IACCM = IACCM + IPREV                                             23      
      IPREV = ITMP                                                      24      
 40   CONTINUE                                                          25      
                                                                        26      
      PRINT 10, IACCM                                                   27      
      GOTO 20                                                           28      
                                                                        29      
 9999 STOP                                                              30      

C     FIBONACCI.F                                                       1       
C     COPYRIGHT (C) 2020 HUGH COLEMAN                                   2       
C                                                                       3       
C     THIS FILE IS PART OF HUGHCOLEMAN/FORTRAN, AN ATTEMPT TO           4       
C     INVESTIGATE THE FORTRAN PROGRAMMING LANGUAGE AND LEARN ABOUT THE  5       
C     EARLY DAYS OF COMPUTING. IT IS RELEASED UNDER THE MIT LICENSE (SEE6       
C     LICENSE.)                                                         7       
                                                                        8       
      DIMENSION IVEC(16)                                                9       
                                                                        10      
 10   FORMAT ( 16I4 )                                                   11      
      READ 10, IVEC                                                     12      
                                                                        13      
      IDX = 16                                                          14      
                                                                        15      
 100  IEND = IDX - 1                                                    16      
      IBUB = 0                                                          17      
                                                                        18      
 200  DO 230 J = 1, IEND                                                19      
          IF (IVEC(J) - IVEC(J + 1)) 210, 220, 220                      20      
 210          ITMP = IVEC(J)                                            21      
              IVEC(J) = IVEC(J + 1)                                     22      
              IVEC(J + 1) = ITMP                                        23      
	      IBUB = J                                                     24      
 220      CONTINUE                                                      25      
 230  CONTINUE                                                          26      
                                                                        27      
      IDX = IBUB                                                        28      
                                                                        29      
      IF (IDX - 1) 300, 300, 100                                        30      
 300  PRINT 10, IVEC                                                    31      
                                                                        32       
 9999 STOP                                                              33      

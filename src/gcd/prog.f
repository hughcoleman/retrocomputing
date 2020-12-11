C     GCD.F                                                             1      
C     COPYRIGHT (C) 2020 HUGH COLEMAN                                   2      
C                                                                       3      
C     THIS FILE IS PART OF HUGHCOLEMAN/FORTRAN, AN ATTEMPT TO           4      
C     INVESTIGATE THE FORTRAN PROGRAMMING LANGUAGE AND LEARN ABOUT THE  5      
C     EARLY DAYS OF COMPUTING. IT IS RELEASED UNDER THE MIT LICENSE (SEE6      
C     LICENSE.)                                                         7      
                                                                        8      
C     THIS IS AN IMPLEMENTATION OF THE EUCLIDEAN ALGORITHM FOR FINDING  9      
C     THE GREATEST COMMON DIVISOR OF TWO POSITIVE INTEGERS A AND B.     10     
                                                                        11     
 10   FORMAT ( 2I5 )                                                    12     
 11   FORMAT ( 1I5 )                                                    13     
                                                                        14     
 20   READ 10, IA, IB                                                   15     
                                                                        16     
C     IF EITHER OF THE SUPPLIED INTEGERS IS ZERO OR NEGATIVE, HALT.     17     
      IF (IA) 9999, 9999, 30                                            18     
 30   IF (IB) 9999, 9999, 40                                            19     
                                                                        20     
C     APPLY THE MODULAR REDUCTION                                       21     
 40   ITMP = IB                                                         22     
      IB = XMODF(IA, IB)                                                23     
      IA = ITMP                                                         24     
      IF (IB) 80, 80, 40                                                25     
                                                                        26     
 80   PRINT 11, IA                                                      27     
      GOTO 20                                                           28     
                                                                        29     
 9999 STOP                                                              30     

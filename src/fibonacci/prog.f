C     FIBONACCI.F                                                               
C     COPYRIGHT (C) 2020 HUGH COLEMAN                                           
C                                                                               
C     THIS FILE IS PART OF HUGHCOLEMAN/FORTRAN, AN ATTEMPT TO INVESTIGATE THE   
C     FORTRAN PROGRAMMING LANGUAGE AND LEARN ABOUT THE EARLY DAYS OF COMPUTING. 
C     IT IS RELEASED UNDER THE MIT LICENSE (SEE LICENSE.)                       
                                                                                
 10   FORMAT ( 1I6 )                                                            
 20   READ 10, N                                                                
      IF (N) 90,90,30                                                           
 30   IFIBA = 0                                                                 
      IFIBB = 1                                                                 
      DO 40 I=1,N                                                               
      ITMP = IFIBB                                                              
      IFIBB = IFIBB + IFIBA                                                     
      IFIBA = ITMP                                                              
 40   CONTINUE                                                                  
      PRINT 10, IFIBB                                                           
      GOTO 20                                                                   
 90   STOP                                                                      

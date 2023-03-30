       identification division.
       program-id. hi.
       data division.
       working-storage section.
       01 num pic 9(3) value 5.
       01 txt pic x(3) value x"C3A4".
       procedure division.
           display "Hello World!"
           call "greet" using by value num
           move 4 to num
           call "report" using num
           call "report" using txt.
       end program hi.

       identification division.
       program-id. report.
      *program-id. report is recursive.
       data division.
       linkage section.
       01 num pic 9(3).
       procedure division using num.
           display "... " num " ...".
       end program report.

       identification division.
       program-id. hi.
       data division.
       working-storage section.
       01 num pic 9(3) packed-decimal value 5.
       01 txt pic x(3) value "año".
       procedure division.
           display "Hello World!"
           call "greet" using by value num
           move 4 to num
           call "greeet" using num
           call "greeet" using txt.
       end program hi.
      *
       identification division.
       program-id. greeet.
       data division.
       linkage section.
       01 num pic 9(3) packed-decimal.
       procedure division using num.
           display "... " num " ...".
       end program greeet.
       
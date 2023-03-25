       identification division.
       program-id. game.
       data division.
       working-storage section.
       01 win usage pointer.
       01 win-flags pic 9(4) usage binary value 0.
       01 win-pos pic 9(4) usage binary value 100.
       01 win-name pic x(32) value 'Hello World'.
       01 win-size pic 9(4) usage binary value 400.
       procedure division.
           display 'Hello World!'
           call 'init'
           call 'SDL_CreateWindow' using
              win-name
              by value win-pos by value win-pos
              by value win-size by value win-size
              by value win-flags
           perform until 1 < 0
           end-perform
           .
       end program game.

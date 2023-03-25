       identification division.
       program-id. game.
       data division.
       working-storage section.
       copy sdl.
       01 event-found binary-long value 0.
       01 win usage pointer.
       01 win-flags binary-long value 0.
       01 win-pos binary-long value 100.
       01 win-name pic x(32) value z'My Game'.
       01 win-size binary-long value 400.
       procedure division.
           perform init
           perform poll-event
           perform until sdl-event-type-quit
               display '---'
               call 'SDL_Delay' using by value 500
               perform poll-event
           end-perform
           .
       init.
           call 'SDL_Init' using by value sdl-init-video
           call 'SDL_CreateWindow' using
              by content win-name
              by value win-pos win-pos win-size win-size win-flags
           .
       poll-event.
           perform with test after until event-found not = 0
               call 'SDL_PollEvent' using by reference sdl-event
                   giving event-found
               display 'Hello World: ' sdl-event-type
           end-perform
      *    call 'pollEvent'
           .
       end program game.

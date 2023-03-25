       identification division.
       program-id. game.
       data division.
       working-storage section.
       01 win usage pointer.
       01 win-flags binary-int value 0.
       01 win-pos binary-int value 100.
       01 win-name pic x(32) value z'My Game'.
       01 win-size binary-int value 400.
       copy sdl.
       procedure division.
           perform init
           perform poll-event
           perform until sdl-event-type-quit
               display 'Hello World: ' sdl-event-type
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
      *    call 'SDL_PollEvent' using by reference sdl-event
           call 'pollEvent'
           .
       end program game.

       identification division.
       program-id. game.
       data division.
       working-storage section.
       copy sdl.
       01 done pic x value space.
       01 event-found binary-long value 0.
       01 renderer usage pointer.
       01 win usage pointer.
       01 win-flags binary-long value 0.
       01 win-pos binary-long value 100.
       01 win-name pic x(32) value z'My Game'.
       01 win-size binary-long value 400.
       procedure division.
           perform init
           perform until done = 'Y'
               perform poll-event
               call 'SDL_RenderClear' using by value renderer
               call 'SDL_RenderPresent' using by value renderer
               call 'SDL_Delay' using by value 20
           end-perform
           perform dispose
           .
       init.
           call 'SDL_Init' using by value sdl-init-video
           call 'SDL_CreateWindow' using
              by content win-name
              by value win-pos win-pos win-size win-size win-flags
              returning win
           call 'SDL_CreateRenderer' using
               by value win
               by reference null
               by value sdl-renderer-accelerated
               returning renderer
           .
       poll-event.
           perform with test after until event-found = 0
               call 'SDL_PollEvent' using by reference sdl-event
                   returning event-found
               evaluate true
                   when sdl-event-type-quit move 'Y' to done
               end-evaluate
           end-perform
           .
       dispose.
           call 'SDL_DestroyRenderer' using by value renderer
           call 'SDL_DestroyWindow' using by value win
           call 'SDL_Quit'
           goback
           .
       end program game.

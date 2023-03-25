       identification division.
       program-id. game.
       data division.
       working-storage section.
       copy sdl.
       01 done-flag pic x value space.
           88 done value 'Y'.
       01 event-found binary-long value 0.
       01 renderer usage pointer.
       01 win usage pointer.
       01 win-flags binary-long value 0.
       01 win-pos binary-long value 100.
       01 win-name pic x(32) value z'My Game'.
       01 win-size binary-long value 400.
       procedure division.
           perform init
           perform until done
               perform poll-events
               perform end-step
           end-perform
           perform dispose
           goback
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
           call 'SDL_PollEvent' using by reference sdl-event
               returning event-found
           .
       poll-events.
           perform poll-event
           perform until event-found = 0
               evaluate true
                   when sdl-event-type-quit set done to true
               end-evaluate
               perform poll-event
           end-perform
           .
       end-step.
           call 'SDL_RenderClear' using by value renderer
           call 'SDL_RenderPresent' using by value renderer
           call 'SDL_Delay' using by value 20
           .
       dispose.
           call 'SDL_DestroyRenderer' using by value renderer
           call 'SDL_DestroyWindow' using by value win
           call 'SDL_Quit'
           .
       end program game.

       identification division.
       program-id. game.
       data division.
       working-storage section.
           copy sdl.
           01 done-flag pic x value space.
               88 done value 'Y'.
           01 event-found binary-long value 0.
           01 player-texture usage pointer.
           01 renderer usage pointer.
           01 win usage pointer.
           01 win-flags binary-long value 0.
           01 win-pos binary-long value 100.
           01 win-name pic x(32) value z'My Game'.
           01 win-size binary-long value 700.
           copy sdl-rect replacing leading ==sdl== by ==src==.
           copy sdl-rect replacing leading ==sdl== by ==dst==.
       procedure division.
           perform init
           move 0 to src-rect-x src-rect-y dst-rect-x dst-rect-y
           move 60 to src-rect-w dst-rect-w
           move 80 to src-rect-h dst-rect-h
           perform until done
               perform poll-events
               perform end-step
               call 'SDL_RenderCopy' using
                   by value renderer player-texture
                   by content src-rect dst-rect
           end-perform
           perform dispose
           goback
           .
       init.
           call 'SDL_Init' using by value sdl-init-video
           call 'SDL_CreateWindow' using
              by content win-name
              by value win-pos 0 win-size 980 win-flags
              returning win
           call 'SDL_CreateRenderer' using
               by value win
      *        TODO How to pass a null pointer?
               by reference null
               by value sdl-renderer-accelerated
               returning renderer
           call 'loadBmp' using
               by content z'assets/character.bmp'
               by value renderer
               by reference player-texture
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

       identification division.
       program-id. load-texture.
       data division.
       working-storage section.
           01 path-nulled pic x(255).
           01 surface usage pointer.
       linkage section.
           01 path pic x(254).
           01 renderer usage pointer.
           01 texture usage pointer.
       procedure division.
      *    move function concatenate(path, x'00') to path-nulled
      *    call 'loadBmp' using by content path-nulled
      *        returning surface
      *    call 'SDL_CreateTextureFromSurface' using
      *        by value renderer surface
      *        returning texture
      *    call 'SDL_DestroySurface' using by value surface
      *    .
       end program load-texture.

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
           perform until done
               perform poll-events
               perform render
               perform end-step
           end-perform
           perform dispose
           goback
           .
       init.
           call 'SDL_Init' using by value sdl-init-video end-call
           call 'SDL_CreateWindow' using
              by content win-name
              by value win-pos 0 win-size 980 win-flags
              returning win
           end-call
           call 'SDL_CreateRenderer' using
               by value win
      *        -- TODO How to pass a null pointer? --
               by reference null
               by value sdl-renderer-accelerated
               returning renderer
           end-call
           call 'load-texture' using
               z'assets/player.bmp' renderer player-texture
           end-call
           move 0 to src-rect-x src-rect-y dst-rect-x dst-rect-y
           move 60 to src-rect-w dst-rect-w
           move 80 to src-rect-h dst-rect-h
           .
       poll-event.
           call 'SDL_PollEvent' using by reference sdl-event
               returning event-found
           end-call
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
       render.
           call 'SDL_RenderClear' using by value renderer end-call
           call 'SDL_RenderCopy' using
               by value renderer player-texture
               by content src-rect dst-rect
           end-call
           .
       end-step.
           call 'SDL_RenderPresent' using by value renderer end-call
           call 'SDL_Delay' using by value 20 end-call
           .
       dispose.
           call 'SDL_DestroyRenderer' using by value renderer end-call
           call 'SDL_DestroyWindow' using by value win end-call
           call 'SDL_Quit' end-call
           .
       end program game.

       identification division.
       program-id. load-texture.
       data division.
       working-storage section.
           01 surface usage pointer.
           01 rw usage pointer.
       linkage section.
      *    -- path must be null-terminated --
           01 path pic x(255).
           01 renderer usage pointer.
           01 texture usage pointer.
       procedure division using path renderer texture.
       begin.
      *    -- Can't just SDL_LoadBMP because it's a C macro ---
           call 'SDL_RWFromFile' using path z'rb' returning rw end-call
           call 'SDL_LoadBMP_RW' using by value rw 1
               returning surface
           end-call
           call 'SDL_CreateTextureFromSurface' using
               by value renderer surface
               returning texture
           end-call
           call 'SDL_FreeSurface' using by value surface end-call
           .
       end program load-texture.

       identification division.
       program-id. game.
       data division.
       working-storage section.
           copy sdl.
           copy game-control-data.
           copy game-resource-data.
       procedure division.
           perform init
           perform until done
               perform poll-events
               perform process-control
               perform render
               perform end-step
           end-perform
           perform dispose
           goback
           .
       dispose.
           call 'SDL_DestroyRenderer' using by value renderer
           call 'SDL_DestroyWindow' using by value win
           call 'SDL_Quit'
           .
       copy game-control.
       copy game-event.
       copy game-render.
       copy game-resource.
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
      *    -- Can't just SDL_LoadBMP because it's a C macro ---
           call 'SDL_RWFromFile' using path z'rb' returning rw
           call 'IMG_Load_RW' using by value rw 1
               returning surface
           end-call
           call 'SDL_CreateTextureFromSurface' using
               by value renderer surface
               returning texture
           end-call
           call 'SDL_FreeSurface' using by value surface
           .
       end program load-texture.

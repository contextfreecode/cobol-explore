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

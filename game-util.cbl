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

       identification division.
       program-id. format-time.
       data division.
      *working-storage section.
       linkage section.
           01 seconds pic 9(9)v9(2) packed-decimal.
           01 result.
               05 fmt-min pic z(6)9.
               05 sep pic x.
               05 fmt-sec pic 9(2).9(2).
       procedure division using seconds result.
           compute fmt-min = seconds / 60
           move ':' to sep
           compute fmt-sec = function rem(seconds, 60)
           .
       end program format-time.

       identification division.
       program-id. space-fill.
       data division.
       linkage section.
           01 seconds pic 9(9)v9(2) packed-decimal.
           01 result pic z(8)9.9(2).
       procedure division using seconds result.
           move seconds to result
           .
       end program space-fill.

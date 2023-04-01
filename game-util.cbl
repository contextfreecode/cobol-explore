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
       program-id. load-texture-data.
       data division.
       working-storage section.
           01 rw usage pointer.
       linkage section.
           01 dat-size binary-long.
           01 dat pic x(1000000).
           01 renderer usage pointer.
           01 texture usage pointer.
       procedure division using dat-size dat renderer texture.
           call 'showPointer' using by value rw
      *    call 'writeBinary' using
      *        by reference z'h.png' dat
      *        by value dat-size
           call 'SDL_RWFromConstMem' using
               by reference dat
               by value dat-size
               returning rw
           end-call
           call 'showPointer' using by value rw
           call 'IMG_LoadTexture_RW' using by value renderer rw 1
               returning texture
           end-call
           call 'showPointer' using by value texture
           .
       end program load-texture-data.

       identification division.
       program-id. format-time.
       data division.
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
           01 val pic 9(9)v9(2) packed-decimal.
           01 result pic z(8)9.9(2).
       procedure division using val result.
           move val to result
           .
       end program space-fill.

       identification division.
       program-id. draw-stat.
       data division.
       working-storage section.
           copy sdl-rect replacing leading ==sdl== by ==tile-src==.
           copy sdl-rect replacing leading ==sdl== by ==tile-dst==.
           78 txt-size value 80.
           01 digit binary-long.
           01 i binary-long.
           01 j binary-long.
           01 step-x binary-long.
       linkage section.
           01 txt pic x(txt-size).
           01 renderer usage pointer.
           01 texture usage pointer.
      *    The texture has fixed-width glyphs "0123456789.:".
           01 tile-w binary-long.
           01 tile-h binary-long.
           01 align pic x.
               88 align-left value 'L'.
               88 align-right value 'R'.
           01 x binary-long.
           01 y binary-long.
       procedure division
           using txt renderer texture tile-w tile-h align x y.
       main.
      *    display txt.
           perform init.
           perform walk.
           goback.
       init.
           move zero to tile-src-rect-y
           move x to tile-dst-rect-x
           move y to tile-dst-rect-y
           move tile-w to tile-src-rect-w tile-dst-rect-w step-x
           move tile-h to tile-src-rect-h tile-dst-rect-h
           if align-right then
               compute step-x = -step-x
               add step-x to tile-dst-rect-x
           end-if
           .
       walk.
           perform varying i from 1 by 1 until i > txt-size
               evaluate true
                   when align-left move i to j
                   when align-right compute j = txt-size - i + 1
               end-evaluate
               perform find-tile
               if txt(j:1) not = ' ' then
                   perform draw
                   add step-x to tile-dst-rect-x
               end-if
           end-perform
           .
       find-tile.
           evaluate txt(j:1)
               when '0' thru '9'
                   move txt(j:1) to digit
                   compute tile-src-rect-x = digit * tile-w
               when '.' compute tile-src-rect-x = 10 * tile-w
               when ':' compute tile-src-rect-x = 11 * tile-w
               when '<' compute tile-src-rect-x = 13 * tile-w
               when '>' compute tile-src-rect-x = 15 * tile-w
           end-evaluate
           .
       draw.
           call 'SDL_RenderCopy' using
               by value renderer texture
               by content tile-src-rect tile-dst-rect
           end-call
           .
       end program draw-stat.

       identification division.
       program-id. wrap-arrows.
       data division.
       linkage section.
           01 txt pic x(80).
       procedure division using txt.
           move function concatenate('<' function trim(txt) '>') to txt
           .
       end program wrap-arrows.

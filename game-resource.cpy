       init.
           call 'SDL_Init' using by value sdl-init-video
           call 'SDL_CreateWindow' using
              by content z'Fall Fast'
              by value 100 0 win-w win-h 0
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
               z'assets/ground.png' renderer ground-texture
           end-call
           call 'load-texture' using
               z'assets/player.png' renderer player-texture
           end-call
           compute ground-src-rect-x = 3 * tile-size
           move tile-size to
               ground-src-rect-w ground-src-rect-h
               ground-dst-rect-w ground-dst-rect-h
           move 96 to player-src-rect-w player-dst-rect-w
           move 128 to player-src-rect-h player-dst-rect-h
           compute player-src-rect-x = 8 * player-src-rect-w
           compute player-dst-rect-x = (win-w - player-src-rect-w) / 2
           .

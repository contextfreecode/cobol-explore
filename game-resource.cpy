       init.
           call 'SDL_Init' using by value sdl-init-video
           call 'SDL_CreateWindow' using
              by content z'Fall Fast'
              by value 100 0 700 980 0
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
               z'assets/player.png' renderer player-texture
           end-call
           move 0 to src-rect-x src-rect-y dst-rect-x dst-rect-y
           move 96 to src-rect-w dst-rect-w
           move 128 to src-rect-h dst-rect-h
           .

       dispose.
           call 'SDL_DestroyRenderer' using by value renderer
           call 'SDL_DestroyWindow' using by value win
           call 'SDL_Quit'
           .

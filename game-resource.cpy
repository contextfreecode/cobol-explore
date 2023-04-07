       init.
           perform init-random
           perform init-sdl
           perform init-texture
           perform init-rect
           perform init-stats
           .

       init-reset.
           perform init-rect
           perform init-stats
           .

       init-random.
           move function numval(function current-date(1:16)) to seed
           move function abs(seed) to seed
           move function random(seed) to random-value
           .

       init-sdl.
           call 'sdlInit' using by value sdl-init-video
           call 'sdlCreateWindow' using
              by content z'Fall Fast'
              by value 100 0; win-w win-h; 0
              returning win
           end-call
           call 'sdlCreateRenderer' using
               by value win
      *        -- TODO How to pass a null pointer? --
               by reference null
               by value sdl-renderer-accelerated
               returning renderer
           end-call
           call 'sdlSetRenderDrawBlendMode' using
               by value renderer 1
           end-call
           .

       init-texture.
           call 'loadTextureData' using
               by value renderer finish-asset-data-size
               by reference finish-asset-data
               returning finish-texture
           end-call
      *    call 'load-texture' using
      *        z'assets/font.png' renderer font-texture
      *    end-call
           call 'loadTextureData' using
               by value renderer font-asset-data-size
               by reference font-asset-data
               returning font-texture
           end-call
      *    call 'load-texture-data' using
      *        ground-asset-data ground-asset-data-size renderer
      *        ground-texture
      *    end-call
           call 'loadTextureData' using
               by value renderer ground-asset-data-size
               by reference ground-asset-data
               returning ground-texture
           end-call
           call 'loadTextureData' using
               by value renderer menu-asset-data-size
               by reference menu-asset-data
               returning menu-texture
           end-call
           call 'loadTextureData' using
               by value renderer player-asset-data-size
               by reference player-asset-data
               returning player-texture
           end-call
           call 'loadTextureData' using
               by value renderer wall-asset-data-size
               by reference wall-asset-data
               returning wall-texture
           end-call
           .

       init-rect.
           move zero to ground-row-index
           compute ground-src-rect-x = 4 * tile-size
           compute ground-src-rect-y = 4 * tile-size
           call 'sdlQueryTexture' using
               by value finish-texture
               by reference
                   null null finish-src-rect-w finish-src-rect-h
           end-call
           call 'sdlQueryTexture' using
               by value menu-texture
               by reference null null menu-src-rect-w menu-src-rect-h
           end-call
           move zero to
               finish-src-rect-x finish-src-rect-y
               menu-src-rect-x menu-src-rect-y
           move finish-src-rect-w to finish-dst-rect-w
           move finish-src-rect-h to finish-dst-rect-h
           compute finish-dst-rect-x = (win-w - finish-dst-rect-w) / 2
           compute finish-dst-rect-y = (win-h - finish-dst-rect-h) / 2
           move menu-src-rect-w to menu-dst-rect-w
           move menu-src-rect-h to menu-dst-rect-h
           compute menu-dst-rect-x = (win-w - menu-dst-rect-w) / 2
           compute menu-dst-rect-y = (win-h - menu-dst-rect-h) / 2
           move tile-size to
               ground-src-rect-w ground-src-rect-h
               ground-dst-rect-w ground-dst-rect-h
           move 96 to player-src-rect-w player-dst-rect-w
           move 128 to player-src-rect-h player-dst-rect-h
           compute player-src-rect-x = 8 * player-src-rect-w
           compute player-dst-rect-x = (game-w - player-src-rect-w) / 2
           compute player-dst-rect-y = 4 * tile-size - player-src-rect-h
           .

       init-stats.
           move zeros to distance decimal-time score
           set mode-init to true
           set option-time to true
           set step-frame-fall to true
           .

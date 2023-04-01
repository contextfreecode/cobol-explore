       render-menu.
           move zero to stat-rect-x stat-rect-y
           move win-w to stat-rect-w
           move win-h to stat-rect-h
           call 'SDL_SetRenderDrawColor' using
               by value renderer 0 0 0 180
           end-call
           call 'SDL_RenderFillRect' using
               by value renderer
               by content stat-rect
           end-call
           call 'SDL_RenderCopy' using
               by value renderer menu-texture
               by content menu-src-rect menu-dst-rect
           end-call
           perform render-options
           .

       render-stats.
           if mode-play then
               perform render-stats-bg
               perform render-stats-text
           end-if
           .

       render-stats-text.
           compute fmt-distance = distance / 70
           call 'space-fill' using score fmt-score
           call 'format-time' using decimal-time fmt-time
      *    display fmt-time ' ' fmt-distance
      *    perform render-text-fake
           move fmt-time to full-line
           call 'draw-stat' using
               full-line renderer font-texture
               font-tile-w font-tile-h 'L' font-tile-w 0
           end-call
           move fmt-distance to full-line
           compute stat-rect-x = win-w - font-tile-w
           call 'draw-stat' using
               full-line renderer font-texture
               font-tile-w font-tile-h 'R' stat-rect-x 0
           end-call
           .

       render-stats-bg.
           move zero to stat-rect-x stat-rect-y
           move win-w to stat-rect-w
           move font-tile-h to stat-rect-h
           call 'SDL_SetRenderDrawColor' using
               by value renderer 0 0 0 180
           end-call
           call 'SDL_RenderFillRect' using
               by value renderer
               by content stat-rect
           end-call
           .

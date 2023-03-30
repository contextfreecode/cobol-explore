       render-stats-bg.
           move zero to stat-rect-x stat-rect-y
           move win-w to stat-rect-w
           move 43 to stat-rect-h
           call 'SDL_SetRenderDrawColor' using
               by value renderer 0 0 0 180
           call 'SDL_RenderFillRect' using
               by value renderer
               by content stat-rect
           .

       render-stats.
           compute fmt-distance = distance / 70
           call 'space-fill' using score fmt-score
           call 'format-time' using decimal-time fmt-time
      *    display fmt-time ' ' fmt-distance
           perform render-stats-bg
      *    perform render-text-fake
           move fmt-time to full-line
           call 'draw-stat' using
               full-line renderer font-texture 19 43 'L' 19 0
           end-call
           move fmt-distance to full-line
           compute stat-rect-x = win-w - 19
           call 'draw-stat' using
               full-line renderer font-texture 19 43 'R' stat-rect-x 0
           end-call
           .

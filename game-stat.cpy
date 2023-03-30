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

       render-text-fake.
           move zero to stat-rect-x stat-rect-y
           move 228 to stat-rect-w
           move 43 to stat-rect-h
           call 'SDL_RenderCopy' using
               by value renderer font-texture
               by content stat-rect stat-rect
           .

       render-stats.
           compute fmt-distance = distance / 70
           call 'space-fill' using score fmt-score
           call 'format-time' using decimal-time fmt-time
      *    display fmt-time ' ' fmt-distance
           perform render-stats-bg
           perform render-text-fake
           .

       render-finish.
           perform render-menu-bg
           call 'sdlRenderCopy' using
               by value renderer finish-texture
               by content finish-src-rect finish-dst-rect
           end-call
           .

       render-menu-bg.
           move zero to stat-rect-x
           move font-tile-h to stat-rect-y
           move win-w to stat-rect-w
           move win-h to stat-rect-h
           call 'sdlSetRenderDrawColor' using
               by value renderer 0 0 0 180
           end-call
           call 'sdlRenderFillRect' using
               by value renderer
               by content stat-rect
           end-call
           .

       render-menu.
           perform render-menu-bg
           call 'sdlRenderCopy' using
               by value renderer menu-texture
               by content menu-src-rect menu-dst-rect
           end-call
           perform render-options
           .

       render-stats.
           perform render-stats-bg
           if mode-play or mode-finish then
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
           call 'sdlSetRenderDrawColor' using
               by value renderer 0 0 0 180
           end-call
           call 'sdlRenderFillRect' using
               by value renderer
               by content stat-rect
           end-call
           .

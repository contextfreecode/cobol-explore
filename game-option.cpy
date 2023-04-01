       render-option-distance.
           move '123' to full-line
      *    These are hand refined coordinates.
           compute stat-rect-x = menu-dst-rect-x + 279
           compute stat-rect-y = menu-dst-rect-y + 161
           call 'draw-stat' using
               full-line renderer font-texture
               font-tile-w font-tile-h 'L' stat-rect-x stat-rect-y
           end-call
           .

       render-option-time.
           move '123' to full-line
      *    These are hand refined coordinates.
           compute stat-rect-x = menu-dst-rect-x + 252
           compute stat-rect-y = menu-dst-rect-y + 106
           call 'draw-stat' using
               full-line renderer font-texture
               font-tile-w font-tile-h 'L' stat-rect-x stat-rect-y
           end-call
           .

       render-options.
           perform render-option-distance
           perform render-option-time
           .

       process-options.
           evaluate true
               when control-down set option-distance to true
               when control-up set option-time to true
           end-evaluate
           evaluate true
               when event-left
                   evaluate true
                       when option-distance
                           compute distance-limit = function max(
                               distance-limit - 1000, 0
                           )
                       when option-time
                           compute time-limit = function max(
                               time-limit - 60, 0
                           )
                   end-evaluate
               when event-right
                   evaluate true
                       when option-distance
                           add 1000 to distance-limit
                       when option-time
                           add 60 to time-limit
                   end-evaluate
           end-evaluate
           .

       render-option-distance.
           evaluate distance-limit
               when 0 move ' ' to full-line
               when other move distance-limit to full-line
           end-evaluate
           if option-distance call 'wrap-arrows' using full-line end-if
      *    These are hand refined coordinates.
           compute stat-rect-x = menu-dst-rect-x + 280
           compute stat-rect-y = menu-dst-rect-y + 161
           call 'draw-stat' using
               full-line renderer font-texture
               font-tile-w font-tile-h 'L' stat-rect-x stat-rect-y
           end-call
           .

       render-option-time.
           evaluate time-limit
               when 0 move ' ' to full-line
               when other
                   call 'format-time' using time-limit fmt-time
                   move fmt-time to full-line
                   move function substitute(full-line '.00' ' ')
                       to full-line
           end-evaluate
           if option-time call 'wrap-arrows' using full-line end-if
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

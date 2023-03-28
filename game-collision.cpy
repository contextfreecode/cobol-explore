       check-collision-foot.
           compute collision-offset-x =
               player-dst-rect-x + player-dst-rect-w / 2
               + collision-offset-x * (
                   player-dst-rect-w / 2 - collision-inset
               )
           compute collision-offset-y =
               player-dst-rect-y + player-dst-rect-h
           compute ground-render-row-index =
               ground-render-row-start
               + (collision-offset-y + ground-render-offset-y)
                   / tile-size
           compute ground-render-col-index =
               1 + collision-offset-x / tile-size
           move ground-cell(
               ground-render-row-index, ground-render-col-index
           ) to ground-gen
           if ground-gen-solid then set collision to true end-if
           .

       check-collision-feet.
           if ground-render-offset-y >= tile-size then
               move ' ' to collision-flag
               move -1 to collision-offset-x
               perform check-collision-foot
               if not collision
                       and player-dst-rect-x + player-dst-rect-w
                           < win-w then
                   move 1 to collision-offset-x
                   perform check-collision-foot
               end-if
           end-if
           .

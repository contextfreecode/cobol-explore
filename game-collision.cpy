       check-collision-foot.
           compute collision-offset-x =
               player-dst-rect-x
               + collision-offset-x * (player-dst-rect-w / 2 - 10)
               + player-dst-rect-w / 2
           compute collision-offset-y =
               player-dst-rect-y + player-dst-rect-h
           compute ground-render-row-index =
               ground-render-row-start
               + (collision-offset-y + ground-render-offset-y)
                   / tile-size
           compute ground-render-col-index = ground-render-col-index
           move ground-cell(
               ground-render-row-index, ground-render-col-index
           ) to ground-gen
           if ground-gen-solid then set collision to true end-if
           .

       check-collision-feet.
           move ' ' to collision-flag
           move -1 to collision-offset-x
           perform check-collision-foot
           if not collision then
               move 1 to collision-offset-x
               perform check-collision-foot
           end-if
           .

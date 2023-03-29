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
                           < game-w then
                   move 1 to collision-offset-x
                   perform check-collision-foot
               end-if
               if not collision
                   then set step-frame-fall to true
               end-if
               if collision and step-frame-fall then
                   set step-frame-land to true
               end-if
           end-if
           .

       move-things.
           add speed to ground-render-offset-y
           perform check-collision-feet
           if not collision then
               add 1 to collision-free-time
      *        display collision-free-time ' ' speed
               if collision-free-time > 10 and speed < 10 then
                   add 1 to speed
                   move zero to collision-free-time
               end-if
           end-if
           if collision then
               move tile-size to ground-render-offset-y
               move zero to collision-free-time speed
      *    Need more math if we can move more than a tile per frame.
           else if ground-render-offset-y >= tile-size or collision then
      *        Move ground up
               perform copy-row varying ground-render-row-index
                   from 1 by 1
      *            Don't copy *into* the last row.
                   until ground-render-row-index = ground-row-count
               subtract tile-size from ground-render-offset-y
               subtract 1 from ground-row-index
               perform ground-fill
      *        perform print-ground
           end-if
           .

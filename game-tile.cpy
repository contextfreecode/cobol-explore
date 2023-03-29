       check-ground-left.
           evaluate true
               when ground-render-col-index = 1
                   move ' ' to solid-left-flag
               when ground-solid(
                       ground-render-row-index,
                       ground-render-col-index - 1)
                   set solid-left to true
               when other move ' ' to solid-left-flag
           end-evaluate
           .

       check-ground-right.
           evaluate true
               when ground-render-col-index = ground-col-count
                   move ' ' to solid-right-flag
               when ground-solid(
                       ground-render-row-index,
                       ground-render-col-index + 1)
                   set solid-right to true
               when other move ' ' to solid-right-flag
           end-evaluate
           .

       choose-ground-tile.
           perform check-ground-left.
           perform check-ground-right.
           compute ground-src-rect-x = tile-size * 4
           evaluate true
               when ground-render-col-index = zero
                   compute ground-src-rect-x = tile-size * 1
                   compute ground-src-rect-y = tile-size * 6
               when ground-render-col-index = ground-col-count + 1
                   compute ground-src-rect-x = tile-size * 2
                   compute ground-src-rect-y = tile-size * 0
               when solid-left and solid-right
                   compute ground-src-rect-y = tile-size * 2
               when solid-left
                   compute ground-src-rect-y = tile-size * 1
               when solid-right
                   compute ground-src-rect-y = tile-size * 3
               when other
                   compute ground-src-rect-y = tile-size * 4
           end-evaluate
           .

       choose-player-tile.
           evaluate true
               when collision
                  compute player-src-rect-x = player-src-rect-w * 3
                  compute player-src-rect-y = player-src-rect-h * 0
               when other
                  compute player-src-rect-x = player-src-rect-w * 8
                  compute player-src-rect-y = player-src-rect-h * 0
           end-evaluate
           .

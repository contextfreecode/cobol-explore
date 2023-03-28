       copy-row.
           perform varying ground-render-col-index
               from 1 by 1
               until ground-render-col-index > ground-col-count
               move ground-cell(
                   ground-render-row-index + 1, ground-render-col-index
               ) to ground-cell(
                   ground-render-row-index, ground-render-col-index
               )
           end-perform
           .

       ground-cell-generate.
           move function random to random-value
           evaluate true
               when random-value < 0.05
                       and ground-row-index >
                           ground-render-row-start * 2
                   set ground-gen-solid to true
               when other set ground-gen-empty to true
           end-evaluate
      *    display 'gen ' ground-col-index ' ' ground-row-index
           move ground-gen
               to ground-cell(ground-row-index, ground-col-index)
           .

       ground-fill.
           perform varying ground-row-index from ground-row-index by 1
               until ground-row-index > ground-row-count
               after ground-col-index from 1 by 1
                   until ground-col-index > ground-col-count
               perform ground-cell-generate
           end-perform
           .

       move-things.
           add 5 to ground-render-offset-y
           perform check-collision-feet
           if collision then move 0 to ground-render-offset-y end-if
      *    Need more math if we can move more than a tile per frame.
           if ground-render-offset-y >= tile-size then
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

       process-control.
           perform move-things
           perform ground-fill
           perform process-player-control
           .

       process-player-control.
      *    if control-down add 10 to player-dst-rect-y end-if
           if control-left subtract 5 from player-dst-rect-x end-if
           if control-right add 5 to player-dst-rect-x end-if
      *    if control-up subtract 10 from player-dst-rect-y end-if
           .

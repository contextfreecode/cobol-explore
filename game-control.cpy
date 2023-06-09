       copy-row.
           perform varying ground-render-col-index
               from 1 by 1
               until ground-render-col-index > ground-col-count
               move ground-cell(
                   ground-render-row-index + 1, ground-render-col-index
               ) to ground-cell(
                   ground-render-row-index ground-render-col-index
               )
           end-perform
           .

       ground-cell-generate.
           move function random to random-value
           evaluate true
               when random-value < 0.05
                       and ground-row-index > ground-row-show-count * 2
                   set ground-gen-solid to true
               when other set ground-gen-empty to true
           end-evaluate
      *    display 'gen ' ground-col-index ' ' ground-row-index
           move ground-gen
               to ground-cell(ground-row-index ground-col-index)
           .

       ground-fill.
           perform varying ground-row-index from ground-row-index by 1
               until ground-row-index > ground-row-count
               after ground-col-index from 1 by 1
                   until ground-col-index > ground-col-count
               perform ground-cell-generate
           end-perform
           .

       process-control.
           perform ground-fill
           evaluate true
               when mode-init
                   perform process-options
               when mode-play
                   perform move-things
                   perform process-player-control
               when mode-finish
                   set mode-finish to true
           end-evaluate
           .

       process-player-control.
      *    if control-down add 10 to player-dst-rect-y end-if
      *    if control-up subtract 10 from player-dst-rect-y end-if
           if control-left then
               subtract 5 from player-dst-rect-x
               if player-dst-rect-x < -collision-inset then
                   compute player-dst-rect-x = -collision-inset
               end-if
               set direction-left to true
           end-if
           if control-right then
               add 5 to player-dst-rect-x
               if player-dst-rect-x + player-dst-rect-w
                       > game-w + collision-inset then
                   compute player-dst-rect-x = game-w + collision-inset
                       - player-dst-rect-w
               end-if
               set direction-right to true
           end-if
           if collision and (control-left or control-right) then
               evaluate true
                   when step-frame-walk
                       compute step-frame = function rem(
                           step-frame + 1, step-frame-count
                       )
                   when other
                       move zero to step-frame
               end-evaluate
           end-if
           .

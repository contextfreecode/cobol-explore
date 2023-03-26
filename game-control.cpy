       ground-cell-generate.
           move function random to random-value
           evaluate true
               when random-value < 0.15 set ground-gen-solid to true
               when other set ground-gen-empty to true
           end-evaluate
           move ground-gen
               to ground-cell(ground-col-index, ground-row-index)
           .

       ground-fill.
           perform varying ground-row-index from ground-row-index by 1
               until ground-row-index = ground-row-count + 1
               after ground-col-index from 1 by 1
                   until ground-col-index = ground-col-count + 1
               perform ground-cell-generate
           end-perform
           .

       process-control.
           perform ground-fill
           perform process-player-control
           .

       process-player-control.
           if control-down add 10 to player-dst-rect-y end-if
           if control-left subtract 5 from player-dst-rect-x end-if
           if control-right add 5 to player-dst-rect-x end-if
           if control-up subtract 10 from player-dst-rect-y end-if
           .

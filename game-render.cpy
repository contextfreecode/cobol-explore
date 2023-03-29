       render.
           call 'SDL_RenderClear' using by value renderer
           perform render-ground
           perform render-player
           .

       print-ground.
           perform varying ground-render-row-index from 1 by 1
               until ground-render-row-index > ground-row-count
               display ground-rows(ground-render-row-index) '|'
           end-perform
           display '---'
           .

       render-ground.
           perform varying ground-render-row-index
               from ground-render-row-start by 1
               until ground-render-row-index >
                       ground-render-row-start
                       + ground-row-show-count + 2
                   or ground-render-row-index > ground-row-count
               perform render-ground-row
           end-perform
           .

       render-ground-cell.
           move ground-cell(
               ground-render-row-index, ground-render-col-index
           ) to ground-gen
           if ground-gen-solid then
               compute ground-dst-rect-x =
                   ground-render-col-index * tile-size
               perform choose-ground-tile
               call 'SDL_RenderCopy' using
                   by value renderer ground-texture
                   by content ground-src-rect ground-dst-rect
           end-if
           .

       render-ground-row.
           compute ground-dst-rect-y = (
                   ground-render-row-index - ground-render-row-start
               ) * tile-size
               - ground-render-offset-y
           perform render-ground-wall-left
           perform render-ground-wall-right
           perform render-ground-cell varying ground-render-col-index
               from 1 by 1
               until ground-render-col-index > ground-col-count
           .

       render-ground-wall-left.
           compute ground-src-rect-x = tile-size * 2
           compute ground-src-rect-y = tile-size * 0
           move zero to ground-dst-rect-x
           call 'SDL_RenderCopy' using
               by value renderer wall-texture
               by content ground-src-rect ground-dst-rect
           .

       render-ground-wall-right.
           compute ground-src-rect-x = tile-size * 2
           compute ground-src-rect-y = tile-size * 1
           compute ground-dst-rect-x =
               ground-render-col-index * tile-size
           call 'SDL_RenderCopy' using
               by value renderer wall-texture
               by content ground-src-rect ground-dst-rect
           .

       render-player.
           add tile-size to player-dst-rect-x
           perform choose-player-tile
           call 'SDL_RenderCopy' using
               by value renderer player-texture
               by content player-src-rect player-dst-rect
           end-call
           subtract tile-size from player-dst-rect-x
           .

       end-step.
           call 'SDL_RenderPresent' using by value renderer
           call 'SDL_Delay' using by value 10
           .

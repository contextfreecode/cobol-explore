       render.
           call 'SDL_RenderClear' using by value renderer
           perform render-ground
           perform render-player
           .

       render-ground.
           perform varying ground-render-row-index
               from ground-render-row-start by 1
               until ground-render-row-index =
                   ground-render-row-start + ground-row-show-count + 1
               perform render-ground-row
           end-perform
           .

       render-ground-cell.
           move ground-cell(
               ground-render-col-index, ground-render-row-index
           ) to ground-gen
           if ground-gen-solid then
               compute ground-dst-rect-x =
                   ground-render-col-index * tile-size
               compute ground-dst-rect-y =
                   (ground-render-row-index - ground-render-row-start)
                   * tile-size
               call 'SDL_RenderCopy' using
                   by value renderer ground-texture
                   by content ground-src-rect ground-dst-rect
           end-if
           .

       render-ground-row.
           perform render-ground-cell varying ground-render-col-index
               from 1 by 1
               until ground-render-col-index = ground-col-count + 1
           .

       render-player.
           call 'SDL_RenderCopy' using
               by value renderer player-texture
               by content player-src-rect player-dst-rect
           end-call
           .

       end-step.
           call 'SDL_RenderPresent' using by value renderer
           call 'SDL_Delay' using by value 10
           .

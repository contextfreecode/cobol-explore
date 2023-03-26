       render.
           call 'SDL_RenderClear' using by value renderer
           call 'SDL_RenderCopy' using
               by value renderer player-texture
               by content src-rect dst-rect
           end-call
           .

       end-step.
           call 'SDL_RenderPresent' using by value renderer
           call 'SDL_Delay' using by value 10
           .

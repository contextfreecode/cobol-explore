       identification division.
       program-id. game.
       data division.
       working-storage section.
           copy sdl.
           copy sdl-rect replacing leading ==sdl== by ==src==.
           copy sdl-rect replacing leading ==sdl== by ==dst==.

           01 control-fields.
               05 control-down-flag pic x value space.
                   88 control-down value 'Y'.
               05 control-left-flag pic x value space.
                   88 control-left value 'Y'.
               05 control-right-flag pic x value space.
                   88 control-right value 'Y'.
               05 control-up-flag pic x value space.
                   88 control-up value 'Y'.

           01 done-flag pic x value space.
               88 done value 'Y'.

           01 event-found binary-long value 0.
           01 player-texture usage pointer.
           01 renderer usage pointer.
           01 win usage pointer.

       procedure division.
       main.
           perform init
           perform until done
               perform poll-events
               perform process-control
               perform render
               perform end-step
           end-perform
           perform dispose
           goback
           .

       init.
           call 'SDL_Init' using by value sdl-init-video
           call 'SDL_CreateWindow' using
              by content z'Fall Fast'
              by value 100 0 700 980 0
              returning win
           end-call
           call 'SDL_CreateRenderer' using
               by value win
      *        -- TODO How to pass a null pointer? --
               by reference null
               by value sdl-renderer-accelerated
               returning renderer
           end-call
           call 'load-texture' using
               z'assets/player.png' renderer player-texture
           end-call
           move 0 to src-rect-x src-rect-y dst-rect-x dst-rect-y
           move 96 to src-rect-w dst-rect-w
           move 128 to src-rect-h dst-rect-h
           .

       poll-event.
           call 'SDL_PollEvent' using by reference sdl-event
               returning event-found
           end-call
           .

       poll-events.
           perform poll-event
           perform until event-found = 0
               evaluate true
                   when sdl-event-type-keydown perform process-keydown
                   when sdl-event-type-keyup perform process-keyup
                   when sdl-event-type-quit set done to true
               end-evaluate
               perform poll-event
           end-perform
           .

       process-control.
           if control-down add 10 to dst-rect-y end-if
           if control-left subtract 5 from dst-rect-x end-if
           if control-right add 5 to dst-rect-x end-if
           if control-up subtract 5 from dst-rect-y end-if
           .

       process-keydown.
      *    display 'keydown '
      *        sdl-event-key-scancode ' ' sdl-event-key-keycode
           evaluate true
               when sdl-scancode-down set control-down to true
               when sdl-scancode-left set control-left to true
               when sdl-scancode-right set control-right to true
               when sdl-scancode-up set control-up to true
           end-evaluate
           .

       process-keyup.
           evaluate true
               when sdl-scancode-down move space to control-down-flag
               when sdl-scancode-left move space to control-left-flag
               when sdl-scancode-right move space to control-right-flag
               when sdl-scancode-up move space to control-up-flag
           end-evaluate
           .

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

       dispose.
           call 'SDL_DestroyRenderer' using by value renderer
           call 'SDL_DestroyWindow' using by value win
           call 'SDL_Quit'
           .
       end program game.


       identification division.
       program-id. load-texture.
       data division.
       working-storage section.
           01 surface usage pointer.
           01 rw usage pointer.
       linkage section.
      *    -- path must be null-terminated --
           01 path pic x(255).
           01 renderer usage pointer.
           01 texture usage pointer.
       procedure division using path renderer texture.
       main.
      *    -- Can't just SDL_LoadBMP because it's a C macro ---
           call 'SDL_RWFromFile' using path z'rb' returning rw
           call 'IMG_Load_RW' using by value rw 1
               returning surface
           end-call
           call 'SDL_CreateTextureFromSurface' using
               by value renderer surface
               returning texture
           end-call
           call 'SDL_FreeSurface' using by value surface
           .
       end program load-texture.

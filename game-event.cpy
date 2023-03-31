       poll-event.
           call 'SDL_PollEvent' using by reference sdl-event
               returning event-found
           end-call
           .

       poll-events.
           perform poll-event
           perform until event-found = 0
               evaluate true
      *            TODO Mouse/touch events for mobile!
                   when sdl-event-type-keydown perform process-keydown
                   when sdl-event-type-keyup perform process-keyup
                   when sdl-event-type-quit set done to true
               end-evaluate
               perform poll-event
           end-perform
           .

       process-keydown.
           evaluate true
               when sdl-scancode-escape
                   perform init-reset
               when sdl-scancode-enter or sdl-scancode-return
                   if mode-init then set mode-play to true end-if
               when sdl-scancode-down set control-down to true
               when sdl-scancode-left set control-left to true
               when sdl-scancode-a set control-left to true
               when sdl-scancode-right set control-right to true
               when sdl-scancode-d set control-right to true
               when sdl-scancode-up set control-up to true
           end-evaluate
           .

       process-keyup.
           evaluate true
               when sdl-scancode-down move space to control-down-flag
               when sdl-scancode-left move space to control-left-flag
               when sdl-scancode-a move space to control-left-flag
               when sdl-scancode-right move space to control-right-flag
               when sdl-scancode-d move space to control-right-flag
               when sdl-scancode-up move space to control-up-flag
           end-evaluate
           .

       01 sdl-event pic x(128).
       01 sdl-event-type redefines sdl-event binary-long.
           88 sdl-event-type-quit value 256.
           88 sdl-event-type-keydown value 768.
           88 sdl-event-type-keyup value 769.
       01 sdl-event-keyboard redefines sdl-event.
           05 sdl-event-key-type binary-long.
           05 sdl-event-key-timestamp binary-long.
           05 sdl-event-key-window-id binary-long.
           05 sdl-event-key-state binary-char.
           05 sdl-event-key-repeat binary-char.
           05 sdl-event-key-padding1 binary-char.
           05 sdl-event-key-padding2 binary-char.
           05 sdl-event-key-sym.
               10 sdl-event-key-scancode binary-long.
                   88 sdl-scancode-a value 4.
                   88 sdl-scancode-d value 7.
                   88 sdl-scancode-return value 40.
                   88 sdl-scancode-escape value 41.
                   88 sdl-scancode-right value 79.
                   88 sdl-scancode-left value 80.
                   88 sdl-scancode-down value 81.
                   88 sdl-scancode-up value 82.
                   88 sdl-scancode-enter value 88.
               10 sdl-event-key-keycode binary-long.
               10 sdl-event-key-mod binary-short.
               10 sdl-event-key-unused binary-long.

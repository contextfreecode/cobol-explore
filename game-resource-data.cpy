           01 ground-texture usage pointer.
           01 player-texture usage pointer.
           01 wall-texture usage pointer.

           01 renderer usage pointer.
           01 seed binary-long.
           78 tile-size value 70.
           01 win usage pointer.
           78 win-h value 980.
           78 win-w value tile-size * (ground-col-count + 2).
           78 game-w value tile-size * ground-col-count.
           copy sdl-rect replacing leading ==sdl== by ==ground-src==.
           copy sdl-rect replacing leading ==sdl== by ==ground-dst==.
           copy sdl-rect replacing leading ==sdl== by ==player-src==.
           copy sdl-rect replacing leading ==sdl== by ==player-dst==.

           01 solid-sides.
               05 solid-left-flag pic x value ' '.
                   88 solid-left value 'Y'.
               05 solid-right-flag pic x value ' '.
                   88 solid-right value 'Y'.

           78 step-frame-actual-count value 8.
           78 step-frame-factor value 4.
           78 step-frame-count value
               step-frame-actual-count * step-frame-factor.
           01 step-frame-actual binary-long.
           01 step-frame binary-long value -2.
               88 step-frame-fall value -2.
               88 step-frame-land value -1.
               88 step-frame-walk value 0 thru step-frame-count - 1.

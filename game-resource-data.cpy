           01 finish-texture usage pointer.
           01 font-texture usage pointer.
           01 ground-texture usage pointer.
           01 menu-texture usage pointer.
           01 player-texture usage pointer.
           01 wall-texture usage pointer.

           copy game-asset-finish.
           copy game-asset-font.
           copy game-asset-ground.
           copy game-asset-menu.
           copy game-asset-player.
           copy game-asset-wall.

           01 renderer usage pointer.
           01 seed binary-long.
           78 tile-size value 70.
           01 win usage pointer.
           78 win-h value 980.
           78 win-w value tile-size * (ground-col-count + 2).
           78 game-w value tile-size * ground-col-count.
           copy sdl-rect replacing leading ==sdl== by ==finish-src==.
           copy sdl-rect replacing leading ==sdl== by ==finish-dst==.
           copy sdl-rect replacing leading ==sdl== by ==ground-src==.
           copy sdl-rect replacing leading ==sdl== by ==ground-dst==.
           copy sdl-rect replacing leading ==sdl== by ==menu-src==.
           copy sdl-rect replacing leading ==sdl== by ==menu-dst==.
           copy sdl-rect replacing leading ==sdl== by ==player-src==.
           copy sdl-rect replacing leading ==sdl== by ==player-dst==.
           copy sdl-rect replacing leading ==sdl== by ==stat==.

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
           01 direction-flag binary-long value 0.
               88 direction-left value 1.
               88 direction-right value 0.

           01 angle float-long value 0.0.

           78 font-tile-w value 29.
           78 font-tile-h value 64.

           01 formatted-stats.
               05 fmt-distance pic z(8)9.
               05 fmt-score pic x(12).
               05 fmt-time pic x(13).

           01 full-line pic x(80) value spaces.

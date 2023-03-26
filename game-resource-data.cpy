           01 ground-texture usage pointer.
           01 player-texture usage pointer.
           01 renderer usage pointer.
           01 seed binary-long.
           78 tile-size value 70.
           01 win usage pointer.
           78 win-h value 980.
           78 win-w value 700.
           copy sdl-rect replacing leading ==sdl== by ==ground-src==.
           copy sdl-rect replacing leading ==sdl== by ==ground-dst==.
           copy sdl-rect replacing leading ==sdl== by ==player-src==.
           copy sdl-rect replacing leading ==sdl== by ==player-dst==.

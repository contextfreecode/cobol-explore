```
cobc -x hi.cbl help.c -Os && ./hi

python game_gen_asset_data.py && \
    cobc -x game.cbl sdl.c -Wall -lSDL2 -lSDL2_image \
        -Os -fliteral-length=200000 && \
    ./game
```

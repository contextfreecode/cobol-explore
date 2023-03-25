#include <SDL2/SDL.h>
#include <SDL2/SDL_main.h>

void dontCallMe(void) {
    // Just need anything to make sdl available.
    SDL_Init(0);
}

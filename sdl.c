#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_main.h>
#include <stdio.h>

void dontCallMe(void) {
    // Just need anything to make sdl available.
    SDL_Init(0);
    IMG_Load("");
}

void showPointer(void* pointer) {
    printf("%p\n", pointer);
}

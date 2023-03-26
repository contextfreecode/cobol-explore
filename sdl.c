#include <SDL2/SDL.h>
#include <SDL2/SDL_main.h>
#include <stdio.h>

void dontCallMe(void) {
    // Just need anything to make sdl available.
    SDL_Init(0);
    SDL_Surface* surface = SDL_LoadBMP("whatever");
    SDL_FreeSurface(surface);
}

SDL_Surface* loadBmpAsSurface(const char* path) {
    return SDL_LoadBMP(path);
}

void renderTexture(
    SDL_Renderer* renderer, SDL_Texture* texture, SDL_Rect* src, SDL_Rect* dst
) {
    SDL_RenderCopy(renderer, texture, src, dst);
}

void showPointer(void* pointer) {
    printf("%p\n", pointer);
}

#include <SDL2/SDL.h>
#include <SDL2/SDL_main.h>

void dontCallMe(void) {
    // Just need anything to make sdl available.
    SDL_Init(0);
    SDL_Surface* surface = SDL_LoadBMP("whatever");
    SDL_FreeSurface(surface);
}

SDL_Texture* loadBmp(const char* path, SDL_Renderer* renderer) {
    SDL_Surface* surface = SDL_LoadBMP(path);
    SDL_Texture* texture = SDL_CreateTextureFromSurface(renderer, surface);
    SDL_FreeSurface(surface);
    return texture;
}

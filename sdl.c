#include <SDL2/SDL.h>
#include <SDL2/SDL_main.h>
#include <stdio.h>

void dontCallMe(void) {
    // Just need anything to make sdl available.
    SDL_Init(0);
    SDL_Surface* surface = SDL_LoadBMP("whatever");
    SDL_FreeSurface(surface);
}

SDL_Texture* loadBmp(const char* path, SDL_Renderer* renderer) {
    SDL_Surface* surface = SDL_LoadBMP(path);
    SDL_Texture* texture = SDL_CreateTextureFromSurface(renderer, surface);
    printf("path %s\n", path);
    printf("surface %p texture %p\n", surface, texture);
    SDL_FreeSurface(surface);
    return texture;
}

void renderTexture(
    SDL_Renderer* renderer, SDL_Texture* texture, SDL_Rect* src, SDL_Rect* dst
) {
    printf("renderer %p texture %p\n", renderer, texture);
    printf("src %d %d %d %d\n", src->x, src->y, src->w, src->h);
    printf("dst %d %d %d %d\n", dst->x, dst->y, dst->w, dst->h);
    SDL_RenderCopy(renderer, texture, src, dst);
}

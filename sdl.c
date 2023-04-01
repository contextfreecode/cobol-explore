#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_main.h>
#include <stdio.h>

void dontCallMe(void) {
    // Just need anything to make sdl available.
    SDL_Init(0);
    IMG_Load("");
}

// void writeBinary(const char* name, const void* data, int size) {
//     FILE* output = fopen(name, "wb");
//     fwrite(data, size, 1, output);
//     fclose(output);
// }

void showPointer(void* pointer) {
    printf("%p\n", pointer);
}

SDL_Texture* loadTextureData(
    SDL_Renderer* renderer, int size, const void* data
) {
    SDL_RWops* rw = SDL_RWFromConstMem(data, size);
    return IMG_LoadTexture_RW(renderer, rw, 1);
}

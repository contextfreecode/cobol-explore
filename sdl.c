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

// Duplicated to see if that gets us working in emscripten.

SDL_Renderer* sdlCreateRenderer(SDL_Window* window, int index, Uint32 flags) {
    return SDL_CreateRenderer(window, index, flags);
}

SDL_Texture* sdlCreateTextureFromSurface(
    SDL_Renderer* renderer, SDL_Surface* surface
) {
    return SDL_CreateTextureFromSurface(renderer, surface);
}

SDL_Window* sdlCreateWindow(
    const char* title, int x, int y, int w, int h, Uint32 flags
) {
    return SDL_CreateWindow(title, x, y, w, h, flags);
}

void sdlDelay(Uint32 ms) {
    SDL_Delay(ms);
}

void sdlDestroyRenderer(SDL_Renderer* renderer) {
    SDL_DestroyRenderer(renderer);
}

void sdlDestroyWindow(SDL_Window* window) {
    SDL_DestroyWindow(window);
}

void sdlFreeSurface(SDL_Surface* surface) {
    SDL_FreeSurface(surface);
}

Uint32 sdlGetTicks(void) {
    return SDL_GetTicks();
}

int sdlInit(Uint32 flags) {
    return SDL_Init(flags);
}

int sdlPollEvent(SDL_Event* event) {
    return SDL_PollEvent(event);
}

int sdlQueryTexture(
    SDL_Texture* texture, Uint32* format, int* access, int* w, int* h
) {
    return SDL_QueryTexture(texture, format, access, w, h);
}

void sdlQuit(void) {
    SDL_Quit();
}

int sdlRenderClear(SDL_Renderer* renderer) {
    return SDL_RenderClear(renderer);
}

int sdlRenderCopy(
    SDL_Renderer* renderer,
    SDL_Texture* texture,
    const SDL_Rect* srcrect,
    const SDL_Rect * dstrect
) {
    return SDL_RenderCopy(renderer, texture, srcrect, dstrect);
}

int sdlRenderCopyEx(
    SDL_Renderer* renderer,
    SDL_Texture* texture,
    const SDL_Rect* srcrect,
    const SDL_Rect* dstrect,
    const double angle,
    const SDL_Point* center,
    const SDL_RendererFlip flip
) {
    return SDL_RenderCopyEx(
        renderer, texture, srcrect, dstrect, angle, center, flip
    );
}

int sdlRenderFillRect(SDL_Renderer* renderer, const SDL_Rect* rect) {
    return SDL_RenderFillRect(renderer, rect);
}

void sdlRenderPresent(SDL_Renderer* renderer) {
    SDL_RenderPresent(renderer);
}

SDL_RWops* sdlRWFromConstMem(const void* mem, int size) {
    return SDL_RWFromConstMem(mem, size);
}

SDL_RWops* sdlRWFromFile(const char* file, const char* mode) {
    return SDL_RWFromFile(file, mode);
}

int sdlSetRenderDrawBlendMode(
    SDL_Renderer* renderer, SDL_BlendMode blendMode
) {
    return SDL_SetRenderDrawBlendMode(renderer, blendMode);
}

int sdlSetRenderDrawColor(
    SDL_Renderer* renderer, Uint8 r, Uint8 g, Uint8 b, Uint8 a
) {
    return SDL_SetRenderDrawColor(renderer, r, g, b, a);
}

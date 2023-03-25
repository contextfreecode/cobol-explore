#include <SDL2/SDL.h>
#include <SDL2/SDL_main.h>
#include <stdio.h>

void pollEvent(void) {
    SDL_Event event;
    SDL_PollEvent(&event);
    printf("event type: %d\n", event.type);
}

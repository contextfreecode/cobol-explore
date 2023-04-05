FROM cobol-js-emscripten

RUN echo | emcc -s USE_SDL=2 -s USE_SDL_IMAGE=2 -E - -o /dev/null

#!/bin/bash

set -e

# Define C intermediate and js/wasm output dirs
build_c_dir=tmp/build
build_js_dir=app/cobol-js/

# Create these directories if they don't exist
mkdir -p $build_js_dir $build_c_dir

# Define list of functions to expose from c/extern.c
functions="-K emscripten_sleep -K setElementProperty -K startup"

# Define C intermediate and js output paths
build_c=$build_c_dir/build.c
build_js=$build_js_dir/index.js

echo ""
echo ">>> Transpiling COBOL -> C ..."
cobc $functions -fliteral-length=200000 -C -x game.cbl sdl.c

echo ">>> Compiling C -> WASM + JS ..."
tput setaf 3 # Set font to yellow
emcc \
  game.c \
  sdl.c \
  /root/opt/lib/libgmp.a `# Include Gnu multiprecision library llvm build` \
  /root/opt/lib/libcob.a `# Link in gnucobol's libcob llvm build` \
  -L/usr/local/include \
  -I/usr/local/include \
  -lSDL2 \
  -lSDL2_image \
  -s USE_SDL=2 \
  -s USE_SDL_IMAGE=2 \
  -s ERROR_ON_UNDEFINED_SYMBOLS=0 \
  -s ASYNCIFY \
  -s EXPORTED_RUNTIME_METHODS=['UTF8ToString'] \
  -s EXPORTED_FUNCTIONS=_loadTextureData \
  -s EXPORT_ALL=1 \
  --minify 0 `# Disable JS minify - This allows the sed commands to below operate correctly` \
  -O2 \
  -o $build_js 
tput sgr 0  # Reset font color

echo ">>> Commenting out all dlopen JS callbacks"
sed -i '/dlopenMissingError/s/^/\/\//' $build_js

echo ">>> Commenting out all stub JS callbacks"
sed -i '/Calling stub instead/s/^/\/\//' $build_js

echo "$(tput setaf 2)>>> Build Complete!$(tput sgr 0)"

#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
mkdir -p build dist

x86_64-w64-mingw32-windres \
  -I src \
  src/resources.rc \
  build/resources.o

x86_64-w64-mingw32-g++ \
  -std=c++17 -O2 -DNDEBUG -municode -mwindows \
  -Wall -Wextra -Wpedantic \
  -ffunction-sections -fdata-sections \
  src/main.cpp build/resources.o \
  -o dist/Exusiai.build.exe \
  -Wl,--gc-sections -Wl,--subsystem,windows \
  -static -static-libgcc -static-libstdc++ \
  -lole32 -luuid -lwindowscodecs -lshlwapi -lgdi32 -luser32 -lwinmm -lcomctl32

x86_64-w64-mingw32-strip --strip-unneeded dist/Exusiai.build.exe

if [[ "$(od -An -c -N2 dist/Exusiai.build.exe | tr -d ' ')" != "MZ" ]]; then
  echo "Build failed: output is not a valid Windows executable." >&2
  exit 1
fi

mv -f dist/Exusiai.build.exe dist/Exusiai.exe
sha256sum dist/Exusiai.exe > dist/Exusiai.exe.sha256

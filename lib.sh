#!/bin/sh
is_win=0
if [ "$(uname -o)" = "Msys" ]; then
	is_win=1
fi
vcpkg_exe=vcpkg
extra=
if [ $is_win -eq 1 ]; then
	vcpkg_exe=vcpkg.exe
	extra=pthreads
fi

cd vcpkg
if [ ! -f "$vcpkg_exe" ]; then
	./bootstrap-vcpkg.sh
fi

./vcpkg install zlib bzip2 miniupnpc freetype zstd sdl2 $extra

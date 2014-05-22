# This just shortcuts stuff through to cmake
all build ctwm install clean: build/Makefile
	( cd build && ${MAKE} ${@} )

build/Makefile cmake: CMakeLists.txt
	( cd build && cmake -DCMAKE_C_FLAGS:STRING="${CFLAGS}" .. )

allclean:
	rm -rf build/*

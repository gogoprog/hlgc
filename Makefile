haxe:
	haxe build.hxml

native: haxe
	gcc \
	-o out/main \
	-L ${HL}/build/bin \
	-I out/ \
	-I ${HL}/src \
	-funwind-tables -fPIC -Wno-tentative-definition-incomplete-type \
	-fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes \
	-std=c11 \
	-DHL_MOBILE=1 \
	-DHL_NO_THREADS \
	out/main.c \
	${HL}/src/code.c \
	${HL}/src/debugger.c \
	${HL}/src/gc.c \
	${HL}/src/std/array.c \
	${HL}/src/std/error.c \
	${HL}/src/std/process.c \
	${HL}/src/std/sys_android.c ${HL}/src/std/buffer.c \
	${HL}/src/std/file.c \
	${HL}/src/std/random.c \
	${HL}/src/std/thread.c ${HL}/src/std/bytes.c \
	${HL}/src/std/fun.c \
	${HL}/src/std/regexp.c \
	${HL}/src/std/track.c ${HL}/src/std/cast.c \
	${HL}/src/std/maps.c \
	${HL}/src/std/socket.c \
	${HL}/src/std/types.c ${HL}/src/std/date.c \
	${HL}/src/std/math.c \
	${HL}/src/std/string.c \
	${HL}/src/std/ucs2.c ${HL}/src/std/debug.c \
	${HL}/src/std/obj.c \
	${HL}/src/std/sys.c \
	${HL}/include/pcre/*.c \
	-lpthread \
	-lpcre \
	-lm \
	-O3
	



run: native
	LD_LIBRARY_PATH=${HL}/build/bin out/main




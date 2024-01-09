haxe:
	haxe build.hxml

native: haxe
	gcc out/main.c -o out/main -L ${HL}/build/bin -lhl -I out/ -I ${HL}/src

run: native
	LD_LIBRARY_PATH=${HL}/build/bin out/main




all:
	lt-comp lr apertium-kv-ru.ru.dix ru-kv.automorf.bin apertium-kv-ru.ru.acx
	lt-comp lr apertium-kv-ru.kv-ru.dix kv-ru.autobil.bin
	lt-comp rl apertium-kv-ru.kv-ru.dix ru-kv.autobil.bin
	cg-comp apertium-kv-ru.ru-kv.rlx ru-kv.rlx.bin
	cg-comp apertium-kv-ru.kv-ru.rlx kv-ru.rlx.bin

	apertium-validate-transfer apertium-kv-ru.kv-ru.t1x
	apertium-preprocess-transfer apertium-kv-ru.kv-ru.t1x kv-ru.t1x.bin
	apertium-validate-interchunk apertium-kv-ru.kv-ru.t2x
	apertium-preprocess-transfer apertium-kv-ru.kv-ru.t2x kv-ru.t2x.bin
	apertium-validate-postchunk apertium-kv-ru.kv-ru.t3x
	apertium-preprocess-transfer apertium-kv-ru.kv-ru.t3x kv-ru.t3x.bin


	apertium-gen-modes modes.xml
	cp *.mode modes/

cd $HOME/Documents/github/zmk/app/
if [ "$1" = "left" ]; then
	BUILD_LEFT=1
	BUILD_RIGHT=0
elif [ "$1" = "right" ]; then
	BUILD_LEFT=0
	BUILD_RIGHT=1
else
	BUILD_LEFT=1
	BUILD_RIGHT=1
fi

if [ $BUILD_LEFT -eq 1 ]; then
	if [ -d build/left ]; then
		west build -d build/left
	else
		west build -d build/left -b nice_nano_v2 -- -DSHIELD=rollow_left -DZMK_CONFIG=$HOME/Documents/github/zmk-config/config
	fi
	echo "Waiting for left device"
	until [ -d /run/media/theol/NICENANO ]; do
		sleep 1
	done
	echo "Flashing"
	cp build/left/zephyr/zmk.uf2 /run/media/theol/NICENANO
fi

if [ $BUILD_RIGHT -eq 1 ]; then
	if [ -d build/right ]; then
		west build -d build/right
	else
		west build -d build/right -b nice_nano_v2 -- -DSHIELD=rollow_right -DZMK_CONFIG=$HOME/Documents/github/zmk-config/config
	fi
	echo "Waiting for right device"
	until [ -d /run/media/theol/NICENANO ]; do
		sleep 1
	done
	echo "Flashing"
	cp build/right/zephyr/zmk.uf2 /run/media/theol/NICENANO
fi

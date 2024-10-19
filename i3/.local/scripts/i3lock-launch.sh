SCREEN_RESOLUTION="$(xdpyinfo | grep dimensions | cut -d' ' -f7)"
BGCOLOR="#121011"
magick "/home/eeli/Pictures/Bgs/blackhole.jpeg" -gravity Center -background $BGCOLOR -resize "$SCREEN_RESOLUTION" -extent "$SCREEN_RESOLUTION" RGB:- | i3lock --raw=$SCREEN_RESOLUTION:rgb -c $BGCOLOR -i /dev/stdin

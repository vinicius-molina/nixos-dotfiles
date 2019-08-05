
#!/bin/bash
pkill -f animatedWallpaper &
wait
pkill -f feh
exec -a animatedWallpaper xwinwrap -fs -ni -s -ov -- mpv -wid WID $1


#!/bin/bash
if [[ "$FEH_SLIDES" -ne 1 ]]; then
  pkill -f animatedWallpaper &
  wait
  FEH_SLIDES=1
  while true; do 
    feh --recursive --randomize --bg-fill ~/wallpapers
    sleep 5
  done
fi

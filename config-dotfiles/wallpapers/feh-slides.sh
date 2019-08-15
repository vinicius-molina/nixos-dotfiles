# for restart
if [[ `ps h -C bash -o cmd= | grep -c feh-slides` -gt 0 ]]; then
  pkill -f feh-slides & wait
fi

# kill wallpaper animated
if [[ `ps -Al | grep -c xwinwrap` -gt 0 ]]; then
  pkill xwinwrap & wait
fi

( exec -a "feh-slides" bash ) <<EOF &
{
  SCRIPT=$(readlink -f "$0")

  while true; do
    feh --recursive --randomize --bg-fill ~/wallpapers/
    sleep 5
  done
}
EOF

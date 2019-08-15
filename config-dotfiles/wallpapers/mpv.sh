SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

if [[ $# -lt 1 ]]; then
  echo "Is necessary the animated wallpaper"
  echo "Ex: mpv.sh animation.mp4"
  exit 1
fi

if [[ `ps h -C bash -o cmd= | grep -c feh-slides` -gt 0 ]]; then
  pkill -f feh-slides & wait
fi

# workaround of the bug from feh, where the last background stay
feh --bg-fill "$SCRIPTPATH/black-background.jpg"

# for restart
if [[ `ps -Al | grep -c xwinwrap` -gt 0 ]]; then
  pkill xwinwrap & wait
fi

( exec -a "animated-wallpaper" bash ) <<EOF &
{
  exec -a animated-wallpaper xwinwrap -fs -ni -s -ov -- mpv -wid WID $1
}
EOF

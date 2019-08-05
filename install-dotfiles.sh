
#!/bin/bash
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

if [[ $# -lt 1 ]]; then
  echo "insert the user route, ex: /home/vinicius"
  exit 1
fi

ln -fsv $SCRIPTPATH/dotfiles/* "$1/.config"

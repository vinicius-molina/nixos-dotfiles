
#!/bin/bash
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

if [[ $# -lt 1 ]]; then
  echo "insert the user route, ex: /home/vinicius"
  exit 1
fi

mkdir -p "$1/.config"
ln -fsv $SCRIPTPATH/config-dotfiles/* "$1/.config"

for file in $SCRIPTPATH/dotfiles/*; do
	ln -fsv $file "$1/.$(basename $file)"
done

for file in $SCRIPTPATH/home-files/*; do
	ln -fsv $file "$1/$(basename $file)"
done

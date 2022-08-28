#!bin/sh

set -e

if [ ! "$(command -v chezmoi)" ]; then
  BINDIR="$HOME/.local/bin"
  CHEZMOI="$BINDIR/chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$BINDIR"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$BINDIR"
  else
    echo "Must have curl or wget installed to get chezmoi." >&2
    exit 1
  fi
else
  CHEZMOI=chezmoi
fi

DOTFILES="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
exec "$CHEZMOI" init --apply "--source=$DOTFILES"

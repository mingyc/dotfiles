#!/bin/sh

set -e

require() {
  CMD=$1
  REASON=$2
  if [ ! "$(command -v $CMD)" ]; then
    echo "Must have $CMD installed to $REASON." >&2
    exit 1
  fi
}

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

require git "initialize dotfiles"
require vim "edit text"

DOTFILES="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
exec "$CHEZMOI" init --apply "--source=$DOTFILES"

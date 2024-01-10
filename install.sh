#!/bin/bash

set -e

DOTFILES_USER=mingyc
REMOTE_INSTALL=0
THIS=$0

show_help() {
  echo "$THIS: install dotfiles from $DOTFILES_USER/dotfiles"
  echo "Options:"
  echo "  --remote                Install without checking out the repo."
  echo "  --email <address>       Provides alternative email address."
  echo "  --work-repo <git-repo>  Provides additional configs. Chezmoi profile will be set to 'work'."
}

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
require zsh "be the default shell"

# https://stackoverflow.com/a/4884411
while [[ $1 == -* ]]; do
  case "$1" in
    -h|--help|-\?) show_help; exit 0;;
    --remote) REMOTE_INSTALL=1; shift;;
    --email) if [[ $# > 1 && $2 != -* ]]; then
               export CHEZMOI_USER_EMAIL=$2; shift 2
             else
               echo "--email requires an argument" 1>&2
               exit 1
             fi ;;
    --work-repo) if [[ $# > 1 && $2 != -* ]]; then
                   export CHEZMOI_USER_WORK_REPO=$2; shift 2
                 else
                   echo "--work-repo requires an argument" 1>&2
                   exit 1
                 fi ;;
    --) shift; break;;
    -*) echo "invalid option: $1" 1>&2; show_help; exit 1;;
  esac
done

# Replace current process with chezmoi.
if [[ $REMOTE_INSTALL -eq "1" ]]; then
  exec "$CHEZMOI" init --apply $DOTFILES_USER
else
  DOTFILES_LOCAL="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
  exec "$CHEZMOI" init --apply "--source=$DOTFILES_LOCAL"
fi

# dotfiles
---

My dotfiles managed with [chezmoi](https://chezmoi.io).


## Installation

Check out this repo & install:

```sh
git clone https://github.com/mingyc/dotfiles.git && dotfiles/install.sh
```

Install remotely:

```sh
sh -c "$(curl -fsLS https://raw.githubusercontent.com/mingyc/dotfiles/master/install.sh)" -- --remote
```

Install remotely with non-default user data:

```sh
sh -c "$(curl -fsLS https://raw.githubusercontent.com/mingyc/dotfiles/master/install.sh)" -- --remote --interactive
```

## Debugging Changes

```sh
chezmoi apply --verbose --destination /tmp/home --dry-run
```


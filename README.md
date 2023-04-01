# dotfiles
---

My dotfiles managed with [chezmoi](https://chezmoi.io).


## Installation

```sh
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b $HOME/.local/bin -- init --apply mingyc
```

### With Non-Default User Data

```sh
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b $HOME/.local/bin -- init --apply mingyc --interactive
```

## Debugging Changes

```sh
chezmoi apply --verbose --destination /tmp/home --dry-run
```


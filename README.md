# dotfiles
---

My dotfiles managed with [chezmoi](https://chezmoi.io).


## Installation

```sh
sh -c "$(curl -fsLS https://chezmoi.io/get)" -b .local/bin -- init --apply mingyc
```

### Debug

```sh
chezmoi apply --verbose --destination /tmp/home --dry-run
```


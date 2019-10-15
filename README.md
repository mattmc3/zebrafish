# zebrafish

Instantly put the goodies found in the [fish shell][fish-shell] into ZSH
without the hassle to get it there.

## What's included

- Much better history configuration
- Much better ZSH settings
- Command [autosuggestions][zsh-autosuggestions]
- [History substring search][zsh-history-substring-search]
- [Syntax highlighting][fast-syntax-highlighting]
- More complete [completions][zsh-completions]
- Robust Emacs keybindings
- Auto-load all functions in `$ZDOTDIR/functions`
- Auto-source all ZSH files in `$ZDOTDIR/conf.d`

## Installation

Installable with:
- [zgen]: `zgen load mattmc3/zebrafish`
- [oh-my-zsh]:
  ``` shell
  ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}
  git clone --recursive --depth 1 https://github.com/mattmc3/zebrafish.git $ZSH_CUSTOM/zebrafish
  # now add zebrafish to your plugins variable in .zshrc
  ```
- [antibody]: `antibody bundle mattmc3/zebrafish`
- [antigen]: `antigen bundle mattmc3/zebrafish`


[zgen]:       https://github.com/tarjoilija/zgen
[oh-my-zsh]:  https://github.com/robbyrussell/oh-my-zsh
[antibody]:   https://getantibody.github.io
[antigen]:    https://github.com/zsh-users/antigen
[fish-shell]: https://fishshell.com/
[zsh-autosuggestions]:           https://github.com/zsh-users/zsh-autosuggestions
[zsh-completions]:               https://github.com/zsh-users/zsh-completions
[zsh-history-substring-search]:  https://github.com/zsh-users/zsh-history-substring-search
[fast-syntax-highlighting]:      https://github.com/zdharma/fast-syntax-highlighting

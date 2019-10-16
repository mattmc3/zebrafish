# zebrafish

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)

<a title="Azul [Copyrighted free use], via Wikimedia Commons"
   href="https://commons.wikimedia.org/wiki/File:Zebrafisch.jpg"
   align="right">
<img align="right"
     width="250"
     alt="zebrafish"
     src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Zebrafisch.jpg/512px-Zebrafisch.jpg">
</a>

A solid base zsh configuration achieved with only one small, simple include.

No slow, boated framework. No excessive and hard to follow config tricks.
Just a plain, simple, lightning fast zsh config with only a single file

Borrows some great ideas from [fish shell][fish-shell], but with a zsh flair.

## What's included

### Leverage amazing built-in ZSH features:

- Better ZSH default settings
- Sane command history configuration
- Auto-load any functions in `$ZDOTDIR/zfunctions`
- Auto-source any ZSH files in `$ZDOTDIR/zshrc.d`
- Robust Emacs keybindings in the shell
- Sets your [XDG base directories][xdg-basedirs] if they haven't already been set

### Leverage awesome ZSH plugins:

- Smart command [autosuggestions][zsh-autosuggestions] based on previously used commands
- Allow [history substring searching][zsh-history-substring-search]
- Call-out mistakes easily with [syntax highlighting][fast-syntax-highlighting] for shell commands
- More complete [completions][zsh-completions]

## How is zebrafish different?

Projects like [oh-my-zsh] and [prezto] are neat. They do a ton of work to create a
full featured zsh environment, and make zsh welcoming and exciting for new users.
But these frameworks have some serious downsides. They can be slow. They have a
ton of files and plugins. They mix themes and aliases and configuration and functions
and plugins all into one giant soup of zsh stuff. It's hard to know what it's all
doing, and even harder to customize the parts you might not like.

zebrafish is different because it's not a full on zsh framework that does everything
under the sun. Instead, it's a set of sane defaults that lets you easily build up the
rest of you zsh config from there. Because zebrafish is a single file, you also can
easily push parts of this configuration to a server that cannot reach out to git
sources like github.

## Customization

zebrafish has great defaults. It's built to provide you with a full-featured
zsh setup with no special configuration beyond sourcing `zebrafish.zsh`.

However, sometimes you really do want to adjust features. These `zstyle`
settings are available to add to your `.zshrc` prior to loading zebrafish
if you decide you need them.

```shell
# Leave what you want in this zstyle list to denote which zebrafish
# features you want to disable.
zstyle ':zebrafish:features' 'disable' \
  'compinit' \
  'history' \
  'key-bindings' \
  'xdg' \
  'zfunctions' \
  'zsh-options' \
  'zshrc.d'

# Leave what you want in this zstyle list to denote which zebrafish
# external plugins you want to disable.
zstyle ':zebrafish:plugins' 'disable' \
  'autosuggestions' \
  'completions' \
  'history-substring-search' \
  'syntax-highlighting'
```

If you want to customize directory locations, use the following:

```shell
# to change the default zshrc.d path
zstyle ':zebrafish:paths' 'zshrc.d' ~/.config/zsh/conf.d

# to change the default zfunctions path
zstyle ':zebrafish:paths' 'zfunctions' ~/.config/zsh/functions
```

If you want to see which zebrafish settings you have set, run this:

```shell
zstyle -L ':zebrafish:*'
```

If you want to see which zsh options are set, run this:

```shell
setopt
```

If you don't like the option settings that zebrafish provides, you can always
set your own after zebrafish runs. Treat zebrafish's settings like better zsh
defaults, but also consider them overridable.

```shell
# set up your shell your way if you want to
# zebrafish is meant to give you the best defaults,
# not take away your freedom to set up your config your way
setopt HIST_BEEP
setopt SHARE_HISTORY
HISTFILE=~/.zsh_history
```

## Installation

Installation methods:
- [zgen]: `zgen load mattmc3/zebrafish`
- [oh-my-zsh]:
  ```shell
  ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}
  git clone --depth 1 https://github.com/mattmc3/zebrafish.git $ZSH_CUSTOM/zebrafish
  # now add zebrafish to your plugins variable in .zshrc
  ```
- [antibody]: `antibody bundle mattmc3/zebrafish`
- [antigen]: `antigen bundle mattmc3/zebrafish`
- manually with curl:
  ```shell
  curl -s -o ${ZDOTDIR:-$HOME}/zebrafish.zsh https://raw.githubusercontent.com/mattmc3/zebrafish/master/zebrafish.zsh
  echo ". ${ZDOTDIR:-$HOME}/zebrafish.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
  ```

[antibody]:                      https://getantibody.github.io
[antigen]:                       https://github.com/zsh-users/antigen
[fast-syntax-highlighting]:      https://github.com/zdharma/fast-syntax-highlighting
[fish-shell]:                    https://fishshell.com/
[oh-my-zsh]:                     https://github.com/robbyrussell/oh-my-zsh
[prezto]:                        https://github.com/sorin-ionescu/prezto
[xdg-basedirs]:                  https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
[zgen]:                          https://github.com/tarjoilija/zgen
[zsh-autosuggestions]:           https://github.com/zsh-users/zsh-autosuggestions
[zsh-completions]:               https://github.com/zsh-users/zsh-completions
[zsh-history-substring-search]:  https://github.com/zsh-users/zsh-history-substring-search

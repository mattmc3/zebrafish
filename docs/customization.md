# Customization

Zebrafish has great defaults. It's built to provide you with an opinionated,
well configured zsh setup.

However, sometimes you really do want to adjust features. These [zstyle]
settings are available to add to your `.zshrc` prior to loading Zebrafish
if you decide you need them.

## Enabling only the features you need

By default, all features are enabled. If you want to leave off features, put
this zstyle list in your .zshrc prior to loading Zebrafish to denote which
features you want. Comment out any you don't want.

```shell
# maybe you want to define your own key-bindings
zstyle ':zebrafish:features' 'enable' \
  'compinit' \
  'history' \
  'environment' \
  # 'key-bindings' \
  'xdg' \
  'zfunctions' \
  'zshrc.d'
```

**Note:** you can turn off 'zfunctions' and 'zshrc.d' if you really want to, but
these features are only used if the directories for them exist, so there's
rarely a good reason to turn them off - just don't make the directories.

## Customizing directory paths

If you want to customize directory locations, use the following:

```shell
# to change the default zshrc.d path from $ZDOTDIR/.zshrc.d
zstyle ':zebrafish:zshrc.d' 'path' ~/.config/zsh/conf.d

# to change the default zfunctions path from $ZDOTDIR/.zfunctions
zstyle ':zebrafish:zfunctions' 'path' ~/.config/zsh/myfunctions
```

## Checking your environment settings

If you want to see which Zebrafish settings you have set, run this:

```shell
# zebrafish only
zstyle -L ':zebrafish:*'

# or all zstyle values...
zstyle
```

If you want to see which ZSH options are set, run `setopt`:

```shell
# show ZSH options
setopt

# alternatively...
set -o
set +o
```

If you want to see which ZSH environment variables are set, run `env`:

```shell
# show all environment variables and their values
env
```

## Customizing ZSH differently than Zebrafish does

If you don't like the option settings or environment variables that Zebrafish
provides, you can always set your own after Zebrafish runs. Treat Zebrafish's
settings like better ZSH defaults, but also consider them overridable.

```shell
# set up your shell your way if you want to
# Zebrafish is meant to give you the best defaults,
# not take away your freedom to set up your config your way
setopt HIST_BEEP
setopt SHARE_HISTORY
HISTFILE=~/.zsh_history
```

[zstyle]:  http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html#The-zsh_002fzutil-Module

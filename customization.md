# Customization

Zebrafish has great defaults. It's built to provide you with a an opinionated,
full-featured zsh setup with no extra configuration necessary beyond sourcing
`zebrafish.zsh`.

However, sometimes you really do want to adjust features. These [zstyle]
settings are available to add to your `.zshrc` prior to loading Zebrafish
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

# Leave what you want in this zstyle list to denote which zebrafish
# prompts you want to disable.
zstyle ':zebrafish:prompts' 'disable' \
  'pure' \
  'lean' \
  'spaceship'
```

If you want to customize directory locations, use the following:

```shell
# to change the default ZSHrc.d path
zstyle ':zebrafish:paths' 'zshrc.d' ~/.config/zsh/conf.d

# to change the default zfunctions path
zstyle ':zebrafish:paths' 'zfunctions' ~/.config/zsh/functions
```

If you want to see which Zebrafish settings you have set, run this:

```shell
zstyle -L ':zebrafish:*'
```

If you want to see which ZSH options are set, run this:

```shell
setopt
```

If you don't like the option settings that Zebrafish provides, you can always
set your own after Zebrafish runs. Treat Zebrafish's settings like better ZSH
defaults, but also consider them overridable.

```shell
# set up your shell your way if you want to
# Zebrafish is meant to give you the best defaults,
# not take away your freedom to set up your config your way
setopt HIST_BEEP
setopt SHARE_HISTORY
HISTFILE=~/.zsh_history
```

[zstyle]:  http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html#The-zsh_002fzutil-Module

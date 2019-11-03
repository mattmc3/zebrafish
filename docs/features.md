# Features

## Prompts

Many new ZSH users think they need a fancy framework to get great looking
prompt themes and don't realize that ZSH has
[built-in prompt themeing support][zsh-prompt-theme].

You can list available prompts with:

```shell
prompt -l
```

You can set your prompt with:

```shell
prompt elite2
```

You can add your own custom prompts to your `${ZDOTDIR:-$HOME}/.zprompts` directory.

Try out some of these great prompts:

```shell
# install pure
git clone --recursive --depth=1 https://github.com/sindresorhus/pure ${ZDOTDIR:-$HOME}/.zprompts/sindresorhus/pure

# install lean
git clone --recursive --depth=1 https://github.com/miekg/lean.git ${ZDOTDIR:-$HOME}/.zprompts/miekg/lean

# install spaceship
git clone --recursive --depth=1 https://github.com/denysdovhan/spaceship-prompt.git ${ZDOTDIR:-$HOME}/.zprompts/denysdovhan/spaceship-prompt
ln -sf "${ZDOTDIR:-$HOME}/.zprompts/denysdovhan/spaceship-prompt/spaceship.zsh" "${ZDOTDIR:-$HOME}/.zprompts/denysdovhan/spaceship-prompt/prompt_spaceship_setup"

# try out a new theme
prompt lean
```

Prompts by default live here: `${ZDOTDIR:-$HOME}/.zprompts`

You can customize where prompts are put by changing this `zstyle` setting:

```shell
# to change the default zprompts path from $ZDOTDIR/.zprompts
zstyle ':zebrafish:zprompts' 'path' ~/.config/zsh/myprompts
```

You can turn off prompts, but that's not really necessary since the zprompts
feature is ignored if the directory doesn't exist.

``` shell
# Example of how to disable just 'zprompts'
zstyle ':zebrafish:features' 'disable' 'zprompts'

# Or add it amidst a list of other disabled features:
zstyle ':zebrafish:features' 'disable' \
  ... \
  'zprompts' \
  ...
```

## Plugins

Custom plugins are supported by adding projects to your `${ZDOTDIR:-$HOME}/.zplugins`
directory:

```shell
# install zsh-autosuggestions
git clone --recursive --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZDOTDIR:-$HOME}/.zplugins/zsh-users/zsh-autosuggestions

# install zsh-completions
git clone --recursive --depth=1 https://github.com/zsh-users/zsh-completions.git ${ZDOTDIR:-$HOME}/.zplugins/zsh-users/zsh-completions

# install zsh-history-substring-search
git clone --recursive --depth=1 https://github.com/zsh-users/zsh-history-substring-search.git ${ZDOTDIR:-$HOME}/.zplugins/zsh-users/zsh-history-substring-search

# install zsh-syntax-highlighting
git clone --recursive --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZDOTDIR:-$HOME}/.zplugins/zsh-users/zsh-syntax-highlighting
```

Using plugins is as simple as adding the following `zstyle` config to your
`${ZDOTDIR:-$HOME}/.zshrc`:

```shell
# Add any external plugins you want to load to this zstyle list. ORDER MATTERS.
zstyle ':zebrafish:zplugins' 'load' \
  'zsh-users/zsh-autosuggestions' \
  'zsh-users/zsh-completions' \
  'zsh-users/zsh-history-substring-search' \
  'zsh-users/zsh-syntax-highlighting'
```

You can turn off plugins, but that's not really necessary since the zplugins
feature is ignored if the directory doesn't exist.

``` shell
# Example of how to disable just 'zplugins'
zstyle ':zebrafish:features' 'disable' 'zplugins'

# Or add it amidst a list of other disabled features:
zstyle ':zebrafish:features' 'disable' \
  ... \
  'zplugins' \
  ...
```

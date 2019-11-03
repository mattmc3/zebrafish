#!/usr/bin/env zsh

# Copyright (c) 2019 mattmc3
# MIT license
# powerpack.zsh
#
# https://github.com/mattmc3/zebrafish
#
# Install great plugins and prompts from across the web to beef up zebrafish
#

function go_git_em() {
  local basedir=$1
  shift
  for r in "$@"; do
    if [[ ! -d "$basedir/$r" ]]; then
      echo "git clone $r"
      git clone --recursive --depth 1 https://github.com/${r}.git "$basedir/$r"
    else
      echo "git pull $r"
      git -C "$basedir/$r" pull --recurse-submodules
    fi
  done
}

# zplugins
zstyle -g zplugins_dir ':zebrafish:zplugins' 'path'
[[ -n $zplugins_dir ]] || zplugins_dir="${ZDOTDIR:-$HOME}"/.zplugins
zplugins=(
  # fish-like goodies
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting

  # other great stuff
  rupa/z
  mattmc3/zsh-safe-rm
)
frameworks=(
  robbyrussell/oh-my-zsh
  sorin-ionescu/prezto
)
go_git_em $zplugins_dir $zplugins
go_git_em $zplugins_dir $frameworks

# zprompts
zstyle -g zprompts_dir ':zebrafish:zprompts' 'path'
[[ -n $zprompts_dir ]] || zprompts_dir="${ZDOTDIR:-$HOME}"/.zprompts
zprompts=(
  sindresorhus/pure
  miekg/lean
  denysdovhan/spaceship-prompt
)
go_git_em $zprompts_dir $zprompts

if ! grep -q '^prompt\ ' ${ZDOTDIR:-$HOME}/.zshrc; then
  echo "prompt lean" >> "${ZDOTDIR:-$HOME}"/.zshrc
fi
if ! grep -q "^zstyle\ ':zebrafish:zplugins'\ 'load'" ${ZDOTDIR:-$HOME}/.zshrc; then
  line="zstyle ':zebrafish:zplugins' 'load' ${zplugins}"
  ex -sc "1i|$line" -cx ${ZDOTDIR:-$HOME}/.zshrc
fi

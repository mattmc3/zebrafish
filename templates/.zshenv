# ${ZDOTDIR:-$HOME}/.zshenv

export ZDOTDIR=$HOME/.zsh

# ~/.zshenv needs to exist as well, best to just link it
if [[ ! -f "$HOME"/.zshenv ]] && [[ -f "$ZDOTDIR"/.zshenv ]]; then
  ln -s "$ZDOTDIR"/.zshenv "$HOME"/.zshenv
fi

# ${ZDOTDIR:-$HOME}/.zshrc

# setup zgen and any pre-plugin options
export ZGEN_DIR="${ZDOTDIR:-$HOME}"/.zgen
[[ -d "$ZGEN_DIR" ]] || git clone --depth 1 https://github.com/tarjoilija/zgen.git "$ZGEN_DIR"
ZGEN_RESET_ON_CHANGE=(${ZDOTDIR:-$HOME}/.zshrc)
ZGEN_AUTOLOAD_COMPINIT=false
ZSH="$ZGEN_DIR/robbyrussell/oh-my-zsh-master"

# load plugins
source "$ZGEN_DIR/zgen.zsh"
if ! zgen saved; then
  # load zebrafish first
  zgen load mattmc3/zebrafish

  # make zsh awesome with plugins from github
  zgen load mafredri/zsh-async
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-history-substring-search
  zgen load mattmc3/zsh-safe-rm
  zgen load rummik/zsh-tailf
  zgen load peterhurford/up.zsh

  # let's get some prompt theme options
  zgen load mattmc3/zsh-prompt-pack

  # instead you can use a zplugins file for plugins to keep .zshrc even cleaner
  if [[ -f $ZDOTDIR/zplugins ]]; then
    zgen loadall < $ZDOTDIR/zplugins
  fi

  # plugins that should come last!
  zgen load zdharma/fast-syntax-highlighting

  # save zgen plugins into init.zsh
  zgen save
fi

# chose a prompt
prompt pure

# .zshrc.local contains your machine level config (do not add to git)
[[ -f "${ZDOTDIR:-HOME}"/.zshrc.local ]] && source "${ZDOTDIR:-HOME}"/.zshrc.local

# Copyright (c) 2019 mattmc3
# MIT license
# zebrafish.zsh
# version: 0.9.0
# https://github.com/mattmc3/zebrafish/blob/master/zebrafish.plugin.zsh
#
# A solid base zsh configuration with only a single include file.
# No slow, boated framework. No excessive and hard to follow config tricks.
# Just a plain, simple, lightning fast zsh config with only a single file

### init
# https://stackoverflow.com/questions/9901210/bash-source0-equivalent-in-zsh
0=${(%):-%N}

# setup variables from zstyle settings
zstyle -g _disabled_features ':zebrafish:features' disable
zstyle -g _disabled_plugins ':zebrafish:plugins' disable
zstyle -g _zshrcd_dir ':zebrafish:paths' 'zshrc.d'
if [[ -z $_zshrcd_dir ]]; then
  [[ -n $ZDOTDIR ]] && _zshrcd_dir="${ZDOTDIR}"/zshrc.d || _zshrcd_dir="$HOME"/.zshrc.d
fi
zstyle -g _zfunctions_dir ':zebrafish:paths' 'zfunctions'
if [[ -z $_zfunctions_dir ]]; then
  [[ -n $ZDOTDIR ]] && _zfunctions_dir="${ZDOTDIR}"/zfunctions || _zfunctions_dir="$HOME"/.zfunctions
fi
_zebrafish_dir=${ZDOTDIR:-$HOME}/.zebrafish


### XDG
if ! (($_disabled_features[(Ie)xdg])); then
  export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
  export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
  export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
  export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$HOME/.xdg}"
fi

### ZSH Options
if ! (($_disabled_features[(Ie)zsh-options])); then
  # http://zsh.sourceforge.net/Doc/Release/Options.html

  # Changing Directories
  setopt auto_cd                 # if a command isn't valid, but is a directory, cd to that dir
  setopt auto_pushd              # make cd push the old directory onto the directory stack
  setopt pushd_ignore_dups       # don’t push multiple copies of the same directory onto the directory stack
  setopt pushd_minus             # exchanges the meanings of ‘+’ and ‘-’ when specifying a directory in the stack

  # Completions
  setopt always_to_end           # move cursor to the end of a completed word
  setopt auto_list               # automatically list choices on ambiguous completion
  setopt auto_menu               # show completion menu on a successive tab press
  setopt auto_param_slash        # if completed parameter is a directory, add a trailing slash
  setopt complete_in_word        # complete from both ends of a word
  unsetopt menu_complete         # don't autoselect the first completion entry

  # Expansion and Globbing
  setopt extended_glob           # use more awesome globbing features

  # History
  setopt append_history          # append to history file
  setopt extended_history        # write the history file in the ':start:elapsed;command' format
  unsetopt hist_beep             # don't beep when attempting to access a missing history entry
  setopt hist_expire_dups_first  # expire a duplicate event first when trimming history
  setopt hist_find_no_dups       # don't display a previously found event
  setopt hist_ignore_all_dups    # delete an old recorded event if a new event is a duplicate
  setopt hist_ignore_dups        # don't record an event that was just recorded again
  setopt hist_ignore_space       # don't record an event starting with a space
  setopt hist_no_store           # don't store history commands
  setopt hist_reduce_blanks      # remove superfluous blanks from each command line being added to the history list
  setopt hist_save_no_dups       # don't write a duplicate event to the history file
  setopt hist_verify             # don't execute immediately upon history expansion
  setopt inc_append_history      # write to the history file immediately, not when the shell exits
  unsetopt share_history         # don't share history between all sessions

  # Initialization
  # none

  # Input/Output
  unsetopt correct               # don't try to correct the spelling of commands
  unsetopt correct_all           # don't try to correct the spelling of all arguments in a line
  unsetopt flow_control          # disable start/stop characters in shell editor
  setopt interactive_comments    # enable comments in interactive shell
  unsetopt mail_warning          # don't print a warning message if a mail file has been accessed
  setopt path_dirs               # perform path search even on command names with slashes
  setopt rc_quotes               # allow 'Henry''s Garage' instead of 'Henry'\''s Garage'

  # Job Control
  setopt auto_resume            # attempt to resume existing job before creating a new process
  unsetopt bg_nice              # don't run all background jobs at a lower priority
  unsetopt check_jobs           # don't report on jobs when shell exit
  unsetopt hup                  # don't kill jobs on shell exit
  setopt long_list_jobs         # list jobs in the long format by default
  setopt notify                 # report status of background jobs immediately

  # Prompting
  setopt prompt_subst           # expand parameters in prompt variables

  # Scripts and Functions
  # none

  # Shell Emulation
  # none

  # Shell State
  # none

  # Zle
  unsetopt beep                 # be quiet!
  setopt combining_chars        # combine zero-length punctuation characters (accents) with the base character
  setopt emacs                  # use emacs keybindings in the shell
fi

if ! (($_disabled_features[(Ie)history])); then
  ### History
  SAVEHIST=100000
  HISTSIZE=100000
  HISTFILE="${HISTFILE:-$XDG_DATA_HOME/zsh/zsh_history}"
  [[ -d "$XDG_DATA_HOME"/zsh ]] || mkdir -p "$XDG_DATA_HOME"/zsh
fi

### Key-bindings
# TODO: verify this is complete and correct and comment it better
# https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_default_key_bindings.fish
# http://fishshell.com/docs/current/index.html#editor
# https://github.com/changs/slimzsh/blob/master/keys.zsh
if ! (($_disabled_features[(Ie)key-bindings])); then
  bindkey -e
  bindkey '\ew' kill-region
  bindkey -s '\el' "ls\n"
  bindkey '^r' history-incremental-search-backward
  bindkey "^[[5~" up-line-or-history
  bindkey "^[[6~" down-line-or-history
  bindkey '^[[A' up-line-or-search
  bindkey '^[[B' down-line-or-search
  bindkey "^[[H" beginning-of-line
  bindkey "^[[1~" beginning-of-line
  bindkey "^[OH" beginning-of-line
  bindkey "^[[F" end-of-line
  bindkey "^[[4~" end-of-line
  bindkey "^[OF" end-of-line
  bindkey ' ' magic-space
  bindkey "^F" forward-word
  bindkey "^B" backward-word
  bindkey '^[[Z' reverse-menu-complete
  bindkey '^?' backward-delete-char
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
  bindkey -s '^X^Z' '%-^M'
  bindkey '^[e' expand-cmd-path
  bindkey '^[^I' reverse-menu-complete
  bindkey '^X^N' accept-and-infer-next-history
  bindkey '^W' kill-region
  bindkey '^I' complete-word
  # Fix weird sequence that rxvt produces
  bindkey -s '^[[Z' '\t'
fi


### Completions
if ! (($_disabled_features[(Ie)compinit])); then
  # https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/init.zsh#L31-L41
  autoload -Uz compinit
  _comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
  if (( $#_comp_files )); then
    compinit -i -C
  else
    compinit -i
  fi
  unset _comp_files
fi


### Z-Functions
# auto load any function in the functions location
if ! (($_disabled_features[(Ie)zfunctions])); then
  [[ -d "$_zfunctions_dir" ]] || mkdir -p "$_zfunctions_dir"
  fpath=("$_zfunctions_dir" $fpath)
  for _zfunc in "$_zfunctions_dir"/*(N); do
    autoload -U "$_zfunc"
  done
  unset _zfunc
fi


### External plugins
function _load_plugin() {
  setopt local_options extended_glob

  local gituser=${1%/*}
  local repo=${1#*/}

  # see if the plugin exists
  if [[ ! -d "$_zebrafish_dir/plugins/$1" ]]; then
    mkdir -p "$_zebrafish_dir/plugins/$gituser"
    git clone --recursive --depth 1 https://github.com/$1.git "$_zebrafish_dir/plugins/$1"

    # compile the plugin contents
    autoload -U zrecompile
    local zfile
    for zfile in "$_zebrafish_dir/plugins/$1"/**/*.zsh(.N); do
      zrecompile -pq ${zfile}
    done
  fi
  source "$_zebrafish_dir/plugins/$1/${repo}.plugin.zsh"
}

if ! (($_disabled_plugins[(Ie)autosuggestions])); then
  _load_plugin 'zsh-users/zsh-autosuggestions'
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
fi
if ! (($_disabled_plugins[(Ie)completions])); then
  _load_plugin 'zsh-users/zsh-completions'
fi
if ! (($_disabled_plugins[(Ie)history-substring-search])); then
  _load_plugin 'zsh-users/zsh-history-substring-search'
fi
if ! (($_disabled_plugins[(Ie)syntax-highlighting])); then
  _load_plugin 'zdharma/fast-syntax-highlighting'
fi


### .zshrc.d
if ! (($_disabled_features[(Ie)zshrc.d])); then
  [[ -d "$_zshrcd_dir" ]] || mkdir -p "$_zshrcd_dir"
  for _zfile in "$_zshrcd_dir"/*.{sh,zsh}(N); do
    # ignore files that begin with a tilde
    case $_zfile:t in ~*) continue;; esac
    source "$_zfile"
  done
  unset _zfile
fi


### Cleanup
unset _disabled_features
unset _disabled_plugins
unset _zfunctions_dir
unset _zshrcd_dir
unset _zebrafish_dir
unset -f _load_plugin

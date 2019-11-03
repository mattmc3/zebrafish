# Copyright (c) 2019 mattmc3
# MIT license
# zebrafish.zsh
# version: 0.3.0
# homepage: https://github.com/mattmc3/zebrafish
#
# A solid base zsh configuration achieved with only one small, simple include.
#
# No slow, boated frameworks. No excessive and hard to follow config tricks.
# Just a plain, simple, lightning fast zsh config with only a single include.
#
# simple install:
#   curl -s -o ${ZDOTDIR:-$HOME}/.zebrafish.zsh https://raw.githubusercontent.com/mattmc3/zebrafish/master/zebrafish.zsh
#   echo '. ${ZDOTDIR:-$HOME}/.zebrafish.zsh' >> ${ZDOTDIR:-$HOME}/.zshrc

#
## Init
# setup variables from zstyle settings
zstyle -g _disabled_features ':zebrafish:features' disable
zstyle -g _zshrcd_dir ':zebrafish:zshrc.d' 'path'
[[ -n $_zshrcd_dir ]] || _zshrcd_dir="${ZDOTDIR:-$HOME}"/.zshrc.d
zstyle -g _zfunctions_dir ':zebrafish:zfunctions' 'path'
[[ -n $_zfunctions_dir ]] || _zfunctions_dir="${ZDOTDIR:-$HOME}"/.zfunctions
zstyle -g _zprompts_dir ':zebrafish:zprompts' 'path'
[[ -n $_zprompts_dir ]] || _zprompts_dir="${ZDOTDIR:-$HOME}"/.zprompts
zstyle -g _zplugins ':zebrafish:zplugins' 'load'
zstyle -g _zplugins_dir ':zebrafish:zplugins' 'path'
[[ -n $_zplugins_dir ]] || _zplugins_dir="${ZDOTDIR:-$HOME}"/.zplugins

#
## XDG
if ! (($_disabled_features[(Ie)xdg])); then
  export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
  export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
  export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
  export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$HOME/.xdg}"
fi

#
## ZSH Options
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
setopt glob_dots               # include dotfiles when globbing

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
unsetopt clobber               # must use >| to truncate existing files
unsetopt correct               # don't try to correct the spelling of commands
unsetopt correct_all           # don't try to correct the spelling of all arguments in a line
unsetopt flow_control          # disable start/stop characters in shell editor
setopt interactive_comments    # enable comments in interactive shell
unsetopt mail_warning          # don't print a warning message if a mail file has been accessed
setopt path_dirs               # perform path search even on command names with slashes
setopt rc_quotes               # allow 'Henry''s Garage' instead of 'Henry'\''s Garage'
unsetopt rm_star_silent        # ask for confirmation for `rm *' or `rm path/*'

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

#
## Environment
if ! (($_disabled_features[(Ie)environment])); then
  export LANG="${LANG:-en_US.UTF-8}"
  export LANGUAGE="${LANGUAGE:-en}"
  export LC_ALL="${LC_ALL:-en_US.UTF-8}"

  export CLICOLOR="${CLICOLOR:-1}"
  export LSCOLORS="${LSCOLORS:-ExfxcxdxbxGxDxabagacad}"

  export PAGER="${PAGER:-less}"
  export EDITOR="${EDITOR:-vim}"
  export VISUAL="${VISUAL:-vim}"
fi

#
## History
if ! (($_disabled_features[(Ie)history])); then
  SAVEHIST="${SAVEHIST:-10000}"
  HISTSIZE="${HISTSIZE:-10000}"
  if [[ -z $HISTFILE ]]; then
    if [[ -d $XDG_DATA_HOME ]]; then
      HISTFILE="$XDG_DATA_HOME/zsh/zhistory}"
      [[ -d "$XDG_DATA_HOME"/zsh ]] || mkdir -p "$XDG_DATA_HOME"/zsh
      [[ -f "${ZDOTDIR:-$HOME}/.zhistory" ]] || ln -sf "$HISTFILE" "${ZDOTDIR:-$HOME}/.zhistory"
    else
      HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
    fi
  fi
fi

#
## Key-bindings
# TODO: verify this is complete and correct and comment it better
# https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_default_key_bindings.fish
# http://fishshell.com/docs/current/index.html#editor
# https://github.com/changs/slimzsh/blob/master/keys.zsh
if ! (($_disabled_features[(Ie)key-bindings])); then
  export KEYTIMEOUT=${KEYTIMEOUT:-1}  # remove lag
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

#
## Completions
_zcompinit() {
  # https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/init.zsh#L31-L41
  # http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Use-of-compinit
  # https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2894219
  setopt extendedglob local_options
  autoload -Uz compinit
  local zcd=${ZDOTDIR:-$HOME}/.zcompdump
  local zcdc="$zcd.zwc"
  # Compile the completion dump to increase startup speed if dump is newer or
  # missing. Do in background for next time to not affect the current session
  if [[ -f "$zcd"(#qN.m+1) ]]; then
    compinit -i -d "$zcd"
    { rm -f "$zcdc" && zcompile "$zcd" } &!
  else
    compinit -i -C -d "$zcd"
    { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
  fi
}
if ! (($_disabled_features[(Ie)compinit])); then
  _zcompinit
fi

#
## .zplugins
_load_plugin() {
  local zplugindir=$1
  local plugin=$2
  local plugin_name location

  # split on the slash
  if [[ $plugin = */* ]]; then
    # get part after slash
    plugin_name=${plugin#*/}
  else
    plugin_name=${plugin}
  fi
  location=${zplugindir}/${plugin}/${plugin_name}

  # https://github.com/tarjoilija/zgen/blob/master/zgen.zsh#L346-L374
  if [[ -f "${location}.zsh" ]]; then
    source "${location}.zsh"
  elif [[ -f "${location}.plugin.zsh" ]]; then
    source  "${location}.plugin.zsh"
  elif [[ -f "${location}/init.zsh" ]]; then
    source  "${location}/init.zsh"
  elif [[ -f "${location}.sh" ]]; then
    source  "${location}.sh"
  else
    echo "${location}"
    echo "Failed to load plugin: $plugin" >&2
    return 1
  fi
  return 0
}
# if plugins are specified, load them in order
if ! (($_disabled_features[(Ie)zplugins])) && [[ -d "$_zplugins_dir" ]]; then
  for _zplugin in $_zplugins; do
    if [[ -f "$plugin" ]]; then
      source "$plugin"
    else
      _load_plugin $_zplugins_dir $_zplugin
    fi
  done
  unset _zplugin
fi

#
## .zprompts
# add any subfolder of .zprompts containing prompt_*_setup to fpath
if ! (($_disabled_features[(Ie)zprompts])) && [[ -d "$_zprompts_dir" ]]; then
  for _zdir in "$_zprompts_dir"/**/prompt_*_setup(N:a:h); do
    fpath=($fpath $_zdir)
  done
  unset _zdir
  autoload -U promptinit; promptinit
fi

#
## .zfunctions
# auto load any function in the functions location
if ! (($_disabled_features[(Ie)zfunctions])) && [[ -d "$_zfunctions_dir" ]]; then
  fpath=("$_zfunctions_dir" $fpath)
  for _zfunc in "$_zfunctions_dir"/*(N); do
    autoload -U "$_zfunc"
  done
  unset _zfunc
fi

#
## .zshrc.d
if ! (($_disabled_features[(Ie)zshrc.d])) && [[ -d "$_zshrcd_dir" ]]; then
  for _zfile in "$_zshrcd_dir"/*.{sh,zsh}(N); do
    # ignore files that begin with a tilde
    case $_zfile:t in ~*) continue;; esac
    source "$_zfile"
  done
  unset _zfile
fi

#
## Cleanup
unset _disabled_features
unset _zfunctions_dir
unset _zshrcd_dir
unset _zprompts_dir
unset _zplugins_dir
unset _zplugins
unfunction _load_plugin
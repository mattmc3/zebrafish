# Copyright (c) 2021 mattmc3
# MIT license
# zebrafish.zsh
# homepage: https://github.com/mattmc3/zebrafish

0=${(%):-%N}

() {
  local basedir="${${(%):-%x}:a:h}"
  local funcdir="$basedir/functions"
  fpath+="$funcdir"
  local fnfile; for fnfile in "$funcdir"/*(.N); do
    local fnname="${fnfile:t}"
    (( $+functions[$fnname] )) && unfunction "$fnname"
    autoload -Uz "$fnfile"
  done
}

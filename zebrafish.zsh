# Copyright (c) 2021 mattmc3
# MIT license
# zebrafish.zsh
# homepage: https://github.com/mattmc3/zebrafish

0=${(%):-%N}

() {
  local basedir="${${(%):-%x}:a:h}"
  local funcdir="$basedir/functions"
  fpath+="$funcdir"
  local fn; for fn in "$funcdir"/*(.N); do
    autoload -Uz "$fn"
  done
}

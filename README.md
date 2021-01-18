# Zebrafish

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)

<a title="Azul [Copyrighted free use], via Wikimedia Commons"
   href="https://commons.wikimedia.org/wiki/File:Zebrafisch.jpg"
   align="right">
<img align="right"
     width="250"
     alt="Zebrafish"
     src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Zebrafisch.jpg/512px-Zebrafisch.jpg">
</a>

[Fish shell][fish-shell] has some great [built-in commands][fish-commands].
This project attempts to bring that missing functionality to ZSH.

## Installation

Installation methods:

- [pz]: `pz source mattmc3/zebrafish`
- [oh-my-zsh]:

  ```shell
  ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}
  git clone --depth 1 https://github.com/mattmc3/zebrafish.git $ZSH_CUSTOM/zebrafish
  # now add zebrafish to your plugins variable in .zshrc
  plugins(... zebrafish)
  ```

[pz]:            https://github.com/mattmc3/pz
[fish-shell]:    https://fishshell.com/
[fish-commands]: http://fishshell.com/docs/current/commands.html
[oh-my-zsh]:     https://github.com/robbyrussell/oh-my-zsh

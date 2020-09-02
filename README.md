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

A full featured, modern ZSH configuration packed into one simple include.

Borrows some great ideas from [fish shell][fish-shell], but with a ZSH flair.

## What's included

### Leverage amazing ZSH features

- Sets the best [ZSH options][zsh-options] so you start off with a great ZSH configuration
- Sets common environment variables
- Adds a sane history configuration
- Auto-sources any ZSH config files you put in `${ZDOTDIR:-$HOME}/.zshrc.d`
- Lazy loads any ZSH function files you put in `${ZDOTDIR:-$HOME}/.zfunctions`
- Leverages the built in ZSH prompt functionality for themeing
- Sets common keybindings
- Uses the [XDG base directories][xdg-basedirs] spec so your `$HOME` remains uncluttered
- Uses zstyle instead of  environment variables

### More information

Zebrafish's features are covered in more detail on the [features.md](docs/features.md) page.

## How is Zebrafish different?

### Compared to frameworks

Projects like [oh-my-zsh], [zimfw] and [prezto] are neat. They do a ton of work to create a full featured ZSH environment, and make ZSH welcoming and exciting for new users. But these frameworks have downsides. They can be slow. They have a ton of files and configs and plugins. They are in charge of bootstrapping your whole ZSH configuration. They mix concepts of themes, aliases, functions, shell options, and plugins all into one giant soup of ZSH stuff. It's hard to know what it's all doing, and even harder to modify the parts you might not like.

Zebrafish is different because it's not a ZSH framework that tries to do everything under the sun. Instead, it's just a set of sane defaults that lets you easily build up the rest of you ZSH config from there. You can even use it with a ZSH framework if you prefer. Since Zebrafish is housed in a single file, you also can easily do things like:

- See everything Zebrafish does in one place
- Turn off parts you don't like
- Extend it with new features
- Roll your own ZSH configuration without all the boilerplate stuff that really
  should just be built-in [like other shells already do][fish-shell]
- Control your whole config just from your custom .zshrc instead of from a
  .specialrc file like [prezto] and [zimfw] make you do.
- Use this configuration on a server that cannot reach out to internet git
  sources like GitHub.
- Add this file directly to your own [dotfiles] repo or manage it with a plugin
  manager
- Share your ZSH configuration with your co-workers and friends easily without
  forcing them to commit to using a whole framework

If you like [oh-my-zsh] or [prezto], you can keep using them with Zebrafish. Zebrafish is meant to be built upon. It just sets up your initial ZSH configuration in a way that makes sense so you don't have to do it all.

Just keep in mind that loading other plugins and frameworks _after_ Zebrafish means it's likely you overrode some of Zebrafish's settings.

### Compared to just using .zshrc

There's no reason you can't put the contents of Zebrafish directly in your .zshrc. But, this project is great for folks that like a clean .zshrc file and want a reasonable base configuration to build their .zshrc from.

## Customization

Zebrafish has great settings, and by default it's intended to work with nothing
more fancy than `source ${ZDOTDIR:-$HOME}/.zebrafish.zsh`, but sometimes you
really do want to customize something. The [customization.md](docs/customization.md)
in this project describes those options.

## Installation

Installation methods:

- [zgen]: `zgen load zshzoo/zebrafish`
- [oh-my-zsh]:

  ```shell
  ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}
  git clone --depth 1 https://github.com/zshzoo/zebrafish.git $ZSH_CUSTOM/zebrafish
  # now add zebrafish to your plugins variable in .zshrc
  ```

- [antibody]: `antibody bundle zshzoo/zebrafish`
- [antigen]: `antigen bundle zshzoo/zebrafish`
- manually with curl:

  ```shell
  curl -s -o ${ZDOTDIR:-$HOME}/.zebrafish.zsh https://raw.githubusercontent.com/zshzoo/zebrafish/master/zebrafish.plugin.zsh
  echo ". ${ZDOTDIR:-$HOME}/.zebrafish.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
  ```

[antibody]:  https://getantibody.github.io
[antigen]:  https://github.com/zsh-users/antigen
[dotfiles]:  https://dotfiles.github.io/
[fast-syntax-highlighting]:  https://github.com/zdharma/fast-syntax-highlighting
[fish-shell]:  https://fishshell.com/
[oh-my-zsh]:  https://github.com/ohmyzsh/ohmyzsh
[prezto]:  https://github.com/sorin-ionescu/prezto
[xdg-basedirs]:  https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
[zgen]:  https://github.com/tarjoilija/zgen
[zimfw]:  https://github.com/zimfw/zimfw
[zsh-autosuggestions]:  https://github.com/zsh-users/zsh-autosuggestions
[zsh-completions]:  https://github.com/zsh-users/zsh-completions
[zsh-history-substring-search]:  https://github.com/zsh-users/zsh-history-substring-search
[zsh-options]:  http://zsh.sourceforge.net/Doc/Release/Options.html
[zsh-prompt-theme]:  http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Prompt-Themes

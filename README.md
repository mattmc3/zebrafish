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

A solid base ZSH configuration achieved with only one small, simple include.

No slow, boated framework. No excessive and hard to follow config tricks.
Just a plain, simple, lightning fast ZSH config with only a single file

Borrows some great ideas from [fish shell][fish-shell], but with a ZSH flair.

## What's included

### Leverage amazing built-in ZSH features

- Better ZSH default settings
- Sane command history configuration
- Auto-load any functions you put in `$ZDOTDIR/zfunctions`
- Auto-source any ZSH files you put in `$ZDOTDIR/zshrc.d`
- Robust keybindings in the shell
- Sets your [XDG base directories][xdg-basedirs] if they haven't already been set

### Leverage awesome ZSH plugins

- Smart command [autosuggestions][zsh-autosuggestions] based on previously used commands
- Allow [history substring searching][zsh-history-substring-search]
- Call-out mistakes easily with [syntax highlighting][fast-syntax-highlighting] for shell commands
- More complete [completions][zsh-completions]

### Leverage attractive ZSH prompt themes

- Other frameworks try to add their own clumsy theming system. Why?!
- Zebrafish uses the built-in [ZSH prompt theme system][zsh-prompt-theme]
- Some of the best ZSH themes are already included and available using the
  `prompt` command
- `prompt -l` lists what prompts are available
- `prompt -p` previews the prompts
- Read more [here](http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Theme-Selection)

## How is Zebrafish different?

Projects like [oh-my-zsh] and [prezto] are neat. They do a ton of work to create a
full featured ZSH environment, and make ZSH welcoming and exciting for new users.
But these frameworks have downsides. They can be slow. They have a ton of files
and configs and plugins. They are in charge of bootstrapping your whole ZSH
configuration. They mix themes and aliases and configuration and functions
and plugins all into one giant soup of ZSH stuff. It's hard to know what it's all
doing, and even harder to modify the parts you might not like.

Zebrafish is different because it's not a ZSH framework that tries to do everything
under the sun. Instead, it's a set of sane defaults and handy tools that lets you
easily build up the rest of you ZSH config from there. Since Zebrafish is housed
in a single file, you also can easily do things like:

- See everything Zebrafish does in one place
- Turn off parts you don't like
- Extend it with new features
- Roll your own ZSH configuration without all the boilerplate stuff that really
  should just be built-in [like other shells already do][fish-shell]
- Control your whole config just from your custom .zshrc instead of from a
  .specialrc file
- Use parts of this configuration on a server that cannot reach out to git
  sources like github.
- Add this file directly to your own [dotfiles] repo or manage it with a plugin
  manager like [zgen]
- Share your ZSH configuration with your co-workers and friends easily without
  forcing them to commit to using a whole framework

If you like [oh-my-zsh] or [prezto], you can keep using them with Zebrafish.
Zebrafish is meant to be built upon, but it's full featured and powerful all
by itself.

## Customization

Zebrafish has great defaults, and by default it's intended to work with nothing
more fancy than `source ${ZDOTDIR:-$HOME}/zebrafish.zsh`, but sometimes you
really do want to customize something. The [customization.md](customization.md)
in this project describes those options.

## Installation

Installation methods:
- [zgen]: `zgen load mattmc3/zebrafish`
- [oh-my-zsh]:
  ```shell
  ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}
  git clone --depth 1 https://github.com/mattmc3/zebrafish.git $ZSH_CUSTOM/zebrafish
  # now add zebrafish to your plugins variable in .zshrc
  ```
- [antibody]: `antibody bundle mattmc3/zebrafish`
- [antigen]: `antigen bundle mattmc3/zebrafish`
- manually with curl:
  ```shell
  curl -s -o ${ZDOTDIR:-$HOME}/zebrafish.zsh https://raw.githubusercontent.com/mattmc3/zebrafish/master/zebrafish.zsh
  echo ". ${ZDOTDIR:-$HOME}/zebrafish.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
  ```

[antibody]:                      https://getantibody.github.io
[antigen]:                       https://github.com/zsh-users/antigen
[dotfiles]:                      https://dotfiles.github.io/
[fast-syntax-highlighting]:      https://github.com/zdharma/fast-syntax-highlighting
[fish-shell]:                    https://fishshell.com/
[oh-my-zsh]:                     https://github.com/robbyrussell/oh-my-zsh
[prezto]:                        https://github.com/sorin-ionescu/prezto
[xdg-basedirs]:                  https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
[zgen]:                          https://github.com/tarjoilija/zgen
[zsh-autosuggestions]:           https://github.com/zsh-users/zsh-autosuggestions
[zsh-completions]:               https://github.com/zsh-users/zsh-completions
[zsh-history-substring-search]:  https://github.com/zsh-users/zsh-history-substring-search
[zsh-prompt-theme]:              http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Prompt-Themes

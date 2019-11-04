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

A solid base ZSH configuration achieved with one small, simple include.

Borrows some great ideas from [fish shell][fish-shell], but with a ZSH flair.

## What's included

### Leverage amazing ZSH features using what already comes with ZSH

- Sets better ZSH default options
- Sets good defaults for common environment variables
- Adds a sane history configuration
- Auto-sources any ZSH config files you put in `${ZDOTDIR:-$HOME}/.zshrc.d`
- Lazy loads any ZSH function files you put in `${ZDOTDIR:-$HOME}/.zfunctions`
- Adds great default keybindings
- Sets the [XDG base directories][xdg-basedirs] if they haven't already been set

### Extend ZSH features with other ZSH projects from around the web

- Auto-sources any ZSH plugins you put in `${ZDOTDIR:-$HOME}/.zplugins`
- Adds prompt themes to your `fpath` for any prompts in `${ZDOTDIR:-$HOME}/.zprompts`

### More information

Zebrafish's features are covered in more detail on the
[features.md](docs/features.md) page.

## What's not included

Zebrafish doesn't include anything you don't get out of the box with ZSH. That
means that "plugins" and "prompts" from other git projects are not directly
included in this project, though they are supported. Sometimes you are on a
server where arbitrary ZSH code from the internet is not advisable, in which
case Zebrafish will still work just fine as a standalone file - tiny and fast.

There are a lot of great ZSH plugins out there, and I highly recommend grabbing
a few to add even more features to your ZSH config. You can use a plugin manager
like [zgen] if you think you want one, though `git` is simple and easy too.
Zebrafish can be treated like a plugin itself and loaded from a plugin manager,
or just a simple stand alone include from your .zshrc and then it can load
plugins you pulled with `git` into `${ZDOTDIR:-$HOME}/.zplugins}`.

## How is Zebrafish different?

### Compared to frameworks

Projects like [oh-my-zsh], [zimfw] and [prezto] are neat. They do a ton of work
to create a full featured ZSH environment, and make ZSH welcoming and exciting
for new users. But these frameworks have downsides. They can be slow. They have
a ton of files and configs and plugins. They are in charge of bootstrapping your
whole ZSH configuration. They mix concepts of themes, aliases, functions, shell
options, and plugins all into one giant soup of ZSH stuff. It's hard to know
what it's all doing, and even harder to modify the parts you might not like.

Zebrafish is different because it's not a ZSH framework that tries to do
everything under the sun. Instead, it's just a set of sane defaults and handy
tools that lets you easily build up the rest of you ZSH config from there. You
can even use it with a ZSH framework if you prefer. Since Zebrafish is housed
in a single file, you also can easily do things like:

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

If you like [oh-my-zsh] or [prezto], you can keep using them with Zebrafish.
Zebrafish is meant to be built upon. It just sets up your initial ZSH
configuration in a way that makes sense so you don't have to do it all.

Just keep in mind that loading other plugins and frameworks _after_ Zebrafish
means it's likely you overrode some of Zebrafish's settings.

### Compared to just using .zshrc

There's no reason you can't put the contents of Zebrafish directly in your
.zshrc. But, this project is great for folks that like a clean .zshrc file and
want a reasonable base configuration to build their .zshrc from.

## Customization

Zebrafish has great settings, and by default it's intended to work with nothing
more fancy than `source ${ZDOTDIR:-$HOME}/.zebrafish.zsh`, but sometimes you
really do want to customize something. The [customization.md](docs/customization.md)
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
  curl -s -o ${ZDOTDIR:-$HOME}/.zebrafish.zsh https://raw.githubusercontent.com/mattmc3/zebrafish/master/zebrafish.plugin.zsh
  echo ". ${ZDOTDIR:-$HOME}/.zebrafish.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
  ```

[antibody]:                      https://getantibody.github.io
[antigen]:                       https://github.com/zsh-users/antigen
[dotfiles]:                      https://dotfiles.github.io/
[fast-syntax-highlighting]:      https://github.com/zdharma/fast-syntax-highlighting
[fish-shell]:                    https://fishshell.com/
[oh-my-zsh]:                     https://github.com/robbyrussell/oh-my-zsh
[prezto]:                        https://github.com/sorin-ionescu/prezto
[xdg-basedirs]:                  https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
[zimfw]:                         https://github.com/zimfw/zimfw
[zgen]:                          https://github.com/tarjoilija/zgen
[zsh-autosuggestions]:           https://github.com/zsh-users/zsh-autosuggestions
[zsh-completions]:               https://github.com/zsh-users/zsh-completions
[zsh-history-substring-search]:  https://github.com/zsh-users/zsh-history-substring-search
[zsh-prompt-theme]:              http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Prompt-Themes

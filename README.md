# dotfiles
[![MIT License](http://img.shields.io/badge/license-MIT-red.svg?style=flat-square)][license]
[![CircleCI](https://circleci.com/gh/paveg/dotfiles.svg?style=svg&circle-token=8450388e746829bdec04897f4153e91b085b3a9e)][circleci]
[![DockerHub](https://images.microbadger.com/badges/version/paveg/dotfiles.svg)][dockerhub]

## Styles

![example](https://github.com/paveg/dotfiles/blob/gif/examples/moving.gif)

### Main color theme

* Neovim
  * [vim-material-theme][vim-theme]
* Terminal theme
  * [MaterialDark][theme]

## Prepare

required:
  - cURL
  - git
  - brew / linuxbrew
  - ruby

### linux

- Please install Linuxbrew. ( [Repository](https://github.com/Linuxbrew) )

### macOS

- Please install brew.

## Quick Start

```bash
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/paveg/dotfiles/master/etc/installer.sh)"
$ echo $(brew --prefix)/bin/zsh | sudo tee -a /etc/shells
$ sudo chsh -s $(brew --prefix)/bin/zsh
```

## Configuration

### C++

```bash
# for MacOS
$ brew install llvm
$ ln -s "/usr/local/Cellar/llvm/<version>/bin/clangd" "/usr/local/bin/clangd"
```

### Rust

```bash
# @see https://github.com/rust-lang/rustup.rs
$ cd $HOME
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
$ rustup completions zsh > ~/.zfunc/_rustup
```

### Environment

|key|value|
|:---:|:---:|
|ONELOGIN_AWS_MAIL|onelogin aws email|

## Constitution

* [brew](https://github.com/Homebrew/brew) - package manager
* [zsh](http://www.zsh.org/) - THE Z SHELL (ZSH)
* [zplug](https://github.com/zplug/zplug) - zsh plugin manager
* [pure](https://github.com/sindresorhus/pure) - Pretty, minimal and fast ZSH prompt
* [neovim](https://github.com/neovim/neovim) - Neovim is a project that seeks to aggressively refactor Vim
* [anyenv](https://github.com/anyenv/anyenv) - All in one for \*\*env

---

* [bat](https://github.com/sharkdp/bat) - A cat(1) clone with wings
* [exa](https://github.com/ogham/exa) - A modern version of ‘ls’

### Directory

```textmate
~/dotfiles
pav@ryota-2.local ❯❯❯ tree -aL 3 --dirsfirst -I '.git|.idea|*.zwc|.zcompdump|.zcompcache|examples|.circleci|.github|LICENSE|README.md|.dockerignore|Dockerfile|.envrc' .
.
├── .zsh.d
│   ├── .zfunc
│   │   ├── .keep
│   │   └── _rustup
│   ├── utils
│   │   ├── alias.zsh         # Define the alias you usually use
│   │   ├── core.zsh          # Define core zsh configuration
│   │   ├── env.zsh           # Define environment
│   │   ├── functions.zsh     # Define convenient functions
│   │   ├── key_bindings.zsh  # Define zsh key bindings
│   │   ├── tmux.zsh          # Define tmux functions
│   │   └── zplug.zsh         # Zsh plugin manager configuration
│   ├── .zprofile             # Source only once library at startup terminal
│   ├── .zshenv               # Actual zsh environment
│   └── .zshrc                # Defined common zsh configuration
├── bin
│   ├── gcp-context           # Fetch Google Cloud Platform information
│   ├── kube-context          # Fetch kubectl information
│   └── wifi-info             # Fetch wi-fi information
├── etc
│   └── installer.sh          # Installer dotfiles
├── lib
│   └── utilities.sh          # Utility bash shell functions
├── nvim
│   ├── after
│   │   └── coc.vim           # Coc configuration file
│   ├── dein
│   │   ├── cpp.toml          # C++ plugins
│   │   ├── go.toml           # Go plugins
│   │   ├── javascript.toml   # JavaScript and TypeScript plugins
│   │   ├── lazy.toml         # Lazy load plugins
│   │   ├── markdown.toml     # Markdown plugins
│   │   ├── plugins.toml      # Common plugins
│   │   ├── plugins.toml      # Common plugins
│   │   ├── python.toml       # Python plugins
│   │   └── ruby.toml         # Ruby plugins
│   │   └── rust.toml         # Rust plugins
│   ├── rc
│   │   ├── plugins           # Vim plugins directory
│   │   └── plugins.vim       # Init plugins
│   ├── coc-settings.json     # Coc configuration json file
│   └── init.vim              # Vim initializer
├── pkg
│   ├── brew.txt              # Brew package list
│   └── brew_cask.txt         # Brew cask package list
├── .commit_template          # Commit template
├── .gitconfig                # Global git config file
├── .gitignore                # Global git ignore file
├── .tmux.conf                # Tmux configuration file
├── .zshenv                   # Invite you to zsh
└── Makefile
```

## Continuous Integration

**Keep building the development environment continuously**

#### **Do not stop development\!**

## Note

* Respect [b4b4r07/dotfiles](https://github.com/b4b4r07/dotfiles) and borrow part of the code

[license]: https://github.com/paveg/dotfiles/blob/master/LICENSE
[circleci]: https://circleci.com/gh/paveg/dotfiles
[dockerhub]: https://microbadger.com/images/paveg/dotfiles
[vim-theme]: https://github.com/jdkanani/vim-material-theme
[theme]: https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/xfce4terminal/colorschemes/MaterialDark.theme

![dotfiles](https://github.com/paveg/dotfiles/blob/gif/examples/logo.png)

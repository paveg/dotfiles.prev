# dotfiles
[![MIT License](http://img.shields.io/badge/license-MIT-red.svg?style=flat-square)][license]
[![CircleCI](https://circleci.com/gh/paveg/dotfiles.svg?style=svg&circle-token=8450388e746829bdec04897f4153e91b085b3a9e)][circleci]
![Build Status][azure]
[![DockerHub](https://images.microbadger.com/badges/version/paveg/dotfiles.svg)][dockerhub]

[license]: https://github.com/paveg/dotfiles/blob/master/LICENSE
[azure]: https://dev.azure.com/pavegy/pavegy/_apis/build/status/paveg.dotfiles?branchName=master
[circleci]: https://circleci.com/gh/paveg/dotfiles
[dockerhub]: https://microbadger.com/images/paveg/dotfiles

## Styles

![styles](./examples/styles.png)

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
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/paveg/dotfiles/master/etc/installer)"
$ echo $(brew --prefix)/bin/zsh | sudo tee -a /etc/shells
$ sudo chsh -s $(brew --prefix)/bin/zsh
```

## Configuration

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
pav@ryota.local ❯❯❯ tree -aL 3 --dirsfirst -I '.git|.idea|*.zwc|.zcompdump|.zcompcache|examples' .
.
├── .circleci
│   └── config.yml
├── .zsh.d
│   ├── utils
│   │   ├── alias.zsh         # Define the alias you usually use
│   │   ├── core.zsh          # Define core zsh configuration
│   │   ├── env.zsh           # Define environment
│   │   ├── functions.zsh     # Define convenient function
│   │   ├── key_bindings.zsh  # Define zsh key bindings
│   │   └── zplug.zsh         # Zsh plugin manager configuration
│   ├── .zprofile             # Source only once library at startup terminal
│   ├── .zshenv               # Actual zsh environment
│   └── .zshrc                # Normal zshrc; defined common zsh configuration
├── bin
│   ├── gcp-context           # Fetch Google Cloud Platform information
│   ├── kube-context          # Fetch kubectl information
│   └── wifi-info             # Fetch wi-fi information
├── etc
│   └── installer             # Installer dotfiles
├── lib
│   └── utilities.sh          # Utility bash shell functions
├── nvim
│   ├── dein
│   │   ├── go.toml           # Go plugins
│   │   ├── javascript.toml   # Javascript plugins
│   │   ├── lazy.toml         # Lazy load plugins
│   │   ├── plugins.toml      # Common plugins
│   │   ├── python.toml       # Python plugins
│   │   └── ruby.toml         # Ruby plugins
│   ├── rc
│   │   └── plugins.vim       # Init plugins
│   └── init.vim              # Vim initializer
├── pkg
│   ├── brew.txt              # Brew package list
│   └── brew_cask.txt         # Brew cask package list
├── .dockerignore
├── .envrc
├── .gitconfig
├── .gitignore
├── .tmux.conf                # Tmux configuration file
├── .zshenv                   # Invite you to zsh
├── Dockerfile
├── LICENSE
├── Makefile
├── README.md
└── azure-pipelines.yml
```

## Continuous Integration

**Keep building the development environment continuously**

#### **Do not stop development\!**

## Note

* Respect [b4b4r07/dotfiles](https://github.com/b4b4r07/dotfiles) and borrow part of the code

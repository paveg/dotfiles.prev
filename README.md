# dotfiles

[![CircleCI](https://circleci.com/gh/paveg/dotfiles.svg?style=svg&circle-token=8450388e746829bdec04897f4153e91b085b3a9e)][circleci]
![Build Status][azure]
[![DockerHub](https://images.microbadger.com/badges/version/paveg/dotfiles.svg)][dockerhub]

[azure]: https://dev.azure.com/pavegy/pavegy/_apis/build/status/paveg.dotfiles?branchName=master
[circleci]: https://circleci.com/gh/paveg/dotfiles
[dockerhub]: https://microbadger.com/images/paveg/dotfiles

## Prepare

### linux

- Please install Linuxbrew. ( [Repository](https://github.com/Linuxbrew) )

### macOS

- Please install brew.

## Quick Start

```bash
$ git clone https://github.com/paveg/dotfiles $HOME/dotfiles
$ cd dotfiles && make install
```

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

```
❯ tree -aL 3 --dirsfirst -I '.git|.idea' .
.
├── .circleci
│   └── config.yml
├── .zsh.d
│   ├── utils
│   │   ├── alias.zsh    # Define the alias you usually use
│   │   ├── core.zsh     # Define core zsh configrtion
│   │   ├── env.zsh      # Define environment
│   │   ├── function.zsh # Define convenient function
│   │   └── zplug.zsh    # for zplug
│   ├── .zprofile        # source only once library at startup terminal
│   ├── .zshenv          # actual zsh environment
│   └── .zshrc           # normal zshrc; defined common zsh configuraton
├── lib
│   ├── package_list.sh  # brew an brew cask packages list
│   └── utilities.sh     # utility bash shell functions
├── .dockerignore
├── .envrc
├── .gitignore
├── .zshenv              # Invite you to zsh
├── Dockerfile
├── LICENSE
├── Makefile
├── README.md
├── azure-pipelines.yml
└── installer.sh         # Install this dotfile
```

## Continuous Integration

**Keep building the development environment continuously**

#### **Do not stop development\!**

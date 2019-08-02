# dotfiles

## Prepare

### for linux

- Please install Linuxbrew. ( [Repository](https://github.com/Linuxbrew) )

### for mac

- Please install Homebrew.

## Quick Start

```bash
$ git clone https://github.com/paveg/dotfiles $HOME/dotfiles
$ cd dotfiles && make install
```

## Constitution

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

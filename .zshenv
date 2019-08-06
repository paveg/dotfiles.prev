# initialize zsh env
setopt no_global_rcs

# Set dotfiles root directory as default variable
if [[ -z "${DOTPATH:-}" ]]; then
  if [[ -d $HOME/src/github.com/paveg/dotfiles ]]; then
    export DOTPATH=$HOME/src/github.com/paveg/dotfiles # for ghq src root
  else
    export DOTPATH=$HOME/dotfiles
  fi
fi

export ZDOTDIR=$DOTPATH/.zsh.d

. $ZDOTDIR/.zshenv

# zsh loading...

# load directly under .zsh* files, when you configure $ZDOTDIR.
# if not configure load $HOME/.z* files.

# at startup
# zshenv > zprofile > zshrc

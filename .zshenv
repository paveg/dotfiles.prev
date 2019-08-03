# initialize zsh env
setopt no_global_rcs

# Set dotfiles root directory as default variable
if [ -z "${DOTPATH:-}" ]; then
  export DOTPATH=$HOME/dotfiles
fi

export ZDOTDIR=$DOTPATH/.zsh.d

. $ZDOTDIR/.zshenv

# zsh loading...

# load directly under .zsh* files, when you configure $ZDOTDIR.
# if not configure load $HOME/.z* files.

# at startup
# zshenv > zprofile > zshrc

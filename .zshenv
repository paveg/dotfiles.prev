# initialize zsh env
setopt no_global_rcs
setopt combiningchars

# set your dotpath
export DOTPATH=$HOME/src/github.com/paveg/dotfiles
export ZDOTDIR=$DOTPATH/.zsh.d

. $ZDOTDIR/.zshenv

# zsh loading...

# load directly under .zsh* files, when you configure $ZDOTDIR.
# if not configure load $HOME/.z* files.

# at startup
# zshenv > zprofile > zshrc

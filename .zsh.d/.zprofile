. $ZDOTDIR/utils/alias.zsh

if (($+commands[nvim])); then
  export EDITOR=nvim
  export GIT_EDITOR="${EDITOR}"
fi

# NOTE: git config source XDG Base Directory...
if [[ ! -e $XDG_CONFIG_HOME/git ]]; then
  mkdir $XDG_CONFIG_HOME/git
  ln -sf $DOTPATH/.gitconfig $XDG_CONFIG_HOME/git/config
  echo "set your global git config: $XDG_CONFIG_HOME/git/config"
fi

# NOTE: git config source XDG Base Directory...
if [[ ! -e $XDG_CONFIG_HOME/git ]]; then
  mkdir -p $XDG_CONFIG_HOME/git
  ln -sf $DOTPATH/.gitconfig $XDG_CONFIG_HOME/git/config
  ln -sf $DOTPATH/.commit_template $XDG_CONFIG_HOME/git/.commit_template
  echo "set your global git config: $XDG_CONFIG_HOME/git/config"
  if [[ -e $HOME/.gitconfig ]]; then
    echo "backup and mv global config"
    mv $HOME/.gitconfig $HOME/.gitconfig.bk
  fi
fi

log_pass "Loading complete .zprofile"

export PATH="$HOME/.cargo/bin:$PATH"

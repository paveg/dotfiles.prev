#!/bin/zsh -e
is_screen_running() { [[ ! -z "$STY" ]]; }
is_screen_or_tmux_running() { is_screen_running || is_tmux_running; }
shell_has_started_interactively() { [[ ! -z "$PS1" ]]; }
is_ssh_running() { [[ ! -z "$SSH_CONECTION" ]]; }
tmux_automatically_attach_session() {
  if is_screen_or_tmux_running; then
    ! is_exists 'tmux' && return 1
    if is_tmux_running; then
      log_info "Start to tmux session..."
    elif is_screen_running; then
      log_info "This is on screen."
    fi
  else
    if shell_has_started_interactively && ! is_ssh_running; then
      if ! is_exists 'tmux'; then
        log_fail 'Error: tmux command not found' 2>&1
        return 1
      fi

      if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
        # detached session exists
        tmux list-sessions
        echo -n "Tmux: attach? (y/N/num) "
        read
        if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
          tmux attach-session
          if [[ $? -eq 0 ]]; then
            log_info "$(tmux -V) attached session"
            return 0
          fi
        elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
          tmux attach -t "$REPLY"
          if [[ $? -eq 0 ]]; then
            log_info "$(tmux -V) attached session"
            return 0
          fi
        fi
      fi

      if is_osx && is_exists 'reattach-to-user-namespace'; then
        # on OS X force tmux's default command
        # to spawn a shell in the user's namespace
        tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
        tmux -f <(echo "$tmux_config") new-session && log_info "$(tmux -V) created new session supported OS X"
      else
        tmux new-session && log_info "tmux created new session"
      fi
    fi
  fi
}
tmux_automatically_attach_session

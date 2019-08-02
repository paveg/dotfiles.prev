# timezone
export TZ="Asia/Tokyo"

# locale
export LANGUAGE="ja_JP.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# Set dotfiles root directory as default variable
if [ -z "${DOTPATH:-}" ]; then
  DOTPATH=$HOME/.dotfiles; export DOTPATH
fi

# zsh core packages
if [ -z "${ZPLUG_HOME:-}" ]; then
  ZPLUG_HOME=$HOME/.zplug; export ZPLUG_HOME
fi

# XDG Base Directory Specification
# @see https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Homebrew Cask Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export SHELL="$(brew --prefix)/bin/zsh"

# anyenv
# see: https://github.com/anyenv/anyenv
export ANYENV_ROOT=$HOME/.anyenv

# Helm
export HELM_HOME=$HOME/.helm


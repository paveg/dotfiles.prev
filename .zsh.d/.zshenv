# Homebrew Cask Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export SHELL="$(brew --prefix)/bin/zsh"

# timezone
export TZ="Asia/Tokyo"

# locale
export LANGUAGE="ja_JP.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

. $ZDOTDIR/utils/alias.zsh

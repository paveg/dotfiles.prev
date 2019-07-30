#!/bin/bash
set -e
export PLATFORM
source ./lib/utilities.sh

log_pass "Starting the installation..."
# Set DOTPATH as default variable
if [ -z "${DOTPATH:-}" ]; then
    DOTPATH=~/.dotfiles; export DOTPATH
fi
if [ -d "$DOTPATH" ]; then
    log_fail "$DOTPATH: already exists"
    exit 1
fi
log_pass "dotfiles ok."

#!/usr/bin/env bash

# Bash Completion

# FIXME: This propagate to GNU Pass itself looking at the wrong store
export PASSWORD_STORE_DIR="$HOME/.notes-store"

if [ -f /usr/share/bash-completion/completions/pass ]; then
  source /usr/share/bash-completion/completions/pass
  complete -F _pass note
fi

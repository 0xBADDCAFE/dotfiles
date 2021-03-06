#!/usr/bin/env zsh
setopt EXTENDED_GLOB

# Install zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

SRCDIR=${0:a:h}

for rcfile in "${SRCDIR}"/zfiles/z*(.N); do
  <<RCFILE > "${ZDOTDIR:-$HOME}/.${rcfile:t}"
source ${rcfile}
RCFILE
done

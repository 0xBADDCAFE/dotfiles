#!/usr/bin/env zsh
setopt EXTENDED_GLOB

SRCDIR=${0:a:h}

ln -s ${SRCDIR}/.zprezto ${ZDOTDIR:-$HOME}/.zprezto
for rcfile in "${SRCDIR}"/zfiles/z*(.N); do
  <<RCFILE > "${ZDOTDIR:-$HOME}/.${rcfile:t}"
source ${rcfile}
RCFILE
done

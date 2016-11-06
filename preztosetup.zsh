#!/bin/env zsh
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	cp "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

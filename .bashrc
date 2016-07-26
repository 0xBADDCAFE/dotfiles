export HISTCONTROL=ignoreboth
export HISTIGNORE="fg*:bg*:history*:ls*"
export HISTSIZE=10000

PS1="\[\e[00;32m\]\u\[\e[0m\]\[\e[00;33m\]@\[\e[0m\]\[\e[00;32m\]\h:\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;36m\]\w\[\e[0m\]\[\e[00;37m\]\n\[\e[0m\]\[\e[00;32m\]\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"

# aliases
alias ls='ls -FG'

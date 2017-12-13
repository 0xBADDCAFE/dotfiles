source $BYOBU_PREFIX/share/byobu/profiles/tmux
set -g default-terminal "screen-256color"
# if-shell 'test "$(uname -s)" = Darwin && which reattach-to-user-namespace > /dev/null 2>&1' 'set -g default-command "reattach-to-user-namespace -l zsh"'
set -g display-panes-time 450
set-window-option -g mouse on
# if host's $TERM is xterm:
# set -g terminal-overrides 'xterm*:smcup@:rmcup@'

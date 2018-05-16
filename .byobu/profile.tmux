source $BYOBU_PREFIX/share/byobu/profiles/tmux
set -g default-terminal "screen-256color"
set -ga terminal-overrides ",xterm-256color:Tc"
# Change cursor shape with DECSCUSR like on Vim
# https://github.com/neovim/neovim/pull/3165#issuecomment-176451922
set -ga terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'
# if-shell 'test "$(uname -s)" = Darwin && which reattach-to-user-namespace > /dev/null 2>&1' 'set -g default-command "reattach-to-user-namespace -l zsh"'
set -g display-panes-time 450
set-window-option -g mouse on
# if host's $TERM is xterm:
# set -g terminal-overrides 'xterm*:smcup@:rmcup@'

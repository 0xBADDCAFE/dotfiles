unbind -n F1
unbind -n F2
unbind -n F3
unbind -n F4
unbind -n F5
unbind -n F6
unbind -n F7
unbind -n F8
unbind -n F9
unbind -n F10
unbind -n F11
unbind -n F12

unbind -n C-a
unbind -n C-t
set -g prefix ^T
set -g prefix2 ^T
bind t send-prefix
bind % display-panes \; split-window -h -c "#{pane_current_path}"
bind | display-panes \; split-window -v -c "#{pane_current_path}"

# Setup 'v' to begin selection as in Vim
# bind-key -t vi-copy v begin-selection
# bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"
 
# Update default binding of `Enter` to also use copy-pipe
if-shell 'test "$(uname -s)" = Darwin' 'unbind -t vi-copy Enter'
# bind -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"
if-shell 'test "$(uname -s)" = Darwin' 'bind -t vi-copy Enter copy-pipe "pbcopy"'

### https://github.com/tmux/tmux/issues/145 ###
# Start copy mode when scrolling up and exit when scrolling down to bottom.
# The "#{mouse_any_flag}" check just sends scrolls to any program running that
# has mouse support (like vim).
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M

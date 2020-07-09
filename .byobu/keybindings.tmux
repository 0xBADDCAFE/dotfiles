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
bind % split-window -h -c "#{pane_current_path}" \; display-panes
bind | split-window -v -c "#{pane_current_path}" \; display-panes

# Setup 'v' to begin selection as in Vim
# bind-key -t vi-copy v begin-selection
# bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"
 
# Update default binding of `Enter` to also use copy-pipe
if-shell 'test "$(uname -s)" = Darwin' 'unbind -T copy-mode-vi Enter'
# bind -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"
if-shell 'test "$(uname -s)" = Darwin' 'bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "pbcopy"'
# Clipboard bridge for VM to Windows host
if-shell "[ -x $GOPATH/bin/lemonade ]" 'bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "$GOPATH/bin/lemonade copy"'
# Clipboard bridge for WSL
if-shell "[ -x /mnt/c/Windows/System32/clip.exe ]" 'bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "/mnt/c/Windows/System32/clip.exe"'

### https://github.com/tmux/tmux/issues/145 ###
# Start copy mode when scrolling up and exit when scrolling down to bottom.
# The "#{mouse_any_flag}" check just sends scrolls to any program running that
# has mouse support (like vim).
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M

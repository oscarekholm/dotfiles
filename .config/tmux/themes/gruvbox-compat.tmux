#### COLOUR (Solarized 256)

# default statusbar colors
set-option -g status-bg colour235 #base02
set-option -g status-fg colour136 #yellow
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour244 #base0
set-window-option -g window-status-bg default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg colour81
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg colour240 #base01

# message text
set-option -g message-bg colour235 #base02
set-option -g message-fg colour166 #orange

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green

set-option -g status-position bottom
set-window-option -g xterm-keys on
bind-key -n S-Up set-option -g status
bind-key -n S-Down set-option -g status
bind-key -n S-Left previous-window
bind-key -n S-Right next-window
set-option -g status-fg white
set-option -g status-bg default
set-option -g status-attr default
set-window-option -g window-status-fg "#666666"
set-window-option -g window-status-bg default
set-window-option -g window-status-attr default
set-option -g message-fg white
set-option -g message-bg black
set-option -g message-attr bright
set -g status-left '#[fg=#666,bold] #S #[fg=colour252,bg=colour238,nobold]'
set -g status-justify left
set -g window-status-format "> #I #W"
set -g window-status-current-format "#[noreverse]> #I #W"
set-window-option -g window-status-current-fg red
set-window-option -g window-status-current-bg default
set-window-option -g window-status-current-attr default

set -g status-right-length 300
set -g status-right '#[fg=yellow] #(np granhelvete) | #[fg=red,noreverse,nobold]%H:%M |#[fg=red,noreverse,nobold,bg=default] %y.%m.%d '

# Hide now playing status
bind > set -g status-right '#[fg=yellow] #(np granhelvete) | #[fg=red,noreverse,nobold]%H:%M |#[fg=red,noreverse,nobold,bg=default] %y.%m.%d '
bind < set -g status-right '#[fg=red,noreverse,nobold]%H:%M |#[fg=red,noreverse,nobold,bg=default] %y.%m.%d '

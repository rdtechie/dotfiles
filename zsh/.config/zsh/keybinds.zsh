# bindkey -s '^f' "$HOME/.local/bin/tmux-sessionizer\n"
# bindkey -s '\eh' "$HOME/.local/bin/tmux-sessionizer -s 0\n"
# bindkey -s '\et' "$HOME/.local/bin/tmux-sessionizer -s 1\n"
# bindkey -s '\en' "$HOME/.local/bin/tmux-sessionizer -s 2\n"
# bindkey -s '\es' "$HOME/.local/bin/tmux-sessionizer -s 3\n"
#
# zle     -N             sesh-sessions
# bindkey -M emacs '\es' sesh-sessions
# bindkey -M vicmd '\es' sesh-sessions
# bindkey -M viins '\es' sesh-sessions
#
bindkey -s '^f' sesh-sessions

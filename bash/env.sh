export EDITOR='vim'
export GIT_EDITOR='vim'

# Enable shell history in iex
export ERL_AFLAGS="-kernel shell_history enabled"

# Allow ctrl+s without locking the session when sshing
bind -r '\C-s'
stty -ixon

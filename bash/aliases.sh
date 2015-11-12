# Dirs
alias p="cd ~/Projects"
alias o="open ."  # OS X, open in Finder

# http://www.hogbaysoftware.com/products/plaintext
alias text='cd ~/Dropbox/PlainText; vim'

# Management
alias dots="cd ~/.dotfiles; vim"
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/.dotfiles && git pull && rake; cd -'

# Dropbox projects
alias mdrop='~/Dropbox/Projects/move_here.sh'
alias sdrop='~/Dropbox/Projects/symlink.rb'

# Shell
alias c='clear'
alias la='ls -alh'
alias cdd='cd -'  # back to last directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Portable ls with colors
if ls --color -d . >/dev/null 2>&1; then
  alias ls='ls --color=auto'  # Linux
elif ls -G -d . >/dev/null 2>&1; then
  alias ls='ls -G'  # BSD/OS X
fi

# General purpose app development aliases
alias co='[ -e mix.exs ] && iex -S mix || bundle exec rails console'
alias hco="heroku run '[ -e mix.exs ] && iex -S mix || bundle exec rails console'"
alias mig="[ -f mix.exs ] && mix ecto.migrate || rake db:migrate"

# Ruby on Rails
alias sc='bundle exec rails console'
alias ss='bundle exec rails server'
alias sdb="[ -f script/dbconsole ] && script/console --include-password || bundle exec rails dbconsole --include-password"
alias rs='rake spec'
alias rsu='rake spec:unit'
alias rsua='rake spec:unit:all'
alias rsa='rake spec:all'
alias tdev='tail -n 90 -f log/development.log'
alias tdevp='tdev | egrep "*Parameters"'
alias tprod='tail -f log/production.log'
alias rsp='rake testbot:spec'
alias rsc='rake spec:changed'
alias prep='rake db:test:prepare'
alias g='bundle exec guard'
alias f='script/foreman_turbux'
alias ref='script/refresh'

# Git
alias gl="git pull --rebase"
alias gs="git status"
alias gst="git status"
alias gw="git show"
alias gd="git diff"  # What's changed but not yet added?
alias gdc="git diff --cached"  # What's added but not yet committed?
alias ga='git add'
alias gc="git commit -v -a"
# For gca, see functions.sh
alias gcac="git commit -a -m 'Cleanup'"
alias gam="git commit --amend"
alias gamm="git add --all && git commit --amend -C HEAD"
alias gco="git checkout"
alias gb="git checkout -b --color"
alias gba='git branch -a --color'
alias gp='git push'
alias gps='git stash && gpp && git stash pop'
alias gpp='git pull --rebase && git push'
alias gcp="git cherry-pick"
alias gm='git merge'
alias gbt='git branch --track' # stubs origin/stubs
alias mim='mergeinmaster'
alias grb='git-remote-branch'
alias stats='git shortlog -s -n'
alias emptycommit='git commit --allow-empty -v'

# Xcode versioning
# http://www.blog.montgomerie.net/easy-iphone-application-versioning-with-agvtool
alias xv="agvtool what-version; agvtool what-marketing-version"  # Show versions.
alias xvbump="agvtool bump -all"  # Bump build number.
alias xvset="agvtool new-marketing-version"  # Set user-visible version: xvset 2.0

# Servers
alias grace='sudo apachectl graceful'
alias rst="touch tmp/restart.txt && echo touched tmp/restart.txt"  # Passenger
alias res="touch tmp/restart.txt && echo touched tmp/restart.txt"  # Passenger

alias hosts='sudo vim /etc/hosts'

# RVM
alias gsd="rvm gemset delete"
alias gsc="rvm gemset create"
alias gsl="rvm gemset list"
alias gsu="rvm gemset use"
alias rvu="rvm use"

# Other:
alias online="ping -c 1 www.sunet.se &> /dev/null && echo 'Online :)' || echo 'Offline :('"
alias v="vagrant"
alias ta='tmux attach'
alias to='teamocil --here'

alias paira="git config user.pair 'AR+JK' && git config user.name 'Albert Ramstedt and Joakim Kolsjö' && git config user.email 'all+albert+jocke@barsoom.se'; pair"
alias pairk="git config user.pair 'JK+KP' && git config user.name 'Joakim Kolsjö and Kim Persson' && git config user.email 'all+jocke+kim@barsoom.se'; pair"
alias pairt="git config user.pair 'JK+TS' && git config user.name 'Joakim Kolsjö and Tomas Skogberg' && git config user.email 'all+jocke+tomas@barsoom.se'; pair"
alias pairv="git config user.pair 'JK+VA' && git config user.name 'Joakim Kolsjö and Victor Arias' && git config user.email 'all+jocke+victor@barsoom.se'; pair"
alias pairf="git config user.pair 'FH+JK' && git config user.name 'Joakim Kolsjö and Fabian Hoffmann' && git config user.email 'all+fabian+jocke@barsoom.se'; pair"
alias pairl="git config user.pair 'JK+LF' && git config user.name 'Joakim Kolsjö and Lennart Fridén' && git config user.email 'all+jocke+lennart@barsoom.se'; pair"

# Dirs
alias p="cd ~/Projects"
alias a="cd ~/Projects/auktion"
alias tc="cd ~/Projects/testbot_cloud"
alias t="cd ~/Projects/testbot"
alias o="open ."  # OS X, open in Finder

# http://www.hogbaysoftware.com/products/plaintext
alias text='mvim ~/Dropbox/PlainText'

# Management
alias dots="mvim ~/.dotfiles"
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

# Ruby on Rails
alias sc="[ -f script/console ] && script/console || bundle exec rails console"
alias sdb="[ -f script/dbconsole ] && script/console --include-password || bundle exec rails dbconsole --include-password"
alias ss="[ -f script/server ] && script/server || rails server"
alias cu='script/cucumber features -b -s -f progress'
alias cuf='rake features:focus'
alias rs='rake spec'
alias mig='rake db:migrate'
alias mpr='mate-open app features config lib db/schema.rb db/migrate public spec script/cruise stories test todo.txt script/cron script/oneoff script/app Gemfile'
alias tdev='tail -n 90 -f log/development.log'
alias tdevp='tdev | egrep "*Parameters"'
alias tprod='tail -f log/production.log'
alias sp='script/spork'
alias spc='script/spork cucumber'
alias rsp='bundle exec specjour'
alias cup='rake testbot:features'
alias prep='rake db:test:prepare'
alias g='guard'
alias f='foreman start'

# Git
alias gl="git pull --rebase"
alias gs="git status"
alias gst="git status"
alias gw="git show"
alias gd="git diff"  # What's changed but not yet added?
alias gdc="git diff --cached"  # What's added but not yet committed?
alias ga='git add'
alias gc="git commit -v -a"
alias gca="git commit -v -a"
alias gam="git commit --amend"
alias gco="git checkout"
alias go="git checkout"
alias gb="git checkout -b --color"
alias gba='git branch -a --color'
alias gp='git push'
alias gpp='git pull && git push'
alias gcp="git cherry-pick"
alias gm='git merge'
alias gbt='git branch --track' # stubs origin/stubs
alias mim='mergeinmaster'
alias grb='git-remote-branch'
alias stats='git shortlog -s -n'

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

# Work
# Use with autologin Greasemonkey script: http://gist.github.com/raw/487186/ccf2c203741c1e39eb45416d02bc58b2728427fc/basefarm_auto.user.js
alias vpn="open -a Firefox 'https://ssl-vpn.sth.basefarm.net/ssl'; sleep 1; osascript -e 'tell app \"System Events\" to set visible of process \"Firefox\" to false'"
alias vpnagent="sudo killall -9 vpnagentd; sudo nohup /opt/cisco/vpn/bin/vpnagentd -execv_instance &"

# LiveReload
alias lr="nohup /usr/bin/rake livereload &> /dev/null &"

# RVM
alias gsd="rvm gemset delete"
alias gsc="rvm gemset create"
alias gsl="rvm gemset list"
alias gsu="rvm gemset use"
alias rvu="rvm use"

# Other:
alias online="ping -c 1 www.sunet.se &> /dev/null && echo 'Online :)' || echo 'Offline :('"
alias v="vagrant"


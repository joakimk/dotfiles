# Read profile if it exists
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Bundler bin-stubs
export PATH=.bundle/bin:$PATH

# Useful for running bins within a project
export PATH=bin:$PATH

# Scripts
export PATH=/Users/jocke/.scripts:/usr/local/bin:$PATH

# Python
export PATH=/usr/local/Cellar/python/2.6.5/bin:$PATH

# Mysql
export PATH=/usr/local/mysql/bin:$PATH

# STk (Scheme)
export PATH=/Applications/STk/bin:$PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# autojump
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

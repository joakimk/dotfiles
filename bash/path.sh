# Read profile if it exists
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Scripts
export PATH=/Users/jocke/.scripts:/usr/local/bin:$PATH

# Python
export PATH=/usr/local/Cellar/python/2.6.5/bin:$PATH

# Mysql
export PATH=/usr/local/mysql/bin:$PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

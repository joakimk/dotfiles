source ~/.bash/path.sh
source ~/.bash/env.sh
source ~/.bash/prompt.sh
source ~/.bash/aliases.sh
source ~/.bash/functions.sh
source ~/.bash/lib/gitpair.sh

if [ -f ~/Dropbox/Scripts/bash_private.sh ]
then
  source ~/Dropbox/Scripts/bash_private.sh
fi

if [ -f ~/.bash_local ]
then
  source ~/.bash_local
fi

[[ -s "$HOME/.bs/profile" ]] && source "$HOME/.bs/profile"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

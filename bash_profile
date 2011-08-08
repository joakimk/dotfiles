source ~/.bash/path.sh
source ~/.bash/env.sh
source ~/.bash/prompt.sh
source ~/.bash/aliases.sh
source ~/.bash/functions.sh

if [ -f ~/Dropbox/Scripts/bash_private.sh ]
then
  source ~/Dropbox/Scripts/bash_private.sh
fi

[[ -s "$HOME/.bs/profile" ]] && source "$HOME/.bs/profile"
[[ -s "$HOME/.bdev/profile" ]] && source "$HOME/.bdev/profile"

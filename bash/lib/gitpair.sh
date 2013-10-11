# Simple git pair. Like "hitch" but simpler/less buggy for me. WiP.
# Also see prompt.sh.

alias pair='echo "Committing as: `git config user.name` <`git config user.email`>"'
alias unpair="git config --remove-section user 2> /dev/null; echo Unpaired.; pair"

alias pairh="git config user.pair 'HN+JK' && git config user.name 'Henrik Nyh and Joakim Kolsjö' && git config user.email 'all+henrik+jocke@barsoom.se'; pair"

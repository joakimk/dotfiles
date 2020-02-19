# Simple git pair. Like "hitch" but simpler/less buggy for me.
# Also see prompt.sh.

getpair() { echo "`git config user.name` <`git config user.email`>"; }

alias pair='echo Committing as: `getpair`'
alias unpair="git config --remove-section user 2> /dev/null; echo Unpaired.; pair"

# Amend the last commit with the current pair (when you forget to set the pair until after committing.)
alias pair!='git commit --amend -C HEAD --author="`getpair`"; git show --format="Author: %an <%ae>" --quiet'
alias paira="git config user.pair 'AR+JK' && git config user.name 'Albert Ramstedt and Joakim Kolsjö' && git config user.email 'all+albert+jocke@barsoom.se'; pair"
alias pairk="git config user.pair 'JK+KP' && git config user.name 'Joakim Kolsjö and Kim Persson' && git config user.email 'all+jocke+kim@barsoom.se'; pair"
alias pairt="git config user.pair 'JK+TS' && git config user.name 'Joakim Kolsjö and Tomas Skogberg' && git config user.email 'all+jocke+tomas@barsoom.se'; pair"
alias pairv="git config user.pair 'JK+VA' && git config user.name 'Joakim Kolsjö and Victor Arias' && git config user.email 'all+jocke+victor@barsoom.se'; pair"
alias pairf="git config user.pair 'FH+JK' && git config user.name 'Joakim Kolsjö and Fabian Hoffmann' && git config user.email 'all+fabian+jocke@barsoom.se'; pair"
alias pairl="git config user.pair 'JK+LF' && git config user.name 'Joakim Kolsjö and Lennart Fridén' && git config user.email 'all+jocke+lennart@barsoom.se'; pair"
alias pairp="git config user.pair 'JK+PW' && git config user.name 'Joakim Kolsjö and Peter Wall' && git config user.email 'all+jocke+peter@barsoom.se'; pair"
alias pairh="git config user.pair 'HN+JK' && git config user.name 'Henrik Nyh and Joakim Kolsjö' && git config user.email 'all+henrik+jocke@barsoom.se'; pair"
alias pairht="git config user.pair 'HN+JK+TS' && git config user.name 'Henrik Nyh and Joakim Kolsjö and Tomas Skogberg' && git config user.email 'all+henrik+jocke+tomas@barsoom.se'; pair"
alias pairmob="git config user.pair 'MOB' && git config user.name 'Mob' && git config user.email 'devs@auctionet.com'; pair"

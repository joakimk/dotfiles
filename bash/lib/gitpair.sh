# Simple git pair. Like "hitch" but simpler/less buggy for me.
# Also see prompt.sh.

# Disabled in order to use another pairing script.
#getpair() { echo "`git config user.name` <`git config user.email`>"; }
#
#alias pair='echo Committing as: `getpair`'
#alias unpair="git config --remove-section user 2> /dev/null; echo Unpaired.; pair"
#
## Amend the last commit with the current pair (when you forget to set the pair until after committing.)
#alias pair!='git commit --amend -C HEAD --author="`getpair`"; git show --format="Author: %an <%ae>" --quiet'
#alias paira="git config user.pair 'JK+AR' && git config user.name 'Joakim Kolsjö and Albert Ramstedt' && git config user.email 'devs+joakimk+soma@auctionet.com'; pair"
#alias pairk="git config user.pair 'JK+KP' && git config user.name 'Joakim Kolsjö and Kim Persson' && git config user.email 'devs+joakimk+lavinia@auctionet.com'; pair"
#alias pairt="git config user.pair 'JK+TS' && git config user.name 'Joakim Kolsjö and Tomas Skogberg' && git config user.email 'devs+joakimk+tskogberg@auctionet.com'; pair"
#alias pairv="git config user.pair 'JK+VA' && git config user.name 'Joakim Kolsjö and Victor Arias' && git config user.email 'devs+joakimk+victor@auctionet.com'; pair"
#alias pairl="git config user.pair 'JK+LF' && git config user.name 'Joakim Kolsjö and Lennart Fridén' && git config user.email 'devs+joakimk+lennart@auctionet.com'; pair"
#alias pairp="git config user.pair 'JK+PW' && git config user.name 'Joakim Kolsjö and Peter Wall' && git config user.email 'devs+joakimk+p-wall@auctionet.com'; pair"
#alias pairh="git config user.pair 'HN+JK' && git config user.name 'Henrik Nyh and Joakim Kolsjö' && git config user.email 'devs+henrik+joakimk@auctionet.com'; pair"
#alias pairht="git config user.pair 'HN+JK+TS' && git config user.name 'Henrik Nyh and Joakim Kolsjö and Tomas Skogberg' && git config user.email 'devs+henrik+joakimk+tskogberg@auctionet.com'; pair"
#alias pairpt="git config user.pair 'JK+PW+TS' && git config user.name 'Joakim Kolsjö and Peter Wall and Tomas Skogberg' && git config user.email 'devs+joakimk+p-wall+tskogberg@auctionet.com'; pair"
#alias pairop="git config user.pair 'JK+OJ+PW' && git config user.name 'Joakim Kolsjö, Olle Jonsson and Peter Wall' && git config user.email 'devs+joakimk+olleolleolle+p-wall@auctionet.com'; pair"
#alias pairo="git config user.pair 'JK+OJ' && git config user.name 'Joakim Kolsjö and Olle Jonsson' && git config user.email 'devs+joakimk+olleolleolle@auctionet.com'; pair"
#alias pairmob="git config user.pair 'MOB' && git config user.name 'Mob' && git config user.email 'devs@auctionet.com'; pair"

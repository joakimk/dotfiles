[ `git config user.pair` ] && GIT_PS1_PAIR="`git config user.pair`@"
export PS1='$GIT_PS1_PAIR$(~/.git-ps1 "[\u@\h \W]\$ ")'

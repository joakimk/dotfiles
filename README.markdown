# My dotfiles

## Install

    git clone git://github.com/joakimk/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && rake

This rake task will not replace existing files, but it will replace existing symlinks.

The dotfiles will be symlinked, e.g. `~/.bash_profile` symlinked to `~/.dotfiles/bash_profile`.

### <.replace>

If e.g. `~/.dotfiles/gitconfig` contains `<.replace github-token>` then

 * that bit will be replaced with the contents of `~/.github-token`
 * the resulting file will be written to `~/.dotfiles/gitconfig` directly, not symlinked
 
So if you want to make changes to that file, make them in `~/dotfiles/gitconfig` and then run `rake install` again.

Changes to symlinked files without `<.replace>` bits do not require a `rake install` on every change as they're symlinked.


## Vim

I'm assuming MacVim (`brew install macvim`) and at least Vim 7.

Vim plugins are each their own directory under vim/bundles thanks to [Pathogen](http://www.vim.org/scripts/script.php?script_id=2332).

## Extras

The `extras` directory contains additional configuration files that are not dotfiles:

 * `jellybeans_like_in_mvim.itermcolors` is a colorscheme for [iTerm2](http://www.iterm2.com/) adapted to match the colors in mvim using jellybeans+.
 * Also set xterm-256color to get the right colors in tmux (brew install tmux). Unlimited scrollback, uncheck lion style fullscreen.
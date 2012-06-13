runtime colors/jellybeans.vim
let g:colors_name = "jellybeans+"

hi  VertSplit    guibg=#888888
hi  StatusLine   guibg=#cccccc guifg=#000000
hi  StatusLineNC guibg=#888888 guifg=#000000

" Subtle colors so show the active split
" GUI colors are broken since I don't use GUI vim.
hi StatusLine             guifg=#000000 ctermfg=16  guibg=#FF5600 ctermbg=103  gui=ITALIC cterm=NONE
hi StatusLineNC           guifg=#000000 ctermfg=16   guibg=#FFFFFF ctermbg=102  gui=NONE cterm=NONE

" Highlight current line
hi CursorLine cterm=none ctermbg=235

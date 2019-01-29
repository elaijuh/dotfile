highlight clear

" forked from https://github.com/plan9-for-vimspace/acme-colors

hi! Normal guibg=#fff9c4 guifg=#000000 ctermbg=230 ctermfg=232
highlight! NonText guibg=bg guifg=#ffffea ctermbg=bg ctermfg=230
highlight! StatusLine guibg=#aeeeee guifg=#000000 gui=NONE ctermbg=159 ctermfg=232 cterm=NONE
highlight! StatusLineNC guibg=#eaffff guifg=#000000 gui=NONE ctermbg=194 ctermfg=232 cterm=NONE
highlight! WildMenu guibg=#000000 guifg=#eaffff gui=NONE ctermbg=black ctermfg=159 cterm=NONE
set fillchars=vert:│
hi! VertSplit guibg=bg guifg=fg gui=NONE
highlight! Folded guibg=#cccc7c guifg=fg gui=italic ctermbg=187 ctermfg=fg cterm=italic
highlight! FoldColumn guibg=#fcfcce guifg=fg ctermbg=229 ctermfg=fg
highlight! Conceal guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! LineNr guibg=bg guifg=#505050 gui=italic ctermbg=bg ctermfg=239 cterm=italic
hi! Visual guibg=#bbdefb guifg=NONE ctermbg=fg ctermfg=bg
hi! IncSearch term=NONE cterm=NONE ctermfg=white ctermbg=2 gui=NONE guifg=NONE guibg=#bbdefb
hi! Search term=NONE cterm=NONE ctermfg=white ctermbg=2 gui=NONE guifg=NONE guibg=#bbdefb
hi! ErrorMsg term=NONE cterm=NONE ctermfg=9 ctermbg=white gui=NONE guifg=white guibg=#e57373
hi! WarningMsg ctermfg=1 guifg=#e57373
hi! Error term=NONE cterm=NONE ctermfg=9 ctermbg=white gui=NONE guifg=white guibg=#e57373
hi! NvimInternalError term=NONE cterm=NONE ctermfg=9 ctermbg=white gui=NONE guifg=white guibg=#e57373
hi! Pmenu term=NONE cterm=NONE ctermfg=fg ctermbg=4 gui=NONE guifg=white guibg=#80cbc4
hi! MatchParen ctermbg=4 guibg=#80cbc4
hi! CursorLine ctermbg=4 guibg=#bbdefb
hi! Todo ctermfg=0 ctermbg=11 guifg=#000000 guibg=#ffee58

highlight! Statement guibg=bg guifg=fg gui=italic ctermbg=bg ctermfg=fg cterm=italic
highlight! Identifier guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! Type guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! PreProc guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! Constant guibg=bg guifg=#101010 gui=bold ctermbg=bg ctermfg=233 cterm=italic
highlight! Comment guibg=bg guifg=#303030 gui=italic ctermbg=bg ctermfg=236 cterm=italic
highlight! Special guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! SpecialKey guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! Directory guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! link Title Directory
highlight! link MoreMsg Comment
highlight! link Question Comment

" vim
hi link vimFunction Identifier

let g:colors_name = "acme"

" Vim color file
"
" based on elflord by Ron Aaron <ron@ronware.org>
"
" Author: Xiaoguang Zhu <steamstuffedbun@gmail.com>

" Basic elflord - simple copy
" Last Change:	2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mycolorscheme"
hi Normal		guifg=cyan			guibg=black
hi Comment	term=bold		ctermfg=DarkCyan		guifg=#80a0ff
hi Constant	term=underline	ctermfg=Magenta		guifg=Magenta
hi Special	term=bold		ctermfg=DarkMagenta	guifg=Red
hi Identifier term=underline	cterm=bold			ctermfg=Cyan guifg=#40ffff
hi Statement term=bold		ctermfg=Yellow gui=bold	guifg=#aa4444
hi PreProc	term=underline	ctermfg=LightBlue	guifg=#ff80ff
hi Type	term=underline		ctermfg=LightGreen	guifg=#60ff60 gui=bold
hi Function	term=bold		ctermfg=White guifg=White
hi Repeat	term=underline	ctermfg=White		guifg=white
hi Operator				ctermfg=Red			guifg=Red
hi Ignore				ctermfg=black		guifg=bg
hi Error	term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
hi Todo	term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String	Constant
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special


" Additions made by XG Z
" Targeting xterm-256
" Trying to make it atom-dark

highlight Normal ctermfg=254 ctermbg=234
highlight ColorColumn ctermbg=239
highlight LineNr ctermfg=DarkYellow
highlight CursorLineNr ctermfg=LightYellow
highlight CursorLine cterm=None ctermbg=235
highlight CursorColumn ctermbg=235

" so I have a better sense of where I'm at...
highlight StatusLineNC cterm=None ctermfg=Black ctermbg=247

highlight Pmenu ctermfg=White ctermbg=237
highlight PmenuSel ctermfg=White ctermbg=243

highlight Todo cterm=bold ctermfg=LightYellow ctermbg=None
highlight Error cterm=reverse ctermfg=LightRed ctermbg=None

highlight Folded ctermbg=None ctermfg=80
highlight FoldColumn ctermbg=Black ctermfg=80

" Syntax Highlight
highlight String ctermfg=112
highlight Constant ctermfg=171
highlight Operator ctermfg=251
highlight Delimiter ctermfg=251
highlight Function cterm=bold ctermfg=215
highlight Comment ctermfg=242
" highlight Type
highlight Structure ctermfg=143
highlight Typedef ctermfg=143
highlight StorageClass ctermfg=121

highlight Statement ctermfg=111
highlight PreProc ctermfg=147


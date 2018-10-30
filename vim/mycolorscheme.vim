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

" background slightly lit for eye protection maybe
highlight Normal ctermfg=253 ctermbg=233
highlight ColorColumn cterm=None ctermbg=234
highlight LineNr ctermfg=237
highlight CursorLineNr ctermfg=242 ctermbg=234
highlight CursorLine cterm=None ctermbg=234
highlight CursorColumn ctermbg=234
highlight Visual ctermfg=Black ctermbg=242

" so I have a better sense of where I'm at...
highlight StatusLineNC cterm=None ctermfg=Black ctermbg=247

highlight Pmenu ctermfg=White ctermbg=237
highlight PmenuSel ctermfg=White ctermbg=243

highlight Todo cterm=bold ctermfg=cyan ctermbg=None
highlight Error cterm=reverse ctermfg=LightRed ctermbg=None
highlight Search cterm=reverse ctermfg=DarkRed ctermbg=None

highlight Folded ctermbg=None ctermfg=242
highlight FoldColumn ctermbg=233 ctermfg=242
highlight EndOfBuffer ctermfg=233

" Syntax Highlight
highlight String ctermfg=112
highlight Constant ctermfg=171
highlight Operator ctermfg=248
highlight Delimiter ctermfg=248
highlight MatchParen ctermfg=Black ctermbg=cyan
" highlight MatchParen cterm=underline ctermbg=None ctermfg=None
highlight Function cterm=None ctermfg=215
highlight Comment cterm=italic ctermfg=242
" In regular vim, `italic` == `reverse`, which is ugly!
if !has('nvim')
    highlight Comment cterm=None
endif
" highlight Type
highlight Structure ctermfg=143
highlight Typedef ctermfg=143
highlight StorageClass ctermfg=121

highlight Statement ctermfg=111
highlight PreProc ctermfg=147


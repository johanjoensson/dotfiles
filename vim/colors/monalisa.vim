scriptencoding utf8

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'monalisa'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif


let s:fg        = g:monalisa#palette.fg

let s:bglighter = g:monalisa#palette.bglighter
let s:bglight   = g:monalisa#palette.bglight
let s:bg        = g:monalisa#palette.bg
let s:bgdark    = g:monalisa#palette.bgdark
let s:bgdarker  = g:monalisa#palette.bgdarker

let s:comment   = g:monalisa#palette.comment
let s:selection = g:monalisa#palette.selection
let s:subtle    = g:monalisa#palette.subtle

let s:black        =g:monalisa#palette.black      
let s:red          =g:monalisa#palette.red        
let s:green        =g:monalisa#palette.green      
let s:yellow       =g:monalisa#palette.yellow     
let s:orange       =g:monalisa#palette.orange     
let s:blue         =g:monalisa#palette.blue       
let s:purple       =g:monalisa#palette.purple     
let s:cyan         =g:monalisa#palette.cyan       
let s:white        =g:monalisa#palette.white      
let s:brightBlack  =g:monalisa#palette.brightBlack
let s:brightRed    =g:monalisa#palette.brightRed  
let s:brightGreen  =g:monalisa#palette.brightGreen
let s:brightYellow =g:monalisa#palette.brightYellow
let s:brightBlue   =g:monalisa#palette.brightBlue 
let s:brightPurple =g:monalisa#palette.brightPurple
let s:pink         =g:monalisa#palette.pink       
let s:brightCyan   =g:monalisa#palette.brightCyan 
let s:brightWhite  =g:monalisa#palette.brightWhite

let s:none      = ['NONE', 'NONE']

if has('nvim')
  for s:i in range(16)
    let g:terminal_color_{s:i} = g:monalisa#palette['color_' . s:i]
  endfor
endif

if has('terminal')
  let g:terminal_ansi_colors = []
  for s:i in range(16)
    call add(g:terminal_ansi_colors, g:monalisa#palette['color_' . s:i])
  endfor
endif

if !exists('g:monalisa_bold')
  let g:monalisa_bold = 1
endif

if !exists('g:monalisa_italic')
  let g:monalisa_italic = 1
endif

if !exists('g:monalisa_underline')
  let g:monalisa_underline = 1
endif

if !exists('g:monalisa_undercurl')
  let g:monalisa_undercurl = g:monalisa_underline
endif

if !exists('g:monalisa_full_special_attrs_support')
  let g:monalisa_full_special_attrs_support = has('gui_running')
endif

if !exists('g:monalisa_inverse')
  let g:monalisa_inverse = 1
endif

if !exists('g:monalisa_colorterm')
  let g:monalisa_colorterm = 1
endif


let s:attrs = {
      \ 'bold': g:monalisa_bold == 1 ? 'bold' : 0,
      \ 'italic': g:monalisa_italic == 1 ? 'italic' : 0,
      \ 'underline': g:monalisa_underline == 1 ? 'underline' : 0,
      \ 'undercurl': g:monalisa_undercurl == 1 ? 'undercurl' : 0,
      \ 'inverse': g:monalisa_inverse == 1 ? 'inverse' : 0,
      \}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  " If the UI does not have full support for special attributes (like underline and
  " undercurl) and the highlight does not explicitly set the foreground color,
  " make the foreground the same as the attribute color to ensure the user will
  " get some highlight if the attribute is not supported. The default behavior
  " is to assume that terminals do not have full support, but the user can set
  " the global variable `g:monalisa_full_special_attrs_support` explicitly if the
  " default behavior is not desirable.
  let l:special = get(a:, 3, ['NONE', 'NONE'])
  if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !g:monalisa_full_special_attrs_support
    let l:fg[0] = l:special[0]
    let l:fg[1] = l:special[1]
  endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction

call s:h('MonaLisaBgLight', s:none, s:bglight)
call s:h('MonaLisaBgLighter', s:none, s:bglighter)
call s:h('MonaLisaBgDark', s:none, s:bgdark)
call s:h('MonaLisaBgDarker', s:none, s:bgdarker)

call s:h('MonaLisaFg', s:fg)
call s:h('MonaLisaFgUnderline', s:fg, s:none, [s:attrs.underline])
call s:h('MonaLisaFgBold', s:fg, s:none, [s:attrs.bold])

call s:h('MonaLisaComment', s:comment)
call s:h('MonaLisaCommentBold', s:comment, s:none, [s:attrs.bold])

call s:h('MonaLisaSelection', s:none, s:selection)

call s:h('MonaLisaSubtle', s:subtle)

call s:h('MonaLisaCyan', s:cyan)
call s:h('MonaLisaCyanItalic', s:cyan, s:none, [s:attrs.italic])

call s:h('MonaLisaGreen', s:green)
call s:h('MonaLisaGreenBold', s:green, s:none, [s:attrs.bold])
call s:h('MonaLisaGreenItalic', s:green, s:none, [s:attrs.italic])
call s:h('MonaLisaGreenItalicUnderline', s:green, s:none, [s:attrs.italic, s:attrs.underline])

call s:h('MonaLisaOrange', s:orange)
call s:h('MonaLisaOrangeBold', s:orange, s:none, [s:attrs.bold])
call s:h('MonaLisaOrangeItalic', s:orange, s:none, [s:attrs.italic])
call s:h('MonaLisaOrangeBoldItalic', s:orange, s:none, [s:attrs.bold, s:attrs.italic])
call s:h('MonaLisaOrangeInverse', s:bg, s:orange)

call s:h('MonaLisaPink', s:pink)
call s:h('MonaLisaPinkItalic', s:pink, s:none, [s:attrs.italic])

call s:h('MonaLisaPurple', s:purple)
call s:h('MonaLisaPurpleBold', s:purple, s:none, [s:attrs.bold])
call s:h('MonaLisaPurpleItalic', s:purple, s:none, [s:attrs.italic])

call s:h('MonaLisaRed', s:red)
call s:h('MonaLisaRedInverse', s:fg, s:red)

call s:h('MonaLisaYellow', s:yellow)
call s:h('MonaLisaYellowItalic', s:yellow, s:none, [s:attrs.italic])

call s:h('MonaLisaError', s:red, s:none, [], s:red)

call s:h('MonaLisaErrorLine', s:none, s:none, [s:attrs.undercurl], s:red)
call s:h('MonaLisaWarnLine', s:none, s:none, [s:attrs.undercurl], s:orange)
call s:h('MonaLisaInfoLine', s:none, s:none, [s:attrs.undercurl], s:cyan)

call s:h('MonaLisaTodo', s:cyan, s:none, [s:attrs.bold, s:attrs.inverse])
call s:h('MonaLisaSearch', s:green, s:none, [s:attrs.inverse])
call s:h('MonaLisaBoundary', s:comment, s:bgdark)
call s:h('MonaLisaLink', s:cyan, s:none, [s:attrs.underline])

call s:h('MonaLisaDiffChange', s:orange, s:none)
call s:h('MonaLisaDiffText', s:bg, s:orange)
call s:h('MonaLisaDiffDelete', s:red, s:bgdark)

set background=dark

" Required as some plugins will overwrite
call s:h('Normal', s:fg, g:monalisa_colorterm || has('gui_running') ? s:bg : s:none )
call s:h('StatusLine', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineNC', s:none, s:bglight)
call s:h('StatusLineTerm', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineTermNC', s:none, s:bglight)
call s:h('WildMenu', s:bg, s:purple, [s:attrs.bold])
call s:h('CursorLine', s:none, s:subtle)

hi! link ColorColumn  MonaLisaBgDark
hi! link CursorColumn CursorLine
hi! link CursorLineNr MonaLisaYellow
hi! link DiffAdd      MonaLisaGreen
hi! link DiffAdded    DiffAdd
hi! link DiffChange   MonaLisaDiffChange
hi! link DiffDelete   MonaLisaDiffDelete
hi! link DiffRemoved  DiffDelete
hi! link DiffText     MonaLisaDiffText
hi! link Directory    MonaLisaPurpleBold
hi! link ErrorMsg     MonaLisaRedInverse
hi! link FoldColumn   MonaLisaSubtle
hi! link Folded       MonaLisaBoundary
hi! link IncSearch    MonaLisaOrangeInverse
call s:h('LineNr', s:comment)
hi! link MoreMsg      MonaLisaFgBold
hi! link NonText      MonaLisaSubtle
hi! link Pmenu        MonaLisaBgDark
hi! link PmenuSbar    MonaLisaBgDark
hi! link PmenuSel     MonaLisaSelection
hi! link PmenuThumb   MonaLisaSelection
hi! link Question     MonaLisaFgBold
hi! link Search       MonaLisaSearch
call s:h('SignColumn', s:comment)
hi! link TabLine      MonaLisaBoundary
hi! link TabLineFill  MonaLisaBgDark
hi! link TabLineSel   Normal
hi! link Title        MonaLisaGreenBold
hi! link VertSplit    MonaLisaBoundary
hi! link Visual       MonaLisaSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   MonaLisaOrangeInverse

" Required as some plugins will overwrite
call s:h('MatchParen', s:green, s:none, [s:attrs.underline])
call s:h('Conceal', s:cyan, s:none)

" Neovim uses SpecialKey for escape characters only. Vim uses it for that, plus whitespace.
if has('nvim')
  hi! link SpecialKey MonaLisaRed
  hi! link LspReferenceText MonaLisaSelection
  hi! link LspReferenceRead MonaLisaSelection
  hi! link LspReferenceWrite MonaLisaSelection
  hi! link LspDiagnosticsDefaultInformation MonaLisaCyan
  hi! link LspDiagnosticsDefaultHint MonaLisaCyan
  hi! link LspDiagnosticsDefaultError MonaLisaError
  hi! link LspDiagnosticsDefaultWarning MonaLisaOrange
  hi! link LspDiagnosticsUnderlineError MonaLisaErrorLine
  hi! link LspDiagnosticsUnderlineHint MonaLisaInfoLine
  hi! link LspDiagnosticsUnderlineInformation MonaLisaInfoLine
  hi! link LspDiagnosticsUnderlineWarning MonaLisaWarnLine
else
  hi! link SpecialKey MonaLisaPink
endif

hi! link Comment MonaLisaComment
hi! link Underlined MonaLisaFgUnderline
hi! link Todo MonaLisaTodo

hi! link Error MonaLisaError
hi! link SpellBad MonaLisaErrorLine
hi! link SpellLocal MonaLisaWarnLine
hi! link SpellCap MonaLisaInfoLine
hi! link SpellRare MonaLisaInfoLine

hi! link Constant MonaLisaPurple
hi! link String MonaLisaYellow
hi! link Character MonaLisaPink
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

hi! link Identifier MonaLisaFg
hi! link Function MonaLisaGreen

hi! link Statement MonaLisaPink
hi! link Conditional MonaLisaPink
hi! link Repeat MonaLisaPink
hi! link Label MonaLisaPink
hi! link Operator MonaLisaPink
hi! link Keyword MonaLisaPink
hi! link Exception MonaLisaPink

hi! link PreProc MonaLisaPink
hi! link Include MonaLisaPink
hi! link Define MonaLisaPink
hi! link Macro MonaLisaPink
hi! link PreCondit MonaLisaPink
hi! link StorageClass MonaLisaPink
hi! link Structure MonaLisaPink
hi! link Typedef MonaLisaPink

hi! link Type MonaLisaCyanItalic

hi! link Delimiter MonaLisaFg

hi! link Special MonaLisaPink
hi! link SpecialComment MonaLisaCyanItalic
hi! link Tag MonaLisaCyan
hi! link helpHyperTextJump MonaLisaLink
hi! link helpCommand MonaLisaPurple
hi! link helpExample MonaLisaGreen
hi! link helpBacktick Special


let g:monalisa#palette           = {}

let g:monalisa#palette.black            = ['#351b0e', 0]
let g:monalisa#palette.red              = ['#9b291c', 1]
let g:monalisa#palette.green            = ['#636232',  2]
let g:monalisa#palette.yellow           = ['#c36e28', 3]
let g:monalisa#palette.orange           = ['#c36e28', 3]
let g:monalisa#palette.blue             = ['#515c5d', 4]
let g:monalisa#palette.purple           = ['#9b1d29', 5]
let g:monalisa#palette.cyan             = ['#588056', 6]
let g:monalisa#palette.white            = ['#f7d75c', 7]
let g:monalisa#palette.brightBlack      = ['#874228', 8]
let g:monalisa#palette.brightRed        = ['#ff4331', 9]
let g:monalisa#palette.brightGreen      = ['#b4b264',  10]
let g:monalisa#palette.brightYellow     = ['#ff9566', 11]
let g:monalisa#palette.brightBlue       = ['#9eb2b4', 12]
let g:monalisa#palette.brightPurple     = ['#ff5b6a', 13]
let g:monalisa#palette.pink             = ['#ff5b6a', 13]
let g:monalisa#palette.brightCyan       = ['#8acd8f', 14]
let g:monalisa#palette.brightWhite      = ['#ffe598', 15]

let g:monalisa#palette.fg        = g:monalisa#palette.white

let g:monalisa#palette.bglighter = g:monalisa#palette.brightBlack
let g:monalisa#palette.bglight   = g:monalisa#palette.black
let g:monalisa#palette.bg        = ['#120b0d', 16]
let g:monalisa#palette.bgdark    = ['#030102', 235]
let g:monalisa#palette.bgdarker  = ['#000000', 234]

let g:monalisa#palette.comment   = g:monalisa#palette.blue
let g:monalisa#palette.selection = g:monalisa#palette.green
let g:monalisa#palette.subtle    = g:monalisa#palette.red


"
" ANSI
"
let g:monalisa#palette.color_0  = '#351b0e'
let g:monalisa#palette.color_1  = '#9b291c'
let g:monalisa#palette.color_2  = '#636232'
let g:monalisa#palette.color_3  = '#c36e28'
let g:monalisa#palette.color_4  = '#515c5d'
let g:monalisa#palette.color_5  = '#9b1d29'
let g:monalisa#palette.color_6  = '#588056'
let g:monalisa#palette.color_7  = '#f7d75c'
let g:monalisa#palette.color_8  = '#874228'
let g:monalisa#palette.color_9  = '#ff4331'
let g:monalisa#palette.color_10 = '#b4b264'
let g:monalisa#palette.color_11 = '#ff9566'
let g:monalisa#palette.color_12 = '#9eb2b4'
let g:monalisa#palette.color_13 = '#ff5b6a'
let g:monalisa#palette.color_14 = '#8acd8f'
let g:monalisa#palette.color_15 = '#ffe598'

" Helper function that takes a variadic list of filetypes as args and returns
" whether or not the execution of the ftplugin should be aborted.
func! monalisa#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'monalisa'
        return 1
    elseif a:0 > 0 && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1)
        return 1
    endif
    return 0
endfunction

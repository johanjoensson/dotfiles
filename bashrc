#_______________________________________________________________________________
#____________________\MMMMMMMMM7\_________\MMMMMMMMM7\__________________________
#_____________________\WWWWWWW7#R\_________\WWWWWWW7#R\_________________________
#_____________________________\7#R\________________\7#R\________________________
#______________________________\7#R\________________\7#R\_______________________
#_______________________________\7#R\________________\7#R\______________________
#________________________________\7#R\________________\7#R\_____________________
#__________________________/7R\___\7#R\_________/7R\___\7#R\____________________
#__________________________|7##RMMM7#R|_________|7##RMMM7#R|____________________
#____________________________\WWWWWWWW/___________\WWWWWWWW/____________________
#_______________________________________________________________________________
 
# .bashrc

[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Auto "cd" when entering just a path
shopt -s autocd 2> /dev/null

# Line wrap on window resize
shopt -s checkwinsize 2> /dev/null

# Sudo tab completion
complete -cf sudo

# Case-insensitive tab completetion
bind 'set completion-ignore-case on'

# When displaying tab completion options, show just the remaining characters
bind 'set completion-prefix-display-length 2'

# Show tab completion options on the first press of TAB
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'


PATH=~/bin:$PATH
PATH=/usr/local/bin:$PATH

# Append to the Bash history file, rather than overwriting
shopt -s histappend 2> /dev/null


# Entries beginning with space aren't added into history, and duplicate
# entries will be erased (leaving the most recent entry).
export HISTCONTROL="ignorespace:erasedups"

# Give history timestamps.
export HISTTIMEFORMAT="[%F %T] "

# Lots o' history.
export HISTSIZE=10000
export HISTFILESIZE=10000

export EDITOR="vim"

alias ls='ls -lhF --color --hyperlink=auto'
alias lsa='ls -A'
alias lsd="ls --color | /usr/bin/grep --color=never '^d'"
alias lsda="lsa | /usr/bin/grep --color=never '^d'"

alias grep='grep --color=auto -n -i'

alias clear="clear && printf '\e[3J'";

alias df="df -h"
alias du="du -h"

if [ -f /usr/bin/xdg-open ]; then
    alias open='/usr/bin/xdg-open'
fi

##########
# Colors #
##########

if dircolors > /dev/null 2>&1; then
	eval $(dircolors -b ~/.dircolors)
fi

reset=$(tput sgr0)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 2)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
brightblack=$(tput setaf 8)
brightred=$(tput setaf 9)
brightgreen=$(tput setaf 10)
brightyellow=$(tput setaf 11)
brightblue=$(tput setaf 12)
brightmagenta=$(tput setaf 13)
brightcyan=$(tput setaf 14)
brightwhite=$(tput setaf 15)


##########
# Prompt #
##########

if [[ "$USER" == "root" ]]; then
	prompt_col_1=$brightred
	prompt_col_2=$red
elif [[ "$SSH_TTY" ]]; then
	prompt_col_1=$brightgreen
	prompt_col_2=$magenta
else
	prompt_col_1=$brightyellow
	prompt_col_2=$yellow
fi

PS1='\n\[$reset\]\[$prompt_col_1\]\u\[$reset\]@\[$prompt_col_2\]\h\[$prompt_col_1\]:\W'

if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
	export PS1+='\[$prompt_col_2\]$(__git_ps1 "(%s)")'
fi

PS1+='\[$reset\]\n\$ '


# Colored man pages
man() {
env LESS_TERMCAP_mb=$'\E[01;31m' \
LESS_TERMCAP_md=$'\E[01;38;5;74m' \
LESS_TERMCAP_me=$'\E[0m' \
LESS_TERMCAP_se=$'\E[0m' \
LESS_TERMCAP_so=$'\E[38;5;246m' \
LESS_TERMCAP_ue=$'\E[0m' \
LESS_TERMCAP_us=$'\E[04;38;5;146m' \
man "$@"
}

if [[ $- == *i* && $0 =~ .*'bash'.* ]]; then
    sh ~/.dotfiles/scripts/login.sh
fi


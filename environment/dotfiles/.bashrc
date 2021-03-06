#export TERM=screen-256color
#Colors definition
BLACK="\[\033[0;30m\]"
DARK_GRAY="\[\033[1;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
PURPLE="\[\033[0;35m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
BROWN="\[\033[0;33m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
DEFAULT_COLOR="\[\033[00m\]"
RED_BOLD="\[\033[01;31m\]"
GREEN="\[\033[0;32m\]"

export LESS_TERMCAP_so=$'\E[97;101m' 
export LESS_TERMCAP_se=$'\E[39;49m'

#color fixup
export LESS_TERMCAP_zz=$'\E[39;49m'

#Get git information
is_homedir () {
	bar=$(git rev-parse --show-toplevel $(pwd) 2> /dev/null | head -1)
        if [[ $bar == $HOME ]]; then
		echo 1
        else
		echo 0
        fi
}

parse_git_branch () {
        isHome=$(is_homedir)
        if [ $isHome == "0" ]; then 
        git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (git::\1)#'
	else
	git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (home::\1)#' 
	fi
}


#Get svn information
##Get svn url
parse_svn_url() {
        svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}

##Get svn repository root
parse_svn_repository_root() {
        svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}
##Get svn revision 
parse_svn_current_revision() {
        svn info 2>/dev/null | sed -ne 's#^Revision: ##p'
}
##Parse everything and return the svn general info
parse_svn_branch_revision() {
	parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print $1 "/" $2 }' | awk '{print " (svn::_@" $1 ")" } ' | sed -e 's#_@#'"$(parse_svn_current_revision)"':#g'	
}




# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

## ignore some common stuff
HISTIGNORE="\&:ls:ll:la:cd:fg:bg:exit:clear"
HISTSIZE=15000

HISTTIMEFORMAT="%F %T  "

#HISTIGNORE="ls:cd"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)




# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

 PS1='\[\033[1;37m\]\u\[\033[1;3\jm\]@\[\033[0;37m\]\h\[\033[1;30m\]:\[\033[0;36m\]\w \[\033[0;$(if [ -w . ]; then echo -n 32; else echo -n 31; fi)m\]\$\[\033[0m\] '

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\][\w$LIGHT_PURPLE\$(parse_git_branch)\$(parse_svn_branch_revision)\[\033[01;34m\]]$DEFAULT_COLOR"
else
    PS1="${debian_chroot:+($debian_chroot)}$DEFAULT_COLOR\u\[\033[1;3\jm\]@\h\[\033[1;30m\]$DEFAULT_COLOR:$WHITE[\w$LIGHT_GREY$LIGHT_PURPLE\$(parse_git_branch)\$(parse_svn_branch_revision)$WHITE] $DEFAULT_COLOR"
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias joel="joe -linums"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# his <tab> s gives persistent history

alias historys="tail -500 ~/.persistent_history"
alias historyss="cat ~/.persistent_history"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#xrandr --output DVI-I-2 --primary
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"




# persistent history ala eli
log_bash_persistent_history()
{
  local rc=$?
  [[ $(history 1) =~ ^\ *[0-9]+\ +([^\ ]+\ [^\ ]+)\ +(.*)$ ]]
  local date_part="${BASH_REMATCH[1]}"
  local command_part="${BASH_REMATCH[2]}"
  if [ "$command_part" != "$PERSISTENT_HISTORY_LAST" ]
  then
    echo $date_part "|" "$command_part" >> ~/.persistent_history
    export PERSISTENT_HISTORY_LAST="$command_part"
  fi
}

# Stuff to do on PROMPT_COMMAND
run_on_prompt_command()
{
    log_bash_persistent_history
}

PROMPT_COMMAND="run_on_prompt_command"
export EDITOR="vim"
. /etc/environment


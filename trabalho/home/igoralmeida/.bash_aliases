# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lh'
alias la='ls -lah'
alias l='ls -CF'
alias rsync='rsync -ah --info=PROGRESS2,STATS1'

# atualização do sistema
alias sup='sudo sh $HOME/apps/system/system-update.sh'

# vi em modo sudo
alias svi='sudo vi'

# organizador de horário de trabalho 
alias torg='$HOME/apps/time-organizer/main.py'


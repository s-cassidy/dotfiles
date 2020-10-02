#
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


#
# fasd
#
eval "$(fasd --init auto)" 
alias v='f -e nvim' # quick opening files with vim
#
# Aliases
#

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
alias ll='ls -alFh'
alias la='ls -A'
alias sl='nocorrect sl'
alias l='ls -CF'
alias vim="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"
alias wttr='curl wttr.in/liverpool'
alias edit=vim

alias canto=canto-curses
alias todo='DATE=$(date +%F) && ~/vimwiki/makediary.py today && vim -O ~/vimwiki/index.wiki ~/vimwiki/diary/$DATE.wiki'
alias tomorrow='DATE=$(date -d "next day" +%F) && ~/vimwiki/makediary.py tomorrow && vim ~/vimwiki/diary/$DATE.wiki'

alias :q=exit
alias :wq=exit

alias network="sudo service network-manager restart"
alias kb="xmodmap ~/.Xmodmap"

alias qud="launch ~/.steam/steam/steamapps/common/Caves\ of\ Qud/CoQ.x86_64"
alias backups=deja-dup


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# for new terminals in termite

autoload -Uz promptinit
promptinit
prompt minimal
# Customize to your needs...
#



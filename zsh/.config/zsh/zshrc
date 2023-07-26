autoload -Uz compinit
compinit

export HISTFILE=~/.local/share/zsh/zsh_history
export HISTSIZE=10000
export SAVEHIST=10000


### MAKE VIM MODE TOLERABLE

# Cursor changes depending on vi-mode
zle-keymap-select () {
if [ $KEYMAP = vicmd ]; then
    printf "\033[2 q"
else
    printf "\033[6 q"
fi
}
zle -N zle-keymap-select
zle-line-init () {
zle -K viins
printf "\033[6 q"
}
zle -N zle-line-init

# Fix weird backspace key behaviour in vi mode
vi-search-fix() {
zle vi-cmd-mode
zle .vi-history-search-backward
}
autoload vi-search-fix
zle -N vi-search-fix
bindkey -M viins '\e/' vi-search-fix
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word 
bindkey "^U" backward-kill-line

# Make esc in vi-mode actually responsive
KEYTIMEOUT=1
bindkey -M vicmd '^[' undefined-key
bindkey -rM viins '^X'
bindkey -M viins '^X,' _history-complete-newer \
                 '^X/' _history-complete-older \
                 '^X`' _bash_complete-word

bindkey -v
####


# Enable completion in sudo
zstyle ':completion::complete:*' gain-privileges 1

# aliases
alias ls='exa -l'
alias grep='rg'
alias cat="bat"
alias vim="nvim"
alias vi="nvim"
alias lg="lazygit"


source ~/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/spaceship-prompt/spaceship.zsh



eval "$(zoxide init zsh)"

### FZF STUFF
source /usr/share/fzf/shell/key-bindings.zsh
export FZF_DEFAULT_COMMAND="fd . $HOME"
#
# restore fzf default options ('fzf clear')
alias fzfcl="export FZF_DEFAULT_COMMAND='fd .'"

# reinstate fzf custom options ('fzf-' as in 'cd -' as in 'back to where I was')
alias fzf-="export FZF_DEFAULT_COMMAND='fd . $HOME'"

source /usr/share/fzf/shell/completion.zsh
source ~/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh





_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git .obsidian" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

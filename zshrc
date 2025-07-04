
export ZSH="$HOME/.oh-my-zsh"


plugins=( 
    git
    archlinux
    colored-man-pages
    cp
    copypath
    extract
    fzf
    history-substring-search
    kitty
    sudo
    zoxide
    zsh-interactive-cd
    zsh-navigation-tools
    zsh-autosuggestions
    zsh-syntax-highlighting
    direnv
)
source $ZSH/oh-my-zsh.sh



if [ -z "$SSH_AUTH_SOCK" ]; then
	eval $(ssh-agent -s)
	ssh-add ~/.ssh/id_rsa
fi


export PATH=$PATH:/usr/sbin:/home/$USER/bin:/home/$USER/go/bin:/home/$USER/.cargo/bin:/home/cas/.local/bin

#aws completion
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -c '/usr/local/bin/aws_completer' aws



# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Initialize Zoxide
eval "$(zoxide init zsh)"
##------Aliases---------##
alias cat='bat'
alias vi='nvim'
alias vim='nvim'
alias cd='z'
alias obs="nvim ${HOME}/Documents/vault"
alias open='xdg-open'
alias find='fd'


alias burppro='/home/$USER/bin/burppro.sh'
alias zed='zeditor'

export EDITOR=nvim

eval "$(direnv hook zsh)"
#----------Key bindings--------------

eval "$(dircolors ~/.dircolors)"

#---------- Vim Mode --------------
bindkey -v
export KEYTIMEOUT=20

bindkey -M viins 'jj' vi-cmd-mode
bindkey -M visual 'jj' vi-cmd-mode

bindkey '^E' autosuggest-execute
bindkey '^\\' autosuggest-execute

#-------------Prompt-----------------

PROMPT='%F{#4A42AE}[%f%F{#00ffb3}%n%F{#0018cd} 󰊠 %f%F{#d754aa}%m%f%F{#4A42AE}]%f %F{#00b8ff}$(git_prompt_info)%f%F{#00b8ff} -%f %F{#4A42AE}[%f%F{#EBA4D2}%~%f%F{#4A42AE}]%f
%F{#00ff9f} '
RPROMPT='%F{#4A42AE}[%f%F{#00ff9f}%w%f %F{#00b8ff}- %f%F{#00ff9f}%@%F{#4A42AE}]%f'
#TODO: Fix Vertical Spacing issue with right prompt


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/cas/google-cloud-sdk/path.zsh.inc' ]; then . '/home/cas/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/cas/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/cas/google-cloud-sdk/completion.zsh.inc'; fi
eval "$(atuin init zsh --disable-up-arrow)"

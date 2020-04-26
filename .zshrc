export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"


source $ZSH/oh-my-zsh.sh


plugins=(
    zsh-autosuggestions
    git
)


source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/local/opt/rabbitmq/sbin:$HOME/bin
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '!{.git,node_modules,.fusebox,.idea,tmp}' 2> /dev/null"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
source $HOME/.bash_aliases
source $HOME/.kubectl_aliases


POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

POWERLEVEL9K_CUSTOM_NAME="echo $(whoami)"
POWERLEVEL9K_CUSTOM_NAME_BACKGROUND=069
POWERLEVEL9K_CUSTOM_NAME_FOREGROUND=015


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_name dir vcs)



ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#818181,underline'

eval "$(pyenv init -)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


[[ -s "/Users/vudang/.gvm/scripts/gvm" ]] && source "/Users/vudang/.gvm/scripts/gvm"
export GOPATH=$HOME/Code/go
export GOBIN=$HOME/Code/go/bin
#export GO111MODULE=on
export PATH=$PATH:$GOBIN:$GOPATH

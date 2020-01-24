export TERM="xterm-256color"
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"


source $ZSH/oh-my-zsh.sh


plugins=(
    zsh-autosuggestions
    git
)


source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/Code/go
export GOBIN=$HOME/Code/go/bin
export PATH=$PATH:/usr/local/opt/rabbitmq/sbin:$HOME/bin:$GOBIN
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '!{.git,node_modules,.fusebox,.idea,tmp}' 2> /dev/null"



source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
source $HOME/.bash_aliases
source $HOME/.kubectl_aliases


POWERLEVEL9K_PROMPT_ON_NEWLINE=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#818181,underline'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

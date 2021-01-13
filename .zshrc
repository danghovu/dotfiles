source ~/.tmux.conf

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
#export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


plugins=(
    zsh-autosuggestions
    git
)


source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/local/opt/rabbitmq/sbin:$HOME/bin
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '!{.git,node_modules,.fusebox,.idea,tmp}' 2> /dev/null"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.bash_aliases
source $HOME/.kubectl_aliases


#POWERLEVEL9K_DISABLE_RPROMPT=true
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_CUSTOM_NAME="echo $(whoami)"
POWERLEVEL9K_CUSTOM_NAME_BACKGROUND=069
POWERLEVEL9K_CUSTOM_NAME_FOREGROUND=015
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_name dir vcs)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#818181,underline'

export GO111MODULE=auto
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

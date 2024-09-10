export CONDA_AUTO_ACTIVATE_BASE=false
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/bin/antigen.zsh

antigen use oh-my-zsh

antigen bundle git

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme romkatv/powerlevel10k

antigen apply

autoload -Uz compinit && compinit

setopt correct
set -o vi

PATH=$PATH:/home/yashkarandikar/bin
PATH=$PATH:/home/yashkarandikar/.local/bin
PATH=$PATH:/home/yashkarandikar/.cargo/bin
autoload -U +X bashcompinit && bashcompinit

alias mosh="mosh --predict=experimental"
alias sys="sudo systemctl"
alias sysu="systemctl --user"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

export EDITOR=vim

eval $(thefuck --alias)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/yashkarandikar/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/yashkarandikar/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/yashkarandikar/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/yashkarandikar/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


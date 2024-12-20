# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(systemd git z.lua copypath copyfile copybuffer encode64 kubectl fubectl asdf)
case "$OSTYPE" in
  darwin*)
    echo "Mac"
  ;;
  linux*)
    echo "Linux"
  ;;
esac
source $ZSH/oh-my-zsh.sh

# common
tabs -4
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# zfunc
fpath=(~/.zfunc $fpath)
autoload -Uz proxy sync

# go
export GOPATH="${HOME}/go"
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z.lua
export _ZL_ADD_ONCE=1
export _ZL_ROOT_MARKERS=".git,.svn,.hg,.root,package.json,go.mod"

# k8s
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


# local proxy
proxy on

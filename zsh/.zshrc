path=($HOME/.local/bin /usr/local/bin /usr/local/opt/coreutils/libexec/gnubin $path)
HOMEBREW_NO_ANALYTICS=1
fpath=(~/.zfunc $fpath)

alias make=gmake
alias geany="/Applications/Geany.app/Contents/MacOS/geany"
alias k="kubectl"

# llvm
# export LDFLAGS="-L/usr/local/opt/llvm/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm/include"
# export PATH="/usr/local/opt/llvm/bin:$PATH"

# ruby
# export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.1.0/bin:$PATH"

# go
# export GOPATH="${HOME}/go"
# export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
# export GO111MODULE=on

# fzf
source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# gcc
alias CC="$(brew --prefix gcc)/bin/gcc-14"
alias CXX="$(brew --prefix gcc)/bin/g++-14"
alias gcc='gcc-14'
alias g++='gcc++-14'

# k8s
[[ -f $HOME/fubectl.source ]] && source $HOME/fubectl.source
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# curl
# export PATH="/usr/local/opt/curl/bin:$PATH"

# groff
# export GROFF_TMAC_PATH=/usr/local/share/groff/current/tmac


# >>> zi setup >>>
source '/Users/hjl/.config/zi/setup.zsh'
zi ice wait lucid blockf atpull'zi creinstall -q .'
zi light zsh-users/zsh-completions

autoload -Uz compinit && compinit
zicdreplay -q

zi ice wait lucid has'fzf' atinit"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zi light Aloxaf/fzf-tab

zi ice wait'0c' lucid
zi light z-shell/F-Sy-H

zi ice wait'0c' lucid atload"!_zsh_autosuggest_start"
zi light zsh-users/zsh-autosuggestions

zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# <<< zi setup <<<

eval "$(zoxide init zsh)"
source <(fzf --zsh)

# Last
eval "$(starship init zsh)"

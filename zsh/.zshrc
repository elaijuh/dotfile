typeset -U path fpath
path=("$HOME/.local/bin" "$HOME/.pulumi/bin" "/opt/homebrew/bin" "/opt/homebrew/opt/coreutils/libexec/gnubin" $path)
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# >>> zi setup >>>
source '/Users/jiale.hu/.config/zi/setup.zsh'
zi ice wait lucid blockf atpull'zi creinstall -q .' \
  atload'zicompinit; zicdreplay; autoload -Uz bashcompinit && bashcompinit; complete -C /opt/homebrew/bin/aws_completer aws'
zi light zsh-users/zsh-completions

zi ice wait lucid has'fzf'
zi light Aloxaf/fzf-tab

zi ice wait'0c' lucid
zi light z-shell/F-Sy-H

zi ice wait'0c' lucid atload"!_zsh_autosuggest_start"
zi light zsh-users/zsh-autosuggestions

zi ice wait lucid has'eza' atload'_zsh_eza_params=(${_zsh_eza_params:#--color-scale*})'
zi light z-shell/zsh-eza

zi ice wait lucid
zi snippet OMZP::aws

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=*' 'l:|=* r:|=*'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# <<< zi setup <<<

# zoxied setup
eval "$(zoxide init zsh --no-cmd)"
alias z=__zoxide_z

# fzf setup
source <(fzf --zsh)



# Last
eval "$(starship init zsh)"

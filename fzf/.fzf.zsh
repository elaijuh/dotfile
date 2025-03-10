# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.zsh"

export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --no-ignore --exclude .git"
export FZF_DEFAULT_OPTS="--height 40% --layout reverse --info=inline --border --margin=1 --padding=1 --inline-info"
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'cat -n {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute(readlink -f {} | echo -n {2..} | xclip -selection clipboard)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

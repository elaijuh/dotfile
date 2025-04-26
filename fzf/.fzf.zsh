export FZF_DEFAULT_COMMAND="rg -uu --files -H"
# export FZF_DEFAULT_OPTS_FILE=~/.fzfrc
export FZF_DEFAULT_OPTS="
	--height 40%
	--layout reverse
	--margin 1
	--padding 1
	--info inline
	--border sharp
	--color light
	--bind 'ctrl-f:page-down,ctrl-b:page-up'
	--bind 'ctrl-/:toggle-preview'
"
export FZF_CTRL_T_OPTS="
	--preview 'bat --color=always {}'
	--bind 'ctrl-/:change-preview-window(down|hidden|)'
	--bind 'ctrl-o:execute:nvim {}'
"
export FZF_CTRL_R_OPTS="
	--preview ''
	--preview-window up:3:hidden:wrap
	--bind 'ctrl-/:toggle-preview'
	--bind 'ctrl-y:execute(readlink -f {} | echo -n {2..} | xclip -selection clipboard)+abort'
	--color header:italic
	--header 'Press CTRL-Y to copy command into clipboard'
"
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

z() {
	if [[ $# == 0 ]]; then
		local dir=$(
			_zlua | fzf --height 40% --layout reverse --info inline \
				--nth 2.. --tac --query "$*" \
				--bind 'enter:become:echo {2..}' \
				--preview ''

		) && cd "$dir"
	else
		_zlua $*
	fi
}

rfv() {
	local RELOAD='reload:rg --column --color=always --smart-case {q} || :'
	local OPENER='
if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
	nvim {1} +{2}     # No selection. Open the current line in Vim.
else
	nvim +cw -q {+f}  # Build quickfix list for the selected items.
fi
'
	fzf --disabled --ansi --multi \
		--bind "start:$RELOAD" --bind "change:$RELOAD" \
		--bind "enter:become:$OPENER" \
		--bind "ctrl-o:execute:$OPENER" \
		--bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
		--delimiter : \
		--preview 'bat --highlight-line {2} {1}' \
		--preview-window '~4,+{2}+4/3,<80(up)' \
		--query "$*"
}

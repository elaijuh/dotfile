set fish_greeting ""

if status is-interactive
	alias cat 'bat --paging=never'
	alias less 'bat'
	alias more 'bat'
	alias tree 'eza --tree'

	fzf --fish | source
	zoxide init fish | source

	if test "$TERM" != dumb
		starship init fish | source
	end
end

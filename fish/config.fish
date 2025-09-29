set fish_greeting ""

fish_add_path -m ~/.local/bin /usr/local/go/bin

set -gx http_proxy 'http://127.0.0.1:7890'
set -gx https_proxy 'http://127.0.0.1:7890'

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

set fish_greeting ""

fish_add_path -m ~/.local/bin ~/go/bin /usr/local/go/bin

# set -gx http_proxy 'http://127.0.0.1:7897'
# set -gx https_proxy 'http://127.0.0.1:7897'

alias hx helix

if status is-interactive
    alias xclip 'xclip -sel c'
    alias cat 'bat --paging=never'
    alias less bat
    alias more bat
    alias tree 'eza --tree'

    fzf --fish | source
    zoxide init fish | source

    if test "$TERM" != dumb
        starship init fish | source
    end
end

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/hjl/.opam/opam-init/init.fish' && source '/home/hjl/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true
# END opam configuration

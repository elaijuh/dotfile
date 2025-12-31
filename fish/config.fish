set fish_greeting ""

fish_add_path -m ~/.local/bin ~/go/bin /usr/local/go/bin
fish_config theme choose none
set -g fish_key_bindings fish_default_key_bindings
set -gx http_proxy 'http://127.0.0.1:7899'
set -gx https_proxy 'http://127.0.0.1:7899'
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_CACHE_HOME ~/.cache
set -gx XDG_DATA_HOME ~/.local/share
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx MANPATH ~/.local/share/man:$MANPATH
set -gx EDITOR helix
set -gx VISUAL helix
set -gx BROWSER firefox

alias hx helix

if status is-interactive
    alias xclip 'xclip -sel c'
    alias cat 'bat --paging=never'
    fzf --fish | source
    zoxide init fish | source

    if test "$TERM" != dumb
        # starship init fish | source
    end

    if set -q SSH_CONNECTION
        set -x TERM xterm-256color
    end
end

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/hjl/.opam/opam-init/init.fish' && source '/home/hjl/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true
# END opam configuration

# yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

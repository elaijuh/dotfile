#!/usr/bin/env fish

function my_syncdotfile -d "sync configs to dotfile"
    if test (count $argv) -lt 1
        echo "Usage: my_syncdotfile <app> [options]" >&2
        return 1
    end

    set -l dotfile_repo ~/code/dotfile
    set -l app $argv[1]

    switch $app
        case helix hx
            echo "sync helix config..."
            cp ~/.config/helix/{config.toml,languages.toml} $dotfile_repo/helix/
        case fish
            echo "sync fish config..."
            cp ~/.config/fish/{config.fish,fish_plugins} $dotfile_repo/fish/
            cp ~/.config/fish/functions/my_syncdotfile.fish $dotfile_repo/fish/functions/
            # cp ~/.config/fish/themes/my.theme $dotfile_repo/fish/themes/
        case foot
            echo "sync foot config..."
            cp ~/.config/foot/foot.ini $dotfile_repo/foot/
        case lazygit
            echo "sync lazygit config..."
            cp ~/.config/lazygit/config.yml $dotfile_repo/lazygit/
        case yazi
            echo "sync yazi config..."
            cp ~/.config/yazi/{yazi.toml,theme.toml,keymap.toml,init.lua} $dotfile_repo/yazi/
        case tmux
            echo "sync tmux config..."
            cp ~/.tmux.conf $dotfile_repo/tmux/
        case dprint
            echo "sync dprint config..."
            cp ~/.dprint.json $dotfile_repo/dprint/
        case glow
            echo "sync glow config..."
            cp ~/.config/glow/glow.yml $dotfile_repo/glow/
        case newsboat
            echo "sync newsboat config..."
            cp ~/.config/newsboat/{urls,config} $dotfile_repo/newsboat/
    end

    argparse p/push -- $argv

    if set -lq _flag_p
        echo "git push"
        cd $dotfile_repo
        git add .
        git commit -am sync
        git push origin master
    end
end

# =============================================================================
#  ~/.config/fish/conf.d/acme.fish
#  Plan 9 "acme" colors for the fish command line (light / pale-yellow paper).
#
#  fish colors its OWN interactive prompt independently of the terminal theme,
#  and its defaults assume a dark background. These override them for acme.
#  Colors are the Plan 9 draw.h palette (hex without '#', fish's format).
#
#  Install: save as ~/.config/fish/conf.d/acme.fish  (auto-loaded on new shells)
#  Then open a new fish, or run:  exec fish
# =============================================================================

# --- command-line syntax highlighting ---
set -g fish_color_normal 000000 # default text (black ink)
set -g fish_color_command 0000cc # commands (acme blue)
set -g fish_color_keyword 0000cc # keywords: and/or/if...
set -g fish_color_param 000000 # arguments
set -g fish_color_option 448844 # -flags / --options
set -g fish_color_quote 448844 # quoted strings (green)
set -g fish_color_redirection 8888cc # > >> | (purple-blue)
set -g fish_color_end 99994c # ; & separators (yellow-green)
set -g fish_color_operator 008888 # $ (), math (teal)
set -g fish_color_escape 008888 # \n \x.. escapes
set -g fish_color_comment 7a7a66 --italics # # comments (muted)
set -g fish_color_error cc0000 # errors (red)
set -g fish_color_status cc0000 # non-zero exit status in prompt
set -g fish_color_cancel -r # ^C cancel marker
set -g fish_color_autosuggestion 8a8a76 # ghost autosuggestion text
set -g fish_color_selection 000000 --background=eeee9e # visual selection
set -g fish_color_search_match 000000 --background=9eeeee # history search hit
set -g fish_color_valid_path --underline
set -g fish_color_history_current --bold

# --- used by the default prompt / greeting ---
set -g fish_color_cwd 0000cc
set -g fish_color_cwd_root cc0000
set -g fish_color_user 448844
set -g fish_color_host 0000cc
set -g fish_color_host_remote 448844

# --- pager (tab-completion menu) ---
set -g fish_pager_color_progress 7a7a66
set -g fish_pager_color_prefix 0000cc --bold
set -g fish_pager_color_completion 000000
set -g fish_pager_color_description 7a7a66
set -g fish_pager_color_selected_background --background=eeee9e
set -g fish_pager_color_selected_prefix 0000cc
set -g fish_pager_color_selected_completion 000000
set -g fish_pager_color_selected_description 7a7a66

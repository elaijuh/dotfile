# =============================================================================
#  ~/.config/fish/conf.d/acme_lscolors.fish
#  Plan 9 "acme" colors for `ls` output (directories, files, links, etc.).
#
#  `ls` coloring is separate from the terminal/shell/prompt theme:
#    - GNU ls (Linux, or coreutils/gls on macOS) -> LS_COLORS (24-bit, below)
#    - BSD ls (macOS default)                    -> LSCOLORS + CLICOLOR
#  Both are set here; each `ls` uses the one that applies to it.
#
#  Check which you have:  ls --version   (GNU prints a version; BSD errors)
#  Install: save as ~/.config/fish/conf.d/acme_lscolors.fish, then: exec fish
# =============================================================================

# --- GNU ls (truecolor, exact acme hex) + fish's own completion coloring ---
set -gx LS_COLORS "di=1;38;2;0;0;204:fi=0:ln=38;2;0;136;136:pi=38;2;153;153;76:so=38;2;136;136;204:do=38;2;136;136;204:bd=38;2;170;136;0:cd=38;2;170;136;0:or=38;2;255;255;234;48;2;204;0;0:mi=38;2;255;255;234;48;2;204;0;0:su=38;2;255;255;234;48;2;204;0;0:sg=38;2;0;0;0;48;2;238;238;158:tw=38;2;0;0;0;48;2;158;238;238:ow=1;38;2;0;0;204:st=38;2;255;255;234;48;2;0;0;204:ex=38;2;68;136;68:*.tar=38;2;204;0;0:*.tgz=38;2;204;0;0:*.zip=38;2;204;0;0:*.gz=38;2;204;0;0:*.bz2=38;2;204;0;0:*.xz=38;2;204;0;0:*.zst=38;2;204;0;0:*.7z=38;2;204;0;0:*.rar=38;2;204;0;0:*.deb=38;2;204;0;0:*.rpm=38;2;204;0;0:*.jpg=38;2;0;136;136:*.jpeg=38;2;0;136;136:*.png=38;2;0;136;136:*.gif=38;2;0;136;136:*.bmp=38;2;0;136;136:*.svg=38;2;0;136;136:*.webp=38;2;0;136;136:*.tiff=38;2;0;136;136:*.ico=38;2;0;136;136:*.mp4=38;2;136;136;204:*.mkv=38;2;136;136;204:*.mov=38;2;136;136;204:*.avi=38;2;136;136;204:*.webm=38;2;136;136;204:*.mp3=38;2;136;136;204:*.flac=38;2;136;136;204:*.wav=38;2;136;136;204:*.ogg=38;2;136;136;204:*.m4a=38;2;136;136;204:*.pdf=38;2;68;136;68:*.doc=38;2;68;136;68:*.docx=38;2;68;136;68:*.md=38;2;68;136;68:*.txt=38;2;68;136;68:*.rtf=38;2;68;136;68:*.odt=38;2;68;136;68:*.epub=38;2;68;136;68"

# --- BSD ls (macOS default): enable color + acme-ish 16-color mapping ---
# LSCOLORS pairs (fg,bg): 1 dir 2 link 3 socket 4 pipe 5 exec 6 block 7 char
#                         8 setuid 9 setgid 10 dir-sticky 11 dir-writable
#   e=blue g=cyan f=magenta d=brown/yellow c=green a=black x=default (caps=bold)
set -gx CLICOLOR 1
set -gx LSCOLORS exgxfxdxcxegedabagacad

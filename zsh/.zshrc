# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/hjl/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macos z.lua copypath copyfile copybuffer encode64 vagrant kubectl asdf)

source $ZSH/oh-my-zsh.sh

# User configuration
tabs -4
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share

# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$HOME/.local/bin:$PATH

fpath=(~/.zfunc $fpath)
autoload -Uz proxy sync

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="nvim ~/.oh-my-zsh"
alias make=gmake
alias geany="/Applications/Geany.app/Contents/MacOS/geany"
alias k="kubectl"
alias openssl="/usr/local/opt/openssl@3/bin/openssl"

# brew
#export HOMEBREW_BREW_GIT_REMOTE=https://mirrors.cloud.tencent.com/homebrew/brew.git
#export HOMEBREW_CORE_GIT_REMOTE=https://mirrors.cloud.tencent.com/homebrew/homebrew-core.git
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles
#brew tap --custom-remote --force-auto-update homebrew/core https://mirrors.cloud.tencent.com/homebrew/homebrew-core.git
#brew tap --custom-remote --force-auto-update homebrew/cask https://mirrors.cloud.tencent.com/homebrew/homebrew-cask.git
#brew tap --custom-remote --force-auto-update homebrew/cask-fonts https://mirrors.cloud.tencent.com/homebrew/homebrew-cask-fonts.git
#brew tap --custom-remote --force-auto-update homebrew/cask-drivers https://mirrors.cloud.tencent.com/homebrew/homebrew-cask-drivers.git

# llvm
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# ruby
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.1.0/bin:$PATH"

# go
export GOPATH="${HOME}/go"
export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
export GO111MODULE=on

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf
source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z.lua
export _ZL_ADD_ONCE=1
export _ZL_ROOT_MARKERS=".git,.svn,.hg,.root,package.json,go.mod"


# gcc
alias gcc='gcc-14'
alias g++='gcc++-14'

# k8s
[[ -f $HOME/fubectl.source ]] && source $HOME/fubectl.source
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# vpn
proxy on

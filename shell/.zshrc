# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"

##############################
# powerlevel9k configuration #
##############################

POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_PROMPT_ON_NEWLINE="true"
POWERLEVEL9K_RPROMPT_ON_NEWLINE="true"
POWERLEVEL9K_PROMPT_ADD_NEWLINE="true"

# Adds a white space for these characters on order to
# not cut them off
POWERLEVEL9K_DISK_ICON=$' '
POWERLEVEL9K_FOLDER_ICON=$' '
POWERLEVEL9K_HOME_ICON=$' '
POWERLEVEL9K_HOME_SUB_ICON=$' '
POWERLEVEL9K_LINUX_ICON=$' '
POWERLEVEL9K_LINUX_ARCH_ICON=$' '
POWERLEVEL9K_OK_ICON=$' '
POWERLEVEL9K_EXECUTION_TIME_ICON=$' '

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status root_indicator background_jobs history time os_icon)

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(icons_test)

##############################

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source $ZSH/oh-my-zsh.sh

######################
# User configuration #
######################

# export MANPATH="/usr/local/man:$MANPATH"

# Invoke compinit here
compinit -d ~/.cache/zsh/zcompdump-anarcroth-$ZSH_VERSION

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='emacsclient --alternate-editor "" --create-frame -nw'
# This is the old config, just in case something happens
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='emacs'
#fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias padon="xinput enable \"ETPS/2 Elantech Touchpad\""
alias padoff="xinput disable \"ETPS/2 Elantech Touchpad\""
alias ff="firefox"

# Run antigen
source $HOME/antigen/antigen.zsh

# Load oh-my-zsh's library
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle git
antigen bundle catimg
antigen bundle chucknorris
antigen bundle command-not-found
antigen bundle sudo
antigen bundle archlinux
antigen bundle lol
antigen bundle mvn
antigen bundle python
antigen bundle rand-quote
antigen bundle systemd
antigen bundle emacs

antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle chrissicool/zsh-256color
antigen bundle djui/alias-tips
antigen bundle srijanshetty/zsh-pandoc-completion
antigen bundle aramboi/zsh-ipfs

antigen apply

# Ctrl+s show sensors output
function sens() {
  sensors
}
zle -N sens{,}
bindkey ^s sens

# List current directory for passed pattern
function lep() {
  if [[ -n "$1" ]]; then
    l | grep "$1"
  fi
}

# Currently I am not using pywal
# pywal call
# export PATH="${PATH}:${HOME}/.local/bin/"
# Import colorscheme from 'wal' asynchronously
# (cat ~/.cache/wal/sequences &)

# source fonts
source ~/.fonts/*.sh

# Call neofetch with wallpaper
neofetch

# Source zsh theme
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# Changes cursor to blinking bar
echo -e -n "\x1b[\x35 q"

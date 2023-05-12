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
POWERLEVEL9K_RPROMPT_ON_NEWLINE="false"
POWERLEVEL9K_PROMPT_ADD_NEWLINE="true"

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="  "
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="   "

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status)

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

# Invoke compinit here
compinit -d ~/.cache/zsh/zcompdump-anarcroth-$ZSH_VERSION

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='emacsclient --alternate-editor "" --create-frame'

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
alias ssh="TERM=xterm-256color ssh"
alias lxc="TERM=xterm-256color lxc"
alias padon="xinput enable \"ETPS/2 Elantech Touchpad\""
alias padoff="xinput disable \"ETPS/2 Elantech Touchpad\""
alias ff="firefox"
alias glep="ls -la | grep -Ee $1"
alias shdwn="shutdown -h now"
alias gep="grep -n -C 2 $1"
alias pacin="sudo pacman -S" # Install packages from the repositories
alias pacinf="pacman -Qi" # Display information about a package in the local database
alias pacsur="pacman -Qs" # Search for packages in the local database
alias pacorph="sudo pacman -Qdt" # List all orphaned packages
alias pacrem="sudo pacman -Rns" # Remove packages, including its settings and dependencies
alias pacrm="sudo pacman -Rs" # Remove packages, without its dependencies
alias pacrinf="pacman -Si" # Display information about a package in the repositories
alias pacrsur="pacman -Ss" # Search for packages in the repositories
alias pacrmorphs="sudo pacman -Rs $(pacman -Qtdq)" # Delete all orphaned packages
alias pacupg="sudo pacman -Syu" # Sync with repositories before upgrading packages
alias pacfls="pacman -Ql" # List files in a package
alias pacown="pacman -Qo" # Show which package owns a file
alias dvorak="setxkbmap -model \"pc105\" -layout \"us(dvorak),bg(phonetic)\" -option \"grp:alt_shift_toggle\""
alias qwerty="setxkbmap -model \"pc105\" -layout \"us,bg(phonetic)\" -option \"grp:alt_shift_toggle\""
alias pyenv="python -m venv $1" # Create python virtual environment at path (argument)

# Run antigen
source $HOME/antigen/antigen.zsh

# Load oh-my-zsh's library
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle git
antigen bundle command-not-found
antigen bundle emacs
antigen bundle autojump

antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle chrissicool/zsh-256color

antigen apply

# Currently I am not using pywal
# pywal call
# export PATH="${PATH}:${HOME}/.local/bin/"
# Import colorscheme from 'wal' asynchronously
# (cat ~/.cache/wal/sequences &)

# Call neofetch with wallpaper
#neofetch

# Source zsh theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Disable cowsay for ansible
export ANSIBLE_NOCOWS=1

# Export rust src path
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src

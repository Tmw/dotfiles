# If you come from bash you might have to change your $PATH.
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='/usr/local/bin/nvim'
export VISUAL="$EDITOR"
export FZF_DEFAULT_COMMAND='fd --type f'

# android studio requirements (RN)
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"

ZSH_THEME="robbyrussell"

# zsh plugins
plugins=(git)

# load oh-my-zsh, its plugins and completions
source $ZSH/oh-my-zsh.sh
fpath=(/usr/local/share/zsh-completions $fpath)

# Set aliasses
alias dc="docker-compose"
alias dev='cd ~/Development'
alias rake='noglob rake'
alias bundle='noglob bundle'
alias vim='nvim'
alias vimtweak='nvim ~/.config/nvim/init.vim'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# set locales
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# load asdf shims
source /usr/local/opt/asdf/asdf.sh

# load cargo env
source $HOME/.cargo/env

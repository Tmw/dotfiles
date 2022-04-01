# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='/usr/local/bin/nvim'
export VISUAL="$EDITOR"
export FZF_DEFAULT_COMMAND='fd --type f'

# android studio requirements (RN)
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
alias notes='cd $HOME/Notes && nvim .'
alias vimtweak='cd $HOME/.config/nvim && nvim .'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# set locales
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# load asdf shims
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# set gopath
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$(go env GOPATH)/bin"

# load cargo env
# source $HOME/.cargo/env

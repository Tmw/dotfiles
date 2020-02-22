# If you come from bash you might have to change your $PATH.
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/tiemen/.oh-my-zsh"
export EDITOR='/usr/local/bin/nvim'
export VISUAL="$EDITOR"

ZSH_THEME="robbyrussell"

# zsh plugins
plugins=(
  asdf
  docker
)

source $ZSH/oh-my-zsh.sh

# Aliasses
alias dc="docker-compose"
alias dev='cd ~/Development'
alias rake='noglob rake'
alias bundle='noglob bundle'
alias vim='nvim'
alias vimtweak='nvim ~/.config/nvim/init.vim'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Load autocompletions
fpath=(/usr/local/share/zsh-completions $fpath)

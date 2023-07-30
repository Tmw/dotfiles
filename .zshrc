# enable some vim bindings on bash 
# eg. ESC + b / ESC + w to jump between words
set -o vi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='/Users/tiemenwaterreus/.local/bin/lvim'
export GIT_EDITOR="$EDITOR"
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
alias lvim='/Users/tiemenwaterreus/.local/bin/lvim'
alias vim='lvim'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lg='lazygit'

# set locales
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# load asdf shims
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# load Z
. /opt/homebrew/etc/profile.d/z.sh

# set gopath
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$(go env GOPATH)/bin"

# load cargo env
# source $HOME/.cargo/env
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

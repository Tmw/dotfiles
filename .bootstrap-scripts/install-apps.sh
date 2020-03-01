# This script will install applications and fonts using homebrew.

# Install cli tools
cli_tools=(
  coreutils
  gpg
  jq
  git
  git-lfs
  ack
  zsh-completions
  neovim
  awscli
  docker
  pgcli
  telnet
  asdf
)

# Install GUI tools
gui_tools=(
  spotify
  kitty
  brave-browser
  tweetbot
  1password
  ticktick
  dropbox
  spectacle
  docker
  graphiql
  whatsapp
  telegram
  postman
  numi
)

# Install fonts
fonts=(
  font-fira-code
  font-fira-mono
  font-fira-sans
  font-hack-nerd-font
)

# programming languages
languages=(
  nodejs
  ruby
  golang
  rust
  erlang
  elixir
  python
)

# First update homebrew
brew update

# Install fonts tap
brew tap homebrew/cask-fonts

# Iterate over the list of essential CLI tools
# and install them one-by-one using Homebrew
for tool in ${cli_tools[@]}; do
  brew install "$tool"
done

# Git needs to be configured to use LFS too..
git lfs install

# Now; iterate over all the GUI tools and
# instal them one-by-one too!
for tool in ${gui_tools[@]}; do
  brew cask install "$tool" --no-quarantine
done

# Install the font(s) we'll need
for font in ${fonts[@]}; do
  brew cask install "$font"
done

###########
# Plugins #
###########

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install vim-plug (plugin manager for vim)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install asdf plugin and then latest version of the given language
for lang in ${languages[@]}; do
  # add the plugin for that language
  asdf plugin-add "$lang"

  if [ "$lang" = 'nodejs' ]; then
    # node wants some GPG keys to be installed
    bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
  fi

  # install the latest version of the language
  asdf install "$lang" latest

  # and mark that version of the language as the one globally used
  asdf global "$lang" $(ls .asdf/installs/"$lang" | head -n 1)
done

# Some global npm packages
npm -g install yarn

# cleanup
brew cleanup

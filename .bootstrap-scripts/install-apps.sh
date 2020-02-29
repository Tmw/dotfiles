# This script will install applications and fonts using homebrew.

# Install cli tools
cli_tools=(
  coreutils
  gpg
  jq
  git
  git-lfs
  ack
  zsh
  zsh-completions
  neovim
  awscli
  docker
  pgcli
  telnet
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
)

# Install fonts
fonts=(
  font-fira-code
  font-fira-mono
  font-fira-sans
)

# programming languages
languages=(
  node
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

# Install asdf plugin and then latest version of the given language
for lang in ${languages[@]}; do
  asdf plugin-add "$lang"
  asdf install "$lang" latest
done

# setup PGP key for nodejs releases
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# cleanup
brew cleanup

# Install cli tools
cli_tools=(
  jq
  git
  git-lfs
  ack
  zsh
  zsh-completions
  neovim
  awscli
  docker
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
)

########################
###### INTERNALS #######
########################

# Install homebrew if not already exist.
if ! [ -x "$(command -v brew)" ]; then
  echo "No Homebrew found; Installing homebrew first"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Already have Homebrew; skipping.."
fi


# First update homebrew
brew update

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

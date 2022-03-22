# programming languages (using asdf)
languages=(
  nodejs
  ruby
  golang
  rust
  erlang
  elixir
  python
)

# Git needs to be configured to use LFS too..
git lfs install
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

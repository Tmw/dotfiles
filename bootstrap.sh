########################
# Bootstrap script
#
# Will install homebrew to start with and then clone my dotfiles directory
# for further installation and configuration.
#

# Switch to home directory
cd $HOME

# request sudo password upfront and keep the sudo session alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Then; install Homebrew if not already exist.
if ! [ -x "$(command -v brew)" ]; then
  echo "No Homebrew found; Installing homebrew first"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Already have Homebrew; continuing.."
fi

# checkout rest of dotfiles repo before continuing
git clone --bare https://github.com/tmw/dotfiles.git $HOME/.dotfiles

# set (temporary alias) to work with the dotfiles repo
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# configure dotfiles repo to ignore untracked files
dotfiles config --local status.showUntrackedFiles no

# And then install apps and fonts
./.bootstrap-scripts/install-apps.sh

# Only checkout dotfiles after installing the apps to ensure we dont
# override settings files back to defaults after installing.
dotfiles fetch --all
dotfiles reset --hard origin/abranch
dotfiles checkout $branch

# Run the preferences script
./.bootstrap-scripts/setup-preferences.sh


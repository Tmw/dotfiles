# Dotfiles

Getting started on a new machine is as simple as copy-pasting the following command in your terminal.

```bash
  bash -c "$(curl -fSsl https://raw.githubusercontent.com/Tmw/dotfiles/master/bootstrap.sh)"
```

This bashscript will setup homebrew and install a few CLI and MacOS tools as well as fonts and the asdf version manager. The tools, fonts and languages that it will install are defined in [install-apps.sh](.bootstrap-scripts/install-apps.sh). asdf will automatically install the latest version of the languages listed and mark them as globally available.

Then it will pull this repository and setup the Dotfiles command & structure as described in [this article](https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b) so that all my preferences are setup the way I like them.

## Saving changes to dotfiles

dotfiles is using a bare git repository to track dotfiles in the home directory.
A zsh alias defines the `dotfiles` command to be git pointing to the dotfiles repository. Note that all untracked files will be hidden by default; tracking a new file will require you to specify the filename explicitly.

```
dotfiles add <name-of-dotfile>
dotfiles commit -m 'what changed'
dotfiles push origin master
```

## Manual setting up

**Inside Brave: install plugins**
- 1PasswordX
- Apollo Client Developer Tools
- React Developer Tools
- Reeder

**Apps from Mac App Store**
- Xcode
- Giphy capture
- Bear
- Unsplash Wallpapers


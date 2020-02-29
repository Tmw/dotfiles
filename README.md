# Dotfiles

Getting started on a new machine is as simple as copy-pasting the following command in your terminal.

```bash
  bash -c "$(curl -fSsl https://raw.githubusercontent.com/Tmw/dotfiles/master/bootstrap.sh)"
```

This bashscript will setup homebrew and install a few CLI tools as well
as some Mac OS applications that I personally use on a day-to-day basis.

Then it will pull this repository and setup the Dotfiles command & structure as described in [this article](https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b) so that all my preferences are setup the way I like them.

## Saving changes to dotfiles

dotfiles is using a bare git repository to track dotfiles in the home directory.
A zsh alias defines the `dotfiles` command to be git pointing to the dotfiles repository. Note that all untracked files will be hidden by default; tracking a new file will require you to specify the filename explicitly.

```
dotfiles add <name-of-dotfile>
dotfiles commit -m 'what changed'
dotfiles push origin master
```

# dotfiles

Files to configure a terminal environment. 
(to be updated with more files to configure tmux, git and etc.)

## How to Use

1. Clone this repository to your home directory

2. Use `stow` to manage all symlinks

```
$ cd ~/dotfiles
$ stow vim
$ stow zsh
```
### nvim

For the nvim directory, since it is not located in the home directory, copy it from this directory to `~/.config`.

## How it Works

### Symlinks

All the necessary symlinks are managed with GNU Stow and all the files that needs to be symlinked to the home directory is inside `~/dotfiles`. Using `stow vim` for example will manage all the symlinks such that everything that is in `~/dotfiles/vim/` goes to `~/`

Completely based on [this](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).

### ZSH

- Uses [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) to manage plugins
- Uses [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme

### Vim

- All plugins managed by [vim-plug](https://github.com/junegunn/vim-plug)

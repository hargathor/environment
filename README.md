# Dot files
Dot files such as vimrc, bashrc, etc....

## Installation

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim
````

Type `:PlugInstall`

For nvim-completion-manager you need to install pip modules for python3

```bash
# neovim is the required pip module
# jedi for python completion
# psutil (optional)
# setproctitle (optional)
pip3 install --user neovim jedi psutil setproctitle
```

### Patched Powerline fonts
```bash
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
````

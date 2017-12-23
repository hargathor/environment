# Dot files
Dot files such as vimrc, bashrc, etc....

## Installation

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim
````

Type `:PlugInstall`

### YCM Completer 
```bash
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
npm install -g typescript
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer --rust-completer --js-completer 
````

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

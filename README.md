# environment
Environment files such as vimrc, bashrc, etc....

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
cd ~/.vim/plugged/YouCompleteMe
./install.py --all
````

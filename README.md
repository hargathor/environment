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
cd ~/.config/
ln -sf <PROJECT_PATH>/powerline
````

### Install Termite
Kudos to https://askubuntu.com/a/906475/805625

Install dependencies

```bash
sudo apt install -y g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool libpcre2-dev libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev libxml2-utils gperf build-essential
`````

Get and install vte-ng

```bash
git clone https://github.com/thestinger/vte-ng.git
echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng && ./autogen.sh && make && sudo make install 
cd ..
````

Get and install termite, and setup
```bash
git clone --recursive https://github.com/thestinger/termite.git
cd termite && make && sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite
````

# vim4ide

use vim as ide

### How to setup


#### macvim

```shell
brew install macvim --with-override-system-vim
```
#### vim plugins

```shell
_placed .vimrc_
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim
:PluginInstall
```

#### YouCompleteMe

> support C-family language,GO,Typescript,Javascript

```shell
home brew install cmake
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer  --gocode-completer --tern-completer
```
### ScreenShot
![vim4ide](./screenshot.png)



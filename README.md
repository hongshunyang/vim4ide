# vim4ide

use vim as ide

> maybe you like [vimAwesome](http://vimawesome.com).

## Links

* [vim game](http://vim-adventures.com/)
* [vimGenius](http://www.vimgenius.com/)
* [user manual](https://vimhelp.appspot.com/usr_toc.txt.html)
* [quick reference](https://vimhelp.appspot.com/quickref.txt.html)



## TODO

* support tmux
* support R
* [vim-R-tmux](http://manuals.bioinformatics.ucr.edu/home/programming-in-r/vim-r)


### How to setup


#### macvim

```shell
brew install python
brew install macvim --with-python --with-override-system-vim
```
#### vim plugins

```shell
cp .vimrc ~/.vimrc 
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

### Optional

```shell
brew install iterm2
```
> config settings as below

![iterm2](./misc/iterm2.1.png)
![iterm2](./misc/iterm2.2.png)

### ScreenShot
![vim4ide](./screenshot.png)



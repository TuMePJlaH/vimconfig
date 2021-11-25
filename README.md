# vimconfig
### Plugins
* [Vundle.vim](https://github.com/VundleVim/Vundle.vim)
* [Nerdtree](https://github.com/scrooloose/nerdtree)
* [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)
* [UltiSnips](https://github.com/SirVer/ultisnips)
* [LightLine](https://github.com/itchyny/lightline.vim)
* [MultipleCursor](https://github.com/terryma/vim-multiple-cursors)
* [VimPolyglot](https://github.com/sheerun/vim-polyglot)
* [Gutentags](https://github.com/ludovicchabant/vim-gutentags) ([link1](https://kulkarniamit.github.io/whatwhyhow/howto/use-vim-ctags.html), [link2](https://bolt80.com/gutentags/))
### Colors
* [OneDark](https://github.com/joshdick/onedark.vim)
### Map caps lock to escape
#### XWindows
Drop this file in your home directory:
```
! Swap caps lock and escape
remove Lock = Caps_Lock
keysym Escape = Caps_Lock
keysym Caps_Lock = Escape
add Lock = Caps_Lock
```
and call it ".speedswapper". Then open a terminal and type
```
xmodmap ~/.speedswapper
```

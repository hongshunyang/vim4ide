" define the prefix of shortcut key
let mapleader = ";"

" file type detection

" turn on detection
filetype on
" different type different plugin
filetype plugin on

" vim shortcut key
nmap LB 0
nmap LB $

" copy select content to clipboard
vnoremap <Leader>y "+y
" paste clipboard to cursor
nmap <Leader>p "+p

" close current window
nmap <Leader>q :q<CR>
" save current window
nmap <Leader>w :w<CR>
" save and exit all windows
nmap <Leader>WQ :wa<CR>:q<CR>
" exit windows without saved
nmap <Leader>Q :qa!<CR>

" traverses child window
" next window
nnoremap nw <C-W><C-W>
" right window
nnoremap <Leader>lw <C-W>l
" left window
nnoremap <Leader>hw <C-W>h
" top window
nnoremap <Leader>kw <C-W>k
" bottom window
nnoremap <Leader>jw <C-W>j

" jump the pair
nmap <Leader>M %


" effective immediately 
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Others 

" turn on instant search
set incsearch
" ignore case 
set ignorecase
" no compatible
set nocompatible
" vim command autocomplete
set wildmenu


" Plugins
" vundle config
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle plugins must be placed between vundle#begin() and  vundle#end()
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'

Plugin 'Lokaltog/vim-powerline'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'

Plugin 'majutsushi/tagbar'

Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'

Plugin 'gcmt/wildfire.vim'

Plugin 'scrooloose/nerdcommenter'


Plugin 'suan/vim-instant-markdown'
Plugin 'easymotion/vim-easymotion'


call vundle#end()
filetype plugin indent on
" Plugin end


" Vision


" color scheme


" vim-quantum 
set background=dark
colorscheme quantum

" cursor
set gcr=a:block-blinkon0
" hide scroller
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" hide menu toolbar
set guioptions-=m
set guioptions-=T
" status bar
set laststatus=2
" ruler
set ruler
" row number
set number
" high light current row and current column
set cursorline
set cursorcolumn
" highlight search 
set hlsearch
":nohlsearch

" no wrap
set nowrap

"let g:Powerline_colorscheme='quantum'



" Syntax highlight & color scheme
syntax enable
syntax on

" indent
filetype indent on

" tab 2 space
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" code fold
" za Toggle Codes,zM close all codes,zR open all codes
"set foldmethod=indent
set foldmethod=syntax
set nofoldenable

" plugin indent guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
    
" plugin tagbar
" tagbar placed left 
let tagbar_left=1
" tagbar toggle  
nnoremap <Leader>ilt :TagbarToggle<CR>
" tagbar width
let tagbar_width=32
" tagbar simple
let g:tagbar_compact=1

" code trip
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>


" Plugin Ctrlsf :search in project
nnoremap <Leader>sp :CtrlSF<CR>

" confirm：
" wholeword：
" replace：
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" Man
"source $VIMRUNTIME/ftplugin/man.vim
"nmap <Leader>man :Man 3 <cword><CR>

" Plugin  NERDTree ：file list
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=22
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1


" Plugin MiniBufExplorer
map <Leader>bl :MBEToggle<cr>


" Plugin wildfire
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)



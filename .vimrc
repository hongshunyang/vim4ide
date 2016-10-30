" define the prefix of shortcut key
let mapleader=";"

"<CR>E scroll window down
"<CR>Y scroll window up
"<CR>F scroll down one page
"<CR>B scroll up one page
"H move the cursor to top of the window
"M middle 
"L bottom
 
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

" <Esc> 
inoremap ii <Esc>   

" effective immediately 
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"here is a bug esc and autocmd,when <leader>w save file,statusline hide

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

Plugin 'bling/vim-airline'

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


Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'godlygeek/tabular'

call vundle#end()
filetype plugin indent on
" Plugin end


" Vision


" color scheme

" Syntax highlight & color scheme
syntax enable
syntax on

"vim-color-solarized

set background=dark

" if you use terminal.app umcomment 2 below
"set t_Co=256
"let g:solarized_termcolors=256

colorscheme solarized

" vim-quantum 
"colorscheme quantum



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
nnoremap <Leader>g :set hlsearch!<CR>

" no wrap
set nowrap

"let g:Powerline_colorscheme='quantum'

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
nmap <silent> <Leader>dt <Plug>IndentGuidesToggle
    
" plugin tagbar
" tagbar placed left 
let tagbar_left=1
" tagbar toggle  
nnoremap <Leader>a :TagbarToggle<CR>
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

" Plugin ultisnips

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"Plugin syntax
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

"Plugin CtrlP
let g:ctrlp_map='<Leader>ls'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_switch_buffer='et'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore={
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
"let g:ctrlp_user_command='find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command='dir %s /-n /b /s /a-d'  " Windows
"
"Plugin YouCompleteMe
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_cache_omnifunc=0
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_seed_identifiers_with_syntax=1
set completeopt-=preview


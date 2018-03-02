set encoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
let $LANG = 'en_US.UTF-8'
set nocompatible
set shortmess=atI
set number
set showcmd
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} "show content of status line
set autoindent
set backupdir=~/.vim/undo
set nowritebackup
set noswapfile
set undodir=~/.vim/undo
set tabstop=4
set shiftwidth=4
au FileType html,python,vim,javascript setl shiftwidth=4
au FileType html,python,vim,javascript setl tabstop=4
au FileType java,php setl shiftwidth=4
au FileType java,php setl tabstop=4
filetype off
filetype plugin on
colorscheme molokai
"set guifont=Ayuthaya:h20
set guifont=Go\ Mono\ for\ Powerline:h20



"---Vundlesetup---
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
Plugin 'VundleVim/Vundle.vim'

Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-latex/vim-latex'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on 
"----------latex-suite---
set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on 
let g:tex_flavor='latex'
"---Disable autofolding
let g:Tex_FoldedSections     = ""
let g:Tex_FoldedEnvironments = ""
let g:Tex_FoldedMisc         = ""
"-----------------

"let g:Tex_DefaultTargetFormat = 'pdf'
"-----
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'xelatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats = 'pdf'

"----latex-preview-Preview
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer='open -a Preview'
"----------------------


source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim "for windows OS shortcut key combo

set lines=35 column=80
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
map <silent> <F4> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"--------nerdtree setup-------"
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

"air-line setup
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
set laststatus=2
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

"--------
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    	let &shellxquote=l:shxq_sav
  	endif
endfunction

"-----ShortCuts------"
inoremap jk <ESC>
nnoremap nv :vnew <CR> 
nnoremap op :e! ~/Documents/python/
nnoremap om :e! ~/Documents/Markdown/
nnoremap ot :e! ~/Documents/tex/
nnoremap ox :e! ~/Documents/projects/
nnoremap rcp :!python % <CR>
nnoremap rp :read !python ~/Documents/python/
nnoremap lt :TTemplate
nnoremap lp :LLPStartPreview <CR>
map <F6> :setlocal spell! spelllang=en_us<CR>
"inoremap <Space><Space> <Esc>/<Enter>"_c4l
"autocmd filetype html inoremap ; i <em></em><Space>n indent on


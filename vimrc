" UNIVERSAL SETTINGS {{{
"_______________________________________________________________________________________________________
	execute pathogen#infect()
	:syntax on
	:set nocompatible
	:set nowrap
	:set nonumber
	:set autoindent
	:set smartindent
	:colorscheme elflord

	:set hlsearch incsearch

	:command! W w
	:command! Wq wq
	:command! WQ wq
	:command! Q q
" }}}

" UNVIVERSAL MAPPINGS {{{
"_______________________________________________________________________________________________________
:nnoremap <expr>cv :normal! echo "v:count<<CR>>"

	"mapleaders
	:let mapleader = " "
	:let maplocalleader = "/"

	" insert a single char 
	:nnoremap <silent>s :exec "normal! i".nr2char(getchar())."\e"<CR>
	:nnoremap <silent>S :exec "normal! a".nr2char(getchar())."\e"<CR>

	" For magic vim regex
	:nnoremap / /\v
	:vnoremap / /\v
	:cnoremap s/ s/\v
	
	" key mappings
	:nnoremap H ^
	:nnoremap L $
	:nnoremap j gj
	:nnoremap k gk
	:inoremap jk <esc>l
	:inoremap <esc> <nop>
	:noremap <Up> <nop>
	:noremap <Down> <nop>
	:noremap <Left> <nop>
	:noremap <Right> <nop>
	:noremap <space> <nop>
	:noremap ) <nop>
	
 
	" move lines up and down 
	:noremap - ddp
	:noremap _ ddkP
	

	" edit and reload vimrc
	:nnoremap <leader>ev :vsplit $MYVIMRC<CR>
	:nnoremap <leader>sv :source $MYVIMRC<CR>
	

	" clear a line
	:nnoremap <leader>c ddO
	

	" add an empty line right above or below current line
	:nnoremap <leader>o o<esc>
	:nnoremap <leader>O O<esc>
	

	" capitalize and lowercase a word
	:nnoremap <c-u> viwU
	:inoremap <c-u> <esc>viwUi
	:nnoremap <c-l> viwu
	:inoremap <c-l> <esc>viwui
	

	" add quotes around a word 
	:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
	:vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`<lv`>l

	:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
	:vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`<lv`>l

	:nnoremap <leader>) viw<esc>a)<esc>hbi(<esc>lel
	:vnoremap <leader>) <esc>`>a)<esc>`<i(<esc>`<lv`>l

	:nnoremap <leader>> viw<esc>a><esc>hbi<<esc>lel
	:vnoremap <leader>> <esc>`>a><esc>`<i<<esc>`<lv`>l
	

	" mapping for ease of {} use 
	:inoremap {} {<CR>}<esc>ko

	" For external clipboard use
	"may not work if you arent on vim-gnome
	:nnoremap <c-x> "+dd
	:nnoremap <c-c> "+yy
	:nnoremap <c-v> "+p
	:inoremap <c-x> <esc>"+ddi
	:inoremap <c-c> <esc>"+yyi
	:inoremap <c-v> <esc>"+pi

	" clear higlighting from search
	:nnoremap <silent>noh :nohlsearch<CR>	

" }}}

" UNIVERSAL ABBREVIATIONS {{{
"_______________________________________________________________________________________________________

	" Signatures
	:iabbrev utsign Chris Dean<CR>cdean16@vols.utk.edu
	:iabbrev gsign Chris Dean<CR>chrisdean258@gmail.com
"}}}

" AUTOCMD GROUPS  {{{
"_______________________________________________________________________________________________________

	"AutoRun on buffload
	:augroup auto_run
	:  autocmd BufRead * :normal! zz <CR>
	" C style formatting {{{ :augroup c_style
	:augroup c_style
	:  autocmd!
	:  autocmd FileType c,cpp,javascript,java,perl nnoremap <silent><buffer><localleader>/ :call CommentBL('\/\/')<CR>
	:  autocmd FileType c,cpp,javascript,java,perl vnoremap <buffer><localleader>/ <esc>`<i/*<esc>`>a*/<esc> 
	:  autocmd FileType c,cpp,javascript,java,perl :set cindent
	:  autocmd FileType c,cpp,javascript,java,perl nnoremap ; mqA;<esc>'q
	:  autocmd FileType c,cpp,javascript,java,perl :setlocal foldmethod=syntax
	:  autocmd FileType c,cpp,javascript,java,perl :normal! zR
	:  autocmd FileType c,cpp,javascript,java,perl inoremap <buffer><tab> <c-p>
	:  autocmd FileType c,cpp,javascript,java,perl inoremap c-sign<CR> /**<CR><bs>* Chris Dean<CR>* <esc>"%pa<CR>* <esc>:put =strftime(\"%m/%d/%Y\")<CR>i<bs><esc>o* <CR>*/<up>
	:augroup END
	"}}}

	" C/cpp specific {{{
	:augroup c_cpp
	:  autocmd!
	:  autocmd FileType cpp :iabbrev <buffer> nstd using namespace std;<CR>
	:  autocmd FileType c,cpp :iabbrev <buffer> #i #include
	:  autocmd FileType cpp :iabbrev <buffer> enld endl
	:  autocmd FileType c,cpp :iabbrev <buffer> main int main(int argc, char** argv)<CR>{<CR>}<up>
	"}}}}

	" Python formatting {{{
	:augroup python_
	:  autocmd!
	:  autocmd FileType python,matlab,sh nnoremap <silent><buffer><localleader>/ :call CommentBL('#')<CR>
	:  autocmd FileType python vnoremap <buffer><localleader>/ <esc>`<i"""<esc>`>a"""<esc> 
	:  autocmd FileType python :setlocal foldmethod=indent
	:  autocmd FileType python :normal! zR
	:  autocmd FileType python inoremap <buffer><tab> <c-p>
	:  autocmd FileType python :set tabstop=4
	:  autocmd FileType python :set softtabstop=4
	:  autocmd FileType python :set expandtab
	:augroup END
	"}}}

	" Vim files {{{
	:augroup vim_
	:  autocmd!
	:  autocmd FileType vim nnoremap <buffer><localleader>/ :call CommentBL('" ')<CR>
	:  autocmd FileType vim setlocal foldmethod=marker
	:augroup END
	"}}}
"}}}

" Operator Depedent mappings  {{{
"_______________________________________________________________________________________________________

	" _____ word before ()
	:onoremap fn :<C-U>normal! 0f(hviw<CR>
	
	" end and beginning of line
	:onoremap L $
	:onoremap h ^

	" whole line
	:onoremap il :<c-u>normal! Vl
"}}}

" Commenting Functions {{{ 
"_______________________________________________________________________________________________________

	" accepts as string uses that as a beginning of the line comment
	:function! CommentBL(in) range
	:  kq
	:  execute a:firstline.",".a:lastline.'s/^\s*/&'.a:in.'/e'
	:  execute a:firstline.",".a:lastline.'s/\v^(\s*)'.a:in.a:in.'/\1/e'
	:  'q
	:  nohlsearch
	:endfunction
" }}}

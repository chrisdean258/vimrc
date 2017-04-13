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

	" clear higlighting from search
	:nnoremap <silent> noh :nohlsearch<CR>	

" }}}

" UNIVERSAL ABBREVIATIONS {{{
"_______________________________________________________________________________________________________

	" Signatures
	:iabbrev utsign Chris Dean<CR>cdean16@vols.utk.edu
	:iabbrev gsign Chris Dean<CR>chrisdean258@gmail.com
	:iabbrev cSign /**<CR><bs>* Chris Dean<CR>* <CR>* <CR>*/<up><up>
"}}}

" AUTOCMD GROUPS  {{{
"_______________________________________________________________________________________________________

	" C style formatting {{{ :augroup c_style
	:augroup c_style
	:  autocmd!
	:  autocmd FileType c,cpp,javascript,java,perl nnoremap <silent><buffer><localleader>/ :call C_comment()<CR>
	:  autocmd FileType c,cpp,javascript,java,perl vnoremap <buffer><localleader>/ <esc>`<i/*<esc>`>a*/<esc> 
	:  autocmd FileType c,cpp,javascript,java,perl :set cindent
	:  autocmd FileType c,cpp,javascript,java,perl nnoremap ; mqA;<esc>'q
	:  autocmd FileType c,cpp,javascript,java,perl :setlocal foldmethod=syntax
	:  autocmd FileType c,cpp,javascript,java,perl :normal! zR
	:  autocmd FileType c,cpp,javascript,java,perl inoremap <buffer><tab> <c-n>
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
	:  autocmd FileType python,matlab,sh nnoremap <silent><buffer><localleader>/ :call Hash_comment()<CR>:nohlsearch<CR> 
	:  autocmd FileType python vnoremap <buffer><localleader>/ <esc>`<i"""<esc>`>a"""<esc> 
	:  autocmd FileType python :setlocal foldmethod=indent
	:  autocmd FileType python :normal! zR
	:  autocmd FileType python inoremap <buffer><tab> <c-n>
	:augroup END
	"}}}

	" Vim files {{{
	:augroup vim_
	:  autocmd!
	:  autocmd FileType vim nnoremap <silent><buffer><localleader>/ :call Quote_comment()<CR>:nohlsearch<CR> 
	:  autocmd FileType vim setlocal foldmethod=marker
	:augroup END
	"}}}
"}}}

" Operator Depedent mappings  {{{
"_______________________________________________________________________________________________________

	" in ____ parentheses
	:onoremap in( :<c-u>normal! f)vi(<CR>
	:onoremap il( :<c-u>normal! F)vi(<CR>

	" in ____ braces 
	:onoremap in{ :<c-u>normal! f{vi{<CR>
	:onoremap il{ :<c-u>normal! F}vi{<CR>

	" in ____ brackets 
	:onoremap in[ :<c-u>normal! f[vi[<CR>
	:onoremap il[ :<c-u>normal! F]vi[<CR>

	" _____ word before ()
	:onoremap fn :<C-U>normal! 0f(hviw<CR>

	" _____ current word
	:onoremap  cw :<c-u>normal! viw<CR>
	
	" end an beginning of line
	:onoremap L $
	:onoremap H ^
"}}}

" Commenting Functions {{{ 
"_______________________________________________________________________________________________________

	" C++ Commenting
	:function! C_comment()
	:  s/^\s*/&\/\//e
	:  s/\v^(\s*)\/\/\/\//\1/e
	:endfunction

	" # commenting
	:function! Hash_comment()
	:  s/^\s*/&#/e
	:  s/\v^(\s*)##/\1/e
	:endfunction

	" quote commenting
	:function! Quote_comment()
	:  s/^\s*/&" /e
	:  s/\v^(\s*)" " /\1/e
	:endfunction
" }}}

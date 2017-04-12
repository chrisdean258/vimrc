" UNIVERSAL SETTINGS {{{
"_______________________________________________________________________________________________________
	execute pathogen#infect()
	:set nocompatible
	:set nowrap
	:set nonumber
	:set autoindent
	:set smartindent
	:colorscheme elflord

	:command! W w
	:command! Wq wq
	:command! WQ wq
	:command! Q q
" }}}

" UNVIVERSAL MAPPINGS {{{
"_______________________________________________________________________________________________________

	"mapleaders g
	:let mapleader = " "
	:let maplocalleader = "/"
	

	" key mappings g
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
	
 
	" move lines up and down  g
	:noremap - ddp
	:noremap _ ddkP
	

	" edit and reload vimrc g
	:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
	:nnoremap <leader>sv :source $MYVIMRC<cr>
	

	" clear a line g
	:nnoremap <leader>c ddO
	

	" add an empty line right above or below current line g
	:nnoremap <leader>o o<esc>
	:nnoremap <leader>O O<esc>
	

	" capitalize and lowercase a word g
	:nnoremap <c-u> viwU
	:inoremap <c-u> <esc>viwUi
	:nnoremap <c-l> viwu
	:inoremap <c-l> <esc>viwui
	

	" add quotes around a word g
	:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
	:vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`<lv`>l

	:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
	:vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`<lv`>l

	:nnoremap <leader>) viw<esc>a)<esc>hbi(<esc>lel
	:vnoremap <leader>) <esc>`>a)<esc>`<i(<esc>`<lv`>l

	:nnoremap <leader>> viw<esc>a><esc>hbi<<esc>lel
	:vnoremap <leader>> <esc>`>a><esc>`<i<<esc>`<lv`>l
	

	" mapping for ease of {} use g
	:inoremap {} {<cr>}<esc>ko

	" For external clipboard use
	"may not work if you arent on vim-gnome
	:nnoremap <c-x> "+dd
	:nnoremap <c-c> "+yy
	:nnoremap <c-v> "+p
	
" }}}

" UNIVERSAL ABBREVIATIONS {{{
"_______________________________________________________________________________________________________

	" Signatures
	:iabbrev utsign Chris Dean<cr>cdean16@vols.utk.edu
	:iabbrev gsign Chris Dean<cr>chrisdean258@gmail.com
	:iabbrev cSign /**<cr><bs>* Chris Dean<cr>* <cr>* <cr>*/<up><up>
"}}}

" AUTOCMD GROUPS  {{{
"_______________________________________________________________________________________________________

	" C style formatting {{{ :augroup c_style
	:  autocmd!
	:  autocmd FileType c,cpp,javascript,java,perl nnoremap <buffer> <localleader>/ I//<esc>
	:  autocmd FileType c,cpp,javascript,java,perl vnoremap <buffer> <localleader>/ <esc>`<i/*<esc>`>a*/<esc> 
	:  autocmd FileType c,cpp,javascript,java,perl :iabbrev <buffer> iff if()<left>
	:  autocmd FileType c,cpp,javascript,java,perl :set cindent
	:augroup END
	"}}}

	" C/cpp specific {{{
	:augroup c_cpp
	:  autocmd!
	:  autocmd FileType c,cpp :iabbrev <buffer> nstd using namespace std;<cr>
	:  autocmd FileType c,cpp :iabbrev <buffer> #i #include
	:  autocmd FileType c,cpp :iabbrev <buffer> enld endl
	:  autocmd FileType c,cpp :iabbrev <buffer> main int main(int argc, char** argv)<CR>{<CR>}<up>
	"}}}}

	" Python formatting {{{
	:augroup python_
	:  autocmd!
	:  autocmd FileType python,matlab nnoremap <buffer> <localleader>/ I# <esc>
	:  autocmd FileType python :iabbrev <buffer> iff if:<left>
	:augroup END
	"}}}

	" Vim files {{{
	:augroup vim_
	:  autocmd!
	:  autocmd FileType vim nnoremap <buffer> <localleader>/ I" <esc>
	:  autocmd FileType vim setlocal foldmethod=marker
	:augroup END
	"}}}
"}}}

" Operator Depedent mappings  {{{
"_______________________________________________________________________________________________________

	" in ____ parentheses
	:onoremap in( :<c-u>normal! f)vi(<cr>
	:onoremap il( :<c-u>normal! F)vi(<cr>

	" in ____ braces 
	:onoremap in{ :<c-u>normal! f{vi{<cr>
	:onoremap il{ :<c-u>normal! F}vi{<cr>

	" in ____ brackets 
	:onoremap in[ :<c-u>normal! f[vi[<cr>
	:onoremap il[ :<c-u>normal! F]vi[<cr>

	" _____ word before ()
	:onoremap fn :<C-U>normal! 0f(hviw<CR>

	" _____ current word
	:onoremap  cw :<c-u>normal! viw<cr>
	
	" end an beginning of line
	:onoremap L $
	:onoremap H ^
"}}}

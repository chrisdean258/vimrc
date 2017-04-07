" UNIVERSAL SETTINGS
"_______________________________________________________________________________________________________
	execute pathogen#infect()
	:set nowrap
	:set nonumber
	:set autoindent
	:set smartindent
	:colorscheme elflord

" UNVIVERSAL MAPPINGS
"_______________________________________________________________________________________________________

	"mapleaders
	:let mapleader = " "
	:let maplocalleader = "/"

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
	
	"delete to beginning or ending of line
	:nnoremap <leader>dL d$
	:nnoremap <leader>dH d^

	" edit and reload vimrc
	:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
	:nnoremap <leader>sv :source $MYVIMRC<cr>

	" clear a line
	:nnoremap <leader>c ddO

	" add an empty line right above or below current line
	:nnoremap <leader>o o<esc>k
	:nnoremap <leader>O O<esc>j

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

	" May be moved to file dependent
	" _________________________________________________
		" mapping for ease of {} use
		:inoremap {} {<cr>}<esc>ko

" UNIVERSAL ABBREVIATIONS
"_______________________________________________________________________________________________________

	" Signatures
	:iabbrev utsign Chris Dean<cr>cdean16@vols.utk.edu
	:iabbrev gsign Chris Dean<cr>chrisdean258@gmail.com

" Autocmd group 
"_______________________________________________________________________________________________________

	" C style formatting
	:augroup c_style
	:  autocmd!
	:  autocmd FileType c,cpp,javascript,java,perl nnoremap <buffer> <localleader>/ I//<esc>
	:  autocmd FileType c,cpp,javascript,java,perl vnoremap <buffer> <localleader>/ <esc>`<i/*<esc>`>a*/<esc> 
	:  autocmd FileType c,cpp,javascript,java,perl :iabbrev <buffer> iff if()<left>
	:  autocmd FileType c,cpp,javascript,java,perl :set cindent
	:augroup END

	" C/cpp specific
	:augroup c_cpp
	:  autocmd!
	:  autocmd FileType c,cpp :iabbrev <buffer> nstd using namespace std;<cr>
	:  autocmd FileType c,cpp :iabbrev <buffer> #i #include
	:  autocmd FileType c,cpp :iabbrev <buffer> enld endl
	:  autocmd FileType c,cpp :iabbrev <buffer> main int main(int argc, char** argv)<CR>{<CR>}<up>

	" Python formatting
	:augroup python_
	:  autocmd!
	:  autocmd FileType python,matlab nnoremap <buffer> <localleader>/ I# <esc>
	:  autocmd FileType python :iabbrev <buffer> iff if:<left>
	:augroup END

	" Vim files
	:augroup vim_
	:  autocmd!
	:  autocmd FileType vim nnoremap <buffer> <localleader>/ I" <esc>
	:augroup END


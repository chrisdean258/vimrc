" UNIVERSAL SETTINGS {{{
"_______________________________________________________________________________________________________
	execute pathogen#infect()
	:syntax on
	:set nocompatible
	:set nowrap
	:set number
	:set relativenumber
	:set autoindent
	:set smartindent
	:colorscheme elflord

	:let g:syntastic_always_populate_loc_list = 1

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
	:nnoremap s i <esc>r
	:nnoremap S a <esc>r

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
	:nnoremap <silent><A-right> :wincmd l<CR>
	:nnoremap <silent><A-left> :wincmd h<CR>
	
 
	" move lines up and down 
	:nnoremap - ddp
	:nnoremap _ ddkP
	
	" indent file
	:nnoremap <leader>g mqgg=G`qzz

	" edit and reload vimrc
	:nnoremap <leader>ev :vsplit $MYVIMRC<CR>
	:nnoremap <leader>sv :source $MYVIMRC<CR>


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
	:nnoremap <c-z> "+dd
	:nnoremap <c-c> "+yy
	:nnoremap <c-v> "+p
	:inoremap <c-z> <esc>"+ddi
	:inoremap <c-c> <esc>"+yyi
	:inoremap <c-v> <esc>"+pi

	" clear higlighting from search
	:nnoremap <silent>noh :nohlsearch<CR>	

	" mapping for jumping to errors
	:nnoremap <A-up> :llast<CR>
	:nnoremap <A-down> :lnext<CR>

" }}}

" UNIVERSAL ABBREVIATIONS {{{
"_______________________________________________________________________________________________________

	" Signatures
	:iabbrev utsign Chris Dean<CR>cdean16@vols.utk.edu
	:iabbrev gsign Chris Dean<CR>chrisdean258@gmail.com
"}}}

" AUTOCMD GROUPS  {{{
"_______________________________________________________________________________________________________


	" C style formatting
	"{{{
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

	" C/cpp specific 
	"{{{
	:augroup c_cpp
	:  autocmd!
	:  autocmd FileType cpp :iabbrev <buffer> nstd using namespace std;<CR>
	:  autocmd FileType c,cpp :iabbrev <buffer> #i #include
	:  autocmd FileType cpp :iabbrev <buffer> enld endl
	:  autocmd FileType c,cpp :iabbrev <buffer> main int main(int argc, char** argv)<CR>{<CR>}<up>
	:  autocmd FileType cpp :nnoremap <buffer>ms ^mq"tyt W"vyt;?class<CR>w"cyW/public<CR>o<esc>"tpA set_<esc>"vpA(<esc>"tpA <esc>"vpA_);<esc>^"wyt;Go<esc>"wp^Wh"cpa::<esc>o{<CR><esc>"vpa = <esc>"vpa_;<CR>}<Esc>gg=G`q:noh<CR>
	:  autocmd FileType cpp :nnoremap <buffer>mg ^mq"tyt w"vyt;?class<cr>w"cyw/public<cr>o<esc>"tpa get_<esc>"vpa();<esc>^"wyt;go<cr><esc>"wp^wh"cpa::<esc>o{<cr>return <esc>"vpa;<cr>}<esc>gg=g`q:noh<cr>
	:  autocmd FileType cpp :nnoremap <silent><buffer> \ms :call MakeSetter_Cpp()<CR>
	:  autocmd FileType cpp :nnoremap <silent><buffer> \mg :call MakeGetter_Cpp()<CR>
	:  autocmd FileType cpp :nnoremap <silent><buffer> \ma :call MakeGetter_Cpp()<CR>:call MakeSetter_Cpp()<CR>
	:augroup END
	"}}}}

	" Python formatting
	"{{{
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

	" Vim files
	"{{{
	:augroup vim_
	:  autocmd!
	:  autocmd FileType vim nnoremap <buffer><localleader>/ :call CommentBL('" ')<CR>
	:  autocmd FileType vim setlocal foldmethod=marker
	:augroup END
	"}}}

"}}}

" Functions {{{ 
"_______________________________________________________________________________________________________

	" accepts as string uses that as a beginning of the line comment
	:function! CommentBL(in) range
	:  normal! mq
	:  execute "silent ".a:firstline.",".a:lastline.'s/^\s*/&'.a:in.'/e'
	:  execute "silent ".a:firstline.",".a:lastline.'s/\v^(\s*)'.a:in.a:in.'/\1/e'
	:  normal! `q
	:  nohlsearch
	:endfunction

	" Creates getter and setter functions 

	:function! MakeSetter_Cpp()
	"{{{
	:  let hold=@"
	:  normal! mq
	:  normal! ^yt 
	:  let type=@"
	:  normal! t llyt;
	:  let var=@"
	:  execute "normal! ?class\<CR>W"
	:  normal! yW
	:  let class=@"
	:  execute "normal! /public\<CR>"
	:  execute "normal! ovoid set_".var."(".type." ".var."_);"
	:  normal! Go
	:  execute "normal! ovoid ".class."::set_".var."(".type." ".var."_)"
	:  execute "normal! o{\<CR>".var." = ".var."_;\<CR>}"
	:  normal gg=G
	:  let @"=hold
	:  normal! `q
	:endfunction
	"}}}
	
	
	:function! MakeGetter_Cpp()
	"{{{
	:  let hold=@"
	:  normal! mq
	:  normal! ^yt 
	:  let type=@"
	:  normal! t llyt;
	:  let var=@"
	:  execute "normal! ?class\<CR>W"
	:  normal! yW
	:  let class=@"
	:  execute "normal! /public\<CR>"
	:  execute "normal! o".type." get_".var."();"
	:  normal! Go
	:  execute "normal! o".type." ".class."::get_".var."()"
	:  execute "normal! o{\<CR>return ".var.";\<CR>}"
	:  normal gg=G
	:  let @"=hold
	:  normal! `q
	:endfunction
	"}}}
	
" }}}

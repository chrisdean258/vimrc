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
	:set showcmd
	:set wildmenu
	:colorscheme elflord

	:let g:syntastic_always_populate_loc_list = 1

	:set hlsearch incsearch

	" Allows for recursive finding
	:set path+=**

	:command! MakeTags !ctags -R

" }}}

" UNVIVERSAL MAPPINGS {{{
"_______________________________________________________________________________________________________

	"mapleaders
	:let mapleader = " "
	:let maplocalleader = "\\"

	" insert a single char 
	:nnoremap s i <esc>r
	:nnoremap S a <esc>r

	" key mappings
	:nnoremap j gj
	:nnoremap k gk

	:inoremap jk <C-R>=CleverEsc()<CR>
	:inoremap <esc> <nop>
	:noremap <Up> <nop>
	:noremap <Down> <nop>
	:noremap <Left> <nop>
	:noremap <Right> <nop>
	:noremap <space> <nop>
 
	" move lines up and down 
	:nnoremap - ddp
	:nnoremap _ ddkP
	
	" indent file
	:nnoremap <leader>g mqgg=G`qzz

	" edit and reload vimrc
	:nnoremap <leader>ev :vsplit $MYVIMRC<CR>
	:nnoremap <leader>sv :source $MYVIMRC<CR>
	:nnoremap <leader>s% :source %<CR>


	" add an empty line right above or below current line
	:nnoremap <leader>o o<esc>
	:nnoremap <leader>O O<esc>
	

	" capitalize and lowercase a word
	:nnoremap <c-u> viwU
	:inoremap <c-u> <esc>viwUi
	:nnoremap <c-l> viwu
	:inoremap <c-l> <esc>viwui

	" mapping for ease of {} use 
	:inoremap {} {<CR>}<esc>O

	" For external clipboard use
	"may not work if you arent on vim-gnome
	:nnoremap <c-z> "+dd
	:nnoremap <c-c> "+yy
	:nnoremap <c-b> "+p
	:inoremap <c-z> <esc>"+ddi
	:inoremap <c-c> <esc>"+yyi
	:inoremap <c-b> <esc>"+pi

	" clear higlighting from search
	:nnoremap <silent>noh :nohlsearch<CR>	
	:nnoremap <silent><c-L> :nohlsearch<CR><c-L>

	" mapping for jumping to errors
	:nnoremap <A-up> :llast<CR>
	:nnoremap <A-down> :lnext<CR>

	" Clever Tabs
	:inoremap <tab> <C-R>=CleverTab()<CR>

	" Wrapping
	:nnoremap <silent><leader>w :set opfunc=Wrap<CR>g@
	:nnoremap <silent><leader>w :call Wrap("visual")

	" Operator Pending
	:onoremap . V

	" Allow the numpad to work without num lock issues
	:inoremap Oo /
	:inoremap Oj *
	:inoremap OF 1
	:inoremap OB 2
	:inoremap [6~ 3
	:inoremap OD 4
	:inoremap OE 5
	:inoremap OC 6
	:inoremap OH 7
	:inoremap OA 8
	:inoremap [5~ 9
	:inoremap [2~ 0
	:inoremap Ok +
	:inoremap Om -
	:inoremap [3~ .
	
" }}}

" UNIVERSAL ABBREVIATIONS {{{
"_______________________________________________________________________________________________________

	" Signatures
	:iabbrev utsign Chris Dean<CR>cdean16@vols.utk.edu
	:iabbrev gsign Chris Dean<CR>chrisdean258@gmail.com

	" Writing/ quitting vim tmux terminal compatibility
	:cabbrev W w 
	:cabbrev Q q
	:cabbrev Wq wq
	:cabbrev WQ wq

"}}}

" AUTOCMD GROUPS  {{{
"_______________________________________________________________________________________________________

	" C style formatting
	"{{{
	:augroup c_style
	:  autocmd!
	:  autocmd FileType c,cpp,javascript,java,perl nnoremap <silent><buffer><localleader>\ :call CommentBL('\/\/')<CR>
	:  autocmd FileType c,cpp,javascript,java,perl vnoremap <buffer><localleader>\ <esc>`<i/*<esc>`>a*/<esc> 
	:  autocmd FileType c,cpp,javascript,java,perl :set cindent
	:  autocmd FileType c,cpp,javascript,java,perl nnoremap ; mqA;<esc>'q
	:  autocmd FileType c,cpp,javascript,java,perl :setlocal foldmethod=syntax
	:  autocmd FileType c,cpp,javascript,java,perl :normal! zR
	:  autocmd FileType c,cpp,javascript,java,perl :iabbrev csign <c-r>=Csign()<CR>
	:  autocmd FileType c,cpp,javascript,java,perl :nnoremap <buffer><silent><localleader>fl :call ForLoop()<CR>zzO
	:  autocmd FileType c,cpp,javascript,java,perl :nnoremap <buffer><silent><localleader>dl :call DoubleForLoop()<CR>zzO
	:  autocmd FileType c,cpp,javascript,java,perl :nnoremap <buffer><silent><localleader>sw :call Swap_Cpp()<CR>zzO
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
	:  autocmd FileType cpp :nnoremap <buffer>mg ^mq"tyt w"vyt;?class<CR>w"cyw/public<CR>o<esc>"tpa get_<esc>"vpa();<esc>^"wyt;go<CR><esc>"wp^wh"cpa::<esc>o{<CR>return <esc>"vpa;<CR>}<esc>gg=g`q:noh<CR>
	:  autocmd FileType cpp :nnoremap <silent><buffer> \ms :call MakeSetter_Cpp()<CR>
	:  autocmd FileType cpp :nnoremap <silent><buffer> \mg :call MakeGetter_Cpp()<CR>
	:  autocmd FileType cpp :nnoremap <silent><buffer> \ma :call MakeGetter_Cpp()<CR>:call MakeSetter_Cpp()<CR>
	:  autocmd FileType cpp :nnoremap <silent><buffer> \mf :call MakeClassFunction_Cpp()<CR>O
	:  autocmd FileType cpp :nnoremap <silent><buffer> \mc :call MakeConstructor_Cpp()<CR>O
	:augroup END
	"}}}

	" Python formatting
	"{{{
	:augroup python_
	:  autocmd!
	:  autocmd FileType python,matlab,shell,sh,bash nnoremap <silent><buffer><localleader>\ :call CommentBL('#')<CR>
	:  autocmd FileType python vnoremap <buffer><localleader>\ <esc>`<i"""<esc>`>a"""<esc> 
	:  autocmd FileType python nnoremap ; mqA:<esc>'q
	:  autocmd FileType python :setlocal foldmethod=indent
	:  autocmd FileType python :normal! zR
	:  autocmd FileType python :set tabstop=4
	:  autocmd FileType python :set softtabstop=4
	:  autocmd FileType python :set expandtab
	:augroup END
	"}}}

	" Vim files
	"{{{
	:augroup vim_
	:  autocmd!
	:  autocmd FileType vim nnoremap <buffer><localleader>\ :call CommentBL('" ')<CR>
	:  autocmd FileType vim setlocal foldmethod=marker
	:augroup END
	"}}}

	" Markdown
	"{{{
	:augroup Markdown
	:autocmd!
	:autocmd Filetype markdown :setlocal spell spelllang=en_us
	:autocmd Filetype markdown :nnoremap <buffer><localleader>sp mq[s1z=`q
	:autocmd Filetype markdown :nnoremap <buffer><localleader>h1 "qyy"qpVr=
	:autocmd Filetype markdown :nnoremap <buffer><localleader>h2 "qyy"qpVr-
	:augroup END
	"}}}

	" Mutt
	"{{{
	:augroup Muttmail 
	:autocmd!
	:autocmd BufRead,BufNewFile MUTTTEMPFILE :setlocal spell
	:autocmd BufRead,BufNewFile MUTTTEMPFILE :nnoremap <buffer><localleader>sp mq[s1z=`q
	:augroup END
	"}}}

"}}}

" Functions {{{ 
"_______________________________________________________________________________________________________

	" accepts as string uses that as a beginning of the line comment
	:function! CommentBL(in) range
	"  {{{
	:  normal! mq
	:  execute "silent ".a:firstline.",".a:lastline.'s/^\s*/&'.a:in.'/e'
	:  execute "silent ".a:firstline.",".a:lastline.'s/\v^(\s*)'.a:in.a:in.'/\1/e'
	:  normal! `q
	:  nohlsearch
	:endfunction
	" }}}

	:function! MakeGetter_Cpp()
	" {{{
	:  normal! mq
	:  let list = split(getline('.'))
	:  let type = list[0]
	:  let varlist = split(list[1],';')
	:  let var = varlist[0]
	:  execute "normal! ?\\v(class|struct)\<CR>"
	:  let list = split(getline('.'))
	:  let clst = list[0]
	:  let class = list[1]
	:  if clst ==# 'class'
	:    execute "normal!/public\<CR>"
	:  else 
	:    execute "normal!/{\<CR>"
	:  endif
	:  normal! o
	:  execute "normal! i".type." get_".var."();"
	:  execute "normal! =="
	:  execute "normal!/};\<CR>o"
	:  execute "normal! o".type." ".class."::get_".var."()"
	:  execute "normal! o{" 
	:  execute "normal! oreturn ".var.";"
	:  execute "normal! o}" 
	:  normal! `q
	:endfunction
	" }}}
	
	:function! MakeSetter_Cpp()
	" {{{
	:  normal! mq
	:  let list = split(getline('.'))
	:  let type = list[0]
	:  let varList = split(list[1],';')
	:  let var = varList[0]
	:  execute "normal! ?\\v(class|struct)\<CR>"
	:  let list = split(getline('.'))
	:  let clst = list[0]
	:  let class = list[1]
	:  if clst ==# 'class'
	:    execute "normal!/public\<CR>"
	:  else 
	:    execute "normal!/{\<CR>"
	:  endif
	:  normal! o
	:  execute "normal! ivoid set_".var."(".type.");"
	:  execute "normal! =="
	:  execute "normal!/};\<CR>o"
	:  execute "normal! ovoid ".class."::set_".var."(".type." ".var."_)"
	:  execute "normal! o{" 
	:  execute "normal! o".var." = ".var."_;"
	:  execute "normal! o}" 
	:  normal! `q
	:endfunction
	" }}}
	
	:function! MakeClassFunction_Cpp()
	"  {{{
	:  let line = substitute(getline('.'), ";", "", "")
	:  execute "normal! ?\\v(class|struct)\<CR>"
	:  let class = substitute(split(getline('.'))[1], "{", "" , "")
	:  let linesplit = split(line)
	:  let linesplit[1] = class."::".linesplit[1]
	:  let line = join(linesplit)
	:  execute "normal! /};\<CR>"
	:  normal! o
	:  execute "normal! o".line
	:  execute "normal! o{"
	:  execute "normal! o}"
	:endfunction
	" }}}
	
	:function! MakeConstructor_Cpp()
	" {{{
	:  execute "normal! ?\\v(class|struct)\<CR>" 
	:  let list = split(getline('.'))
	:  let clst = list[0]
	:  let class = list[1]
	:  if clst ==# 'class'
	:    execute "normal!/public\<CR>"
	:  else 
	:    execute "normal!/{\<CR>"
	:  endif
	:  execute "normal! o".class."();"
	:  execute "normal!/};\<CR>o"
	:  execute "normal! o".class."::".class."()"
	:  execute "normal! o{"
	:  execute "normal! o}"
	:endfunction
	" }}}

	:function! CleverTab()
	" {{{
	:   let str =  strpart( getline('.'), 0, col('.')-1 ) 
	:   if str =~ '^\s*$' || str =~ '\s$' 
	:      return "\<Tab>"
	:   else
	:      return "\<C-P>"
	:   endif
	:endfunction
	" }}} 

	:function! CleverEsc()
	" {{{
	:  if col('.') == 1
	:    return "\<esc>"
	:  else
	:    return "\<esc>l"
	:  endif
	:endfunction
	" }}}

	:function! Csign()
	" {{{
	:  let rtn = "/**\r\<bs>* Chris Dean\r* ".strftime("%m/%d/%y")."\r* ".@%." \r* \r*/"
	:  return rtn 
	:endfunction
	" }}}

	:function! Wrap(type)
	" {{{
	:  let sel_save = &selection
	:  let &selection = "inclusive"
	:  let input  = nr2char(getchar())
	:  let forward = {"<" : ">", "[" : "]", "{" : "}", "(" : ")",} 
	:  let backward = {">" : "<", "]" : "[", "}" : "{", ")" : "(",}
	:  if has_key(forward, input)
	:    let begin = input
	:    let ending = forward[input]
	:  elseif has_key(backward, input)
	:    let ending = input
	:    let begin = backward[input]
	:   else
	:    let ending = input
	:    let begin = input
	:  endif
	:  if a:type ==# "line"
	:    echom "help"
	:    let deref = "\'"
	:    let jump = "$"
	:  else
	:    let deref = "`"
	:    let jump = ""
	:  endif
	:  if a:type !=# "visual"
	:    silent exe "normal! ".deref."[v".deref."]".jump."d"
	:    let @@ = begin.@@.ending
	:    if col('.') == strlen(getline('.'))
	:      normal! p
	:    else
	:      normal! P
	:    endif
	:    let &selection = sel_save
	:  else
	:    execute "normal! `<i".begin."\<esc>`>a".ending
	:  endif
	:endfunction
	" }}}

	:function! ForLoop()
	" {{{
	:  let line = getline('.')
	:  let line = substitute(line, '^\s*\(.*\)\s*', '\1', '')
	:  execute 'normal! ccfor(i = 0; i < '.line.".size(); i++)\<CR>{\<CR>}"
	:  normal! mqgg=G`q
	:endfunction
	" }}}

	:function! DoubleForLoop()
	" {{{
	:  let line = getline('.')
	:  let line = substitute(line, '^\s*\(.*\)\s*', '\1', '')
	:  execute 'normal! ccfor(i = 0; i < '.line.".size(); i++)\<CR>{\<CR>}\<esc>O"
	:  execute 'normal! ifor(j = 0; j < '.line."[i].size(); j++)\<CR>{\<CR>}"
	:  normal! mqgg=G`q
	:endfunction
	" }}}

	:function! Swap_Cpp()
	" {{{
	:  let line = split(getline('.'))
	:  normal! "_dd
	:  execute "normal! Otemp = ".line[0].";"
	:  execute "normal! ==o".line[0]." = ".line[1].";"
	:  execute "normal! ==o".line[1]." = temp;"
	:  normal! ==
	:endfunction
	" }}}

" }}}

" TMUX Terminal Split {{{
"_______________________________________________________________________________________________________

	:cabbrev t T
	:command! T call Terminal()

	:function TerminalHelper()
	" {{{
	:  cunabbrev Q
	:  cunabbrev Wq
	:  cunabbrev WQ
	:  cabbrev q <c-r>=CleverQuit("")<CR>
	:  cabbrev Q <c-r>=CleverQuit("")<CR>
	:  cabbrev wq <c-r>=CleverQuit("w")<CR>
	:  cabbrev Wq <c-r>=CleverQuit("w")<CR>
	:  cabbrev WQ <c-r>=CleverQuit("w")<CR>
	:endfunction
	" }}}

	:function! CleverQuit(write)
	" {{{
	:  if a:write ==# 'w'
	:    return 'w | silent execute ''!tmux kill-session -t "vim" '' | q' 
	:  else
	:    return 'silent execute ''!tmux kill-session -t "vim" '' | q' 
	:  endif
	:endfunction
	" }}}

	:function! Terminal()
	" {{{
	:  call TerminalHelper()
	:  mksession session.vim 
	:  set noswapfile
	:  silent execute '!tmux new-session -s "vim" "vim -S session.vim -c \"let TMUX=1\"" \; split-window -v -p 20 \;'
	:  silent execute '!rm session.vim'
	:  q!
	:endfunction
	" }}}

" }}}

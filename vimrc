" NORMAL CONFIGURATION SETTINGS {{{
"_______________________________________________________________________________________________________
	:syntax on
	:set nowrap
	:set number
	:set relativenumber
	:colorscheme elflord
	:highlight LongLine guifg=Red ctermfg=Red

	" :highlight Folded ctermbg=black guisp=black ctermbg=black
 	:highlight Folded None
	:highlight Folded ctermfg=Black guifg=Black

	" Set line buffer at top and bottom of screen
	:set scrolloff=5
	:set sidescroll=1
	:set sidescrolloff=5

	" If you want 4 width tabs changes tabstop ad shiftwidth to 4
	:set tabstop=8
	:set softtabstop=0
	:set shiftwidth=8
" }}}

" UNIVERSAL SETTINGS {{{
"_______________________________________________________________________________________________________

	:try
	:  execute pathogen#infect()
	:catch
	:  silent !mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim &> /dev/null
	:  silent !cd ~/.vim/bundle && git clone --depth=1 https://github.com/vim-syntastic/syntastic.git &> /dev/null
	:  execute pathogen#infect()
	:endtry

	:set nocompatible
	:set autoindent
	:set smartindent
	:set showcmd
	:set wildmenu
	:set hlsearch incsearch
	:filetype plugin on

	" Allows for recursive finding
	:set path+=**

	:set omnifunc=syntaxcomplete#Complete


	" Comment out this group for auto commenting
	:augroup commenting
	:autocmd!
	:autocmd FileType,BufNewFile,BufRead * :setlocal formatoptions-=cro
	:augroup END
	:setlocal foldtext=MyFold()

	:let g:syntastic_check_on_wq = 0

" }}}

" UNVIVERSAL MAPPINGS {{{
"_______________________________________________________________________________________________________

	"mapleader
	:let mapleader = " "
	:let maplocalleader = "\\"

	" insert a single char
	:nnoremap s i <esc>r
	:nnoremap S a <esc>r

	" key mapping
	:nnoremap j gj
	:nnoremap k gk

	:inoremap jk <C-R>=CleverEsc()<CR>
	:inoremap Jk <C-R>=CleverEsc()<CR>
	:inoremap JK <C-R>=CleverEsc()<CR>
	:noremap <space> <nop>

	" move lines up and down
	:nnoremap - ddp
	:nnoremap _ ddkP

	" indent file
	:nnoremap <leader>g :call Indent()<CR>

	" edit and reload vimrc
	:nnoremap <leader>ev :vsplit $MYVIMRC<CR>
	:nnoremap <leader>sv :source $MYVIMRC<CR>
	:nnoremap <leader>s% :source %<CR>


	" add an empty line right above or below current line
	:nnoremap <leader>o o<esc>
	:nnoremap <leader>O O<esc>


	" capitalize and lowercase a word
	:nnoremap <c-u> viw~
	:inoremap <c-u> <esc>viw~i

	" For external clipboard use
	"may not work if you arent on vim-gnome
	:nnoremap <leader>p "+p
	:nnoremap <leader>P "+P
	:nnoremap <leader>d "+dd
	:nnoremap <leader>y "+yy

	" clear higlighting from search
	:nnoremap <silent><c-L> :nohlsearch<CR><c-L>

	" mapping for jumping to error
	:nnoremap <A-up> :lnext<CR>
	:nnoremap <A-down> :lprev<CR>

	" Clever Tab
	:inoremap <tab> <C-R>=CleverTab()<CR>
	:inoremap <S-tab> <c-x><c-f>

	" Wrapping
	:nnoremap <silent><leader>w :set opfunc=Wrap<CR>g@
	:vnoremap <silent><leader>w :call Wrap("visual")

	" Resizing split
	:nnoremap <S-right> :vertical resize +5 <CR>
	:nnoremap <S-left> :vertical resize -5 <CR>
	:nnoremap <S-up> :resize +5 <CR>
	:nnoremap <S-down> :resize -5 <CR>

	" Window Compatibility
	" :inoremap <BS> <Left><Del>

	" Operator Pending
	" selects the line
	:onoremap . V

" }}}

" UNIVERSAL ABBREVIATIONS {{{
"_______________________________________________________________________________________________________

	" Signature
	:iabbrev utsign Chris Dean<CR>cdean16@vols.utk.edu
	:iabbrev gsign Chris Dean<CR>chrisdean258@gmail.com

	:cabbrev help vert help
	:cabbrev sp vs
	:cabbrev help vert help

	" Writing/ quitting vim tmux terminal compatibility
	:cabbrev W w
	:cabbrev Q q
	:cabbrev Wq wq
	:cabbrev WQ wq
	:cabbrev jk SyntasticReset

	:command! MakeTags !ctags -R

" }}}

" AUTOCMD GROUPS  {{{
"_______________________________________________________________________________________________________

	" C style formatting
	" {{{
	:augroup c_style
	:  autocmd!
	:  autocmd FileType c,cpp,javascript,java,perl   nnoremap <silent><buffer><localleader>\ :call CommentBL('\/\/')<CR>
	:  autocmd FileType c,cpp,javascript,java,perl   vnoremap <buffer><localleader>\ <esc>`<i/*<esc>`>a*/<esc>
	:  autocmd FileType c,cpp,javascript,java,perl   :set cindent
	:  autocmd FileType c,cpp,javascript,java,perl   nnoremap ; mqA<C-R>=AppendSemicolon()<CR><esc>`q
	:  autocmd FileType c,cpp,javascript,java,perl   :setlocal foldmethod=syntax
	:  autocmd FileType c,cpp,javascript,java,perl   :normal! zR
	:  autocmd FileType c,cpp,javascript,java,perl   :iabbrev csign <c-r>=Csign()<CR>
	:  autocmd FileType c,cpp,javascript,java,perl   :inoremap {} {<CR>}<esc>O
	:  autocmd FileType c,cpp,javascript,java,perl   :set nofoldenable
	:  autocmd FileType c,cpp,javascript,java,perl   :call CFold()
	:  autocmd FileType c,cpp,javascript,java,perl   :call RemoveTrailingWhitespace_AU()
	:  autocmd FileType c,cpp,javascript,java,perl   :nnoremap <silent><buffer><localleader>s :silent call SplitIf()<CR>
	:augroup END
	" }}}

	" C/cpp specific
	" {{{
	:augroup c_cpp
	:  autocmd!
	:  autocmd FileType cpp    :iabbrev <buffer> nstd using namespace std;<CR>
	:  autocmd FileType c,cpp  :iabbrev <buffer> #i #include
	:  autocmd FileType c,cpp  :iabbrev <buffer> cahr char
	:  autocmd FileType cpp    :iabbrev <buffer> enld endl
	:  autocmd FileType c,cpp  :iabbrev <buffer> main <C-R>=MainAbbrev()<CR>
	:  autocmd FileType cpp  :nnoremap <silent><buffer> \ms :call MakeSetter_Cpp()<CR>
	:  autocmd FileType cpp  :nnoremap <silent><buffer> \mg :call MakeGetter_Cpp()<CR>
	:  autocmd FileType cpp  :nnoremap <silent><buffer> \ma :call MakeGetter_Cpp()<CR>:call MakeSetter_Cpp()<CR>
	:  autocmd FileType cpp  :nnoremap <silent><buffer> \mf :call MakeClassFunction_Cpp()<CR>O
	:  autocmd FileType cpp  :nnoremap <silent><buffer> \mc :call MakeConstructor_Cpp()<CR>O
	:  autocmd FileType c    :autocmd CursorMoved,CursorMovedI * call HighlightAfterColumn(80)
	:  autocmd FileType cpp  :autocmd CursorMoved,CursorMovedI * call HighlightAfterColumn(80)
	:augroup END
	" }}}

	" JS, HTML
	" {{{
	:  autocmd FileType javascript,js,html :set tabstop=2
	:  autocmd FileType javascript,js,html :set softtabstop=0
	:  autocmd FileType javascript,js,html :set shiftwidth=2
	" }}}

	" Python formatting
	" {{{
	:augroup python_
	:  autocmd!
	:  autocmd FileType python,matlab,shell,sh,bash  nnoremap <silent><buffer><localleader>\ :call CommentBL('#')<CR>
	:  autocmd FileType python  vnoremap <buffer><localleader>\ <esc>`<i"""<esc>`>a"""<esc>
	:  autocmd FileType python  nnoremap ; mqA:<esc>'q
	:  autocmd FileType python  :setlocal foldmethod=indent
	:  autocmd FileType python  :normal! zR
	:  autocmd FileType python  :set tabstop=4
	:  autocmd FileType python  :set softtabstop=0
	:  autocmd FileType python  :set shiftwidth=4
	:  autocmd FileType python  :set expandtab
	:  autocmd FileType python   :call RemoveTrailingWhitespace_AU()
	:augroup END
	" }}}

	" Vim file
	" {{{
	:augroup vim_
	:  autocmd!
	:  autocmd FileType vim :nnoremap <silent><buffer><localleader>\ :call CommentBL('" ')<CR>
	:  autocmd FileType vim :setlocal foldmethod=marker
	:  autocmd FileType vim   :call RemoveTrailingWhitespace_AU()
	:augroup END
	" }}}

	" Markdown
	" {{{
	:augroup Markdown
	:autocmd!
	" :autocmd Filetype markdown  :setlocal spell spelllang=en_u
	" :autocmd Filetype markdown  :nnoremap <buffer><localleader>sp mq[s1z=`q
	" :autocmd Filetype markdown  :nnoremap <buffer><localleader>h1 "qyy"qpVr=
	" :autocmd Filetype markdown  :nnoremap <buffer><localleader>h2 "qyy"qpVr-
	:augroup END
	" }}}

	" Mutt
	" {{{
	:augroup Muttmail
	:autocmd!
	:autocmd BufRead,BufNewFile MUTTTEMPFILE :setlocal spell
	:autocmd BufRead,BufNewFile MUTTTEMPFILE :nnoremap <buffer><localleader>sp mq[s1z=`q
	:augroup END
	" }}}

	" txt files
	" {{{
	:augroup Text
	:autocmd!
	:autocmd BufRead,BufNewFile *.txt :setlocal wrap
	:augroup END
	" }}}


" }}}

" FUNCTIONS {{{
"_______________________________________________________________________________________________________

	" C++ Code Generation
	" {{{
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

		:function! MakeClassFunction_old_Cpp()
		"  {{{
		:  let line = substitute(getline('.'), ";", "", "")
		:  execute "normal! ?\\v(class|struct)\<CR>"
		:  let class = substitute(split(getline('.'))[1], " {", "" , "")
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

		:function! MakeClassFunction_Cpp()
		"  {{{
		:  let funcline = substitute(getline('.'), ";", "", "")
		:  execute "normal! ?\\v(class|struct)\<CR>"
		:  let classname = substitute(split(getline('.'))[1], " {", "" , "")
		:  let splitLine = split(funcline, '(')
		:  let splitSignature = split(splitLine[0], " ")
		:  let splitSignature[-1] = classname . "::" . splitSignature[-1]
		:  let splitLine[0] = join(splitSignature, ' ')
		:  let line = substitute(join(splitLine, '('), "\t*","","")
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

	" }}}

	" C Style Function
	" {{{
		:function! Csign()
		" {{{
		:  if &l:formatoptions =~ "cro"
		:    let rtn = "/**\rChris Dean\r".strftime("%m/%d/%y")."\r".split(expand('%:p'), '/')[-2]."\r".@%." \r\r\<bs>*/"
		:  else
		:    let rtn = "/**\r\<bs>* Chris Dean\r* ".strftime("%m/%d/%y")."\r* ".split(expand('%:p'), '/')[-2]."\r* ".@%." \r* \r*/"
		:  endif
		:  return rtn
		:endfunction
		" }}}

		:function! CFold()
		" {{{
		:  setlocal foldtext=CFoldText()
		:  setlocal fillchars=fold:\ "
		:  highlight Folded guifg=DarkGreen ctermfg=DarkGreen
		:endfunction
		" }}}

		:function! CFoldText()
		" {{{
		:  let tablen = &l:shiftwidth
		:  let lines = v:foldend - v:foldstart - 1
		:  let line = getline(v:foldstart)
		:  let endline = getline(v:foldend)
		:  return substitute(line[0:index(line,'{')], "\t", repeat(" ", tablen), "g").' '. lines .' lines '. endline
		:endfunction
		" }}}

		:function! HighlightAfterColumn(col)
		" {{{
		:  exe 'match LongLine /\%'.line('.').'l\%>'.(a:col).'v./'
		:endfunction
		" }}}

		:function! AppendSemicolon()
		" {{{
		:  if getline('.') =~ ';\s*$'
		:    return "\<bs>"
		:  endif
		:  return ';'
		:endfunction
		" }}}

		:function! MainAbbrev()
		" {{{
		:  if getline('.') =~ '^$'
		:    echom "abbrev"
		:    return "int main(int argc, char ** argv)\<CR>{\<CR>}\<up>"
		:  else
		:    echom "no abbrev"
		:    return 'main'
		:  endif
		:endfunction
		" }}}

		:function! SplitIf()
		" {{{
		:  normal! mq
		:  normal! H
		:  normal! mm
		:  normal! `q
		:  execute "normal! 0f(%l"
		:  if !(getline('.') =~ ".*(.*)\s*.*;$")
		:    return
		:    echom "No split found"
		:    normal! `m
		:    normal! zt
		:    normal! `q
		:    return
		:  else
		:    execute "normal! i\<CR>{\<CR>\<esc>$a\<CR>}"
		:  endif
		:  normal! `m
		:  normal! zt
		:  normal! `q
		:  normal! 2j^
		:endfunction
		" }}}

	" }}}

	" Universally used function
	" {{{
		:function! CommentBL(in) range
		"  {{{
		:  normal! mq
		:  normal! H
		:  normal! mm
		:  normal! `q
		:  execute "silent ".a:firstline.",".a:lastline.'s/\s*$//e'
		:  execute "silent ".a:firstline.",".a:lastline.'s/\v^(\s*)(.)/\1'.a:in.'\2/e'
		:  execute "silent ".a:firstline.",".a:lastline.'s/\v^(\s*)'.a:in.a:in.'/\1/e'
		:  normal! `m
		:  normal! zt
		:  normal! `q
		:  nohlsearch
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

		:function! Wrap(type)
		" {{{
		:  let sel_save = &selection
		:  let &selection = "inclusive"
		:  let input  = nr2char(getchar())
		:  let forward = {"<" : ">", "[" : "]", " {" : " }", "(" : ")",}
		:  let backward = {">" : "<", "]" : "[", " }" : " {", ")" : "(",}
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

		:function! RemoveTrailingWhitespace_AU()
		" {{{
		:  autocmd BufRead,BufWrite * :silent call RemoveTrailingWhitespace()
		:endfunction
		" }}}

		:function! RemoveTrailingWhitespace()
		" {{{
		:  let line = line('.')
		:  let ll = line-1
		:  let end = line('$')
		:  normal! mq
		:  normal! H
		:  normal! mm
		:  if line != 1
		:    execute "1,".ll.'s/\s*$//g'
		:    echom "1,".ll.'s/\s*$//g'
		:  endif
		:  if line != end
		:    execute line+1.',$s/\s*$//g'
		:    echom line+1.',$s/\s*$//g'
		:  endif
		:  nohlsearch
		:  normal! `m
		:  normal! zt
		:  normal! `q
		:endfunction
		" }}}

		:function! MyFold()
		" {{{
		:  let tablen = &l:shiftwidth
		:  let line = getline(v:foldstart)
		:  let lines_count = v:foldend - v:foldstart + 1
		:  let i = 0
		:  while line[i] == "\t"
		:    let i += 1
		:  endwhile
		:  setlocal fillchars=fold:\ "
		:  let foldline = substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g')
		:  if strlen(foldline) == 0
		:    let foldline = ' '
		:  else
		:    let foldline = ' ' . foldline . ' '
		:  endif
		:  return repeat(" ", tablen*i). '+--- ' . lines_count . ' lines:' . foldline . '---+'
		:endfunction
		" }}}

		:function! Indent()
		" {{{
		:  normal! mq
		:  normal! H
		:  normal! mm
		:  normal! gg=G
		:  normal! `m
		:  normal! zt
		:  normal! `q
		:endfunction
		" }}}

	" }}}
" }}}

" TMUX Terminal Split {{{
"_______________________________________________________________________________________________________

	:cabbrev t T
	:command! T call Terminal()

	:function! Terminal()
	" {{{
	:  let aucmd = ' ''autocmd VimLeave :!tmux kill-session -t vim '' '
	:  let tmuxSession = 'tmux new-session -s "vim" "vim -S session.vim -c '.aucmd .'"'
	:  echo tmuxSession
	:  call getchar()
	:  let split = '\; split-window -v -p 40 \;'
	:  mksession session.vim
	:  set noswapfile
	:  silent execute '!' . tmuxSession . split
	:  silent execute '!rm session.vim'
	" :  q!
	:endfunction
	" }}}

" }}}


" If you cannot see anything but this message uncomment the next line
" :highlight Folded ctermfg=DarkGrey guifg=DarkGrey



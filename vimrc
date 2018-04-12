" NORMAL CONFIGURATION SETTINGS {{{
"_______________________________________________________________________________________________________

	:syntax on
	:set nowrap
	:set number
	:set relativenumber
	:colorscheme elflord

	" Set line buffer at top and bottom of screen
	:set scrolloff=5
	:set sidescroll=1
	:set sidescrolloff=5

	" If you want 4 width tabs changes tabstop ad shiftwidth to 4
	:set tabstop=8
	:set softtabstop=-1
	:set shiftwidth=0
" }}}

" UNIVERSAL SETTINGS {{{
"_______________________________________________________________________________________________________

	:set nocompatible
	:set autoindent
	:set smartindent
	:set showcmd
	:set wildmenu
	:set incsearch
	:set backspace=eol,indent,start
	:filetype plugin indent on
	:filetype plugin on

	" Allows for recursive finding
	:set path+=**

	:set omnifunc=syntaxcomplete#Complete
	:set laststatus=1

	" Comment out this group for auto commenting
	:setlocal formatoptions-=cro
	:setlocal nofoldenable
	:setlocal foldtext=MyFold()

" }}}

" HIGHLIGHT SETTINGS {{{
"_______________________________________________________________________________________________________

	" Setting for using Highlight after function
	:highlight LongLine guifg=Red ctermfg=Red
 	:highlight Folded None
	:highlight Folded ctermfg=Black guifg=Black

	" Settings for tabline
	:highlight tablinefill None
	:highlight tablinesel None
	:highlight tabline None
	:highlight tablinesel ctermfg=DarkGrey guifg=DarkGrey
	:highlight tabline ctermfg=black guifg=black

	" Unhighlight the next two lines if you cant see your tabline
	" :highlight tabline ctermfg=DarkGrey guifg=DarkGrey
	" :highlight tablinesel ctermfg=Grey guifg=Grey

" }}}

" PLUGIN SETTINGS {{{
"_______________________________________________________________________________________________________

	:function! SourceOrInstallSyntastic()
	:  try
	:    execute pathogen#infect()
	:  catch
	:    if executable("git") != 1 || executable("curl") != 1
	:      echom "You need git and curl installed for the Syntastic auto install"
	:      return
	:    endif
	:    silent !mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim &> /dev/null
	:    silent !cd ~/.vim/bundle && git clone --depth=1 https://github.com/vim-syntastic/syntastic.git &> /dev/null
	:    execute pathogen#infect()
	:  endtry
	:endfunction

	:call SourceOrInstallSyntastic()

	:let g:syntastic_check_on_wq = 0
        :let g:syntastic_cpp_compiler = "g++"
        :let g:syntastic_cpp_compiler_options = "-std=c++1z"
" }}}

" UNVIVERSAL MAPPINGS {{{
"_______________________________________________________________________________________________________

	"mapleader
	:let mapleader = " "
	:let maplocalleader = '\'

	" insert a single char
	:nnoremap s i <esc>r
	:nnoremap S a <esc>r

	" key mapping
	:nnoremap j gj
	:nnoremap k gk

	:inoremap <expr> jk CleverEsc()
	:imap Jk jk
	:imap JK jk
	:noremap <space> <nop>

	" move lines up and down
	:nnoremap - ddp
	:nnoremap _ ddkP

	" indent file
	:nnoremap <silent><leader>g :call Indent()<CR>

	" edit and reload vimrc
	:nnoremap <silent><leader>ev :vsplit $MYVIMRC<CR>
	:nnoremap <silent><leader>sv :silent source $MYVIMRC<CR>
	:nnoremap <silent><leader>s% :source %<CR>


	" add an empty line right above or below current line
	:nnoremap <leader>o o<esc>
	:nnoremap <leader>O O<esc>


	" clear higlighting from search
	:nnoremap <silent><c-L> :nohlsearch<CR><c-L>

	" mapping for jumping to error
	:nnoremap <silent><A-up>   :lnext<CR>
	:nnoremap <silent><A-down> :lprev<CR>

	" Clever Tab
	:inoremap <S-tab> <c-x><c-f>

	" Wrapping
	:nnoremap <silent><leader>w :set opfunc=Wrap<CR>g@
	:vnoremap <silent><leader>w :call Wrap("visual")<CR>

	" Resizing split
	:nnoremap <silent><S-right> :vertical resize +5 <CR>
	:nnoremap <silent><S-left>  :vertical resize -5 <CR>
	:nnoremap <silent><S-up>    :resize +5 <CR>
	:nnoremap <silent><S-down>  :resize -5 <CR>

	" Jumping splits and tabs
	:nnoremap <leader>h <c-w>h
	:nnoremap <leader>j <c-w>j
	:nnoremap <leader>k <c-w>k
	:nnoremap <leader>l <c-w>l
	:nnoremap <silent><tab>         :tabnext<CR>
	:nnoremap <silent><S-tab>       :tabprev<CR>
	:nnoremap <silent><leader><tab> :tabnew<CR>

	" Window Compatibility
	" :inoremap <BS> <Left><Del>

	" Getting rid of pesky popup window
	:nnoremap q: :

" }}}

" UNIVERSAL ABBREVIATIONS AND COMMANDS {{{
"_______________________________________________________________________________________________________

	:cabbrev help vert help
	:cabbrev sp vs
	:cabbrev help vert help

	" Quitting cause Im bad at typing
	:cabbrev W w
	:cabbrev Q q
	:cabbrev Wq wq
	:cabbrev WQ wq
	:cabbrev jk SyntasticReset
	:cabbrev unicode Unicode

	:command! MakeTags !ctags -R
	:command! Unicode set encoding=utf-8
	:command! S %s
	:command! A 'a,.s

" }}}

" AUTOCMD GROUPS  {{{
"_______________________________________________________________________________________________________

	" Option Autocmds
	" {{{
	:augroup Options
	:autocmd!
	:autocmd OptionSet relativenumber :let &number=&relativenumber
	:autocmd OptionSet wrap           :let &linebreak=&wrap
	:autocmd OptionSet paste          :let &relativenumber=!&paste
	:autocmd OptionSet spell          :setlocal spelllang=en
	:augroup END
	" }}}

	" C style formatting
	" {{{
	:augroup c_style
	:  autocmd!
	:  autocmd FileType c,cpp,javascript,java,perl,cs :nnoremap <silent><buffer><localleader>\ :call CommentBL('\/\/', '')<CR>
	:  autocmd FileType c,cpp,javascript,java,perl,cs :nnoremap <silent><buffer><localleader>s :silent call SplitIf()<CR>
	:  autocmd FileType c,cpp,javascript,java,perl,cs :nnoremap <silent><buffer>; :call AppendSemicolon()<CR>
	:  autocmd FileType c,cpp,javascript,java,perl,cs :inoremap <buffer>{} {<CR>}<esc>O
	:  autocmd FileType c,cpp,javascript,java,perl,cs :inoremap <expr><buffer><tab> CleverTab()
	:  autocmd FileType c,cpp,javascript,java,perl,cs :setlocal cindent
	:  autocmd FileType c,cpp,javascript,java,perl,cs :iabbrev <buffer>csign <c-r>=Csign()<CR>
	:  autocmd FileType c,cpp,javascript,java,perl,cs :call RemoveTrailingWhitespace_AU()
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
	:  autocmd FileType c      :autocmd CursorMoved,CursorMovedI <buffer> call HighlightAfterColumn(80)
	:  autocmd FileType cpp    :autocmd CursorMoved,CursorMovedI <buffer> call HighlightAfterColumn(80)
	:augroup END
	" }}}

	" Web
	" {{{
	:augroup web
	:  autocmd!
	:  autocmd FileType html,php :setlocal tabstop=2
	:  autocmd FileType html,php :setlocal expandtab
	:  autocmd FileType html,php :setlocal wrap
	:  autocmd FileType html,php :setlocal linebreak
	:  autocmd FileType html,php :setlocal breakindent
	:  autocmd FileType html,php :nnoremap <silent><buffer><localleader>\ :call CommentBL('\<!--', '-->')<CR>
	:  autocmd FileType html,php :inoremap <silent><buffer>> ><esc>:call EndTagHTML()<CR>a
	:  autocmd FileType html,php :inoremap <expr><buffer><CR> HTMLCarriageReturn()
	:  autocmd FileType html,php :inoremap <expr><buffer><tab> CleverTab()
	:augroup END
	" }}}

	" Python formatting
	" {{{
	:augroup python_
	:autocmd!
	:autocmd FileType python,matlab,shell,sh,bash  :nnoremap <silent><buffer><localleader>\ :call CommentBL('#', '')<CR>
	:autocmd FileType python,matlab,shell,sh,bash  :inoremap <expr><buffer><tab> CleverTab()
	:autocmd FileType python  :setlocal tabstop=4
	:autocmd FileType python  :setlocal expandtab
	:autocmd FileType python  :call RemoveTrailingWhitespace_AU()
	:augroup END
	" }}}

	" Vim file
	" {{{
	:augroup vim_
	:autocmd!
	:autocmd FileType vim :nnoremap <silent><buffer><localleader>\ :call CommentBL('" ', "")<CR>
	:autocmd FileType vim :setlocal foldmethod=marker
	:autocmd FileType vim :setlocal foldenable
	:autocmd FileType vim :inoremap <expr><buffer><tab> CleverTab()
	:augroup END
	" }}}

	" Markdown
	" {{{
	:augroup Markdown
	:autocmd!
	:autocmd Filetype markdown :inoremap <expr><buffer><tab> MDTab(CleverTab())
	:autocmd Filetype markdown :inoremap <expr><silent><buffer><CR> MDNewline("\r")
	:autocmd Filetype markdown :inoremap <silent><buffer><localleader>s <esc>:call SpellReplace()<CR>a
	:autocmd Filetype markdown :nnoremap <expr><silent><buffer>o MDNewline("o")
	:autocmd Filetype markdown :nnoremap <silent><buffer><localleader>s :call SpellReplace()<CR>
	:autocmd Filetype markdown :setlocal wrap
	:autocmd Filetype markdown :setlocal breakindent
	:autocmd Filetype markdown :cabbrev markdown call NotesMDFormat()
	:augroup END
	" }}}

	" txt files
	" {{{
	:augroup Text
	:autocmd!
	:autocmd FileType text :setlocal wrap
	:autocmd FileType text :setlocal encoding=utf-8
	:autocmd FileType text :nnoremap <silent><buffer><localleader>s :call SpellReplace()<CR>
	:autocmd FileType text :inoremap <silent><buffer><localleader>s <esc>:call SpellReplace()<CR>a
	:autocmd FileType text :inoremap <expr><buffer><tab> CleverTab()
	:autocmd FileType text :setlocal spell
	:autocmd FileType text :setlocal wrap
	:autocmd FileType text :setlocal linebreak
	:autocmd FileType text :setlocal breakindent
	:autocmd FileType text :setlocal syntax=
	:augroup END
	" }}}

	" Assembly
	" {{{
	:augroup Assembly
	:autocmd!
	:autocmd BufRead,BufNewFile *.S :nnoremap <silent><buffer><localleader>\ :call CommentBL('\/\/', '')<CR>
	:augroup END
	" }}}
" }}}

" FUNCTIONS {{{
"_______________________________________________________________________________________________________

	" Helpers
	" {{{
		:function! Indentation()
		" {{{
		:  return &expandtab ? repeat(" ", &tabstop) : "\t"
		:endfunction
		" }}}

		:function! LeftStrip(str)
		" {{{
		:  return substitute(a:str, '^\s*\(.\{-}\s*\)$', '\1', '')
		:endfunction
		" }}}

		:function! RightStrip(str)
		" {{{
		:  return substitute(a:str, '^\(\s*.\{-}\)\s*$', '\1', '')
		:endfunction
		" }}}

		:function! Strip(str)
		" {{{
		:  return substitute(a:str, '^\s*\(.\{-}\)\s*$', '\1', '')
		:endfunction
		" }}}

		:function! Text(line)
		" {{{
		:  return Strip(getline(a:line))
		:endfunction
		" }}}

		:function! LineFromCursor()
		" {{{
		:  return getline('.')[col('.')-1:]
		:endfunction
		" }}}

		:function! LineUntilCursor()
		" {{{
		:  return getline('.')[:col('.')-1]
		:endfunction
		" }}}

		:function! LineAfterCursor()
		" {{{
		:  return LineFromCursor()[1:]
		:endfunction
		" }}}

		:function! LineBeforeCursor()
		" {{{
		:  return LineUntilCursor()[:-2]
		:endfunction
		" }}}

		:function! TextFromCursor()
		" {{{
		:  return Strip(LineFromCursor())
		:endfunction
		" }}}

		:function! TextAfterCursor()
		" {{{
		:  return Strip(LineAfterCursor())
		:endfunction
		" }}}

		:function! TextUntilCursor()
		" {{{
		:  return Strip(LineUntilCursor())
		:endfunction
		" }}}

		:function! TextBeforeCursor()
		" {{{
		:  return Strip(LineBeforeCursor())
		:endfunction
		" }}}
	" }}}

	" HTML/Markdown
	" {{{
		:function! GetEndTagHTML()
		" {{{
		:  let l:unclosed = [ "area", "base", "br", "col", "command", "embed", "hr", "img", "input", "keygen", "link", "meta", "param", "source", "track", "wbr" ]
		:  let l:line = TextUntilCursor()
		:  if l:line !~ '<\w\+[^>]*>$'
		:    return ""
		:  endif
		:  let l:tag = split(split(split(l:line, "<")[-1], ">")[0], " ")[0]
		:  for tag_ in l:unclosed
		:    if tag_ ==? l:tag
		:      return ""
		:    endif
		:  endfor
		:  return "</".l:tag.">"
		:endfunction
		" }}}

		:function! EndTagHTML()
		" {{{
		:  let l:window = winsaveview()
		:  execute "normal! a".GetEndTagHTML()
		:  call winrestview(l:window)
		:endfunction
		" }}}

		:function! HTMLCarriageReturn()
		" {{{
		:  let l:leftside = TextBeforeCursor()
		:  let l:rightside = TextFromCursor()
		:  if l:leftside =~ '<.*>\s*$' && l:rightside =~ '^\s*</.*>'
		:    return "\<CR>\<esc>O".Indentation()
		:  endif
		:  return "\<CR>"
		:endfunction
		" }}}

		function! MDNewline(in)
		"  {{{
		:  let l:allowable_starts = [ '>', '\*', '-', '+', '|' ]
		:  let l:line = Text('.')
		:  for starting in l:allowable_starts
		:    if l:line =~ '^' . starting . '\s*$'
		:      return "\<esc>^C"
		:    elseif l:line =~ '^' . starting . ' '
		:      return a:in.l:line[:stridx(l:line, " ")]
		:    endif
		:  endfor
		:  if l:line =~ '^\d\+.\s*$' || l:line =~ '^\d\+)\s*'
		:    return "\<esc>^C"
		:  elseif l:line =~ '^\d\+. '
		:    return a:in.(l:line + 1).'. '
		:  elseif l:line =~ '^\d\+) '
		:    return a:in.(l:line + 1).') '
		:  endif
		:  return a:in
		endfunction
		" }}}

		function! MDTab(default)
		"  {{{
		:  let l:allowable_starts = [ '>', '\*', '-', '+', '|' , '\d\+.', '\d\+)' ]
		:  let l:linenum = line('.') - 1
		:  if linenum == 1
		:    return a:default
		:  endif
		:  let lineabove = Text(linenum)
		:  let line = Text('.')
		:  for starting in allowable_starts
		:    if line =~ '^\s*' . starting .'\s*$'
		:      return "\<esc>I".repeat(" ", stridx(l:lineabove, " ") + 1) . "\<esc>A"
		:    endif
		:  endfor
		:  return a:default
		endfunction
		" }}}

		function! NotesMDFormat()
		" {{{
		" The \{-} is the non greedy version of *
		" Honestly there should be a *? but that who am I to judge
		:  let l:window = winsaveview()
		:  %s/__\(.\{-}\)__/<u>\1<\/u>/ge
		:  %s/_\(.\{-}\)_\^\(.\{-}\)\^/<sup>\2<\/sup><sub style='position: relative; left: -.5em;'>\1<\/sub> /ge
		:  %s/\^\(.\{-}\)\^_\(.\{-}\)_/<sup>\1<\/sup><sub style='position: relative; left: -.5em;'>\2<\/sub> /ge
		:  %s/_\(.\{-}\)_/<sub>\1<\/sub>/ge
		:  %s/\^\(.\{-}\)\^/<sup>\1<\/sup>/ge
		:  call winrestview(l:window)
		:  nohlsearch
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
		:  let l:tablen = &l:shiftwidth
		:  let l:lines = v:foldend - v:foldstart - 1
		:  let l:line = getline(v:foldstart)
		:  let l:endline = getline(v:foldend)
		:  return substitute(l:line[0:index(l:line,'{')], "\t", repeat(" ", l:tablen), "g").' '. l:lines .' lines '. l:endline
		:endfunction
		" }}}

		:function! HighlightAfterColumn(col)
		" {{{
		:  exe 'match LongLine /\%'.line('.').'l\%>'.(a:col).'v./'
		:endfunction
		" }}}

		:function! AppendSemicolon()
		" {{{
		:  let l:window = winsaveview()
		:  if Text('.') =~ ';$'
		:    execute "normal! A\b"
		:  else
		:    execute "normal! A;"
		:  endif
		:  call winrestview(l:window)
		:endfunction
		" }}}

		:function! MainAbbrev()
		" {{{
		:  if getline('.') =~ '^$'
		:    return "int main(int argc, char ** argv)\<CR>{\<CR>}\<up>"
		:  else
		:    return 'main'
		:  endif
		:endfunction
		" }}}

		:function! SplitIf()
		" {{{
		:  let l:window = winsaveview()
		:  execute "normal! 0f(%l"
		:  if getline('.') =~ ".*(.*)\s*.*;$"
		:    execute "normal! i\<CR>{\<CR>\<esc>o}"
		:  endif
		:  call winrestview(l:window)
		:  normal! 2j^
		:endfunction
		" }}}

	" }}}

	" Universally used function
	" {{{
		:function! CommentBL(start, end) range
		" {{{
		:  let l:window = winsaveview()
		:  execute "silent ".a:firstline.",".a:lastline.'s/\v^(\s*)(.)/\1'.a:start.'\2/e'
		:  execute "silent ".a:firstline.",".a:lastline.'s/\v^(\s*)'.a:start.a:start.'/\1/e'
		:  execute "silent ".a:firstline.",".a:lastline.'s/$/'. a:end
		:  execute "silent ".a:firstline.",".a:lastline.'s/'. a:end . a:end . '$//e'
		:  call winrestview(l:window)
		:  nohlsearch
		:endfunction
		" }}}

		:function! CleverTab()
		" {{{
		:   let l:str =  strpart( getline('.'), 0, col('.')-1 )
		:   if l:str =~ '^\s*$' || l:str =~ '\s$'
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

		:function! Wrap(type) range
		" {{{
		:  let l:sel_save = &selection
		:  let &selection = "inclusive"
		:  let l:input = nr2char(getchar())
		:  let l:ending = l:input
		:  let l:begin = l:input
		:  let l:first = {"<" : "<", "[" : "[", "{" : "{", "(" : "(", ">" : "<", "]" : "[", "}" : "{", ")" : "(",}
		:  let l:last  = {"<" : ">", "[" : "]", "{" : "}", "(" : ")", ">" : ">", "]" : "]", "}" : "}", ")" : ")",}
		:  if has_key(l:first, input)
		:    let l:begin  = l:first[l:input]
		:    let l:ending = l:last[l:input]
		:  endif
		:  echom a:type
		:  if a:type ==# "line"
		:    silent execute "normal! '[V`]$V"
		:    silent execute "normal! `<i".l:begin."\<esc>`>la".l:ending
		:  elseif a:type ==# "char"
		:    silent execute "normal! `[v`]lv"
		:    silent execute "normal! `<i".l:begin."\<esc>`>a".l:ending
		:  elseif a:type ==# "block"
		:    silent execute "normal! `[\<C-V>`]\<C-V>"
		:    silent execute "normal! `<i".l:begin."\<esc>`>a".l:ending
		:  elseif a:type ==# "visual"
		:    silent execute "normal! `<i".l:begin."\<esc>`>a".l:ending
		:  endif
		:  let &selection = sel_save
		:endfunction
		" }}}

		:function! RemoveTrailingWhitespace_AU()
		" {{{
		:  autocmd BufRead,BufWrite * :silent call RemoveTrailingWhitespace()
		:endfunction
		" }}}

		:function! RemoveTrailingWhitespace()
		" {{{
		:  let l:window = winsaveview()
		:  let l:line = getline('.')
		:  %s/\s\+$//ge
		:  call winrestview(l:window)
		:  call setline('.', l:line)
		:  call winrestview(l:window)
		:  nohlsearch
		:endfunction
		" }}}

		:function! MyFold()
		" {{{
		:  let tablen = &l:tabstop
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
		:  let l:window = winsaveview()
		:  normal! gg=G
		:  call winrestview(l:window)
		:endfunction
		" }}}

		:function! SpellReplace()
		" {{{
		:  let l:window = winsaveview()
		:  normal! [s1z=
		:  call winrestview(l:window)
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

	:function! TestSuspend()
	" {{{
	: silent execute '!sleep 3 && echo hi &'
	:endfunction
	" }}}

" }}}

" AUTO UPDATE SCRIPT {{{
"_______________________________________________________________________________________________________
	:function! Update_Vimrc()
	" {{{
	:let update_script= "sh $HOME/.vim/auto_update/fetch_vimrc.sh auto"
	:  silent execute "! " . update_script . " &> /dev/null"
	:  if v:shell_error != 0
	:    silent !mkdir -p $HOME/.vim/auto_update
	:    silent !wget https://raw.githubusercontent.com/chrisdean258/vimrc/master/fetch_vimrc.sh -O $HOME/.vim/auto_update/fetch_vimrc.sh &>/dev/null
	:    silent execute "! " . update_script . " &>/dev/null"
	:  endif
	:endfunction
	" }}}
	" :call Update_Vimrc()
	:command! Update call Update_Vimrc()
" }}}

" If you cannot see anything but this message uncomment the next line
" :highlight Folded ctermfg=DarkGrey guifg=DarkGrey

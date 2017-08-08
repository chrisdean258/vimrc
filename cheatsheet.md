
Commands
========

General
-------
<pre>
	:let {var}={val}            - set a variable to a value
	:set {(no)setting}          - sets a general setting for vim
	:setlocal {(no)setting}     - sets setting only for local buffer

	:command {toMap} {mapping}  - maps the command toMap to mapping
	:normal                     - executes command as in normal mode
	:normal!                    - executes command as in normal mode ignoring any user remapped characters:w

	:execute {string}           - executes the given string as a command
	:call {function(args)}      - calls the function with given args

	:e                          - edit new file
	:r                          - read contents of file into buffer

	:k{c}                       - mark a line with {c}
	:noh                        - turn off search highlighting
</pre>


Buffer commands
---------------
<pre>
	:w      - write buffer
	:q      - quit
	:wq     - write and quit
	:x      - write and quit
</pre>


Windows and Tabs
--------------
<pre>
	:wincmd (h|j|k|l) - move between windows in split screens (also see navigation)
	:{v}split {file}  - splits the window with the given file
	^w (h|j|k|l)      - move between windows in split screens (also see navigation)
	^w (v|s)          - split the window with the current file

	:tab new          - opens a new tab
	:tabp             - move to previous tab
	:tabn             - move to next tab
</pre>

Regex
-----
<pre>
	:(range)s/pattern/replace/(ge)
</pre>

Run Command on Lines
--------------------
<pre>
	:(range)g/pattern/command - executes command on lines matching pattern
</pre>

Mapping
-------
<pre>
	:noremap {lhs} {rhs}      - general map lhs to rhs
	:nnoremap {lhs} {rhs}     - normal map lhs to rhs
	:inoremap {lhs} {rhs}     - insert map lhs to rhs
	:vnoremap {lhs} {rhs}     - visual map lhs to rhs
	:onoremap {lhs} {rhs}     - operator maps to the end of the line
	:(n|i|v|o)unmap {expr}    - unmaps the previously mapped expression
</pre>

Abbreviation
------------
<pre>
	:iabbrev {lhs} {rhs}   - expands lhs to rhs in insert mode
	:cabbrev {lhs} {rhs}   - expands lhs to rhs in command mode (often useful when ending in <CR>)
</pre>

Auto commands
------------
<pre>
	:augroup {Name}                       - declares an autocommand group
	:  autocmd!                           - clears the group (for when it gets reloaded)
	:  autocmd {expr} {pattern} {command} - runs autocmd when expr and pattern are met
	:augroup END                          - ends augroup
</pre>

Previous versions:
------------------
<pre>
	:earlier {time}   - jumps the file to the version it was Time ago
	:later {time}     - jumps the file to the version at time later(only used after earlier)
</pre>


Navigation
==========
<pre>
	h | &lt;left&gt;  - move left
	j | &lt;down&gt;  - move down
	k | &lt;up&gt;    - move up
	l | &lt;right&gt; - move right

	nG or :n    - move to line n
	G           - move to the end of the file
	gg          - move to the beginning of the file

	^F          - move forward full screen
	^B          - move backward full screen

	^f          - move forward full page
	^b          - move backward full page

	^U          - move up half screen
	^D          - down up half screen

	zz          - center cursor on page(changes page frame)
	zt          - cursor at top of page(changes page frame)
	zb          - cursor at bottom of page(changes page frame)

	M           - center cursor on page(change cursor position)
	H           - put cursor at top of page (change cursor position)
	L           - put cursor at bottomk of page (change cursor position)

	%           - jump to corresponding item (e.g. closing brace)
</pre>

Using Tags
----------
<pre>
	^]          - jump to tag under cursor
	g^]         - used for ambiguous tags
	^t          - jump backl in the tag stack
</pre>


Operator pending mappings
=========================
<pre>
	(* also for navigation)
	$           - *End of current line
	^           - *Beginning of current line
	0           - *Beginning of current line

	w           - *forward one word
	b           - *backward one word
	W           - *forward one WORD
	B           - *backward one WORD

	f{c}        - *to next occurence of {c}
	t{c}        - *to before next occurence of {c}
	F{c}        - *to previous occurence of {c}
	T{c}        - *to after previous occurence of {c}

	iw          - word cursor is currently on
	iW          - WORD cursor is currently on
	i(|)        - in parentheses
	i{|}        - in braces
	i[|]        - in brackets
	i<|>        - in angle brackets

	i'          - in single quotes
	i"          - in double quotes
</pre>

Operator Mappings
=================
<pre>
	(double the letter to reference current line)
	( _ to denote operator pending mapping)

	d_          - delete
	c_          - change (delete and leave in insert mode)
	y_          - yank
	=_          - format (e.g. gg=G indent whole file)
	>_          - indent
	<_          - unindent
</pre>


General mappings
================

Modes
-----
<pre>
	i           - Insert mode
	&lt;esc&gt;       - Normal mode
	R           - Replace mode
	v           - Visual Mode

	I           - Insert at beginning of line
	o           - Insert on newline below current
	O           - Insert on newline above current
	a           - Append
	A           - Append to end of line
	V           - Visual line mode
</pre>

Deleting
--------
<pre>
	x           - delete single char
	X           - backspace
	r           - replace char

	D           - Delete to EOL
	C           - Change to EOL
	Y           - Yank line
</pre>


Putting (Pasting)
-------
<pre>
	p           - Put after cursor
	P           - Put above cursor
</pre>

Autocomplete
-------------
<pre>
	^n          - Autocomplete next word found
	^p          - Autocomplete previous word found
	^x^n        - Autocomplete this file only
	^x^f        - Autocomplete filenames
	^x^]        - Autocomplete tags
</pre>

Other
-----
<pre>
	u           - undo
	^r          - redo
	zM          - Fold all folds
	zR          - Unfold all folds

	q{reg}      - record macro to register (q to end recoding)
	@{reg}      - play macro
	@@          - play previous macro

	.           - replay last change
	*           - search for word under cursor

	gi          - go to insert mode where you previously went into insert mode
	g;          - go to where you previously went into insert mode

	^s          - show man page for word under cursor
</pre>


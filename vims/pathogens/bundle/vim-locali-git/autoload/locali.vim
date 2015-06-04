



""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""
function! locali#airline(...) abort
    set laststatus=2               " enable airline even if no splits

    let g:airline#extensions#branch#enabled     =1
    let g:airline#extensions#syntastic#enabled  =1
    let g:airline#extensions#bufferline#enabled =1
    let g:airline#extensions#commandt#enabled   =1
    let g:airline#extensions#csv#enabled        =1
    let g:airline#extensions#ctrlp#enabled      =1
    let g:airline#extensions#tabline#enabled    =1
    let g:airline#extensions#tagbar#enabled     =1

    let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'v',
        \ 'V'  : 'V',
        \ '' : 'VB',
        \ 's'  : 's',
        \ 'S'  : 'S',
        \ '' : 'SB'
        \ }

    if !exists('g:airline_symbols')
        let g:airline_symbols   = {}
    "    let g:airline_symbols.space = '⣿'
    "    let g:airline_symbols.space = '\ue0a0'
    endif

    let g:airline_powerline_fonts   =1
    let g:airline_theme     = 'murmur'

    " " vim-ascii symbols
    let g:airline_left_sep = '>'
    let g:airline_left_alt_sep = '>>'
    let g:airline_right_sep = '<'
    let g:airline_right_alt_sep = '<<'
    let g:airline_symbols.branch = 'B'
    let g:airline_symbols.readonly = 'R'
    let g:airline_symbols.linenr = 'L'

    " " vim-powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''

    " unicode symbols
    " let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    " let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    " let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    " let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    " let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
endfunction


function! locali#custi(...) abort
    set laststatus=2
    set t_Co=256

    set number
    set tabstop=4       " a hard TAB displays as 4 columns
    set softtabstop=4   " insert/delete 4 spaces when hitting a TAB/BACKSPACE
    set shiftwidth=4    " operation >> indents 4 columns; << unindents 4 columns
    set expandtab       " insert spaces when hitting TABs
    set shiftround      " round indent to multiple of 'shiftwidth'

    " set smarttab    " insert tabs on the start of a line according to
    set autoindent      " align the new line indent with the previous line
    " set smartindent
    set linebreak
    set showbreak=ᓚ⎽⎽⎽⎽⎽⎽ܝ\ \ \ \ \    

    set showcmd         " Show (partial) command in status line.
    set showmatch		" Show matching brackets.
    set ignorecase		" Do case insensitive matching
    set smartcase		" Do smart case matching
    set incsearch		" Incremental search
    set autowrite		" Automatically save before commands like :next and :make
    set hidden          " Hide buffers when they are abandoned
    set wildmenu        " enhanced command-line completion


    au FileType py set autoindent
    " au FileType py set smartindent
    " au FileType py set textwidth=79 " PEP-8 Friendly

    set incsearch
    set hlsearch
    set cursorline      " Highlight current line
    set colorcolumn=80


    syntax on
    filetype plugin indent on    " required



    set enc=utf-8
    set term=screen-256color
    let $TERM='screen-256color'
    colorscheme mayansmoke
    " set background=dark


    " let python_highlight_all = 1
endfunction


function! locali#powerline(...) abort
    " set rtp+=/var/lib/powerline-git/powerline/bindings/vim
    " let g:Powerline_symbols = 'fancy'
    " let g:Powerline_theme = 'short'
endfunction

function! locali#supertab(...) abort
    let g:SuperTabDefaultCompletionType = "<c-n>"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"
endfunction


function! locali#neocomplete(...) abort
	" Note: This option must set it in .vimrc(_vimrc).
	" NOT IN .gvimrc(_gvimrc)!
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
	    \ 'default' : '',
	    \ 'vimshell' : $HOME.'/.vimshell_hist',
	    \ 'scheme' : $HOME.'/.gosh_completions'
	    \ }

	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
	    let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplete#undo_completion()
	inoremap <expr><C-l>     neocomplete#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
	  return neocomplete#close_popup() . "\<CR>"
	  " For no inserting <CR> key.
	  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplete#close_popup()
	inoremap <expr><C-e>  neocomplete#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

	" AutoComplPop like behavior.
	"let g:neocomplete#enable_auto_select = 1

	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplete#enable_auto_select = 1
	"let g:neocomplete#disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" :
	" \ neocomplete#start_manual_complete()

	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Enable heavy omni completion.
	if !exists('g:neocomplete#sources#omni#input_patterns')
	  let g:neocomplete#sources#omni#input_patterns = {}
	endif
	if !exists('g:neocomplete#force_omni_input_patterns')
	  let g:neocomplete#force_omni_input_patterns = {}
	endif
	"let g:neocomplete#sources#omni#input_patterns.php =
	"\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
	"let g:neocomplete#sources#omni#input_patterns.c =
	"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
	"let g:neocomplete#sources#omni#input_patterns.cpp =
	"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplete#sources#omni#input_patterns.perl =
	\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

	" For smart TAB completion.
	"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
	"        \ <SID>check_back_space() ? "\<TAB>" :
	"        \ neocomplete#start_manual_complete()
	"  function! s:check_back_space() "{{{
	"    let col = col('.') - 1
	"    return !col || getline('.')[col - 1]  =~ '\s'
	"  endfunction"}}}
endfunction


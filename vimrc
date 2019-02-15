execute pathogen#infect()
syntax on
filetype plugin indent on
syntax enable
set background=dark
" solarized options
let g:solarized_termtrans = 1
colorscheme solarized

set number
set relativenumber
set ruler

set tabstop=4
set shiftwidth=4

set list!
set listchars=tab:│\ ,extends:›,precedes:‹,nbsp:·,trail:·

set clipboard=unnamed

set backspace=2 " make backspace work like most other programs

" set up fuzzy finder
set rtp+=/usr/local/opt/fzf

call setreg('c', ":!clear; npm run test:jest -- % --setupTestFrameworkScriptFile ''", 'c')
call setreg('i', ":!clear; npm run test:int -- %", 'c')
call setreg('a', ':!clear; yarn test:ava -- %', 'c')
call setreg('m', ':!clear; BABEL_ENV=test mocha $(find src \( -name % \)) src/js/test-util/setup.js --compilers .*:src/js/test-util/compilers %', 'c')

"fuzzy finding macros
"open fuzzy find
call setreg('f', ':FZF', 'c')

"open fuzzy find in new tab
call setreg('n', ':tabnew | FZF', 'c')

"open file under cursor in new tab
call setreg('g', 'gf', 'c')

if executable("rg")
	set grepprg=rg\ --vimgrep\ --no-heading
	set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint', 'flow']
let g:syntastic_sh_checkers=['shellcheck']
let g:syntastic_javascript_eslint_exe = 'node node_modules/eslint/bin/eslint.js'

let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"
let g:netrw_banner=0
let g:netrw_usetab=1
let g:netrw_winsize=25

" Neoformat
call setreg('r', ':Neoformat', 'c')

" Prettier
let g:prettier#autoformat = 0

autocmd BufWritePost * silent! execute "!update_status_bar.sh"

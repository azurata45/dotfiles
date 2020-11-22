"        _                       _                   _           _        _ _ _             
" __   _(_)_ __ ___        _ __ | |_   _  __ _      (_)_ __  ___| |_ __ _| | (_)_ __   __ _ 
" \ \ / / | '_ ` _ \ _____| '_ \| | | | |/ _` |     | | '_ \/ __| __/ _` | | | | '_ \ / _` |
"  \ V /| | | | | | |_____| |_) | | |_| | (_| |     | | | | \__ \ || (_| | | | | | | | (_| |
"   \_/ |_|_| |_| |_|     | .__/|_|\__,_|\__, |     |_|_| |_|___/\__\__,_|_|_|_|_| |_|\__, |
"                         |_|            |___/                                        |___/ 

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

" On Window
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

" On Unix
if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"        _             _                 _           _        _ _ 
"  _ __ | |_   _  __ _(_)_ __  ___      (_)_ __  ___| |_ __ _| | |
" | '_ \| | | | |/ _` | | '_ \/ __|     | | '_ \/ __| __/ _` | | |
" | |_) | | |_| | (_| | | | | \__ \     | | | | \__ \ || (_| | | |
" | .__/|_|\__,_|\__, |_|_| |_|___/     |_|_| |_|___/\__\__,_|_|_|
" |_|            |___/                                            

call plug#begin(expand('~/.config/nvim/plugged'))

" Filer
Plug 'scrooloose/nerdtree'

" Bottom status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git operation
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Color scheme
Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/CSApprox' " Maybe delete later

" Others
Plug 'Raimondi/delimitMate' " Completement brackets and quotations
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary' " Make easy to edit comment
Plug 'sheerun/vim-polyglot' " Add various languages' syntax
Plug 'ryanoasis/vim-devicons' " Add devicons suppoort
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completement
Plug 'nathanaelkane/vim-indent-guides' " Add emphasis on indent
Plug 'tyru/eskk.vim'

call plug#end()

"        _             _                          _   _   _                 
"  _ __ | |_   _  __ _(_)_ __  ___       ___  ___| |_| |_(_)_ __   __ _ ___ 
" | '_ \| | | | |/ _` | | '_ \/ __|     / __|/ _ \ __| __| | '_ \ / _` / __|
" | |_) | | |_| | (_| | | | | \__ \     \__ \  __/ |_| |_| | | | | (_| \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/     |___/\___|\__|\__|_|_| |_|\__, |___/
" |_|            |___/                                            |___/     

" NERDTree
let NERDTreeShowHidden = 1
filetype plugin indent on
autocmd VimEnter * execute 'NERDTree'

" vim-airlines
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
  \ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}
let g:airline#extensions#hunks#enabled = 0
let g:airline_section_z = airline#section#create(['%l',':','%v'])
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" Colorscheme
colorscheme hybrid

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']

" Settings to show vue icon
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = ''
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['vue'] = '42B983'

" eskk serv setting
let g:eskk#server = { 'host': 'localhost', 'port': '55100' }


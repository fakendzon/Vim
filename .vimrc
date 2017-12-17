set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
set runtimepath^=~/.vim/bundle/ctrlp.vim "установил плагин непривычным способом, набрал :PluginSearch ctrlP, установил, добавил эту строку, заработало

Plugin 'majutsushi/tagbar'          	" Class/module browser
nmap <F8> :TagbarToggle<CR>

Plugin 'mileszs/ack.vim'
Plugin 'dyng/ctrlsf.vim'

Plugin 'easymotion/vim-easymotion'
nmap fs <Plug>(easymotion-s)
nmap fl <Plug>(easymotion-sl)
let g:EasyMotion_smartcase = 1          " отключаем зависимость от регистра
let g:EasyMotion_do_shade = 0           " отключаем тень (в момент выбора цели весь текст помечается как комментарий)
" hi link EasyMotionTarget Search      
" hi EasyMotionTarget2First ctermfg=202 ctermbg=None cterm=None
" hi EasyMotionTarget2Second ctermfg=202 ctermbg=None cterm=None

Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
" let g:easytags_file = './tags'          "записываем теги локально для каждого проекта, вместо ~/.vimtags
" let g:easytags_auto_highlight = 0       "отключаем подсветку тегов
" let g:easytags_events = ['BufWritePost'] "события (:help autocmd-events), которые слушает easytags
" let g:easytags_async = 1                "не блокировать vim во время обновления тег-файла
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>




"------------------=== Other ===----------------------
"Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
"Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
"Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and morei
Plugin 'vim-syntastic/syntastic'	"проверка синтаксиса
Plugin 'tpope/vim-commentary'
Plugin 'mkitt/tabline.vim'
" Plugin 'wincent/command-t.vim'


"--------------=== Snippets support ===---------------
"Plugin 'garbas/vim-snipmate'		" Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
"Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo
" Plugin 'sirver/ultisnips'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'


"---------------=== Languages support ===-------------
" Plugin 'farseer90718/vim-translator'
" vmap T <Plug>Translate

"---------------=== Languages support ===-------------

" --- Python ---
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'PProvost/vim-ps1'           " Powershell
"Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
"Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
"Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

" --- PHP ---
"Plugin 'StanAngeloff/php.vim'

" --- SQL ---
Plugin 'vim-scripts/SQLComplete.vim'

" --- HTML ---
Plugin 'othree/html5.vim'               " HTML5 omnicomplete and sytnax
Plugin 'idanarye/breeze.vim'            " Html navigation like vim-easymotion, tag matching, tag highlighting and DOM navigation
Plugin 'mattn/emmet-vim'                "html:5 insert form, what other functions


Plugin 'rhysd/vim-grammarous'

call vundle#end()            		" required
filetype on
filetype plugin on
filetype plugin indent on

" настройки Vim-Airline
" set laststatus=2
" let g:airline_theme='powerlineish'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'



"=====================================================
" Languages support
"=====================================================

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal commentstring=<!--\ %s\ -->





"=====================================================
" General settings
"=====================================================

set number						"номера строк слева
set cursorline					"подcвечивать линию
syntax on						"включить подсветку кода
set tabstop=4					"ширина таба (4 пробела) в режиме вставки, надо нажать tab
set shiftwidth=4				"ширина таба (4 пробела) в номарльном режиме, надо нажать shift >>/<<
set expandtab					"пробелы вместо Tab
" set smartindent
let NERDTreeShowHidden=1		"let NERDTree see hidden files
let @a=expand('%:p')
set ic                          "Игнорировать регистр при поиске
set hls is                      "Подсвечивать слово и результаты при поиске  

"colorscheme solas 
" let g:jellybeans_background_color_256=000
colorscheme jellybeans 
"colorscheme molokai 
"colorscheme myterm 
"colorscheme tomorrow 
"colorscheme nightly

" mappings
map <C-n> :NERDTreeToggle<CR>
"save in normal mode
nmap ;w :w<CR>
vmap "+y :!xclip -f -sel clip

"в режиме вставки можно сменить раскладку нажатием Ctrl-6
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"Нормальная вставка кода
set pastetoggle=<F3>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"   " <s-tab> = shift+tab
let g:UltiSnipsListSnippets = "<s-tab>"

"Recommended settings vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_php_checkers = ['php', 'phpcs']	"phpcs - проверка на соответсвие документации (стиля); php - не работает в vim, в консоле работает. Странная особенность некоторые ошибки отлавливаются, некоторые нет, даже командой из коноли php -l, но когда запускаешь на исплонение php выдает ошибку
let g:syntastic_php_checkers = ['php']	"phpcs - проверка на соответсвие документации (стиля); php - не работает в vim, в консоле работает. Странная особенность некоторые ошибки отлавливаются, некоторые нет, даже командой из коноли php -l, но когда запускаешь на исплонение php выдает ошибку



" https://defuse.ca/blog/clipboard-over-ssh-with-vim.html

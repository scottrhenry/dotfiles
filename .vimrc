" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012


" ============================================
" Note to myself:
" DO NOT USE <C-z> FOR SAVING WHEN PRESENTING!
" ============================================

" Allow vim to have access to ctr j for movement
 let g:C_Ctrl_j = 'off'
 let g:BASH_Ctrl_j='off'
 nnoremap <SID>I_won’t_ever_type_this_Aafdas__ <Plug>IMAP_JumpForward

" Use jk to get of of insert mode
 imap jk <Esc>

" Automatic reloading of .vimrc
 autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

 set pastetoggle=<F6>
 set clipboard=unnamed


" Mouse and backspace
"" set mouse=a  " on OSX press ALT and click
"" set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
 let mapleader = ","
 let maplocalleader = "."


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
 noremap <C-n> :nohl<CR>
 vnoremap <C-n> :nohl<CR>
 inoremap <C-n> :nohl<CR>


" Quicksave command
 noremap <C-Z> :update<CR>
 vnoremap <C-Z> <C-C>:update<CR>
 inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
 noremap <Leader>e :quit<CR>  " Quit current window
 noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l
 nnoremap <C-h> <C-w>h


" easier moving between tabs
 map <Leader>n <esc>:tabprevious<CR>
 map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
"" vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
 vnoremap < <gv  " better indentation
 vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
 autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
 au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" git clone git://github.com/altercation/vim-colors-solarized.git
" mv vim-colors-solarized ~/.vim/bundle/
" cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
 syntax enable
 set background=dark
 colorscheme solarized


" Enable syntax highlighting
" You need to reload this file for the change to apply
 filetype off
 filetype plugin indent on
 syntax on


" Showing line numbers and length
 set number  " show line numbers
 set tw=79   " width of document (used by gd)
 set nowrap  " don't automatically wrap on load
 set fo-=t   " don't automatically wrap text when typing
 set colorcolumn=80
 highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
 vmap Q gq
 nmap Q gqap


" Useful settings
 set history=700
 set undolevels=700


" Real programmers don't use TABs but spaces
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set shiftround
 set expandtab


" Make search case insensitive
 set hlsearch
 set incsearch
 set ignorecase
 set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
 call pathogen#infect()


" ============================================================================
" Python IDE Setup
" ============================================================================

" NerdTree
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git
"
 noremap <F5> :NERDTreeToggle<CR>

" Settings for vim-airplane
" cd ~/.vim/bundle
" git clone https://github.com/bling/vim-airline
" git clone git://github.com/powerline/fonts.git
" sh fonts/install.sh
 set laststatus=2
 let g:airline_powerline_fonts = 1
 let g:airline_section_b = '%{strftime("%c")}'
 let g:airline#themes#solarized#palette = {}

" Settings for ctrlp
" Not currently using
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*


" Settings for python-mode
" Not currently using
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone --recursive git://github.com/davidhalter/jedi-vim.git
" pip install jedi
 let g:jedi#usages_command = "<leader>z"
 let g:jedi#popup_on_dot = 0
 let g:jedi#popup_select_first = 0
 map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Settings for vim-fugitive
" Allows for git commands in vim
" cd ~/.vim/bundle
" git clone git://github.com/tpope/vim-fugitive.git
" vim -u NONE -c "helptags vim-fugitive/doc" -c q

" Settings for vim-flake8
" cd ~/.vim/bundle
" git clone https://github.com/nvie/vim-flake8
" pip install flake8
let g:flake8_show_in_gutter=1


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
 set nofoldenable


" ============================================================================
" Other plugins
" ============================================================================

" Settings for vim-orgmode
" cd ~/.vim/bundle
" git clone https://github.com/jceb/vim-orgmode





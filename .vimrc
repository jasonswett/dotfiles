" MUST INSTALL + CONFIGURE Vim Plug (plug-in manager) in order to use this
" .vimrc file
" https://github.com/junegunn/vim-plug
"
" Run `PlugInstall` from vim command mode to install the plug-ins.
"
" Be sure to read the documentation of the following plug-ins to ensure
" maximum efficiency


call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-dispatch'

" tslime.vim enables Send_to_Tmux.
Plug 'jgdavey/tslime.vim'

" Invoke rspec tests from within vim
Plug 'thoughtbot/vim-rspec'

" Add these keybindings to your personal ~/.vimrc if desired.
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" Necessary Ruby and Rails development plug-ins
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" A plugin that SHOULD be a default Vim/NeoVim feature.
" Most vim-like plugin ever made.
Plug 'tpope/vim-surround'

Plug 'tpope/vim-endwise'

" Unix commands for Vim. (Ex: `Rename` current file)
Plug 'tpope/vim-eunuch'

" Have the . (period) key repeat plugin mappings
Plug 'tpope/vim-repeat'

" Git Tools
Plug 'tpope/vim-fugitive'

" Split/Join Args and Lists (invaluable formatting tool - Make sure to use it!)
Plug 'AndrewRadev/splitjoin.vim'

" Typical modern snippets for most languages
Plug 'honza/vim-snippets'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" Include project-specific files
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" For fzf searching
noremap <C-p> :Files<CR>
noremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

let g:rspec_command = $VIM_RSPEC_COMMAND_HEADLESS

noremap ; :

noremap <C-l> gt
noremap <C-h> gT

" Don't wrap lines
set nowrap

" Use two spaces for indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

syntax on
set background=dark

" Highlight searches
set hlsearch

" Show line numbers
set number

" Allow yanking to the clipboard
set clipboard^=unnamed

set ic

noremap sp :set paste<CR>
noremap snp :set nopaste<CR>

set guicursor=i:block

set foldmethod=indent
set foldlevelstart=99

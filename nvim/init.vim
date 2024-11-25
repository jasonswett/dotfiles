set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

command Init tabnew ~/.config/nvim/init.vim

call plug#begin()

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'slim-template/vim-slim'
Plug 'supermaven-inc/supermaven-nvim'

" Fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Nerdtree
Plug 'preservim/nerdtree'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
call plug#end()

nnoremap Y Y$
nnoremap <leader>y :let @+=expand('%')<CR>

nnoremap <C-p> :Files<CR>
nnoremap <silent> <leader>ag :Ag <C-R>=expand('<cword>')<CR><CR>

let &runtimepath.=','.expand('~/.config/nvim/rplugin/python3')
"
" RSpec.vim mappings
map <silent> <Leader>t :call RunCurrentSpecFile()<CR>
map <silent> <Leader>s :call RunNearestSpec()<CR>
map <silent> <Leader>l :call RunLastSpec()<CR>
map <silent> <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!tmux send-keys -t .1 'bundle exec rspec {spec}' C-m"

nnoremap <C-n> :NERDTreeToggle<CR>

colorscheme wildcharm

lua << EOF
require('supermaven-nvim').setup({
    -- Configuration options go here
})
EOF

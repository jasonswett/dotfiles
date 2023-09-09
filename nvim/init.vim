set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
call plug#end()

nnoremap Y Y$
nnoremap <leader>y :let @+=expand('%')<CR>

let &runtimepath.=','.expand('~/.config/nvim/rplugin/python3')

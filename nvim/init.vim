set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin()
Plug 'tpope/vim-dispatch'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
call plug#end()

nnoremap Y Y$

let &runtimepath.=','.expand('~/.config/nvim/rplugin/python3')

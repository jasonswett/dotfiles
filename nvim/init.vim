set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

command Init tabnew ~/.config/nvim/init.vim

call plug#begin()

" Syntax highlighting
Plug 'rose-pine/neovim', { 'as': 'rose-pine' }

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'slim-template/vim-slim'

" Fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Nerdtree
Plug 'preservim/nerdtree'

" LSP
Plug 'neovim/nvim-lspconfig'

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

lua << EOF
require('rose-pine').setup()
vim.cmd('colorscheme rose-pine')

local cmp = require'cmp'

-- Configure nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      -- For `luasnip` users
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = function(fallback)
      if cmp.visible() and cmp.confirm({ select = true }) then
        -- Switch to command mode after confirming a completion
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-N>', true, true, true), 'n', true)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
  }
})

-- Initialize the LSP client
local lspconfig = require('lspconfig')

-- Function to set key mappings after LSP attaches to buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  -- Set key mappings
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
end

-- Configure Solargraph
lspconfig.solargraph.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = on_attach,
  settings = {
    solargraph = {
      diagnostics = false,
      completion = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  }
}

-- Enable completion with built-in LSP capabilities
vim.o.completeopt = "menuone,noselect"
EOF

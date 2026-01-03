" General settings
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set mouse=a
set showcmd
set showmatch
set termguicolors
set clipboard+=unnamedplus

" Ctrl+DownArrow Ctrl+UpArrow instead of Ctrl+d Ctrl+u
nnoremap <C-Down> <C-d>
nnoremap <C-Up> <C-u>

" vim-plug shortcuts
command! PI PlugInstall
command! PU PlugUpdate
command! PG PlugUpgrade
command! PC PlugClean
command! PS PlugStatus
command! PD PlugDiff

" vim-plug plugins
" Install vim-plug:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lambdalisue/suda.vim' "suda
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "treesitter
" Plug 'nvim-treesitter/nvim-treesitter-textobjects', "treesitter textobject
Plug 'nvim-neo-tree/neo-tree.nvim' "neo-tree
Plug 'MunifTanjim/nui.nvim' "neo-tree dependency
Plug 'nvim-lua/plenary.nvim' "neo-tree dependency
Plug 'nvim-tree/nvim-web-devicons' "neo-tree icons
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} "markdown pictures
call plug#end()

" Terminal colors
let g:gruvbox_termguicolors = 1
set background=dark
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE

" suda.vim shortcuts :W and :R
command! R SudaRead
command! W SudaWrite

" neo-tree shortcuts
nnoremap <C-n> :Neotree toggle<CR>
nnoremap <C-Right> <C-w>l
nnoremap <C-Left> <C-w>h

" neo-tree general settings
lua << EOF
pcall(function()
  require("neo-tree").setup({
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
  })
end)
EOF

" nvim-treesitter general settings
lua << EOF
local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then return end

configs.setup {
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "vim",
    "vimdoc",
    "query",
    "bash",
    "java"
  },
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
EOF

" Ctrl + p for Markdown Prewiew toggle
nnoremap <C-p> :MarkdownPreviewToggle<CR>

" ~/.config/nvim/lua/plugins.lua contains plugins
set mouse=

" ======================== package manager =========================
lua<<EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
EOF

" ======================== fav settings and key bindings =========================

imap jk <Esc>:w<CR>

set number
set tabstop=4
set shiftwidth=4

nmap <S-Tab> <<
nmap <Tab> >>

map gr gT

" movement
nmap <C-h> <C-W><Left>
nmap <C-j> <C-W><Down>
nmap <C-k> <C-W><Up>
nmap <C-l> <C-W><Right>

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
        silent exe "normal! p"
        endfunction     

" ======================== launching plugins =========================

nmap <leader>ve :tabnew ~/.config/nvim/init.vim<CR>
nmap <leader>vr :source %<CR>
nmap <leader>n :Neotree<CR>
nmap <leader>N :Neotree source=buffers<CR>
nmap <C-p> :Telescope find_files<CR>
nmap <C-t> :Telescope telescope-tabs list_tabs<CR>

nmap <leader>t :Telescope<CR>

nmap <leader>lg :LazyGit<CR>

command Gblame :Git blame



" colorschemes
color gruvbox
color everforest
color tokyonight-day

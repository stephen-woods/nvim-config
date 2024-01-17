vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set rnu")
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>',{})
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>',{})
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>',{})
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>',{})

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', {})
vim.wo.number = true

-- NVimTree
vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle <CR>', {})

-- Remap page forard/backward to center cursor in the middle of the screen
vim.keymap.set({'n','v'},'<C-f>','<C-f>zz')
vim.keymap.set({'n','v'},'<C-b>','<C-b>zz')
vim.keymap.set({'n','v'},'<C-d>','<C-d>zz')
vim.keymap.set({'n','v'},'<C-u>','<C-u>zz')

vim.keymap.set('n', '<leader>n', '<cmd> set nu! <CR>')
vim.keymap.set('n', '<leader>rn', '<cmd> set rnu! <CR>')

vim.keymap.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>')
vim.keymap.set('n', '<leader>fa', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>')
vim.keymap.set('n', '<leader>fw', '<cmd> Telescope live_grep <CR>')
vim.keymap.set('n', '<leader>fb', '<cmd> Telescope buffers <CR>')
vim.keymap.set('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>')
vim.keymap.set('n', '<leader>fz', '<cmd> Telescope current_buffer_fuzzy_find <CR>')

vim.keymap.set('n', '<leader>cm', '<cmd> Telescope git_commits <CR>')
vim.keymap.set('n', '<leader>gt', '<cmd> Telescope git_status <CR>')
vim.keymap.set('n', '<leader>ma', '<cmd> Telescope marks <CR>')

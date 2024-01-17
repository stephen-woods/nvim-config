local opts = { noremap = true, silent =true }

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


-- Resize with arrows when using multiple windows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<c-down>", ":resize +2<cr>", opts)
vim.keymap.set("n", "<c-right>", ":vertical resize -2<cr>", opts)
vim.keymap.set("n", "<c-left>", ":vertical resize +2<cr>", opts)

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', {})
vim.wo.number = true

-- NVimTree
vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle <CR>', {})

-- Remap page forard/backward to center cursor in the middle of the screen
vim.keymap.set({'n','v'},'<C-f>','<C-f>zz')
vim.keymap.set({'n','v'},'<C-b>','<C-b>zz')
vim.keymap.set({'n','v'},'<C-d>','<C-d>zz')
vim.keymap.set({'n','v'},'<C-u>','<C-u>zz')

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
vim.keymap.set({'n', 'v'}, 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true}) 
vim.keymap.set({'n', 'v'}, 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true}) 
vim.keymap.set({'n', 'v'}, '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true}) 
vim.keymap.set({'n', 'v'}, '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true}) 


vim.keymap.set('n', '<leader>n', '<cmd> set nu! <CR>')
vim.keymap.set('n', '<leader>rn', '<cmd> set rnu! <CR>')

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>')
vim.keymap.set('n', '<leader>fa', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>')
vim.keymap.set('n', '<leader>fw', '<cmd> Telescope live_grep <CR>')
vim.keymap.set('n', '<leader>fb', '<cmd> Telescope buffers <CR>')
vim.keymap.set('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>')
vim.keymap.set('n', '<leader>fz', '<cmd> Telescope current_buffer_fuzzy_find <CR>')

vim.keymap.set('n', '<leader>cm', '<cmd> Telescope git_commits <CR>')
vim.keymap.set('n', '<leader>gt', '<cmd> Telescope git_status <CR>')
vim.keymap.set('n', '<leader>ma', '<cmd> Telescope marks <CR>')

vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)







vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

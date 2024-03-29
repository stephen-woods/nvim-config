local opts = { noremap = true, silent = true }

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Show relative line numbers - turned off right now
vim.opt.number = true
vim.opt.relativenumber = false

-- Show line number for current line
vim.wo.number = true

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history. Disabling for now so we don't accidentally undo too much
-- vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default. Ensure there is enough columns
vim.opt.signcolumn = 'yes:1'

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitspace in the editor
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live as you type
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd> nohlsearch <CR>', { desc = 'Clear highlighted searcher' } )

-- Use appropriate number of spaces to insert a tab
vim.opt.expandtab = true

-- Number of spaces to use for each tab
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- vim.opt_global.completeopt = { "menuone", "noinsert", "noselect", "preview" }

-- TIP: Disable arrow keys in normal mode 
-- FIXME Up and Down do not work
vim.keymap.set('n', '<Left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<Right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<Up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<Down>', '<cmd>echo "Use j to move!!"<CR>')

-- Navigate vim panes better
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', {})
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', {})
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', {})
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', {})

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', {})

-- NVimTree
vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle <CR>', { desc = 'NVimTree Toggle' })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Remap page forard/backward to center cursor in the middle of the screen
vim.keymap.set({ 'n', 'v' }, '<C-f>', '<C-f>zz', { desc = 'Page down' })
vim.keymap.set({ 'n', 'v' }, '<C-b>', '<C-b>zz', { desc = 'Page up' })
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { desc = 'Half page down' })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { desc = 'Half page up' })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
vim.keymap.set({ 'n', 'v' }, 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
vim.keymap.set({ 'n', 'v' }, 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
vim.keymap.set({ 'n', 'v' }, '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = 'Down', expr = true })
vim.keymap.set({ 'n', 'v' }, '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = 'Up', expr = true })


vim.keymap.set('n', '<leader>n', '<cmd> set nu! <CR>', { desc = 'Toggle line numbers' })
vim.keymap.set('n', '<leader>rn', '<cmd> set rnu! <CR>', { desc = 'Toggle reverse line numbers' })

vim.keymap.set('n', '<leader>fdc', '<cmd> Telescope dap commands <CR>', { desc = 'Telescope dap commands'})
vim.keymap.set('n', '<leader>fdx', '<cmd> Telescope dap configurations <CR>', { desc = 'Telescope dap configurations'})
vim.keymap.set('n', '<leader>fdb', '<cmd> Telescope dap list_breakpoints <CR>', { desc = 'Telescope dap list breakpoints'})
vim.keymap.set('n', '<leader>fdv', '<cmd> Telescope dap variables <CR>', { desc = 'Telescope dap variables'})
vim.keymap.set('n', '<leader>fdf', '<cmd> Telescope dap frames <CR>', { desc = 'Telescope dap frames'})

vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)


vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')



-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- toggle neotree
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

-- move highlighted text up or down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
-- yanks till the end of line but no idea what that one does ^
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- deletes without adding to the register
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'delete without register' })

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', { desc = 'delete character without register' })

-- increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment' }) -- increment
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement' }) -- decrement

-- -- window management
-- vim.keymap.set("n", "<leader>sv", "<C-w>v")        -- split window vertically
-- vim.keymap.set("n", "<leader>sh", "<C-w>s")        -- split window horizontally
-- vim.keymap.set("n", "<leader>se", "<C-w>=")        -- make split windows equal width & height
-- vim.keymap.set("n", "<leader>sx", ":close<CR>")    -- close current split window
--
-- vim.keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
-- vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- vim.keymap.set("n", "<leader>tn", ":tabn<CR>")     --  go to next tab
-- vim.keymap.set("n", "<leader>tp", ":tabp<CR>")     --  go to previous tab

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

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

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

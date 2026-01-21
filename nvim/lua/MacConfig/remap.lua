-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '

-- [[ Set up keymaps ]] See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`
-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Windows
-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')
-- Move windows around
vim.keymap.set({ 't', 'i' }, '<A-S-h>', '<C-\\><C-n><C-w>H')
vim.keymap.set({ 't', 'i' }, '<A-S-j>', '<C-\\><C-n><C-w>J')
vim.keymap.set({ 't', 'i' }, '<A-S-k>', '<C-\\><C-n><C-w>K')
vim.keymap.set({ 't', 'i' }, '<A-S-l>', '<C-\\><C-n><C-w>L')
vim.keymap.set({ 'n' }, '<A-S-h>', '<C-w>H')
vim.keymap.set({ 'n' }, '<A-S-j>', '<C-w>J')
vim.keymap.set({ 'n' }, '<A-S-k>', '<C-w>K')
vim.keymap.set({ 'n' }, '<A-S-l>', '<C-w>L')

-- Search
-- center searches
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- open netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

--allows ci without removing current paste buffer
vim.keymap.set('n', 'ci(', '"_ci(')
vim.keymap.set('n', 'ci)', '"_ci)')
vim.keymap.set('n', 'ci{', '"_ci{')
vim.keymap.set('n', 'ci}', '"_ci}')
vim.keymap.set('n', "ci'", "\"_ci'")
vim.keymap.set('n', 'ci[', '"_ci[')
vim.keymap.set('n', 'ci]', '"_ci]')
vim.keymap.set('n', 'ci"', '"_ci"')

--allows use of d without copying
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('v', 'd', '"_d')

--force you to use nvim binds!
vim.keymap.set('n', '<Left>', ':echoe "Use h"<CR>')
vim.keymap.set('n', '<Right>', ':echoe "Use l"<CR>')
vim.keymap.set('n', '<Up>', ':echoe "Use k"<CR>')
vim.keymap.set('n', '<Down>', ':echoe "Use j"<CR>')
vim.keymap.set('i', '<Left>', '<ESC>:echoe "Use h"<CR>')
vim.keymap.set('i', '<Right>', '<ESC>:echoe "Use l"<CR>')
vim.keymap.set('i', '<Up>', '<ESC>:echoe "Use k"<CR>')
vim.keymap.set('i', '<Down>', '<ESC>:echoe "Use j"<CR>')

--buffer keybinds
vim.keymap.set('n', '<leader>t', ':enew<CR>')
vim.keymap.set('n', '<leader>d', ':bd<CR>')
vim.keymap.set('n', '<leader><Tab>', ':bnext<CR>')
vim.keymap.set('n', '<leader><S-Tab>', ':bprev<CR>')

--tabs keybind
vim.keymap.set('n', '<leader>T', ':tabnew<CR>')
vim.keymap.set('n', '<leader>D', ':tabclose<CR>')
-- vim.keymap.set('n', '<leader><leader><tab>', 'C-

-- Mason
vim.keymap.set('n', '<leader>m', ':Mason<CR>')

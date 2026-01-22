-- [[ Setting options ]] See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:help option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

-- Print the line number in front of each line
vim.o.number = true

-- Use relative line numbers, so that it is easier to jump with j, k. This will affect the 'number'
-- option above, see `:h number_relativenumber`
vim.o.relativenumber = true

-- Sync clipboard between OS and Neovim. Schedule the setting after `UiEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

--make the time to accept a command to 500 ms instead of 1000 for mappings
vim.o.updatetime = 100

-- time to wait for a keybind to complete 
vim.o.timeoutlen = 500

-- Highlight the line where the cursor is on
vim.o.cursorline = true
--
--will try to be smart about when tabbing so will use multuple if needed
vim.o.smarttab = true

--automatically indent in functions and what not
vim.o.autoindent = true

--set tabs to 4 spaces no matter what
vim.o.tabstop = 4 --amount of spaces for normal tabs
vim.o.shiftwidth = 4 -- spaces for when using << or >>
vim.o.expandtab = true -- pressing tab key will insert spaces instead of tab character

--self explainatory
vim.o.smartindent = true

--dont wrap text
vim.o.wrap = false

-- gives me the chunky cursor in insert mode
vim.o.guicursor = ""

vim.o.swapfile = false
-- make a backup before overwritting file
vim.o.backup = true
vim.opt_global.backupdir = os.getenv("HOME") .. "/.nvimTmp/backupdir"
vim.o.backupcopy = "auto"

-- hold undos into a file for persistance 
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.nvimTmp/undodir"

--highlight current search
vim.o.hlsearch = true

--show search while typing it
vim.o.incsearch = true

--24 bit color (required for a bunch of plugins)
vim.o.termguicolors = true
--
--enable cursor to go one more char in normal mode
vim.cmd("set ve+=onemore")

--turn off the mouse
vim.o.mouse = ""

-- command line height (status line still stays)
vim.o.cmdheight = 0;

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Show <tab> and trailing spaces
vim.o.list = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.o.confirm = true

-- [[ Basic Autocommands ]].
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Create user commands ]]
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.fn.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }))
end, { desc = 'Print the git blame for the current line' })

-- [[ Add optional packages ]]
-- Nvim comes bundled with a set of packages that are not enabled by
-- default. You can enable any of them by using the `:packadd` command.

-- For example, to add the "nohlsearch" package to automatically turn off search highlighting after
-- 'updatetime' and when going to insert mode
--

-- LSP Errors icons
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.HINT] = "⚑",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  virtual_text = {
    prefix = "󰻀",
  },
  underline = false,
  update_in_insert = true,
  severity_sort = true,
})

return {
    "dracula/vim",
    lazy = false,
    config = function()
        vim.cmd("colorscheme dracula")

        vim.api.nvim_set_hl(0, "Normal", { bg = "#181a21" })

        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#212121" })
    end,
}


-- return {
--     "Mofiqul/dracula.nvim",
--     config = function()
--         require("dracula").setup({
--             colors = {
--                 bg = "#181a21",
--                 selection = "#212121",
--             },
--         })
--
--         vim.cmd.colorscheme("dracula")
--     end,
-- }

-- purple colorscheme
--[[
 return {
   "bukkml/lillilac.nvim",
   config = function()
     vim.cmd.colorscheme("lillilac")
   end,
 }
 --]]

--[[
return {
-- baes2tone_malldark, base2tone_porchdark
    "atelierbram/base2tone-vim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("base2tone_porchdark")
        vim.api.nvim_set_hl(0, "cursorlinenr", {fg = "#f2e3f7"})
    end,
}
--]]

-- paper colorscheme
--[[
return {
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("kanagawa-paper-ink")
  end,
  opts = {},
}
--]]

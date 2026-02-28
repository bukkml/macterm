-- Dracula colorscheme
return {
    "nvim-lualine/lualine.nvim",

    config = function()
        local colors = {
            bg = "#282a36",
            fg = "#f8f8f2",
            yellow = "#f1fa8c",
            cyan = "#8be9fd",
            green = "#50fa7b",
            orange = "#ffb86c",
            violet = "#bd93f9",
            magenta = "#ff79c6",
            blue = "#6272a4",
            red = "#ff5555",
            comment = "#6272a4",
        }

        local dracula_lualine = {
            normal = {
                a = { bg = "#db93f9", fg = colors.bg, gui = "bold" },
                b = { bg = "#3f496a", fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },

            insert = {
                a = { bg = colors.green, fg = colors.bg, gui = "bold" },
            },

            visual = {
                a = { bg = colors.magenta, fg = colors.bg, gui = "bold" },
            },

            replace = {
                a = { bg = colors.red, fg = colors.bg, gui = "bold" },
            },

            inactive = {
                a = { bg = colors.bg, fg = colors.comment },
                b = { bg = colors.bg, fg = colors.comment },
                c = { bg = colors.bg, fg = colors.comment },
            },
        }

        local function diff_source()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
                return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                }
            end
        end

        local function root_dir(opts)
            opts = vim.tbl_extend("force", {
                cwd = false,
                subdirectory = true,
                parent = true,
                other = true,
                icon = "󱉭 ",
            }, opts or {})

            return function()
                local cwd = vim.fn.getcwd()
                local name = vim.fn.fnamemodify(cwd, ":t")
                return opts.icon .. name
            end
        end

        require("lualine").setup({
            options = {
                theme = dracula_lualine,
                section_separators = "",
                component_separators = "",
                globalstatus = false,
                disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard", "" } },
            },

            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(str)
                            return str:upper()
                        end,
                    },
                },

                lualine_b = {
                    {
                        "branch",
                        icon = "",
                    },
                    {
                        "diff",
                        source = diff_source,
                        symbols = {
                            added = " ",
                            modified = " ",
                            removed = " ",
                        },
                    },
                },

                lualine_c = {
                    {
                        function()
                            local MiniIcons = require("mini.icons")
                            local ft = vim.bo.filetype
                            local icon, hl = MiniIcons.get("filetype", ft)
                            if not icon then
                                return ""
                            end
                            return icon
                        end,
                        padding = { left = 1, right = 0 },
                    },
                    {
                        "filename",
                        path = 1,
                        symbols = {
                            modified = "[+]",
                            readonly = "[-]",
                            unnamed = "[No Name]",
                        },
                    },
                },

                lualine_x = {
                    "encoding",
                    "fileformat",
                },

                lualine_y = {
                    {
                        "diagnostics",
                        symbols = {
                            error = " ",
                            warn = " ",
                            hint = " ",
                            info = " ",
                        },
                    },
                },

                lualine_z = {
                    function()
                        return " " .. os.date("%R")
                    end,
                },
            },
        })
    end,
}

-- Kunagawa colorscheme
--[[
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local kanagawa_paper = require("lualine.themes.kanagawa-paper-ink")
    require('lualine').setup({
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'searchcount', 'selectioncount', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      options = {
        separator = nil,
        section_separators = '',
        component_separators = '',
        theme = kanagawa_paper,
      },
    })
  end,
}
--]]

-- Purple colorscheme
--[[
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		-- Inneficiency speed run fr
		local custom_auto = require("lualine.themes.auto")
		custom_auto.normal.c.fg = "#ffffff"
		custom_auto.insert.c.fg = "#ffffff"
		custom_auto.visual.c.fg = "#ffffff"
		custom_auto.replace.c.fg = "#ffffff"
		custom_auto.command.c.fg = "#ffffff"
		custom_auto.inactive.c.fg = "#ffffff"
		custom_auto.normal.b.fg = "#ffffff"
		custom_auto.insert.b.fg = "#ffffff"
		custom_auto.visual.b.fg = "#ffffff"
		custom_auto.replace.b.fg = "#ffffff"
		custom_auto.command.b.fg = "#ffffff"
		custom_auto.inactive.b.fg = "#ffffff"

		custom_auto.normal.a.bg = "#8e6ea6"
		custom_auto.insert.a.bg = "#b657ff "
		custom_auto.visual.a.bg = "#e3bdff"
		custom_auto.replace.a.bg = "#ffa8f8"
		custom_auto.command.a.bg = "#ff4df0"
		custom_auto.inactive.a.bg = "#9e99ff"

		custom_auto.inactive.a.fg = "#080709"

		custom_auto.normal.b.bg = nil
		custom_auto.normal.c.bg = nil
		custom_auto.insert.b.bg = nil
		custom_auto.insert.c.bg = nil
		custom_auto.visual.b.bg = nil
		custom_auto.visual.c.bg = nil
		custom_auto.replace.b.bg = nil
		custom_auto.replace.c.bg = nil
		custom_auto.command.b.bg = nil
		custom_auto.command.c.bg = nil
		custom_auto.inactive.b.bg = nil
		custom_auto.inactive.c.bg = nil


		require("lualine").setup({
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "searchcount", "selectioncount", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			options = {
				separator = nil,
				section_separators = "",
				component_separators = "",
				theme = custom_auto,
			},
		})
	end,
}
--]]

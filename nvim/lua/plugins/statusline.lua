return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

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
        theme = custom_auto,
      },
    })
  end,
}

--[[
return {
	--status line (the bar at the bottom)
	"MunifTanjim/nougat.nvim",
	opts = { event = "UIEnter" },
	config = function(opts)
		local nougat = require("nougat")
		local core = require("nougat.core")
		local Bar = require("nougat.bar")
		local Item = require("nougat.item")
		local sep = require("nougat.separator")
		local customColor = {
			bg = "#1d2021",
			bg0_h = "#1d2021",
			bg0 = "#282828",
			bg0_s = "#32302f",
			bg1 = "#3c3836",
			bg2 = "#504945",
			bg3 = "#665c54",
			bg4 = "#7c6f64",
			black = "#ffffff",
			gray = "#928374",
			fg = "#ebdbb2",
			fg0 = "#fbf1c7",
			fg1 = "#ebdbb2",
			fg2 = "#d5c4a1",
			fg3 = "#bdae93",
			fg4 = "#a89984",
			lightgray = "#a89984",
			red = "#fb4934",
			green = "#b8bb26",
			yellow = "#fabd2f",
			blue = "#83a598",
			purple = "#d3869b",
			aqua = "#8ec07c",
			orange = "#f38019",
			cyan = "#02DED3",
			sunflower1 = "#FBDD9D",
			sunflower2 = "#E8B12D",
			sunflower3 = "#4F4E28",
			sunflower4 = "#925F17",
			sunflower5 = "#E9BF59",
			accent = {
				red = "#cc241d",
				green = "#98971a",
				yellow = "#d79921",
				blue = "#458588",
				purple = "#b16286",
				aqua = "#689d6a",
				orange = "#d65d0e",
			},
		}
		local nut = {
			buf = {
				diagnostic_count = require("nougat.nut.buf.diagnostic_count").create,
				filename = require("nougat.nut.buf.filename").create,
				filetype = require("nougat.nut.buf.filetype").create,
			},
			git = {
				branch = require("nougat.nut.git.branch").create,
				status = require("nougat.nut.git.status"),
			},
			tab = {
				tablist = {
					tabs = require("nougat.nut.tab.tablist").create,
					close = require("nougat.nut.tab.tablist.close").create,
					icon = require("nougat.nut.tab.tablist.icon").create,
					label = require("nougat.nut.tab.tablist.label").create,
					modified = require("nougat.nut.tab.tablist.modified").create,
				},
			},
			mode = require("nougat.nut.mode").create,
			spacer = require("nougat.nut.spacer").create,
			truncation_point = require("nougat.nut.truncation_point").create,
		}
		---@type nougat.color
		local color = require("nougat.color").get()
		local mode = nut.mode({
			sep_left = sep.left_half_circle_solid(true),
			sep_right = sep.right_half_circle_solid(true),
		})
		local mode = nut.mode({
			prefix = " ",
			suffix = " ",
			sep_right = sep.right_chevron_solid(true),
			config = {
				highlight = {
					normal = {
						bg = customColor.sunflower1,
						fg = color.bg,
					},
					visual = {
						bg = customColor.sunflower2,
						fg = color.bg,
					},
					insert = {
						bg = customColor.sunflower3,
						fg = color.bg,
					},
					replace = {
						bg = customColor.sunflower4,
						fg = color.bg,
					},
					commandline = {
						bg = customColor.sunflower5,
						fg = color.bg,
					},
					terminal = {
						bg = color.accent.green,
						fg = color.bg,
					},
					inactive = {},
				},
			},
		})
		local filename = (function()
			local item = Item({
				prepare = function(_, ctx)
					local bufnr, data = ctx.bufnr, ctx.ctx
					data.readonly = vim.api.nvim_buf_get_option(bufnr, "readonly")
					data.modifiable = vim.api.nvim_buf_get_option(bufnr, "modifiable")
					data.modified = vim.api.nvim_buf_get_option(bufnr, "modified")
				end,
				sep_left = sep.left_half_circle_solid(true),
				content = {
					Item({
						hl = { bg = customColor.sunflower3, fg = color.fg },
						hidden = function(_, ctx)
							return not ctx.ctx.readonly
						end,
						suffix = " ",
						content = "RO",
					}),
					Item({
						hl = { bg = customColor.sunflower3, fg = color.fg },
						hidden = function(_, ctx)
							return ctx.ctx.modifiable
						end,
						content = "",
						suffix = " ",
					}),
					nut.buf.filename({
						hl = { bg = customColor.sunflower5, fg = color.bg },
						prefix = function(_, ctx)
							local data = ctx.ctx
							if data.readonly or not data.modifiable then
								return " "
							end
							return ""
						end,
						suffix = function(_, ctx)
							local data = ctx.ctx
							if data.modified then
								return " "
							end
							return ""
						end,
					}),
					Item({
						hl = { bg = customColor.sunflower3, fg = color.fg },
						hidden = function(_, ctx)
							return not ctx.ctx.modified
						end,
						prefix = " ",
						content = "+",
					}),
				},
				sep_right = sep.right_half_circle_solid(true),
			})
			return item
		end)()
		local ruler = (function()
			local scroll_hl = {
				[true] = { bg = customColor.sunflower4, fg = color.bg },
				[false] = { bg = color.bg4 },
			}
			local item = Item({
				content = {
					Item({
						hl = { bg = customColor.sunflower5, fg = color.bg },
						sep_left = sep.left_half_circle_solid(true),
						content = core.group({
							core.code("l"),
							":",
							core.code("c"),
						}, { align = "left", min_width = 8 }),
						suffix = " ",
					}),
					Item({
						hl = function(_, ctx)
							return scroll_hl[ctx.is_focused]
						end,
						prefix = " ",
						content = core.code("P"),
						sep_right = sep.right_half_circle_solid(true),
					}),
				},
			})
			return item
		end)()
		-- renders space only when item is rendered
		---@param item NougatItem
		local function paired_space(item)
			return Item({
				content = sep.space().content,
				hidden = item,
			})
		end
		local stl = Bar("statusline")
		stl:add_item(mode)
		stl:add_item(sep.space())
		stl:add_item(nut.git.branch({
			hl = { bg = customColor.sunflower4, fg = color.bg },
			sep_left = sep.left_half_circle_solid(true),
			prefix = " ",
			sep_right = sep.right_half_circle_solid(true),
		}))
		stl:add_item(sep.space())
		local gitstatus = stl:add_item(nut.git.status.create({
			hl = { fg = color.bg },
			sep_left = sep.left_half_circle_solid(true),
			content = {
				nut.git.status.count("added", {
					hl = { bg = customColor.sunflower2 },
					prefix = "+",
					suffix = function(_, ctx)
						return (ctx.gitstatus.changed > 0 or ctx.gitstatus.removed > 0) and " " or ""
					end,
				}),
				nut.git.status.count("changed", {
					hl = { bg = customColor.sunflower3 },
					prefix = function(_, ctx)
						return ctx.gitstatus.added > 0 and " ~" or "~"
					end,
					suffix = function(_, ctx)
						return ctx.gitstatus.removed > 0 and " " or ""
					end,
				}),
				nut.git.status.count("removed", {
					hl = { bg = color.red },
					prefix = function(_, ctx)
						return (ctx.gitstatus.added > 0 or ctx.gitstatus.changed > 0) and " -" or "-"
					end,
				}),
			},
			sep_right = sep.right_half_circle_solid(true),
		}))
		stl:add_item(paired_space(gitstatus))
		stl:add_item(filename)
		stl:add_item(sep.space())
		stl:add_item(nut.spacer())
		stl:add_item(nut.truncation_point())
		stl:add_item(nut.buf.filetype({
			hl = { bg = customColor.sunflower4, fg = color.bg },
			sep_left = sep.left_half_circle_solid(true),
			sep_right = sep.right_half_circle_solid(true),
		}))
		stl:add_item(sep.space())
		local diagnostic_count = stl:add_item(nut.buf.diagnostic_count({
			hl = { bg = customColor.sunflower3 },
			sep_left = sep.left_half_circle_solid(true),
			sep_right = sep.right_half_circle_solid(true),
			config = {
				error = { prefix = " " },
				warn = { prefix = " " },
				info = { prefix = " " },
				hint = { prefix = "󰌶 " },
			},
		}))
		stl:add_item(paired_space(diagnostic_count))
		stl:add_item(ruler)
		stl:add_item(sep.space())
		local stl_inactive = Bar("statusline")
		stl_inactive:add_item(mode)
		stl_inactive:add_item(sep.space())
		stl_inactive:add_item(filename)
		stl_inactive:add_item(sep.space())
		stl_inactive:add_item(nut.spacer())
		stl_inactive:add_item(ruler)
		stl_inactive:add_item(sep.space())
		nougat.set_statusline(function(ctx)
			return ctx.is_focused and stl or stl_inactive
		end)
	end,
}
--]]

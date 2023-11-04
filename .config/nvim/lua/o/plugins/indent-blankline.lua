return {
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = {
			"hiphish/rainbow-delimiters.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		config = function()
			local ibl = require("ibl")
			local hooks = require("ibl.hooks")
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			vim.g.rainbow_delimiters = { highlight = highlight }

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

			ibl.setup({

				indent = {
					char = "⏐",
				},
				scope = {
					enabled = true,
					show_start = true,
					highlight = highlight,
				},
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"dashboard",
						"NvimTree",
						"Trouble",
						"notify",
						"mason",
						"lazy",
					},
				},
			})
		end,
	},
}

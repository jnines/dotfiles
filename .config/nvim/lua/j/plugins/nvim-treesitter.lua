---@diagnostic disable: missing-fields
return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"tree-sitter/tree-sitter-regex",
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			local tsctx = require("treesitter-context")

			vim.keymap.set("n", "<leader>gc", function()
				tsctx.go_to_context()
			end, { silent = true, desc = "Goto context" })

			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = { enable = true },
				autotag = {
					enable = true,
				},
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"php",
					"css",
					"markdown",
					"markdown_inline",
					"bash",
					"lua",
					"vim",
					"python",
					"dockerfile",
					"gitignore",
					"go",
					"query",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
}

return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},

			format_on_save = { timeout_ms = 500, lsp_fallback = true },

			formatters = {
				prettier = {
					prepend_args = { "--single-quote", "--jsx-single-quote" },
				},
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>,", function()
			conform.format({
				timeout_ms = 1000,
				lsp_fallback = true,
				async = false,
			})
		end, { desc = "Format file or section" })
	end,
}

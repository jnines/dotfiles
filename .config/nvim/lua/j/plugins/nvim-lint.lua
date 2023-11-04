return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			markdown = { "vale" },
			html = { "vale" },
			php = { "php" },
			yaml = { "yamllint" },
			javascript = { "eslint" },
			json = { "jsonlint" },
			typescript = { "eslint" },
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },
			bash = { "shellcheck" },
			go = { "golangci-lint" },
			python = { "flake8" },
			lua = { "luacheck" },
		}

		lint.linters.luacheck.args = {
			"--formatter",
			"plain",
			"--codes",
			"--ranges",
			"--globals = vim",
			"-",
		}

		local lint_aug = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_aug,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>.", function()
			lint.try_lint()
		end, { desc = "Lint current file" })
	end,
}

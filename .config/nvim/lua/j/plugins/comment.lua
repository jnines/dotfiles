---@diagnostic disable: missing-fields
return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true, opts = { enable_autocmd = false } },
	},
	config = function()
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		comment.setup({
			mappings = {
				basic = true,
				extra = false,
			},
			-- tsx/jsx files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
		vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle line comments" })
		vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Toggle block comments" })
	end,
}

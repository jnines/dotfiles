return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local gs = require("gitsigns")

		gs.setup({
			signs = {
				add = { text = "+" },
				change = { text = "±" },
				untracked = { text = "ü" },
			},
		})
	end,
}

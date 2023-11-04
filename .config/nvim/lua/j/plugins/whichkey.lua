return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			key_labels = {
				["<tab>"] = "TAB",
				["<space>"] = "SPC",
				["<leader>"] = "SPC",
			},
		})

		wk.register({
			["<leader>b"] = { name = "Buffers" },
			["<leader>e"] = { name = "File Tree" },
			["<leader>d"] = { name = "Diagnostics" },
			["<leader>f"] = { name = "File" },
			["<leader>g"] = { name = "GoTo" },
			["<leader>h"] = { name = "Harpoon" },
			["<leader>i"] = { name = "Icons" },
			["<leader>q"] = { "<cmd>xa<CR><cmd>qa<CR>", "Quit" },
			["<leader>r"] = { name = "Rename" },
			["<leader>s"] = { name = "Splits" },
			["<leader>t"] = { name = "Tabs" },
			["<leader>x"] = { name = "Extras" },
		})
	end,
}

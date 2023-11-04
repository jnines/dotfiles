return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local h_mark = require("harpoon.mark")
		local h_ui = require("harpoon.ui")
		local km = vim.keymap

		km.set("n", "<leader>hm", h_mark.add_file, { desc = "Mark file" })
		km.set("n", "<leader>hh", h_ui.toggle_quick_menu, { desc = "Marks menu" })
		km.set("n", "<leader>hk", h_ui.nav_prev, { desc = "Previous mark" })
		km.set("n", "<leader>hj", h_ui.nav_next, { desc = "Next mark" })
	end,
}

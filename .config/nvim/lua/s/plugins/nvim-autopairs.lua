return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local autopairs = require("nvim-autopairs")

		autopairs.setup({
			check_ts = true,
			ts_config = {
				javascript = { "template_string" },
			},
		})

		-- autopairs completion
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		-- completions
		local cmp = require("cmp")

		-- smash them together
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}

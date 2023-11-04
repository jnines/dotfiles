return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local lazy = require("lazy")

		local head = [[

                                             
      ████ ██████           █████      ██
     ███████████             █████ 
     █████████ ███████████████████ ███   ███████████
    █████████  ███    █████████████ █████ ██████████████
   █████████ ██████████ █████████ █████ █████ ████ █████
 ███████████ ███    ███ █████████ █████ █████ ████ █████
██████  █████████████████████ ████ █████ █████ ████ ██████

⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛⍛

        ]]

		dashboard.section.header.val = vim.split(head, "\n")
		dashboard.section.buttons.val = {
			dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
			dashboard.button("g", "🔍" .. " Find text", ":Telescope live_grep <CR>"),
			dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
			dashboard.button("q", " " .. " Quit", ":qa<CR>"),
		}
		dashboard.section.header.opts.hl = "AlphaHeader"

		alpha.setup(dashboard.opts)
		vim.api.nvim_create_autocmd("User", {
			callback = function()
				local stats = lazy.stats()
				local ms = math.floor(stats.startuptime * 100) / 100
				dashboard.section.footer.val = "󱐌 Lazy-loaded " .. stats.loaded .. " plugins in " .. ms .. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
		vim.opt_local.statuscolumn = ""
	end,
}

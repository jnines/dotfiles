local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "s.plugins" }, { import = "s.plugins.lsp" } }, {
	install = {
		colorscheme = { "material" },
	},
	change_detection = {
		notify = false,
	},
	vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" }),
})

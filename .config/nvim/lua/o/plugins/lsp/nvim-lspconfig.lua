return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"folke/neodev.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"b0o/schemastore.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		require("neodev").setup()

		local lspconfig = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function(_, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			local km = vim.keymap

			km.set("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>", { desc = "Goto references" })
			km.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
			km.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Goto definitions" })
			km.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Goto implementations" })
			km.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Goto type definitions" })
			km.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
			km.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
			km.set("v", "<leader>rs", 'y:%s/<C-r>"//<left>', { desc = "Rename section" })
			km.set("n", "<leader>db", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Buffer diagnostics" })
			km.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Line diagnostics" })
			km.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
			km.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
			km.set("n", "K", vim.lsp.buf.hover, { desc = "Selection documentation" })
			km.set("n", "<leader>xx", ":LspRestart<CR>", { desc = "Restart LSP" })
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local schemas = require("schemastore")

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig.bashls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = schemas.json.schemas(),
					validate = { enable = true },
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.yamlls.setup({
			settings = {
				yaml = {
					schemaStore = { enable = false, url = "" },
					schemas = schemas.yaml.schemas(),
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = { vim.env.VIMRUNTIME },
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
					completion = {
						callSnipper = "Replace",
					},
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}

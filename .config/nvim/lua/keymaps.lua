vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap

km.set({ "n", "i", "v" }, "<c-q>", vim.cmd.q, { desc = "exit" })
km.set({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", { desc = "Save Buffer" })
km.set({ "n", "i", "v" }, "<C-z>", "<Esc>:wq<CR>", { desc = "Save Buffer and Exit" })

km.set({ "n", "i" }, "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
km.set({ "n", "i" }, "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })

km.set("n", "Y", "Yg_", { desc = "Yank line without whitespace" })
km.set("n", "<C-down>", "<S-v>yp", { desc = "Copy line down" })
km.set("n", "<leader>sl", "<C-w>l", { desc = "Move to split right" })
km.set("n", "<leader>sh", "<C-w>h", { desc = "Move to split left" })
km.set("n", "<leader>sj", "<C-w>j", { desc = "Move to split down" })
km.set("n", "<leader>sk", "<C-w>k", { desc = "Move to split right" })
km.set("n", "<leader>tl", vim.cmd.tabn, { desc = "Next tab" })
km.set("n", "<leader>th", vim.cmd.tabp, { desc = "Previous tab" })
km.set("n", "<leader>xo", vim.cmd.so, { desc = "Source file" })
km.set("n", "<leader>bm", vim.cmd.buffers, { desc = "Buffer menu" })
km.set("n", "<leader>bn", vim.cmd.bn, { desc = "Buffer next" })
km.set("n", "<leader>bp", vim.cmd.bp, { desc = "Buffer previous" })

km.set("i", "<C-k>", "<Esc>O", { desc = "Open to line above" })
km.set("i", "<C-j>", "<Esc>o", { desc = "Open to line below" })
km.set("i", ",", ",<C-g>u", { desc = "Create undo breakpoint at ," })
km.set("i", ".", ".<C-g>u", { desc = "Create undo breakpoint at ." })
km.set("i", "!", "!<C-g>u", { desc = "Create undo breakpoint at !" })
km.set("i", "?", "?<C-g>u", { desc = "Create undo breakpoint at ?" })
km.set("i", "{", "{<C-g>u", { desc = "Create undo breakpoint at {" })
km.set("i", "[", "[<C-g>u", { desc = "Create undo breakpoint at [" })

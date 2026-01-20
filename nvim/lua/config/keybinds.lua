--SET THE MOVMENT TO BE RIGHT!!--
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")

--Set leader ket--
vim.g.mapleader = "`"

--Set binds with leader--
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

--LINTER KEYBINDS--
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fs", "<cmd>w<cr><esc>", { desc = "File save" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to bottom window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to top window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<leader>wq", "<C-w>c", { desc = "Window quit" })
vim.keymap.set("n", "<leader>wc", "<C-w>c", { desc = "Window close" })

-- Neogit
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })
vim.keymap.set("n", "<leader>gs", "<cmd>Neogit kind=auto<cr>", { desc = "Neogit status" })

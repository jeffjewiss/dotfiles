-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
local function nmap(comb, cmd, desc)
  vim.api.nvim_set_keymap("n", comb, cmd, { noremap = true, silent = true, desc = desc })
end

keymap("n", "<leader>fs", "<cmd>w<cr><esc>", { desc = "File save" })

-- Smooth scrolling
nmap("n", "<C-d>", "<C-d>zz")
nmap("n", "<C-u>", "<C-u>zz")
vim.o.scrolloff = 8

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

--  Searching files
nmap("<C-p>", ':lua require"telescope.builtin".git_files{use_git_root=false} <CR>', "Search git files")
nmap("<C-f>", "<CMD> Telescope live_grep <CR>", "Grep through files")

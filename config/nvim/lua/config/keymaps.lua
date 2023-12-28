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
local nor_opts = function(desc)
  return { noremap = true, silent = true, desc = desc }
end
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>fs", "<cmd>w<cr><esc>", nor_opts("File save"))

-- Smooth scrolling
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
vim.o.scrolloff = 8

-- Move to window using the <ctrl> hjkl keys
keymap("n", "<leader>wh", "<C-w>h", nor_opts("Go to left window"))
keymap("n", "<leader>wj", "<C-w>j", { desc = "Go to bottom window" })
keymap("n", "<leader>wk", "<C-w>k", { desc = "Go to top window" })
keymap("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })
keymap("n", "<leader>wq", "<C-w>c", { desc = "Window quit" })
keymap("n", "<leader>wc", "<C-w>c", { desc = "Window close" })

-- Neogit
keymap("n", "<leader>gg", "<cmd>Neogit<cr>", nor_opts("Neogit"))
keymap("n", "<leader>gs", "<cmd>Neogit kind=auto<cr>", nor_opts("Neogit status"))

--  Searching files
-- keymap("<C-p>", ':lua require"telescope.builtin".git_files{use_git_root=false} <CR>', "Search git files", opts)
-- keymap("<C-f>", "<CMD> Telescope live_grep <CR>", "Grep through files", opts)

-- Package Info
keymap("n", "<LEADER>cps", "<cmd>lua require('package-info').show()<cr>", nor_opts("Show package versions"))
keymap("n", "<LEADER>cpc", "<cmd>lua require('package-info').hide()<cr>", nor_opts("Hide package versions"))

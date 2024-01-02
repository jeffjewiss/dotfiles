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
keymap("n", "<leader>wj", "<C-w>j", nor_opts("Go to bottom window"))
keymap("n", "<leader>wk", "<C-w>k", nor_opts("Go to top window"))
keymap("n", "<leader>wl", "<C-w>l", nor_opts("Go to right window"))
keymap("n", "<leader>wc", "<C-w>c", nor_opts("Close window"))
keymap("n", "<leader>wq", "<C-w>c", nor_opts("Quit window"))
keymap("n", "<leader>ws", "<C-w>s", nor_opts("Split window below"))
keymap("n", "<leader>wv", "<C-w>v", nor_opts("Split window to the right"))

-- Neogit
keymap("n", "<leader>gg", "<cmd>Neogit kind=auto<cr>", nor_opts("Neogit status"))
keymap("n", "<leader>gs", "<cmd>Neogit kind=auto<cr>", nor_opts("Neogit status"))

--  Searching files
-- keymap("<C-p>", ':lua require"telescope.builtin".git_files{use_git_root=false} <CR>', "Search git files", opts)
-- keymap("<C-f>", "<CMD> Telescope live_grep <CR>", "Grep through files", opts)

-- UI
keymap("n", "<leader>uz", "<cmd>ZenMode<cr>", nor_opts("Toggle Zen Mode"))
keymap("n", "<leader>umc", "<cmd>lua MiniMap.close()<cr>", nor_opts("Close Mini Map"))
keymap("n", "<leader>umf", "<cmd>lua MiniMap.toggle_focus()<cr>", nor_opts("Toggle Focus Side of Mini Map"))
keymap("n", "<leader>umo", "<cmd>lua MiniMap.open()<cr>", nor_opts("Open Mini Map"))
keymap("n", "<leader>umr", "<cmd>lua MiniMap.refresh()<cr>", nor_opts("Refresh Mini Map"))
keymap("n", "<leader>ums", "<cmd>lua MiniMap.toggle_side()<cr>", nor_opts("Toggle Side of Mini Map"))
keymap("n", "<leader>umt", "<cmd>lua MiniMap.toggle()<cr>", nor_opts("Toggle Mini Map"))

-- Package Info
keymap("n", "<LEADER>cps", "<cmd>lua require('package-info').show()<cr>", nor_opts("Show package versions"))
keymap("n", "<LEADER>cpc", "<cmd>lua require('package-info').hide()<cr>", nor_opts("Hide package versions"))

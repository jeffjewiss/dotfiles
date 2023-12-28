-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local map = require("utils").map
map("i", "#", "#<C-x><C-o>", { silent = true, buffer = true })
map("i", "@", "@<C-x><C-o>", { silent = true, buffer = true })

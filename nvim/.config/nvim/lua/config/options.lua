vim.g.mapleader = " "

--  How to display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}

-- Move between buffers
vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>")
vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>")

vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

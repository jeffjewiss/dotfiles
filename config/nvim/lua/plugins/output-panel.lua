return {
  {
    "mhanberg/output-panel.nvim",
    event = "VeryLazy",
    config = function()
      require("output_panel").setup()
    end,
    keys = {
      {
        "<leader>co",
        "<cmd>OutputPanel<cr>",
        desc = "Show output panel (lsp)",
      },
    },
  },
}

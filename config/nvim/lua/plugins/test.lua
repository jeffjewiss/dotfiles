return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "marilari88/neotest-vitest",
      "haydenmeade/neotest-jest",
      "thenbe/neotest-playwright",
      "jfpedroza/neotest-elixir",
      "nvim-neotest/neotest-vim-test",
    },
    opts = {
      adapters = {
        "neotest-vitest",
        "neotest-playwright",
        ["neotest-jest"] = {
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
        ["neotest-elixir"] = {
          extra_formatters = { "ExUnit.CLIFormatter", "ExUnitNotifier" },
        },
        ["neotest-vim-test"] = {
          ignore_filetypes = { "elixir", "javascript", "typescript" },
        },
      },
    },
  },
}

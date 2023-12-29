return {
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", lazy = true },
    },
    event = { "LazyFile", "VeryLazy" },
    config = function()
      -- Load treesitter grammar for org
      require("orgmode").setup_ts_grammar()

      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/org/**/*",
        org_default_notes_file = "~/org/refile.org",
      })

      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "org" },
        },
        ensure_installed = { "org" }, -- Or run :TSUpdate org
      })
    end,
  },
  {
    "akinsho/org-bullets.nvim",
    config = function()
      require("org-bullets").setup({
        concealcursor = true,
        symbols = {
          checkboxes = {
            -- done = { "✓", "OrgDone" },
            -- todo = { " ", "OrgTODO" },
          },
        },
      })
    end,
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup({
        sources = {
          { name = "orgmode" },
        },
      })
    end,
  },
}

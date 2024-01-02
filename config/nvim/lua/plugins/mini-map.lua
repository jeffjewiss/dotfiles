return {
  {
    "echasnovski/mini.map",
    version = "*",
    dependencies = "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      local map = require("mini.map")

      map.setup({
        symbols = {
          encode = map.gen_encode_symbols.dot("3x2"),
          scroll_line = "▶ ",
          scroll_view = "┃ ",
        },
        window = {
          show_integration_count = false,
          width = 13,
        },
        integrations = {
          map.gen_integration.gitsigns({
            add = "GitSignsAdd",
            change = "GitSignsChange",
            delete = "GitSignsDelete",
          }),
          map.gen_integration.diagnostic({
            error = "DiagnosticFloatingError",
            warn = "DiagnosticFloatingWarn",
            info = "DiagnosticFloatingInfo",
            hint = "DiagnosticFloatingHint",
          }),
        },
      })

      -- vim.cmd("au VimEnter * lua MiniMap.open()")
    end,
  },
}

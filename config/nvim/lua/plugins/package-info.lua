return {
  {
    "vuki656/package-info.nvim",
    ft = "json",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local wk = require("which-key")

      require("package-info").setup()

      wk.register({
        p = {
          name = "Package Info",
        },
      }, { prefix = "<leader>c" })
    end,
    keys = {
      {
        "<leader>cps",
        "<cmd>lua require('package-info').show()<cr>",
        desc = "Show package version",
      },
      {
        "<leader>cph",
        "<cmd>lua require('package-info').hide()<cr>",
        desc = "Hide package version",
      },
    },
  },
}

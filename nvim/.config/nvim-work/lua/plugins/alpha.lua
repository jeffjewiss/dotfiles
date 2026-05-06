return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[

██╗   ██╗███████╗███╗   ██╗ █████╗  ██████╗ ██████╗ ██████╗ ██████╗
██║   ██║██╔════╝████╗  ██║██╔══██╗██╔════╝██╔═══██╗██╔══██╗██╔══██╗
██║   ██║█████╗  ██╔██╗ ██║███████║██║     ██║   ██║██████╔╝██████╔╝
╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██╔══██║██║     ██║   ██║██╔══██╗██╔═══╝
 ╚████╔╝ ███████╗██║ ╚████║██║  ██║╚██████╗╚██████╔╝██║  ██║██║
  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝
    ]]

    dashboard.section.header.val = vim.split(logo, "\n")
    alpha.setup(dashboard.opts)
  end,
}

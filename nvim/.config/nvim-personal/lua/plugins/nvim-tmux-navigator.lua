return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    require("nvim-tmux-navigation").setup({
      disable_when_zoomed = true, -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      },
    })

    local function tmux_command(command)
      local tmux_socket = vim.fn.split(vim.env.TMUX, ",")[1]
      return vim.fn.system("tmux -S " .. tmux_socket .. " " .. command)
    end

    local nvim_tmux_nav_group = vim.api.nvim_create_augroup("NvimTmuxNavigation", {})

    vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
      group = nvim_tmux_nav_group,
      callback = function()
        tmux_command("set-option -p @is_vim yes")
      end,
    })

    vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
      group = nvim_tmux_nav_group,
      callback = function()
        tmux_command("set-option -p -u @is_vim")
      end,
    })
  end,
}

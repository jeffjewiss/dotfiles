return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      mux = {
        backend = "tmux",
        enabled = true,
        create = "split",
        split = {
          vertical = true,
          size = 0.4,
        },
      },
    },
  },
  keys = {},
}

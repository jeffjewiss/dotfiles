return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-elixir"] = {
          extra_formatters = { "ExUnit.CLIFormatter", "ExUnitNotifier" },
        },
        "neotest-jest",
        "neotest-playwright",
      },
    },
  },
}

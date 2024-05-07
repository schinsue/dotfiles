return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
    "jfpedroza/neotest-elixir",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-python",
    "mrcjkb/rustaceanvim",
  },
  config = function()
    local neotest = require("neotest")

    neotest.setup({
      adapters = {
        require("neotest-elixir"),
        require("neotest-vitest"),
        require("rustaceanvim.neotest"),
        require("neotest-go"),
        require("neotest-python"),
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      },
    })

    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>mr", function()
      neotest.run.run()
    end, { desc = "Run nearest test" })

    keymap.set("n", "<leader>ma", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run test in current file" })

    keymap.set("n", "<leader>mb", function()
      neotest.run.run({ strategy = "dap" })
    end, { desc = "Run nearest test in debug mode" })

    keymap.set("n", "<leader>ms", function()
      neotest.summary.toggle()
    end, { desc = "Open Summary" })

    keymap.set("n", "<leader>mo", function()
      neotest.output_panel.toggle()
    end, { desc = "Open Output Panel" })
  end,
}

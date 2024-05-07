return {
  "ggandor/leap.nvim",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- set keymaps
    local map = vim.keymap.set

    map({ "n", "x" }, "s", "<Plug>(leap)")
    map({ "o" }, "gs", "<Plug>(leap)")
    map({ "n", "x" }, "gs", "<Plug>(leap-from-window)")
  end,
}

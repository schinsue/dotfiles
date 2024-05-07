return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local harpoon = require("harpoon")

    local keymap = vim.keymap -- for conciseness

    -- required
    harpoon.setup({})
    local function toggle_telescope_with_harpoon(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = require("telescope.config").values.file_previewer({}),
          sorter = require("telescope.config").values.generic_sorter({}),
        })
        :find()
    end

    keymap.set("n", "<leader>h", function()
      toggle_telescope_with_harpoon(harpoon:list())
    end, { desc = "Open harpoon window" })

    keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle Harpoon menu" })

    keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Mark current file" })

    keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end, { desc = "Navigate to next file" })

    keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end, { desc = "Navigate to previous file" })

    keymap.set("n", "<leader>hd", function()
      harpoon:list():remove()
    end, { desc = "Delete current file" })

    keymap.set("n", "<leader>h1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon to file 1" })

    keymap.set("n", "<leader>h2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon to file 2" })

    keymap.set("n", "<leader>h3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon to file 3" })
  end,
}

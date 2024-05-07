return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    _Gopts = {
      position = "center",
      hl = "Type",
      -- wrap = "overflow";
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "   New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "   Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼   Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "   Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("r", "󰁯   Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("SPC wr", "󰈚   Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("m", "󱌣   Mason", ":Mason<CR>"),
      dashboard.button("l", "󰒲   Lazy", ":Lazy<CR>"),
      dashboard.button("u", "󰂖   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
      dashboard.button("q", "   Quit NVIM", "<cmd>qa<CR>"),
    }

    local function footer()
      return "Sergio Chin-Sue"
    end

    dashboard.section.footer.val = footer()

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

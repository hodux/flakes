return {
  { "oneslash/helix-nvim", version = "*" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "wildcharm",
    },
  },

  {
    "petertriho/nvim-scrollbar",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "kevinhwang91/nvim-hlslens",
    },
    opts = {
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true,
        search = true,
      },
    },
    config = function(_, opts)
      require("hlslens").setup()
      require("scrollbar").setup(opts)
    end,
  },

  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        ignored = true,
        ui_select = false,
        layout = {
          { preview = true },
          layout = {
            box = "horizontal",
            width = 0.8,
            height = 0.8,
            {
              box = "vertical",
              border = "rounded",
              title = "{source} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", border = "rounded", width = 0.7, title = "{preview}" },
          },
        },
        sources = {
          explorer = {
            cycle = true,
            auto_close = true,
            hidden = true,
            ignored = true,
          },
          files = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
}

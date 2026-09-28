return {
  -- nix over mason
  { "mason-org/mason-lspconfig.nvim", enabled = false },
  -- disable <leader><space> for file picker, makes which key show up faster
  keys = { { "<leader><space>", false }, { "<leader><leader>", false } },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nil_ls = { enabled = false },
        nixd = {},
      },
    },
  },

  -- custom layout for file picker
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        -- hidden = true,
        -- ignored = true,
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
            -- hidden = true,
            -- ignored = true,
          },
          files = {
            -- hidden = true,
            -- ignored = true,
          },
        },
      },
    },
  },
}

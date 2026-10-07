return {
  -- default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "wildcharm",
    },
  },

  -- nix over mason
  { "mason-org/mason-lspconfig.nvim", enabled = false },

  {
    "neovim/nvim-lspconfig",
    opts = {
      -- disable inlay hints by default
      inlay_hints = {
        enabled = false,
      },
      servers = {
        -- use nixd instead of nil
        nil_ls = { enabled = false },
        nixd = {},
        -- disable placeholders
        gopls = {
          settings = {
            gopls = {
              usePlaceholders = false,
            },
          },
        },
      },
    },
  },

  -- disable <leader><space> for file picker, makes "which key" show up faster
  keys = { { "<leader><space>", false }, { "<leader><leader>", false } },

  -- custom layout for file picker & dashboard use neovim-project
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
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
          },
          files = {},
        },
      })

      if opts.dashboard and opts.dashboard.preset and opts.dashboard.preset.keys then
        for _, button in ipairs(opts.dashboard.preset.keys) do
          if button.key == "p" then
            button.action = ":NeovimProjectDiscover"
            button.desc = "Projects"
          end
        end
      end

      return opts
    end,
  },
}

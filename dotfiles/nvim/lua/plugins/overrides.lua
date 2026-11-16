return {
  -- default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      background = {
        light = "latte",
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        snacks = true,
        telescope = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.special.bufferline").get_theme()
          end
        end,
      },
    },
  },

  -- nix over mason
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },
  { "jay-babu/mason-null-ls.nvim", enabled = false },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = {
            "--config",
            vim.fn.json_encode({
              config = {
                MD013 = false, -- Disables line-length check
              },
            }),
            "--",
          },
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      -- disable inlay hints by default
      -- inlay_hints = {
      --   enabled = false,
      -- },
      servers = {
        -- use nixd instead of nil
        nil_ls = { enabled = false },
        nixd = {
          settings = {
            nixd = {
              formatting = {
                command = { "nixfmt" },
              },
              nixpkgs = {
                expr = 'import (builtins.getFlake "/home/rintaro/projects/nixos-config").inputs.nixpkgs { }',
              },
              options = {
                nixos = {
                  expr = 'let flake = builtins.getFlake "/home/rintaro/projects/nixos-config"; host = builtins.replaceStrings ["\\n"] [""] (builtins.readFile "/etc/hostname"); in flake.nixosConfigurations.${host}.options',
                },
                ["home-manager"] = {
                  expr = 'let flake = builtins.getFlake "/home/rintaro/projects/nixos-config"; host = builtins.replaceStrings ["\\n"] [""] (builtins.readFile "/etc/hostname"); in flake.nixosConfigurations.${host}.options.home-manager.users.type.getSubOptions []',
                },
              },
            },
          },
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
  },

  -- disable <leader><space> for file picker, makes "which key" show up faster
  keys = { { "<leader><space>", false }, { "<leader><leader>", false } },

  -- custom layout for file picker & dashboard uses neovim-project
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.image = vim.tbl_deep_extend("force", opts.image or {}, {
        enabled = true,
        doc = {
          inline = true, -- renders formulas inline directly in the buffer
          float = true, -- fallback floating preview if needed
          max_width = 80,
          max_height = 40,
        },
        math = {
          enabled = true, -- compiles LaTeX to PDF via tectonic -> PNG via magick
        },
      })
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
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      latex = {
        enabled = false, -- let snacks.image handle the math
      },
    },
  },
}

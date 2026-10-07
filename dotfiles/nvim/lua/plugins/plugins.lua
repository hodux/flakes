return {
  -- helix theme
  { "oneslash/helix-nvim", version = "*" },

  -- gitsigns scrollbar
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

  -- vscode-like project switching
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/projects/*",
      },
      dashboard_mode = true,
      picker = {
        type = "snacks", -- one of "telescope", "fzf-lua", or "snacks"
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "folke/snacks.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },
}

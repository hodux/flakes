return {
  { "oneslash/helix-nvim", version = "*" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "helix",
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

}

return {
  {
    "coffebar/neovim-project",
    opts = {
      projects = {
        "~/projects/*",
        "~/dev/*",
        "~/work/*",
        "~/.config/nvim",
      },
      last_session_on_startup = false,
      dashboard_mode = true,
      picker = {
        type = "telescope",
      },
    },
    init = function()
      vim.opt.sessionoptions:append("curdir")
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },
}

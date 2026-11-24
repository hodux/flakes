-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, ";", ":", { desc = "Enter Command Mode" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste before from system clipboard" })

-- open external terminal (kitty)
vim.keymap.set("n", "<leader>tk", function()
  local root = LazyVim.root()
  vim.fn.jobstart({ "kitty", "--directory", root }, { detach = true })
end, { desc = "Open External Terminal (kitty)" })

-- open external file manager (nautilus)
vim.keymap.set("n", "<leader>te", function()
  local root = LazyVim.root()
  vim.fn.jobstart({ "nautilus", root }, { detach = true })
end, { desc = "Open External File Manager (nautilus)" })

-- for vscode neovim extension
if vim.g.vscode then
  local vscode = require("vscode")

  -- Project & Files
  vim.keymap.set("n", "<leader>fl", function()
    vscode.action("workbench.action.openRecent")
  end, { desc = "Switch Project (Workspace)" })
  vim.keymap.set("n", "<leader>fp", function()
    vscode.action("workbench.action.files.openFolder")
  end, { desc = "Recent Projects" })
  vim.keymap.set("n", "<C-p>", function()
    vscode.action("workbench.action.quickOpen")
  end, { desc = "Find Files" })
  vim.keymap.set("n", "<leader>ff", function()
    vscode.action("workbench.action.quickOpen")
  end, { desc = "Find Files" })
  vim.keymap.set("n", "<leader>fn", function()
    vscode.action("workbench.action.files.newUntitledFile")
  end, { desc = "New File" })
  vim.keymap.set("n", "<leader>fr", function()
    vscode.action("workbench.action.openRecent")
  end, { desc = "Recent" })
  vim.keymap.set("n", "<leader>e", function()
    vscode.action("workbench.action.toggleSidebarVisibility")
  end, { desc = "Toggle Primary Side Bar" })
  vim.keymap.set("n", "<leader>fe", function()
    vscode.action("workbench.view.explorer")
  end, { desc = "File Explorer" })

  -- Search / Grep
  vim.keymap.set("n", "<leader>sg", function()
    vscode.action("workbench.action.findInFiles")
  end, { desc = "Search in Files" })
  vim.keymap.set("n", "<leader>sw", function()
    vscode.action("workbench.action.findInFiles")
  end, { desc = "Search Word" })

  -- Buffers / Editors
  vim.keymap.set("n", "Q", function()
    vscode.action("workbench.action.closeActiveEditor")
  end, { desc = "Close Editor" })
  vim.keymap.set("n", "<leader>bd", function()
    vscode.action("workbench.action.closeActiveEditor")
  end, { desc = "Close Editor" })
  vim.keymap.set("n", "<leader>bD", function()
    vscode.action("workbench.action.closeOtherEditors")
  end, { desc = "Close Other Editors" })
  vim.keymap.set("n", "<leader>bo", function()
    vscode.action("workbench.action.closeOtherEditors")
  end, { desc = "Close Other Editors" })
  vim.keymap.set("n", "<leader>bb", function()
    vscode.action("workbench.action.showAllEditorsByMostRecentlyUsed")
  end, { desc = "Switch Editor" })

  -- Code / LSP
  vim.keymap.set("n", "<leader>ca", function()
    vscode.action("editor.action.quickFix")
  end, { desc = "Code Action" })
  vim.keymap.set("n", "<leader>cr", function()
    vscode.action("editor.action.rename")
  end, { desc = "Rename" })
  vim.keymap.set("n", "<leader>cf", function()
    vscode.action("editor.action.formatDocument")
  end, { desc = "Format Document" })
  vim.keymap.set("n", "<leader>cd", function()
    vscode.action("editor.action.showHover")
  end, { desc = "Line Diagnostics / Hover" })
  vim.keymap.set("n", "<leader>xx", function()
    vscode.action("workbench.actions.view.problems")
  end, { desc = "Problems / Diagnostics" })
  vim.keymap.set("n", "gd", function()
    vscode.action("editor.action.revealDefinition")
  end, { desc = "Go to Definition" })
  vim.keymap.set("n", "gr", function()
    vscode.action("editor.action.goToReferences")
  end, { desc = "Go to References" })
  vim.keymap.set("n", "gI", function()
    vscode.action("editor.action.goToImplementation")
  end, { desc = "Go to Implementation" })
  vim.keymap.set("n", "gy", function()
    vscode.action("editor.action.goToTypeDefinition")
  end, { desc = "Go to Type Definition" })
  vim.keymap.set("n", "[d", function()
    vscode.action("editor.action.marker.prev")
  end, { desc = "Previous Problem" })
  vim.keymap.set("n", "]d", function()
    vscode.action("editor.action.marker.next")
  end, { desc = "Next Problem" })

  -- Git
  vim.keymap.set("n", "<leader>gg", function()
    vscode.action("workbench.view.scm")
  end, { desc = "Source Control" })
  vim.keymap.set("n", "[h", function()
    vscode.action("workbench.action.editor.previousChange")
  end, { desc = "Previous Change" })
  vim.keymap.set("n", "]h", function()
    vscode.action("workbench.action.editor.nextChange")
  end, { desc = "Next Change" })

  -- Terminal
  vim.keymap.set({ "n", "t" }, "<C-/>", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, { desc = "Toggle Terminal" })
  vim.keymap.set({ "n", "t" }, "<C-_>", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, { desc = "Toggle Terminal" })
else
  -- neovim only
  vim.keymap.set("n", "Q", function()
    Snacks.bufdelete()
  end, { desc = "Delete Buffer" })

  vim.keymap.set("n", "<C-p>", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })

  vim.keymap.set("n", "<leader>fp", "<cmd>NeovimProjectDiscover<cr>", { desc = "Switch Project (Workspace)" })
  vim.keymap.set("n", "<leader>fl", "<cmd>NeovimProjectLoadRecent<cr>", { desc = "Recent Projects" })

  -- Toggle LaTeX / Math rendering (snacks.image & render-markdown)
  Snacks.toggle({
    name = "Render LaTeX",
    get = function()
      return Snacks.image.config.math.enabled ~= false
    end,
    set = function(state)
      Snacks.image.config.math.enabled = state
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          if vim.b[buf].snacks_image_attached then
            vim.api.nvim_exec_autocmds("BufWinEnter", { buffer = buf })
          elseif state then
            local ft = vim.bo[buf].filetype
            local lang = vim.treesitter.language.get_lang(ft)
            if vim.tbl_contains(Snacks.image.langs(), lang) then
              Snacks.image.doc.attach(buf)
            end
          end
        end
      end
      pcall(function()
        Snacks.image.doc.hover_close()
      end)
      local ok_rm, rm_state = pcall(require, "render-markdown.state")
      if ok_rm and rm_state.config and rm_state.config.latex then
        rm_state.config.latex.enabled = state
        for _, bconf in pairs(rm_state.cache or {}) do
          if bconf.latex then
            bconf.latex.enabled = state
          end
        end
        pcall(function()
          require("render-markdown").render({ buf = vim.api.nvim_get_current_buf() })
        end)
      end
    end,
  })
    :map("<leader>ux")
    :map("<leader>uM")
end

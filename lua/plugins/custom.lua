return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- Ensure this loads before other plugins
    opts = {
      rocks = { "lua-utils", "fzy" }, -- List the rocks you want here
    },
  },

  {
    "preservim/nerdtree",
    -- cmd = { "NERDTreeToggle", "NERDTree" },
    keys = {
      { "<C-n>", ":NERDTreeToggle<CR>" }, -- Trigger NERDTree with Ctrl + n
      -- { "n", "a", ":NERDTREEAdd<CR>", { silent = true } },
    },

    dependencies = {
      -- Devicons for NERDTree
      "ryanoasis/vim-devicons",
    },
    -- lazy = false,
    config = function()
      -- Optional: NERDTree settings (you can add more options here)
      -- vim.g.autochdir = 1
      -- vim.g.NERDTreeQuitOnOpen = 1 -- Close NERDTree after opening a file

      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeWinSize = 30

      vim.g.webdevicons_enable = 1
      vim.g.webdevicons_enable_nerdtree = 1

      -- Folder icons (open / closed)
      vim.g.DevIconsEnableFoldersOpenClose = 1

      -- Enable matching icons for folders & files
      vim.g.DevIconsEnableFolderPatternMatching = 1
      vim.g.DevIconsEnableFolderExtensionPatternMatching = 1

      -- NERDTree appearance tweaks
      vim.g.NERDTreeShowHidden = 1
      -- vim.g.NERDTreeMinimalUI = 1

      -- Better arrows / folder symbols
      vim.g.NERDTreeDirArrowExpandable = ""
      vim.g.NERDTreeDirArrowCollapsible = ""
    end,
  },

  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000, -- IMPORTANT: load before other plugins
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}

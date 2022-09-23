local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "september-23-2022",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Lua Development
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "christianchiarulli/lua-dev.nvim"
  -- use "folke/lua-dev.nvim"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "ray-x/lsp_signature.nvim"
  use "SmiteshP/nvim-navic"
  use "simrat39/symbols-outline.nvim"
  use "RRethy/vim-illuminate"
  -- use "github/copilot.vim"
  use {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.copilot"
      end, 100)
    end,
  }
  use "j-hui/fidget.nvim"
  use "lvimuser/lsp-inlayhints.nvim"
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  use { "semanticart/ruby-code-actions.nvim", requires = "nvim-lua/plenary.nvim" }

  -- Completion
  use "christianchiarulli/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-emoji"
  use "zbirenbaum/copilot-cmp"
  use {
    "tzachar/cmp-tabnine",
    commit = "1a8fd2795e4317fd564da269cc64a2fa17ee854e",
    run = "./install.sh"
  }

  -- Snippet
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Syntax/Treesitter
 use "nvim-treesitter/nvim-treesitter"
 use "JoosepAlviste/nvim-ts-context-commentstring"
 use "p00f/nvim-ts-rainbow"
 use "nvim-treesitter/playground"
 use "windwp/nvim-ts-autotag"
 use "nvim-treesitter/nvim-treesitter-textobjects"
 -- use "wellle/targets.vim"
 -- use "RRethy/nvim-treesitter-textsubjects"
 use "kylechui/nvim-surround"
 use {
   "abecodes/tabout.nvim",
   wants = { "nvim-treesitter" }, -- or require if not used so far
 }

  -- Marks
  use "christianchiarulli/harpoon"

  -- Fuzzy Finder/Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Color
  use "norcalli/nvim-colorizer.lua"
  -- use "ziontee113/color-picker.nvim"
  use "nvim-colortils/colortils.nvim"

  -- Colorschemes
  use "lunarvim/onedarker.nvim"
  use "lunarvim/darkplus.nvim"
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "folke/tokyonight.nvim"

  -- Utility
  use "rcarriga/nvim-notify"
  use "stevearc/dressing.nvim"
  use "ghillb/cybu.nvim"
  use "moll/vim-bbye"
  use "lewis6991/impatient.nvim"

  -- Registers
  use "tversteeg/registers.nvim"

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  -- use "ravenxrz/DAPInstall.nvim"

  -- Statusline
  use "christianchiarulli/lualine.nvim"

  -- Startup
  use "goolord/alpha-nvim"

  -- Indent
  use "lukas-reineke/indent-blankline.nvim"

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"
  use "christianchiarulli/lir.nvim"

  -- Comment
  use "numToStr/Comment.nvim" -- Easily comment stuff

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Project
  use "ahmedkhalf/project.nvim"
  use "windwp/nvim-spectre"

  -- Session
  use "rmagatti/auto-session"
  use "rmagatti/session-lens"

  -- Quickfix
  use "kevinhwang91/nvim-bqf"

  -- Code Runner
  use "is0n/jaq-nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Editting Support
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "andymass/vim-matchup"
  use "karb94/neoscroll.nvim"

  -- Motion
  use "phaazon/hop.nvim"

  -- Keybinding
  use "folke/which-key.nvim"

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- Typescript TODO: set this up, also add keybinds to ftplugin
  use "jose-elias-alvarez/typescript.nvim"

  -- Tabline
  -- use "akinsho/bufferline.nvim"

  -- Graveyard
  -- use { "christianchiarulli/nvim-gps", branch = "text_hl" }
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- use "folke/trouble.nvim"
  -- use "nvim-lua/lsp_extensions.nvim"
  -- use "christianchiarulli/lsp-inlay-hints"
  -- use { "christianchiarulli/JABS.nvim" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

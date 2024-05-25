return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
        { {'nvim-tree/nvim-web-devicons'} },
    },
    opts = function()
      return require('plugins.config.dashboard')
    end,

    config = function(_,opts)
        require('dashboard').setup(opts)
    end,
  },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    }
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip' }
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    event = { "BufRead", "BufWinEnter", "InsertEnter" },

    opts = function()
      return require('plugins.config.treesitter')
    end,

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "plugins.config.nvimtree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    opts = function()
      return require "plugins.config.webdevicons"
    end,
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = function()
      return require "plugins.config.term"
    end,
    config = function(_, opts)
      require("toggleterm").setup(opts)
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = function()
      return require "plugins.config.lualine"
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
  {
    'nvim-lua/lsp-status.nvim',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl", opts = {
      exclude = { filetypes = {'dashboard'}}
    }
  },
  {
    "https://github.com/echasnovski/mini.pairs",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        names = false,   
        RRGGBBAA = true, 
        AARRGGBB = true,
        css = true,
        tailwind = true,
      },
    },
  },

  { "nvimtools/none-ls.nvim" },

}


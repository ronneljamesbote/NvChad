local plugins = {
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    init = require("custom.configs.nvim-dap").init,
    config = require("custom.configs.nvim-dap").config,
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = require("custom.configs.nvim-dap-ui").config,
  },

  {
    "williamboman/mason.nvim",
    opts = require("custom.configs.mason").opts,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    config = require("custom.configs.null-ls").config,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = require("custom.configs.lspconfig").config,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("custom.configs.nvim-treesitter").opts,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = require("custom.configs.nvim-treesitter-textobjects").config,
  },

  {
    "tpope/vim-dadbod",
    lazy = false,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    init = require("custom.configs.vim-dadbod-ui").init,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require("custom.configs.nvim-tree").opts,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = require("custom.configs.better-escape").config,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "mbbill/undotree",
    lazy = false,
    config = require("custom.configs.undotree").config,
  },

  {
    "nvim-tree/nvim-web-devicons",
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = require("custom.configs.trouble").opts,
  },
}

return plugins

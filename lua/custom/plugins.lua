local plugins = {

  {
    "williamboman/mason.nvim",
    opts = require("custom.configs.mason").opts,
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = require("custom.configs.null-ls").config,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvimtools/none-ls.nvim",
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
    commit = "19a91a38b02c1c28c14e0ba468d20ae1423c39b2",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = require("custom.configs.nvim-treesitter-textobjects").config,
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
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = require("custom.configs.trouble").opts,
  },

  {
    "tpope/vim-dadbod",
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
    "mfussenegger/nvim-dap",
    init = require("custom.configs.nvim-dap").init,
    config = require("custom.configs.nvim-dap").config,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = require("custom.configs.nvim-dap-ui").config,
  },
}

return plugins

local plugins = {
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    init = function()
      require("core.utils").load_mappings "dap"
    end,
    config = function()
      local dap = require "dap"

      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { vim.fn.stdpath "data" .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug (Laravel Sail)",
          port = 9003,
          hostname = "127.0.0.1",
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}",
          },
        },
      }
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.mason",
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      return {
        ensure_installed = {
          -- Web
          "html",
          "css",
          "scss",

          -- Programming languages
          "php",
          "javascript",
          "typescript",
          "python",
          "go",
          "java",
          "rust",
          "vim",
          "lua",
          "sql",

          -- Templates
          "blade",
          "twig",

          -- Filetypes
          "tsx",
          "vue",

          -- Others
          "json",
          "markdown",
          "markdown_inline",
          "yaml",
        },
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = { enable = true },
      }
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "mbbill/undotree",
    lazy = false,
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1

      vim.api.nvim_exec(
        [[
          if has("persistent_undo")
             let target_path = expand('~/.local/share/nvim/undodir')

              " create the directory and any parent directories
              " if the location does not exist.
              if !isdirectory(target_path)
                  call mkdir(target_path, "p", 0700)
              endif

              let &undodir=target_path
              set undofile
          endif
      ]],
        false
      )
    end,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = false },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
      mode = "document_diagnostics",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
              ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },

              ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },

              ["aa"] = {
                query = "@parameter.outer",
                desc = "Select outer part of a function parameter/argument region",
              },
              ["ia"] = {
                query = "@parameter.inner",
                desc = "Select inner part of a function parameter/argument region",
              },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
            },
          },
        },
      }
    end,
  },
}

return plugins

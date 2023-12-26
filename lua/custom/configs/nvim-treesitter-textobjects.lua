return {
  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
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
}

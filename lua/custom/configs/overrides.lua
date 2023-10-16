local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "php",
    "sql",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- LSPs
    "lua-language-server",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",
    "eslint-lsp",
    "emmet-ls",
    "phpactor",

    -- Formatters
    "stylua",
    "prettier",
    "pint",
    "blade-formatter",
  },
}

-- git support in nvimtree
M.nvimtree = {
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
}

return M

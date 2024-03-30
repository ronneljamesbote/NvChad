local flatten_tables = require "custom.helpers.flatten_tables"

local required_installed = {
  web = {
    -- LSP
    "css-lsp",
    "html-lsp",
    "emmet-ls",
    "tailwindcss-language-server",

    -- Formatters
    "prettier",
  },

  lua = {
    -- LSP
    "lua-language-server",

    -- Formatters
    "stylua",
  },

  php = {
    -- LSP
    "phpactor",

    -- Diagnostics
    "phpstan",

    -- Formatters
    "pint",

    -- Debuggers
    "php-debug-adapter",
  },

  javascript = {
    -- LSP
    "typescript-language-server",

    -- Linters
    "eslint-lsp",
  },

  go = {
    -- LSP
    "gopls",

    -- Formatters
    "gofumpt",
    "goimports-reviser",

    -- Debuggers
    "delve",

    -- Templating
    "templ",
  },

  python = {
    -- LSP
    "pyright",
    "ruff-lsp",

    -- Diagnostics
    "black",

    -- Linters
    "mypy",
  },

  extra = {
    "marksman",
  },
}

return {
  opts = {
    ensure_installed = flatten_tables(required_installed),
  },
}

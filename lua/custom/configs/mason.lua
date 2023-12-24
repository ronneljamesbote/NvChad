local flatten_tables = require "custom.helpers.flatten_tables"

local required_installed = {
  web = {
    -- LSP
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",
    "emmet-ls",

    -- Linters
    "eslint-lsp",

    -- Formatters
    "stylua",
    "prettier",
  },
  lua = {
    -- LSP
    "lua-language-server",
  },
  php = {
    -- LSP
    "phpactor",

    -- Diagnostics
    "phpstan",

    -- Formatters
    "pint",
    "blade-formatter",
  },
  python = {
    -- LSP
    "pyright",

    -- Diagnostics
    "black",

    -- Linters
    "mypy",
    "ruff",
  },
}

return {
  ensure_installed = flatten_tables(required_installed),
}

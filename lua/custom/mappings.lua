local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader>fq"] = {
      function()
        require("telescope.builtin").live_grep { additional_args = { "-u" } }
      end,
      "Live grep hidden files",
    },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format {
          async = false,
          timeout_ms = 30000,
          filter = function(lspClient)
            if lspClient.name == "tsserver" then
              return false
            end

            return true
          end,
        }
      end,
      "LSP formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "Start debugging session",
    },
    ["<leader>Bb"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>Bg"] = {
      function()
        require("dapui").toggle()
      end,
      "Open debugger window",
    },
  },
}

return M

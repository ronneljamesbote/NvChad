local format_file = function()
  vim.lsp.buf.format {
    async = false,
    timeout_ms = 30000,
    filter = function(client)
      if client.name == "tsserver" then
        return false
      end

      return true
    end,
  }
end

return format_file

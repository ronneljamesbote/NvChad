local blacklisted = { "tsserver", "cssls", "html" }

local format_file = function()
  vim.lsp.buf.format {
    async = false,
    timeout_ms = 30000,
    filter = function(client)
      for _, value in ipairs(blacklisted) do
        if client.name == value then
          return false
        end
      end

      return true
    end,
  }
end

return format_file

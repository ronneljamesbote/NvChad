local M = {}

M.stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
end

M.replace = function(str, what, with)
  what = string.gsub(what, "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1")
  with = string.gsub(with, "[%%]", "%%%%")

  return string.gsub(str, what, with)
end

return M

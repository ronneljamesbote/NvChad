local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.blade.php",
  group = augroup("BladeFiletypeRelated", { clear = true }),
  callback = function()
    vim.opt.filetype = "blade"
  end,
})

vim.opt.colorcolumn = "120"

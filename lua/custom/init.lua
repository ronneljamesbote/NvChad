-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
local bladeGrp = vim.api.nvim_create_augroup("BladeFiletypeRelated", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.blade.php",
  group = bladeGrp,
  callback = function()
    vim.opt.filetype = "blade"
  end,
})

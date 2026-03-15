-- Basic Settings
vim.o.number = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2


-- lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- plugin setup
require("lazy").setup({
  {
    "lervag/vimtex",
    lazy=false,
    init = function()
      local is_mac = vim.fn.has("macunix") == 1
      local is_wsl = vim.fn.has("wsl") == 1

      vim.g.vimtex_compiler_method = 'latexmk'

      if is_mac then
        vim.g.vimtex_view_method = 'sioyek'
	vim.g.vimtex_view_sioyek_exe = '/Applications/sioyek.app/Contents/MacOS/sioyek'
	vim.g.vimtex_callback_progpath = 'nvim'
      elseif is_wsl then
        local function wsl_to_win(path)
          return vim.fn.system('wslpath -w ' .. vim.fn.shellescape(path)):gsub('\n', '')
        end

        vim.g.vimtex_view_general_viewer = 'sioyek.exe'
        vim.g.vimtex_view_general_options = '--reuse-instance ' ..
          '--forward-search-file "' .. wsl_to_win('@tex') .. '" ' ..
          '--forward-search-line @line ' ..
          '"' .. wsl_to_win('@pdf') .. '"'
      end
    end
  },
})


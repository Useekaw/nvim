vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.python3_host_prog = vim.fn.expand("~/.local/share/pipx/venvs/pynvim/bin/python")
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
require("vnext.config")
-- require("vim._extui").enable({ msg = { target = "msg" } })
-- vim.opt.cmdheight = 0

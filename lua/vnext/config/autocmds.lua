local api = vim.api

api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "highlight on yank",
})

api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable New Line Comment",
})

api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = api.nvim_buf_get_mark(0, '"')
    local lcount = api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "go to last loc when opening a buffer",
})

api.nvim_create_autocmd("FileType", {
  pattern = {
    "grug-far",
    "help",
    "qf",
    "query",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
  desc = "close certain windows with q",
})

api.nvim_create_autocmd("FileType", {
  pattern = {
    "man",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "ZQ", { buffer = event.buf, silent = true })
  end,
  desc = "quit man page Neovim",
})

local chezmoi_path = vim.fn.resolve(vim.fn.expand("~/.local/share/chezmoi"))
api.nvim_create_autocmd("BufWritePost", {
  pattern = {
    chezmoi_path .. "/**/*", -- files in subdirectories
  },
  callback = function()
    vim.notify("Applying chezmoi changes", vim.log.levels.INFO)
    vim.system({ "chezmoi", "apply", "-k" })
  end,
})

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*Dockerfile*",
  callback = function()
    vim.bo.filetype = "dockerfile"
  end,
})

-- detect ansible yaml files so ansiblels attaches instead of / alongside yamlls
vim.filetype.add({
  pattern = {
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/inventory/.*%.ya?ml"] = "yaml.ansible",
    [".*/molecule/.*%.ya?ml"] = "yaml.ansible",
    [".*playbook.*%.ya?ml"] = "yaml.ansible",
    ["site%.ya?ml"] = "yaml.ansible",
    ["requirements%.ya?ml"] = "yaml.ansible",
  },
})

-- reuse the yaml treesitter parser for the "yaml.ansible" compound filetype
vim.treesitter.language.register("yaml", "yaml.ansible")

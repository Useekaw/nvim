-- Personal overrides on top of the upstream plugin specs. Keeping them here
-- instead of editing the upstream files avoids conflicts when merging
-- Allaman/nvim.

-- LSP servers configured upstream that are not installed/used on this machine
local disabled_servers = {
  "harper_ls", -- English only, too noisy for German text
  "templ",
  "terraformls", -- upstream cmd is a hard-coded macOS path
  "tinymist",
  "tsc",
}

-- filetypes whose upstream formatter is not installed on this machine
local disabled_formatter_fts = {
  "terraform",
  "terraform-vars",
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      for _, server in ipairs(disabled_servers) do
        opts.servers[server] = nil
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      for _, ft in ipairs(disabled_formatter_fts) do
        opts.formatters_by_ft[ft] = nil
      end
    end,
  },
}

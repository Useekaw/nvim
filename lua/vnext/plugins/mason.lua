return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "ansiblels" },
      -- lsp.lua already handles vim.lsp.config/vim.lsp.enable for every entry
      -- in the `servers` table, so let mason-lspconfig only take care of
      -- installing the binaries and keep enabling centralized there.
      automatic_enable = false,
    },
  },
  {
    -- installs non-LSP mason tools (linters/formatters), e.g. ansible-lint
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "ansible-lint", "markdownlint-cli2" },
    },
  },
}

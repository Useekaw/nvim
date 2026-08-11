return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "codecompanion" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-mini/mini.icons",
  },
  opts = {
    -- images are not rendered here: no terminal graphics protocol available
    -- (see snacks.image.enabled = false in snacks.lua); this only renders
    -- headings, tables, code blocks, lists, checkboxes, quotes, links, ...
    completions = { lsp = { enabled = true } },
  },
  keys = {
    { "<leader>um", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Markdown Rendering", ft = "markdown" },
  },
}

-- Read Markdown rendered inside the buffer: headings, tables, code blocks, checkboxes, quotes, links.
-- Rendered in Normal mode, raw text while you type (Insert) or select (Visual). Toggle with <leader>mr
-- (see lua/mappings.lua). Needs the markdown + markdown_inline Treesitter parsers, which Neovim 0.12 bundles.
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    -- Command stub so <leader>mr works (and loads the plugin) even outside a markdown buffer.
    cmd = { "RenderMarkdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    -- By default the cursor line shows the raw markdown; to keep it rendered too, add:
    --   anti_conceal = { enabled = false },
    opts = {
      pipe_table = {
        -- Draw a horizontal line between every table row, not just the column lines.
        grid = true,
        -- Default (true) draws wide tables as virtual lines, which makes the mouse wheel crawl and the cursor
        -- skip past them. false scrolls normally, but a table wider than the window overflows and its border
        -- breaks. Set it back to true if you read wide tables a lot.
      },
    },
  },
}

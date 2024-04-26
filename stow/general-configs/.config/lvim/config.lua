-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "catppuccin"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

lvim.leader = ","
lvim.keys.normal_mode["H"] = ":bprevious<CR>"
lvim.keys.normal_mode["L"] = ":bnext<CR>"

-- After changing plugin config exit and reopen LunarVim,
-- Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.reload_on_bufenter = true
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.filesystem_watchers.enable = false
lvim.builtin.dap.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "go",
  "c",
  "lua",
  "yaml",
  "hcl",
}

lvim.builtin.treesitter.highlight.enable = true
lvim.lsp.installer.setup.automatic_installation = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "gofumpt" },
  { command = "goimports" },
}


-- Additional Plugins
lvim.plugins = {
  { 'leoluz/nvim-dap-go' },
  { "catppuccin/nvim",   name = "catppuccin" },
  {
    'ray-x/go.nvim',
    config = function()
      require('go').setup({
        build_tags = "replay,gpu", -- set default build tags
        luasnip = true,            -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
        fillstruct = 'gopls',
      })
    end
  },
}

-- Custom whichkeys
lvim.builtin.which_key.mappings["t"] = {
  name = "Telescope",
  r = { "<cmd>Telescope lsp_references<cr>", "References" },
  i = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
  f = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Telescope quickfix<cr>", "QuickFix" },
  l = { "<cmd>Telescope loclist<cr>", "LocationList" },
  w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

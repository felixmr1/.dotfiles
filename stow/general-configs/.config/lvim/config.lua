-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "catppuccin"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- After changing plugin config exit and reopen LunarVim,
-- Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

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

-- generic LSP settings

-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "sumneko_lua",
  "jsonls",
  "golangci_lint_ls",
  "gopls",
  "terraformls",
}

-- formatters
--local formatters = require "lvim.lsp.null-ls.formatters"
--formatters.setup {
--  { "gofumpt" },
--  { "goimports" },
--  { "goimports_reviser" },
--}

-- linters
--local linters = require "lvim.lsp.null-ls.linters"
--linters.setup {
--  { "golangci_lint" },
--}

-- Additional Plugins
lvim.plugins = {
  {
    "catppuccin/nvim",
    as = "catppuccin"
  },
  {
    'ray-x/go.nvim',
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

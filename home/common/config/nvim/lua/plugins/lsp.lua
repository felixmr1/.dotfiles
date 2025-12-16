return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "gl", vim.diagnostic.open_float, desc = "Line Diagnostics" },
      { "gn", function() vim.diagnostic.jump({ count = 1 }) end, desc = "Next Diagnostic" },
      { "gN", function() vim.diagnostic.jump({ count = -1 }) end, desc = "Previous Diagnostic" },
    },
    opts = {
      diagnostics = {
        virtual_text = true,
        float = {
          border = "rounded",
          source = "always",
        },
      },
      servers = {
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp" }, -- Exclude proto
        },
        gopls = {
          settings = {
            gopls = {
              analyses = {
                fieldalignment = false,
              },
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://json.schemastore.org/github-action.json"] = "/.github/action.{yml,yaml}",
              },
            },
          },
        },
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },
      },
    },
  },
  {
    "b0o/schemastore.nvim",
  },
}

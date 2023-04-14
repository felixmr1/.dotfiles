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
lvim.keys.normal_mode["H"] = ":bprevious<CR>"
lvim.keys.normal_mode["L"] = ":bnext<CR>"

-- After changing plugin config exit and reopen LunarVim,
-- Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
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

-- generic LSP settings

-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "sumneko_lua",
  "jsonls",
  "golangci_lint_ls",
  "gopls",
  "tflint",
}

-- formatters


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "gofumpt" },
  { command = "goimports" },
  { command = "goimports_reviser" },
}

-- linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "golangci_lint" },
}
lvim.lsp.automatic_servers_installation = true

-- Additional Plugins
lvim.plugins = {
  {
    "giusgad/pets.nvim",
    requires = {
      "giusgad/hologram.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("pets").setup({
        row = 1, -- the row (height) to display the pet at (higher row means the pet is lower on the screen), must be 1<=row<=10
        col = 0, -- the column to display the pet at (set to high number to have it stay still on the right side)
        speed_multiplier = 1, -- you can make your pet move faster/slower. If slower the animation will have lower fps.
        default_pet = "dog", -- the pet to use for the PetNew command
        default_style = "brown", -- the style of the pet to use for the PetNew command
        random = true, -- wether to use a random pet for the PetNew command, ovverides default_pet and default_style
        -- death_animation = true, -- animate the pet's death, set to false to feel less guilt -- currently no animations are available
        popup = { -- popup options, try changing these if you see a rectangle around the pets
          width = "30%", -- can be a string with percentage like "45%" or a number of columns like 45
          winblend = 100, -- winblend value - see :h 'winblend' - only used if avoid_statusline is false
          hl = { Normal = "Normal" }, -- hl is only set if avoid_statusline is true, you can put any hl group instead of "Normal"
          avoid_statusline = false, -- if winblend is 100 then the popup is invisible and covers the statusline, if that
          -- doesn't work for you then set this to true and the popup will use hl and will be spawned above the statusline (hopefully)
        }
      })
    end
  },
  {
    'leoluz/nvim-dap-go',
    config = function()
      require('dap-go').setup({
        -- Additional dap configurations can be added.
        -- dap_configurations accepts a list of tables where each entry
        -- represents a dap configuration. For more details do:
        -- :help dap-configuration
        dap_configurations = {
          {
            -- Must be "go" or it will be ignored by the plugin
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          },
        },
        -- delve configurations
        delve = {
          -- time to wait for delve to initialize the debug session.
          -- default to 20 seconds
          initialize_timeout_sec = 20,
          -- a string that defines the port to start delve debugger.
          -- default to string "${port}" which instructs nvim-dap
          -- to start the process in a random available port
          port = "${port}"
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    as = "catppuccin"
  },
  {
    'ray-x/go.nvim',
    config = function()
      require('go').setup({
        disable_defaults = false, -- true|false when true set false to all boolean settings and replace all table
        -- settings with {}
        go = 'go', -- go command, can be go[default] or go1.18beta1
        goimport = 'gopls', -- goimport command, can be gopls[default] or goimport
        fillstruct = 'gopls', -- can be nil (use fillstruct, slower) and gopls
        gofmt = 'gofumpt', --gofmt cmd,
        max_line_len = 128, -- max line length in golines format, Target maximum line length for golines
        tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
        gotests_template = "", -- sets gotests -template parameter (check gotests for details)
        gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
        comment_placeholder = '', -- comment_placeholder your cool placeholder e.g. ﳑ       
        icons = { breakpoint = '🧘', currentpos = '🏃' }, -- setup to `false` to disable icons setup
        verbose = false, -- output loginf in messages
        lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
        -- false: do nothing
        -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
        --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
        lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
        --      when lsp_cfg is true
        -- if lsp_on_attach is a function: use this function as on_attach function for gopls
        lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
        lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
        -- function(bufnr)
        --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
        -- end
        -- to setup a table of codelens
        lsp_diag_hdlr = true, -- hook lsp diag handler
        lsp_diag_underline = true,
        -- virtual text setup
        lsp_diag_virtual_text = { space = 0, prefix = "" },
        lsp_diag_signs = true,
        lsp_diag_update_in_insert = false,
        lsp_document_formatting = true,
        -- set to true: use gopls to format
        -- false if you want to use other formatter tool(e.g. efm, nulls)
        lsp_inlay_hints = {
          enable = true,
          -- Only show inlay hints for the current line
          only_current_line = false,
          -- Event which triggers a refersh of the inlay hints.
          -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
          -- not that this may cause higher CPU usage.
          -- This option is only respected when only_current_line and
          -- autoSetHints both are true.
          only_current_line_autocmd = "CursorHold",
          -- whether to show variable name before type hints with the inlay hints or not
          -- default: false
          show_variable_name = true,
          -- prefix for parameter hints
          parameter_hints_prefix = " ",
          show_parameter_hints = true,
          -- prefix for all the other hints (type, chaining)
          other_hints_prefix = "=> ",
          -- whether to align to the lenght of the longest line in the file
          max_len_align = false,
          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,
          -- whether to align to the extreme right or not
          right_align = false,
          -- padding from the right if right_align is true
          right_align_padding = 6,
          -- The color of the hints
          highlight = "Comment",
        },
        gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
        gopls_remote_auto = true, -- add -remote=auto to gopls
        gocoverage_sign = "█",
        sign_priority = 5, -- change to a higher number to override other signs
        dap_debug = true, -- set to false to disable dap
        dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
        -- false: do not use keymap in go/dap.lua.  you must define your own.
        -- windows: use visual studio keymap
        dap_debug_gui = true, -- set to true to enable dap gui, highly recommend
        dap_debug_vt = true, -- set to true to enable dap virtual text
        build_tags = "tag1,tag2", -- set default build tags
        textobjects = true, -- enable default text jobects through treesittter-text-objects
        test_runner = 'go', -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
        verbose_tests = true, -- set to add verbose flag to tests
        run_in_floaterm = false, -- set to true to run in float window. :GoTermClose closes the floatterm
        -- float term recommend if you use richgo/ginkgo with terminal color

        trouble = false, -- true: use trouble to open quickfix
        test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
        luasnip = false, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
        --  Do not enable this if you already added the path, that will duplicate the entries
      })
    end
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

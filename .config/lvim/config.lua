--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "info"
lvim.format_on_save = true
lvim.builtin.dap.active = true
-- vim.o.termguicolors = true
-- lvim.colorscheme = "onedarkest"
lvim.colorscheme = "kanagawa-dragon"
-- lvim.transparent_window = true


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-[>"] = "<C-c>"
vim.api.nvim_set_keymap('n', '-d', '"_dd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-C-k>', 'yyP', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-C-k>', 'yP', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-C-j>', 'yyp', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-C-j>', 'yp', { noremap = true })
vim.g.codeium_disable_bindings = 1
vim.g.codeium_no_map_tab = 1
lvim.builtin.telescope = {
  active = true,
  defaults = {
    layout_strategy = "horizontal",
  },
  pickers = {
    git_files = {
      hidden = true,
    },
    live_grep = {
      hidden = true,
    },
  },
}
vim.opt.scrolloff = 8
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.go" },
  command = "setlocal tabstop=4 shiftwidth=4"
})
-- vim.api.nvim_set_keymap('v', '<A-C-j>', 'yp', { noremap = true })
-- vim.api.nvim_set_keymap('v', '<A-C-j>', 'yp', { noremap = true })
-- vim.api.nvim_set_keymap('v', '<A-C-k>', 'yp', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })


-- package-info ---
--- Show dependency versions
-- vim.keymap.set({ "n" }, "<LEADER>ns", require("package-info").show, { silent = true, noremap = true })

-- -- Hide dependency versions
-- vim.keymap.set({ "n" }, "<LEADER>nc", require("package-info").hide, { silent = true, noremap = true })

-- -- Toggle dependency versions
-- vim.keymap.set({ "n" }, "<LEADER>nt", require("package-info").toggle, { silent = true, noremap = true })

-- -- Update dependency on the line
-- vim.keymap.set({ "n" }, "<LEADER>nu", require("package-info").update, { silent = true, noremap = true })

-- -- Delete dependency on the line
-- vim.keymap.set({ "n" }, "<LEADER>nd", require("package-info").delete, { silent = true, noremap = true })

-- -- Install a new dependency
-- vim.keymap.set({ "n" }, "<LEADER>ni", require("package-info").install, { silent = true, noremap = true })

-- -- Install a different dependency version
-- vim.keymap.set({ "n" }, "<LEADER>np", require("package-info").change_version, { silent = true, noremap = true })
-- package-info ---

lvim.builtin.which_key.mappings["l"]["r"] = { "<cmd>lua require('renamer').rename()<cr>", "Rename" }
lvim.builtin.which_key.vmappings["l"] = {
  name = "+Lsp",
  -- r = { "<ESC><CMD>lua require('renamer').rename()<CR>", "Rename" },
  -- a = { "<ESC><CMD>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
  a = { "<ESC><CMD>lua require('telescope.builtin').lsp_code_actions()<CR>", "Code Action" },
}
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", " Zen" }
lvim.builtin.which_key.mappings["n"] = {
  name = "+PackageInfo",
  u = { "<cmd>lua require('package-info').update()<cr>", "Update", { silent = true, noremap = true } },
  p = { "<cmd>lua require('package-info').change_version()<cr>", "Change Version", { silent = true, noremap = true } },
  i = { "<cmd>lua require('package-info').install()<cr>", "Install", { silent = true, noremap = true } },
  d = { "<cmd>lua require('package-info').delete()<cr>", "Delete", { silent = true, noremap = true } },
}

-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }
vim.opt.relativenumber = true
lvim.builtin.project.manual_mode = false
lvim.builtin.project.detection_methods = { "patterns" }
lvim.builtin.project.patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile" }
-- lvim.builtin.telescope.defaults = {}
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.terminal.active = false
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.auto_install = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "html",
  "elixir",
  "go",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettier", filetypes = { "typescript", "javascript" } },
  { command = "gofmt",    filetypes = { "go" } },
  --   { command = "isort", filetypes = { "python" } },
  --   {
  --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "prettier",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--print-with", "100" },
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "typescript", "typescriptreact" },
  --   },
}

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
require('go').setup()

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d",    filetypes = { "typescript", "javascript" } },
  { command = "staticcheck", filetypes = { "golang", "go" } },
  -- --   { command = "flake8", filetypes = { "python" } },
  -- --   {
  -- --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  -- --     command = "shellcheck",
  -- --     ---@usage arguments to pass to the formatter
  -- --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  -- --     extra_args = { "--severity", "warning" },
  -- --   },
  -- --   {
  -- --     command = "codespell",
  -- --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  -- --     filetypes = { "javascript", "python" },
  -- --   },
}

-- Additional Plugins
lvim.plugins = {
  {
    "Exafunction/codeium.vim",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },
  { "lunarvim/colorschemes" },
  { "olivercederborg/poimandres.nvim" },
  { "ayu-theme/ayu-vim" },
  { "christianchiarulli/nvcode-color-schemes.vim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "expoure/NeoSolarized.nvim" },
  { "tpope/vim-fugitive" },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = { "BufRead", "BufNew" },
    config = function()
      local cfg = {
        bind = true,
        doc_lines = 10,
        floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
        floating_window_above_cur_line = true,
        fix_pos = false,         -- set to true, the floating window will not auto-close until finish all parameters
        hint_enable = true,      -- virtual hint enable
        -- hint_prefix = "🐼 ", -- Panda for parameter
        hint_prefix = " ",
        hint_scheme = "String",
        -- use_lspsaga = false, -- set to true if you want to use lspsaga popup
        hi_parameter = "Search", -- how your parameter will be highlight
        max_height = 12,         -- max height of signature floating_window, if content is more than max_height, you can scroll down
        -- to view the hiding contents
        max_width = 120,         -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
          border = "single",     -- double, single, shadow, none
        },
        -- transpancy = 80,
        -- extra_trigger_chars = { "(", "," }, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        zindex = 200,                     -- by default it will be on top of all floating windows, set to 50 send it to bottom
        debug = false,                    -- set to true to enable debug logging
        log_path = "debug_log_file_path", -- debug log path
        padding = "",                     -- character to pad on left and right of signature can be ' ', or '|'  etc
        shadow_blend = 36,                -- if you using shadow as border use this set the opacity
        shadow_guibg = "Black",           -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
      }
      require "lsp_signature".setup(cfg)
    end
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require "zen-mode".setup()
    end
  },
  {
    "filipdutescu/renamer.nvim",
    branch = "master",
    config = function()
      require "renamer".setup()
    end
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu"
  },
  {
    "fatih/vim-go",
    cmd = "GoUpdateBinaries"
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  -- {
  --   "andweeb/presence.nvim"
  -- },
  {
    "vuki656/package-info.nvim",
    config = function()
      require "package-info".setup()
    end
  },
  { "catppuccin/nvim" },
  { "rebelot/kanagawa.nvim" },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
}

-- lvim.autocommands.customd_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

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

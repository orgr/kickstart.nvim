-- You can add your own plugins here or in other files in this directory
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'tpope/vim-rsi', event = 'InsertEnter' },
  { 'stevearc/dressing.nvim', event = 'VeryLazy' },
  {
    'karb94/neoscroll.nvim',
    event = 'VeryLazy',
    config = function()
      require('neoscroll').setup {
        mappings = { -- Keys to be mapped to their corresponding default scrolling animation
          '<C-u>',
          '<C-d>',
          '<C-b>',
          '<C-f>',
          '<C-y>',
          '<C-e>',
          'zt',
          'zz',
          'zb',
        },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        duration_multiplier = 0.1, -- Global duration multiplier
        easing = 'quadratic', --  `linear` quadratic` `cubic` `quartic` `quintic` `circular` `sine`
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
        ignored_events = { -- Events ignored while scrolling
          'WinScrolled',
          'CursorMoved',
        },
      }
    end,
  },
  {
    'nvim-neotest/neotest',
    event = 'VeryLazy',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
    },

    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            -- Extra arguments for nvim-dap configuration
            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
            dap = { justMyCode = true },
            -- Command line arguments for runner
            -- Can also be a function to return dynamic values
            args = { '--log-level', 'DEBUG' },
            -- Runner to use. Will use pytest if available by default.
            -- Can be a function to return dynamic value.
            runner = 'pytest',
            -- Custom python path for the runner.
            -- Can be a string or a list of strings.
            -- Can also be a function to return dynamic value.
            -- If not provided, the path will be inferred by checking for
            -- virtual envs in the local directory and for Pipenev/Poetry configs
            python = '/Users/or/transactions/.venv/bin/python',
            -- Returns if a given file path is a test file.
            -- NB: This function is called a lot so don't perform any heavy tasks within it.
            -- is_test_file = function(file_path)
            --   ...
            -- end,
            -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
            -- instances for files containing a parametrize mark (default: false)
            pytest_discover_instances = true,
          },
        },
      }

      vim.keymap.set('n', '<leader>tr', require('neotest').run.run, { desc = '[T]est [r]un closest test' })
      vim.keymap.set('n', '<leader>td', function()
        require('neotest').run.run { strategy = 'dap' }
      end, { desc = '[T]est [d]ebug closest test' })
      vim.keymap.set('n', '<leader>ts', require('neotest').run.stop, { desc = '[T]est [s]top closest test' })
      vim.keymap.set('n', '<leader>to', require('neotest').output_panel.toggle, { desc = '[T]est show [o]utput' })
      vim.keymap.set('n', '<leader>tt', require('neotest').summary.toggle, { desc = '[T]est show test [t]ree summary' })
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },

    opts = {
      strategies = {
        chat = {
          adapter = 'claude_code',
        },
      },
    },
    -- config = function()
    --   require('codecompanion').setup {
    --     display = {
    --       action_palette = {
    --         width = 95,
    --         height = 10,
    --         provider = 'telescope',
    --       },
    --       diff = {
    --         provider = 'mini_diff',
    --       },
    --     },
    --     strategies = {
    --       chat = {
    --         adapter = 'claude_code',
    --       },
    --       inline = {
    --         adapter = 'claude_code',
    --
    --         keymaps = {
    --           accept_change = {
    --             modes = { n = '<leader>y' },
    --             description = 'Accept the suggested change',
    --           },
    --           reject_change = {
    --             modes = { n = '<leader>u' },
    --             opts = { nowait = true },
    --             description = 'Reject the suggested change',
    --           },
    --         },
    --       },
    --     },
    --   }
    -- end,
  },
  {
    'ldelossa/nvim-dap-projects',
    event = 'VeryLazy',
    config = function()
      require('nvim-dap-projects').search_project_config()
      vim.keymap.set('n', '<leader>dc', require('nvim-dap-projects').search_project_config, { desc = '[Debug] search debug [c]onfig' })
    end,
  },
  {
    'mrjones2014/smart-splits.nvim',
    build = './kitty/install-kittens.bash',
    event = 'VeryLazy',
    keys = {
      {
        '<A-h>',
        function()
          require('smart-splits').resize_left()
        end,
        desc = 'Resize left',
      },
      {
        '<A-j>',
        function()
          require('smart-splits').resize_down()
        end,
        desc = 'Resize down',
      },
      {
        '<A-k>',
        function()
          require('smart-splits').resize_up()
        end,
        desc = 'Resize up',
      },
      {
        '<A-l>',
        function()
          require('smart-splits').resize_right()
        end,
        desc = 'Resize right',
      },
    },
  },
  {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    version = '^6.3.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require('kitty-scrollback').setup()
    end,
  },
  -- mini.align setup is handled in main mini.nvim config

  {
    'echasnovski/mini.diff',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>go',
        function()
          require('mini.diff').toggle_overlay(0)
        end,
        desc = 'Toggle mini.diff overlay',
      },
    },
    opts = {
      view = {
        style = 'number',
      },
      priority = 0,
    },
  },
  -- mini.operators setup is handled in main mini.nvim config
  -- { 'RRethy/nvim-treesitter-textsubjects' }, -- this adds <v.>, <v;> and <vi;> keybindings
  -- Treesitter incremental_selection is set in main nvim-treesitter opts
  { 'nvim-treesitter/nvim-treesitter-context', event = 'VeryLazy' },
  -- mini.bracketed setup is handled in main mini.nvim config
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require('window-picker').setup {
        hint = 'floating-big-letter',
      }
    end,
  },
  -- {
  --   'smoka7/multicursors.nvim',
  --   event = 'VeryLazy',
  --   dependencies = {
  --     'nvimtools/hydra.nvim',
  --   },
  --   opts = {},
  --   cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
  --   keys = {
  --     {
  --       mode = { 'v', 'n' },
  --       '<Leader>m',
  --       '<cmd>MCstart<cr>',
  --       desc = 'Create a selection for selected text or word under the cursor',
  --     },
  --   },
  -- },
  {
    'NeogitOrg/neogit',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed.
      'nvim-telescope/telescope.nvim', -- optional
      -- 'ibhagwan/fzf-lua', -- optional
      -- 'echasnovski/mini.pick', -- optional
    },
    config = function()
      vim.keymap.set('n', '<leader>gg', function()
        local neogit = require 'neogit'
        if neogit.status and neogit.status.is_open() then
          neogit.close()
        else
          neogit.open { kind = 'split_below_all' }
        end
      end, { desc = '[G]it' })
      vim.keymap.set('n', '<leader>gb', function()
        require('neogit').open { 'branch' }
      end, { desc = 'git [B]ranch' })
      -- vim.keymap.set('n', '<leader>gbc', require('neogit').lib.git.branch.create, { desc = 'create branch' })
    end,
  },
  {
    'knubie/vim-kitty-navigator',
    lazy = false, -- ensure it loads; default in this setup is lazy=true
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    event = 'VeryLazy',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      modes = {
        -- options used when flash is activated through
        -- a regular search with `/` or `?`
        search = {
          enabled = true,
          highlight = { backdrop = false },
          incremental = true,
        },
        char = {
          jump_labels = true,
          highlight = { backdrop = false },
        },
      },
      multi_window = false,
    },
              -- stylua: ignore
    keys = {
            { "<c-/>", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
            { "<c-'>", mode = { "n", "o", "x" }, function() require("flash").jump({pattern = vim.fn.expand("<cword>")}) end, desc = "Flash" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    'kawre/leetcode.nvim',
    event = 'VeryLazy',
    build = ':TSUpdate html',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- required by telescope
      'MunifTanjim/nui.nvim',

      -- optional
      'nvim-treesitter/nvim-treesitter',
      'rcarriga/nvim-notify',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      -- configuration goes here
      lang = 'rust',
    },
  },
  {
    'nvim-neorg/neorg',
    event = 'VeryLazy',
    version = '*', -- Pin Neorg to the latest stable release
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
                spanish = '~/personal/spanish',
                personal = '~/personal/notes',
              },
              default_workspace = 'notes',
            },
          },
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
  {
    'kndndrj/nvim-dbee',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require('dbee').install()
    end,
    config = function()
      require('dbee').setup {
        drawer = {
          mapping = {
            { key = '<tab>', mode = 'n', action = 'toggle' },
          },
        },
        editor = {
          -- see drawer comment.
          window_options = {},
          buffer_options = {},

          -- directory where to store the scratchpads.
          --directory = "path/to/scratchpad/dir",

          -- mappings for the buffer
          mappings = {
            -- run what's currently selected on the active connection
            { key = '<D-CR>', mode = 'v', action = 'run_selection' },
            -- run the whole file on the active connection
            { key = '<D-CR>', mode = 'n', action = 'run_file' },
          },
        },
      }
    end,
  },
  -- {
  --   'pmizio/typescript-tools.nvim',
  --   dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  --   opts = {},
  -- },
  {
    'f-person/git-blame.nvim',
    -- load the plugin at startup
    event = 'VeryLazy',
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin will only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = ' <summary> • <date> • <author> • <<sha>>', -- template for the blame message, check the Message template section for more options
      date_format = '%m-%d-%Y %H:%M:%S', -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },
  {
    'gbprod/yanky.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'kkharji/sqlite.lua' },
    },
    opts = {
      ring = { storage = 'sqlite' },
    },
    keys = {
      { '<leader>p', '<cmd>YankyRingHistory<cr>', mode = { 'n', 'x' }, desc = 'Open Yank History' },
      { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
      { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
      { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
      { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after selection' },
      { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before selection' },
      { '<c-p>', '<Plug>(YankyPreviousEntry)', desc = 'Select previous entry through yank history' },
      { '<c-n>', '<Plug>(YankyNextEntry)', desc = 'Select next entry through yank history' },
      { ']p', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
      { '[p', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
      { ']P', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
      { '[P', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
      { '>p', '<Plug>(YankyPutIndentAfterShiftRight)', desc = 'Put and indent right' },
      { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)', desc = 'Put and indent left' },
      { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)', desc = 'Put before and indent right' },
      { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)', desc = 'Put before and indent left' },
      { '=p', '<Plug>(YankyPutAfterFilter)', desc = 'Put after applying a filter' },
      { '=P', '<Plug>(YankyPutBeforeFilter)', desc = 'Put before applying a filter' },
    },
  },
  {
    'linux-cultist/venv-selector.nvim',
    event = 'VeryLazy',
    dependencies = {
      'neovim/nvim-lspconfig',
      { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
    },
    ft = 'python', -- Load when opening Python files
    keys = {
      { ',v', '<cmd>VenvSelect<cr>' }, -- Open picker on keymap
    },
    opts = { -- this can be an empty lua table - just showing below for clarity.
      search = {}, -- if you add your own searches, they go here.
      options = {}, -- if you add plugin options, they go here.
    },
  },
}

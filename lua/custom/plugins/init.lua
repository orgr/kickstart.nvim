-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
<<<<<<< HEAD
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   event = 'VeryLazy',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = function()
  --     require('lualine').setup {
  --       options = {
  --         icons_enabled = true,
  --         theme = 'auto',
  --         component_separators = { left = '', right = '' },
  --         section_separators = { left = '', right = '' },
  --         disabled_filetypes = {
  --           statusline = {},
  --           winbar = {},
  --         },
  --         ignore_focus = {},
  --         always_divide_middle = true,
  --         always_show_tabline = true,
  --         globalstatus = true,
  --         refresh = {
  --           statusline = 100,
  --           tabline = 100,
  --           winbar = 100,
  --         },
  --       },
  --       sections = {
  --         lualine_a = { 'mode' },
  --         lualine_b = { 'branch' },
  --         lualine_c = { { 'windows', component_separators = { left = '', right = '' }, section_separators = { left = '', right = '' } } },
  --         lualine_x = { 'encoding', 'fileformat', 'filetype' },
  --         lualine_y = { 'progress' },
  --         lualine_z = { 'location' },
  --       },
  --       inactive_sections = {
  --         lualine_a = {},
  --         lualine_b = {},
  --         lualine_c = { 'filename' },
  --         lualine_x = { 'location' },
  --         lualine_y = {},
  --         lualine_z = {},
  --       },
  --       tabline = {},
  --       winbar = {
  --         lualine_a = {},
  --         lualine_b = { 'filename' },
  --         lualine_c = { 'diff' },
  --         lualine_x = { 'diagnostics' },
  --         lualine_y = { 'progress' },
  --         lualine_z = {},
  --       },
  --       inactive_winbar = {
  --         lualine_a = {},
  --         lualine_b = { 'filename' },
  --         lualine_c = { 'diff' },
  --         lualine_x = { 'diagnostics' },
  --         lualine_y = { 'progress' },
  --         lualine_z = {},
  --       },
  --       extensions = { 'neo-tree' },
  --     }
  --   end,
  -- },
  'tpope/vim-rsi',
  { 'stevearc/dressing.nvim', event = 'VeryLazy' },
  {
    'nvim-neotest/neotest',
    event = 'VeryLazy',
=======
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { { 'windows', component_separators = { left = '', right = '' }, section_separators = { left = '', right = '' } } },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {
          lualine_a = {},
          lualine_b = { 'filename' },
          lualine_c = { 'diff' },
          lualine_x = { 'diagnostics' },
          lualine_y = { 'progress' },
          lualine_z = {},
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = { 'filename' },
          lualine_c = { 'diff' },
          lualine_x = { 'diagnostics' },
          lualine_y = { 'progress' },
          lualine_z = {},
        },
        extensions = { 'neo-tree', 'nvim-dap-ui' },
      }
    end,
  },
  'tpope/vim-rsi',
  'stevearc/dressing.nvim',
  {
    'nvim-neotest/neotest',
>>>>>>> c0a62fd (good stuff)
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
<<<<<<< HEAD
            python = '/Users/or/transactions/.venv/bin/python',
=======
            python = '/opt/homebrew/Caskroom/miniconda/base/envs/sem-layer/bin/python',
>>>>>>> c0a62fd (good stuff)
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
  -- {
<<<<<<< HEAD
  --   'olimorris/codecompanion.nvim',
  --   event = 'VeryLazy',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --
  --   config = function()
  --     require('codecompanion').setup {
  --       display = {
  --         action_palette = {
  --           width = 95,
  --           height = 10,
  --           provider = 'telescope',
  --         },
  --         diff = {
  --           provider = 'mini_diff',
  --         },
  --       },
  --       adapters = {
  --         ollama = function()
  --           return require('codecompanion.adapters').extend('ollama', {
  --             schema = {
  --               model = {
  --                 default = 'qwen2.5-coder:7b',
  --               },
  --               num_ctx = {
  --                 default = 32768,
  --               },
  --               num_predict = {
  --                 default = -1,
  --               },
  --             },
  --           })
  --         end,
  --       },
  --       strategies = {
  --         chat = {
  --           adapter = 'ollama',
  --         },
  --         inline = {
  --           adapter = 'ollama',
  --         },
  --       },
  --     }
  --   end,
  -- },
  -- {
=======
>>>>>>> c0a62fd (good stuff)
  --   'yetone/avante.nvim',
  --   event = 'VeryLazy',
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
<<<<<<< HEAD
  --     debug = true,
  --     provider = 'ollama',
  --     ollama = {
  --       api_key_name = '',
  --       endpoint = 'http://127.0.0.1:11434',
  --       model = 'qwen2.5-coder:7b',
  --       options = {
  --         num_ctx = 32768,
  --         temperature = 0,
  --       },
  --       stream = true,
  --     },
=======
  --     -- add any opts here
>>>>>>> c0a62fd (good stuff)
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = 'make',
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'stevearc/dressing.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     --- The below dependencies are optional,
  --     'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --     'zbirenbaum/copilot.lua', -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       'HakonHarnes/img-clip.nvim',
  --       event = 'VeryLazy',
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { 'markdown', 'Avante' },
  --       },
  --       ft = { 'markdown', 'Avante' },
  --     },
  --   },
  -- },
  {
    'ldelossa/nvim-dap-projects',
<<<<<<< HEAD
    event = 'VeryLazy',
=======
>>>>>>> c0a62fd (good stuff)
    config = function()
      require('nvim-dap-projects').search_project_config()
      vim.keymap.set('n', '<leader>dc', require('nvim-dap-projects').search_project_config, { desc = '[Debug] search debug [c]onfig' })
    end,
  },
  {
    'mrjones2014/smart-splits.nvim',
    build = './kitty/install-kittens.bash',
    config = function()
      vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
      vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
      vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
      vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
    end,
  },
  {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
<<<<<<< HEAD
    version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
=======
    version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
>>>>>>> c0a62fd (good stuff)
    config = function()
      require('kitty-scrollback').setup()
    end,
  },
  { require('mini.align').setup() },
<<<<<<< HEAD

  { require('mini.diff').setup() },
=======
>>>>>>> c0a62fd (good stuff)
  {
    require('mini.operators').setup {
      -- Each entry configures one operator.
      -- `prefix` defines keys mapped during `setup()`: in Normal mode
      -- to operate on textobject and line, in Visual - on selection.

      -- Evaluate text and replace with output
      evaluate = {
        prefix = '<leader>=',

        -- Function which does the evaluation
        func = nil,
      },

      -- Exchange text regions
      exchange = {
        prefix = '<leader>x',

        -- Whether to reindent new text to match previous indent
        reindent_linewise = true,
      },

      -- Multiply (duplicate) text
      multiply = {
        prefix = '<leader>M',

        -- Function which can modify text before multiplying
        func = nil,
      },

      -- Replace text with register
      replace = {
        prefix = '<leader>p',

        -- Whether to reindent new text to match previous indent
        reindent_linewise = true,
      },

      -- Sort text
      sort = {
        prefix = '<leader>S',

        -- Function which does the sort
        func = nil,
      },
    },
  },
  {
    require('nvim-treesitter.configs').setup {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<leader>v',
          node_incremental = '<leader>v',
          scope_incremental = false,
          node_decremental = '<leader>V',
        },
      },
<<<<<<< HEAD
      textobjects = {

        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
            -- You can also use captures from other query groups like `locals.scm`
            ['as'] = { query = '@local.scope', query_group = 'locals', desc = 'Select language scope' },
          },

          -- move = {
          --   enable = true,
          --   set_jumps = true, -- whether to set jumps in the jumplist
          --   goto_next_start = {
          --     [']m'] = '@function.outer',
          --     [']]'] = { query = '@class.outer', desc = 'Next class start' },
          --     --
          --     -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
          --     [']o'] = '@loop.*',
          --     -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
          --     --
          --     -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          --     -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          --     [']s'] = { query = '@local.scope', query_group = 'locals', desc = 'Next scope' },
          --     [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
          --   },
          --   goto_next_end = {
          --     [']M'] = '@function.outer',
          --     [']['] = '@class.outer',
          --   },
          --   goto_previous_start = {
          --     ['[m'] = '@function.outer',
          --     ['[['] = '@class.outer',
          --   },
          --   goto_previous_end = {
          --     ['[M'] = '@function.outer',
          --     ['[]'] = '@class.outer',
          --   },
          --   -- Below will go to either the start or the end, whichever is closer.
          --   -- Use if you want more granular movements
          --   -- Make it even more gradual by adding multiple queries and regex.
          --   goto_next = {
          --     [']d'] = '@conditional.outer',
          --   },
          --   goto_previous = {
          --     ['[d'] = '@conditional.outer',
          -- },
          -- },
        },
      },
    },
  },
  { 'nvim-treesitter/nvim-treesitter-context', event = 'VeryLazy' },
  { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'VeryLazy' },
=======
    },
  },
  { 'nvim-treesitter/nvim-treesitter-context' },
>>>>>>> c0a62fd (good stuff)
  { require('mini.bracketed').setup() },
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
<<<<<<< HEAD
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
=======
  {
    'smoka7/multicursors.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvimtools/hydra.nvim',
    },
    opts = {},
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
      {
        mode = { 'v', 'n' },
        '<Leader>m',
        '<cmd>MCstart<cr>',
        desc = 'Create a selection for selected text or word under the cursor',
      },
    },
  },
  {
    'NeogitOrg/neogit',
>>>>>>> c0a62fd (good stuff)
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
    end,
  },
  'knubie/vim-kitty-navigator',
<<<<<<< HEAD
  'nvim-tree/nvim-web-devicons',
  {
    'MeanderingProgrammer/render-markdown.nvim',
    event = 'VeryLazy',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
=======
  'rvmelkonian/move.vim',
  'nvim-tree/nvim-web-devicons',
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon',
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim',
    },
>>>>>>> c0a62fd (good stuff)
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
          -- when `true`, flash will be activated during regular search by default.
          -- You can always toggle when searching with `require("flash").toggle()`
          enabled = true,
          highlight = { backdrop = false },
          jump = { history = true, register = true, nohlsearch = true },
          -- `forward` will be automatically set to the search direction
          -- `mode` is always set to `search`
          -- `incremental` is set to `true` when `incsearch` is enabled
        },
      },
      multi_window = false,
    },
              -- stylua: ignore
    keys = {
            { "<c-/>", mode = { "n", "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash" },
            { "<c-'>", mode = { "n", "o", "x" }, function() require("flash").jump({pattern = vim.fn.expand("<cword>")}) end, desc = "Flash" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
<<<<<<< HEAD
  {
    'kawre/leetcode.nvim',
    event = 'VeryLazy',
=======
  { 'Mofiqul/vscode.nvim' },
  {
    'kawre/leetcode.nvim',
>>>>>>> c0a62fd (good stuff)
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
<<<<<<< HEAD
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
    -- lazy = true,
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
=======
  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^5', -- Recommended
  --   ft = { 'rust' },
  -- },
>>>>>>> c0a62fd (good stuff)
}

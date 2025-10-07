-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  { 'rcarriga/nvim-dap-ui', enabled = false },
  {
    'miroshQa/debugmaster.nvim',
    event = 'VeryLazy',
    -- osv is needed if you want to debug neovim lua code. Also can be used
    -- as a way to quickly test-drive the plugin without configuring debug adapters
    dependencies = { 'mfussenegger/nvim-dap', 'jbyuki/one-small-step-for-vimkind' },
    config = function()
      local dm = require 'debugmaster'
      -- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
      -- Alternative keybindings to "<leader>d" could be: "<leader>m", "<leader>;"
      vim.keymap.set({ 'n', 'v' }, '<leader>dd', dm.mode.toggle, { nowait = true })
      -- If you want to disable debug mode in addition to leader+d using the Escape key:
      -- vim.keymap.set("n", "<Esc>", dm.mode.disable)
      -- This might be unwanted if you already use Esc for ":noh"
      vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

      dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code
      local dap = require 'dap'
      -- Configure your debug adapters here
      -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    end,
  },
  {
    -- NOTE: Yes, you can install new plugins here!
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    -- NOTE: And you can specify dependencies as well
    dependencies = {
      -- Creates a beautiful debugger UI
      -- 'rcarriga/nvim-dap-ui',

      -- Required dependency for nvim-dap-ui
      'nvim-neotest/nvim-nio',

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Add your own debuggers here
      'leoluz/nvim-dap-go',

      'mfussenegger/nvim-dap-python',
    },
    keys = function(_, keys)
      local dap = require 'dap'
      -- local dapui = require 'dapui'
      return {
        -- Basic debugging keymaps, feel free to change to your liking!
        { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
        -- { '<F6>', dap.restart, desc = 'Debug: Start/Continue' },
        -- { '<F1>', dap.step_into, desc = 'Debug: Step Into' },
        -- { '<F2>', dap.step_over, desc = 'Debug: Step Over' },
        -- { '<F3>', dap.step_out, desc = 'Debug: Step Out' },
        -- { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
        -- {
        --   '<leader>B',
        --   function()
        --     dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        --   end,
        --   desc = 'Debug: Set Breakpoint',
        -- },
        -- { '<F7>', dapui.toggle, desc = 'Debug: See last session result.' },
        unpack(keys),
      }
    end,
    config = function()
      local dap = require 'dap'
      vim.api.nvim_set_hl(0, 'DapBreakpointHL', { fg = '#e51400' })
      vim.api.nvim_set_hl(0, 'DapConditionHL', { fg = '#00ffff' })
      vim.api.nvim_set_hl(0, 'DapRejectedHL', { fg = '#ffaa00' })
      vim.api.nvim_set_hl(0, 'DapStoppedHL', { fg = '#00ff00' })
      vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#3c3836' })

      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpointHL', linehl = 'DapBreakpointHL' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapConditionHL', linehl = 'DapConditionHL' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapRejectedHL', linehl = 'DapRejectedHL' })
      vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStoppedHL', linehl = 'DapStoppedHL' })

      require('mason-nvim-dap').setup {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {
          function(config)
            -- all sources with no handler get passed here

            -- Keep original functionality
            require('mason-nvim-dap').default_setup(config)
          end,
          python = function(config)
            config.adapters = {
              type = 'executable',
              command = 'python',
              args = {
                '-m',
                'debugpy.adapter',
              },
            }
            require('mason-nvim-dap').default_setup(config) -- don't forget this!
          end,
        },

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          'delve',
          'codelldb',
          'cpptools',
          'python',
        },
      }

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      -- dapui.setup {
      --   -- Set icons to characters that are more likely to work in every terminal.
      --   --    Feel free to remove or use ones that you like more! :)
      --   --    Don't feel like these are good choices.
      --   -- icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      --   -- controls = {
      --   --   icons = {
      --   --     pause = '⏸',
      --   --     play = '▶',
      --   --     step_into = '⏎',
      --   --     step_over = '⏭',
      --   --     step_out = '⏮',
      --   --     step_back = 'b',
      --   --     run_last = '▶▶',
      --   --     terminate = '⏹',
      --   --     disconnect = '⏏',
      --   --   },
      --   -- },
      -- }

      -- Change breakpoint icons
      -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
      -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
      -- local breakpoint_icons = vim.g.have_nerd_font
      --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
      --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
      -- for type, icon in pairs(breakpoint_icons) do
      --   local tp = 'Dap' .. type
      --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
      --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
      -- end

      -- dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      -- dap.listeners.before.event_exited['dapui_config'] = dapui.close

      -- Install golang specific config
      require('dap-go').setup {
        delve = {
          -- On Windows delve must be run attached or it crashes.
          -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
          detached = vim.fn.has 'win32' == 0,
        },
      }
      require('dap-python').setup 'uv'
    end,
  },
}

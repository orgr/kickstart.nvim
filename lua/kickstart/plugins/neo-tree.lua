-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  event = 'VeryLazy',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['/'] = 'noop',
          ['<tab>'] = 'toggle_node',
        },
      },
    },
    event_handlers = {
      {
        event = 'neo_tree_popup_input_ready',
        ---@param args { bufnr: integer, winid: integer }
        handler = function(args)
          vim.cmd 'stopinsert'
          vim.keymap.set('i', '<esc>', vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
        end,
      },
    },
  },
}

-- disable fuzzy finder

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'New Horizontal Split' }),
  vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'New Vertical Split' }),
  vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Close Window' }),

  vim.keymap.set('n', '<leader>sF', function()
    require('telescope.builtin').find_files { hidden = true, no_ignore = true }
  end, { desc = '[S]earch [F]iles (no ignores)' }),
  vim.keymap.set('n', '<leader>sj', function()
    require('telescope.builtin').lsp_document_symbols()
  end, { desc = 'Document [S]ymbols' }),

  vim.keymap.set('n', '<leader>sJ', function()
    require('telescope.builtin').lsp_dynamic_workspace_symbols()
  end, { desc = '[W]orkspace [S]ymbols' }),

  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' }),

  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv"),
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv"),

  vim.keymap.set('n', '<leader>th', function()
    local virtual_text_enabled = not vim.diagnostic.config().virtual_text
    vim.diagnostic.config { virtual_text = virtual_text_enabled }
  end, { desc = 'no desc' }),

  vim.keymap.set('n', '<leader>gh', ':DiffviewFileHistory % <CR>'),
  vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Move focus to the left window' }),
  vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Move focus to the right window' }),
  vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Move focus to the lower window' }),
  vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Move focus to the upper window' }),
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }),
}

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

  vim.keymap.set('n', '<leader>sj', require('telescope.builtin').lsp_document_symbols, { desc = 'Document [S]ymbols' }),

  vim.keymap.set('n', '<leader>sJ', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' }),

  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' }),

  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv"),
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv"),
}

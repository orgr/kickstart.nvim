return {
  name = 'autocommands',
  dir = '.',
  config = function()
    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function(args)
        vim.fn.system { 'kitten', '@', 'set-window-title', 'Nvim - ' .. args.file }
      end,
    })
  end,
}

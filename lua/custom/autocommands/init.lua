return {
  name = 'autocommands',
  lazy = false,
  dir = '.',
  config = function()
    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function(args)
        if not vim.env.KITTY_PID or args.file == '' then
          return
        end
        local title = string.format('Nvim - %s', args.file)
        vim.fn.jobstart({ 'kitten', '@', 'set-window-title', title }, { detach = true })
      end,
    })
  end,
}

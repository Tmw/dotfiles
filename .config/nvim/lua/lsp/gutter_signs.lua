local M = {
  signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }
}

function M.setup()
  for _, sign in ipairs(M.signs) do
    vim.fn.sign_define(sign.name, { 
      texthl = sign.name, 
      text = sign.text, 
      numhl = '' 
    })
  end
end

return M

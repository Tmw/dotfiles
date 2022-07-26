local lsp_installer = require('nvim-lsp-installer')
local gutter_signs = require('lsp.gutter_signs')
local diagnostics = require('lsp.diagnostics')
local null_ls = require('lsp.null-ls')

local Module = {
  -- what language servers do we need (powered by nvim-lsp-installer)
  servers = {
    'eslint',
    'tsserver',
    'gopls',
    'clangd'
  }
}

function Module:setup()
  Module.configure_lsp_handlers()
  null_ls:setup()

  self:install_servers()
  Module.enable_format_on_save()
  gutter_signs.setup()
  diagnostics.setup()
end

function Module:install_servers()
  -- first make sure the required language servers are available and
  -- installed on our system using the lsp-installer package
  for _, name in pairs(self.servers) do
    local server_available, server = lsp_installer.get_server(name)
    if server_available and not server:is_installed() then
      server:install()
    end
  end

  -- once the servers are installed and ready, configure
  -- them using the capabilities and handlers
  lsp_installer.on_server_ready(function(server)
    local config = {}
    config.capabilities = Module._get_capabilities()
    config.on_attach    = Module._on_attach 

    server:setup(config)
  end)
end

-- return language server capabilities and setup snippet support
function Module._get_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local cmp_nvim_lsp = require 'cmp_nvim_lsp'
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

  return capabilities
end

function Module._on_attach(client, bufnr)
  -- loop in the illuminate plugin to light up matching identifiers
  local illuminate = require 'illuminate'
  illuminate.on_attach(client)

  -- only run formatter through null-ls
  if client.name ~= 'null-ls' then
    client.resolved_capabilities.document_formatting = false
  end

  -- if we're doing typescript work; also loop in the nvim-lsp-ts-utils
  -- for an improved typescript workflow.
  if client.name == 'tsserver' then
    local ts_utils = require 'nvim-lsp-ts-utils'
    ts_utils.setup {}
    ts_utils.setup_client(client)
  end

  -- setup keymap for language server in current buffer
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',         '<cmd>lua vim.lsp.buf.hover() <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',        '<cmd>lua vim.lsp.buf.definition() <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',        '<cmd>lua vim.lsp.buf.declaration() <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',        '<cmd>lua vim.lsp.buf.implementation() <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',        '<cmd>lua vim.lsp.buf.references() <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action() <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gh', '<cmd>lua vim.lsp.buf.signature_help() <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename() <CR>', opts)
end

-- Setup autocommand to run formatted when saving a buffer
function Module.enable_format_on_save()
  vim.cmd [[
    augroup format_on_save
      au!
      autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 2000)
    augroup end
  ]]
end

function Module.configure_lsp_handlers()
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })
end

return Module

local null_ls = require 'null-ls'
local Module = {
  sources = {
    -- formatting using prettier with prettierd
    null_ls.builtins.formatting.prettierd,

    -- more?
  }
}

function Module:setup()
  null_ls.setup { 
    sources = self.sources
  }
end

return Module

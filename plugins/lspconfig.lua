local M = {}

M.setup_lsp = function(attach, capabilities)
   capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
   }

   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "html", "cssls", "emmet_ls", "tailwindcss", "tsserver", "jsonls", "volar", "eslint", 'theme_check', 'cssmodules_ls' }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end
end

return M

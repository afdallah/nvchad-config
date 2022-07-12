local M = {}

local function termcodes(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<C-s>"] = "",
    ["<leader>x"] = "",
    ["<leader>c"] = "",
    ["<leader>cm"] = "",
    ["<leader>ca"] = "",
    ["<S-b>"] = "",
    ["<leader>w"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
    ["<C-n>"] = "",
    ["<leader>tt"] = "",
    ["<leader>tp"] = "",
    ["<leader>tn"] = "",
    ["<leader>gg"] = "",
  }
}

M.general = {
  n = {
    ["<leader>w"] = { "<cmd>w <CR>", "﬚  save file"},
    ["<leader>q"] = { "<cmd>qa! <CR>", "Quit"},
    ["<leader>so"] = { "<cmd>source % <CR>", "source lua file" },
    ["<leader>zz"] = {  "<cmd>lua lazygit_toggle()<CR>", "lazygit" },
  },
  t = {
     --  Nicer way to navigate in terminal
    ["<esc>"] = { termcodes "<C-\\><C-n>", "Terminal normal mode"},
    ["<C-h>"] = { termcodes "<C-\\><C-n><C-w>h", "Terminal left window navigation" },
    ["<C-j>"] = { termcodes "<C-\\><C-n><C-w>j", "Terminal down window navigation" },
    ["<C-k>"] = { termcodes "<C-\\><C-n><C-w>k", "Terminal up window navigation" },
    ["<C-l>"] = { termcodes "<C-\\><C-n><C-w>l", "Terminal right window naviation" },
  },
  v = {
    ["<"] = { "<gv", "unindent line" },
    [">"] = { ">gv", "indent line" }
  }
}

M.nvterm = {
  n = {
    ["<leader>lz"] = {
      function()
        require("nvterm.terminal").send("lazygit", "float")
      end,
      "nvterm lazygit",
    },
  }
}

-- M.nvterm = {
--   t = {
--     -- toggle in terminal mode
--     -- ["<C-\\>"] = { "<cmd> _LAZYGIT_TOGGLE() <CR>", "   toggle lazygit"},
--
--     ["<A-h>"] = {
--       function()
--         require("nvterm.terminal").toggle "horizontal"
--       end,
--       "   toggle horizontal term",
--     },
--
--     ["<A-v>"] = {
--       function()
--         require("nvterm.terminal").toggle "vertical"
--       end,
--       "   toggle vertical term",
--     },
--   },
--
--   n = {
--     -- toggle in normal mode
--     ["<C-\\>"] = {
--       function()
--         require("nvterm.terminal").send(term_cmds["lazygit"], 'vertical')
--       end,
--       "   toggle floating term",
--     },
--
--     ["<A-h>"] = {
--       function()
--         require("nvterm.terminal").toggle "horizontal"
--       end,
--       "   toggle horizontal term",
--     },
--
--     ["<A-v>"] = {
--       function()
--         require("nvterm.terminal").toggle "vertical"
--       end,
--       "   toggle vertical term",
--     },
--
--     -- new
--
--     ["<leader>h"] = {
--       function()
--         require("nvterm.terminal").new "horizontal"
--       end,
--       "   new horizontal term",
--     },
--
--     ["<leader>v"] = {
--       function()
--         require("nvterm.terminal").new "vertical"
--       end,
--       "   new vertical term",
--     },
--   },
-- }

M.tabufline = {
  n = {
    ["<leader>c"] = {
      function()
        require("core.utils").close_buffer()
      end,
      "   close buffer",
    },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", '   toggle nvimtree' }
  }
}

M.lspconfig = {
   -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "   lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "   lsp definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "   lsp hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "   lsp implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "   lsp signature_help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "   lsp definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.ui.renamer").open()
      end,
      "   lsp rename",
    },

    -- ["<leader>ca"] = {
    --    function()
    --       vim.lsp.buf.code_action()
    --    end,
    --    "   lsp code_action",
    -- },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "   lsp references",
    },

    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "   floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "   goto prev",
    },

    ["d]"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "   goto_next",
    },

    -- ["<leader>q"] = {
    --    function()
    --       vim.diagnostic.setloclist()
    --    end,
    --    "   diagnostic setloclist",
    -- },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.formatting()
      end,
      "   lsp formatting",
    },

    -- ["<leader>wa"] = {
    --    function()
    --       vim.lsp.buf.add_workspace_folder()
    --    end,
    --    "   add workspace folder",
    -- },

    -- ["<leader>wr"] = {
    --    function()
    --       vim.lsp.buf.remove_workspace_folder()
    --    end,
    --    "   remove workspace folder",
    -- },

    -- ["<leader>wl"] = {
    --    function()
    --       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --    end,
    --    "   list workspace folders",
    -- },
  },
}

return M

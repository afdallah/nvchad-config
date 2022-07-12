return {
  ["JoosepAlviste/nvim-ts-context-commentstring"] = {
    context_commentstring = {
      enable = true
    }
  },
  ["windwp/nvim-ts-autotag"] = {
    config = function()
    end
  },
  ["mg979/vim-visual-multi"] = {
    config = function()
    end
  },
  ["nvim-treesitter/playground"] = {
    config = function()
    end
  },
  ["declancm/cinnamon.nvim"] = {
    config = function()
      require('cinnamon').setup({})
    end
  },
  ["kylechui/nvim-surround"] = {
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  ['sindrets/diffview.nvim'] = {
    after = "plenary.nvim",
    config = function()
      require("diffview").setup()
    end,
  },
  ['nvim-lua/plenary.nvim'] = {
    module = ""
  },
  ["akinsho/toggleterm.nvim"] = {
    -- cmd = "ToggleTerm",
    module = { "toggleterm", "toggleterm.terminal" },
    config = function()
      require "custom.plugins.toggleterm"
    end,
  },
}

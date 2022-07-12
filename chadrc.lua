local M = {}

M.options = {
  user = function()
    vim.opt.scrolloff = 8
    vim.opt.sidescrolloff = 8
    vim.opt.relativenumber = true
  end
}

M.ui = {
  theme = "nightowl",
  hl_override = {
    --override default highlights

    NvimTreeGitDirty = { fg = "green"},
    NvimTreeGitStaged = { fg = "white" },
    NvimTreeGitMerge = {},
    NvimTreeGitRenamed = { fg = "yellow" },
    NvimTreeGitNew = { fg = "red" },
    NvimTreeGitDeleted = { fg = "red" },
    NvimTreeGitIgnored = { fg = "grey" },
  },
  statusline = {
    separator_style = "block"
  }
}

M.plugins = {
  -- remove = {
  --   "NvChad/nvterm",
  -- },
  override = {
    ["nvim-treesitter/nvim-treesitter"]  = {
      highlight = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
      },
      indent = {
        enable = true
      },
      autotag = {
        enable = true
      }
    },
    ["numToStr/Comment.nvim"] = {
      pre_hook = function(ctx)
        local utils = require "Comment.utils"
        local location = nil
        if ctx.ctype == utils.ctype.block then
          location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring {
          key = ctx.ctype == utils.ctype.line and "__default" or "__multiline",
          location = location,
        }
      end,
    },
    ["kyazdani42/nvim-tree.lua"] = {
      hijack_cursor = true,
      git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        timeout = 400,
      },
      renderer = {
        highlight_git = true,
        -- highlight_opened_files = "icon",
        icons = {
          webdev_colors = true,
          git_placement = "after",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "M",
              staged = "A",
              unmerged = "",
              renamed = "R",
              untracked = "U",
              deleted = "D",
              ignored = "i",
            },
          }
        }
      },
      view = {
        side = "left",
        width = 30,
      },
      live_filter = {
        always_show_folders = true,
      },
    }
  },
  user = require "custom.plugins",
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
}

M.mappings = require "custom.mappings"

return M

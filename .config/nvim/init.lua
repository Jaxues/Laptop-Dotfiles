vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.expandtab = false
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  lazy.install(lazy.path)
  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

-- call lazy.setup() properly here
lazy.setup({
  {"nvim-lualine/lualine.nvim"},
  {"vimwiki/vimwiki", 
    init = function() 
      vim.g.vimwiki_list = {
        {
          syntax = 'default',
          ext = '.md',
        },
      }
    end,
  },
  {"Mofiqul/dracula.nvim", priority = 1000},
  {"nvim-treesitter/nvim-treesitter"},
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
			vim.keymap.set('n', '<leader>d', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
  }
})

-- these should stay AFTER lazy.setup
require("lualine").setup()
vim.cmd[[colorscheme dracula]]


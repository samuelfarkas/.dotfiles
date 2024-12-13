-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- Automatically check for plugin updates
  checker = { enabled = true },
  -- Plugins
  spec = {
    -- Which-Key for keybinding management
    'folke/which-key.nvim',

    -- Treesitter-related plugins
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-context',
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
    },

    -- Utility plugins
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'numToStr/Comment.nvim',
    'lewis6991/gitsigns.nvim',
    'NvChad/nvim-colorizer.lua',
    'kyazdani42/nvim-web-devicons',
    'github/copilot.vim',

    -- Telescope for fuzzy finding
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- Lualine for statusline
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- LSP configuration with lsp-zero
    {
      'VonHeikemen/lsp-zero.nvim',
      dependencies = {
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'L3MON4D3/LuaSnip', dependencies = { "rafamadriz/friendly-snippets" }},
        { 'rafamadriz/friendly-snippets' },
      },
    },

    -- None-ls for linting and formatting
    'nvimtools/none-ls.nvim',
    'nvimtools/none-ls-extras.nvim',

    -- Colorscheme
    {
      'rose-pine/neovim',
      name = 'rose-pine',
    },
  },
})


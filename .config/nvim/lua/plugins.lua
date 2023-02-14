vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/nvim-treesitter-context' }
    use { 'nvim-treesitter/playground' }

    -- file search
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' } }
    -- navigation between tmux and vim panes
    use { 'christoomey/vim-tmux-navigator' }
    -- easy commenting 'gc'
    use { 'tpope/vim-commentary' }
    -- surround normal:'ys' 'cs' 'ds', visual:'S'
    use { 'tpope/vim-surround' }
    -- repeat for plugins
    use { 'tpope/vim-repeat' }
    -- best git workflow
    use { 'tpope/vim-fugitive' }
    -- automatically detect indentation
    use { 'tpope/vim-sleuth' }
    -- disable highlight after search
    use { 'romainl/vim-cool' }
    -- star search in visual mode
    use { 'bronson/vim-visual-star-search' }


    -- TODO maybe replacing this with telescope?
    use { 'junegunn/fzf', run = function() vim.fn["fzf#install"]() end }
    use { 'junegunn/fzf.vim' }


    -- status bar line
    use { 'nvim-lualine/lualine.nvim' }
    -- file sidebar
    use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
    -- tagbar
    use { 'preservim/tagbar' }
    -- git gutter
    use { 'airblade/vim-gitgutter' }


    -- vim wiki
    use {
        'vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_list = {
                {
                    path = '~/vimwiki/',
                    syntax = 'markdown',
                    ext = '.md',
                    auto_diary_index = 1,
                    links_space_char = '_',
                }
            }
            -- include extension in created links. allows markdown ease of use outside of vim
            vim.g.vimwiki_markdown_link_ext = 1
            -- disable table mappings to allow for tab to work with ultisnips
            -- vim.g.vimwiki_table_mappings = 0
            -- disable conceal for urls because vimbug vim/vim#260 :c
            vim.g.vimwiki_url_maxsave = 0
        end
    }

    -- markdown preview
    use { 'iamcco/markdown-preview.nvim', run = function() vim.fn["mkdp#util#install"]() end }


    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            -- Snippet Collection (Optional)
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- trying this thing out to get autoimports working in go
    use { 'jose-elias-alvarez/null-ls.nvim' }

    -- trying this out again, totally doesn't work as expected though :[
    -- use { 'shortcuts/no-neck-pain.nvim', tag = '*' }
    use { 'shortcuts/no-neck-pain.nvim' }

    -- some colorschemes
    use { 'arcticicestudio/nord-vim' }
    use { 'EdenEast/nightfox.nvim' }
    use { 'sainnhe/everforest' }
    use { 'catppuccin/nvim', as = 'catppuccin' }

end)

-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  {
    'nvim-telescope/telescope.nvim',
    build = 'make',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required for Telescope to work
      'nvim-telescope/telescope-fzf-native.nvim', -- Faster fuzzy finding
      'nvim-telescope/telescope-ui-select.nvim', -- UI select for Telescope
      'nvim-tree/nvim-web-devicons', -- Optional: for file icons
    },
    config = function()
      -- Load Telescope and its extensions
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'
      local builtin = require 'telescope.builtin'

      -- Configure Telescope
      telescope.setup {
        defaults = {
          mappings = {
            i = {
              -- Close Telescope with a single <Esc> press
              ['<Esc>'] = actions.close,
              -- Navigate the results list
              ['<C-n>'] = actions.move_selection_next,
              ['<C-p>'] = actions.move_selection_previous,
              -- Scroll the preview window
              ['<C-u>'] = actions.preview_scrolling_up,
              ['<C-d>'] = actions.preview_scrolling_down,
            },
          },
          -- Default layout configuration
          layout_config = {
            horizontal = {
              preview_width = 0.6,
            },
          },
          -- Enable file icons (requires nvim-web-devicons)
          file_ignore_patterns = { 'node_modules', '.git', 'dist', 'build' }, -- Ignore certain files/folders
        },
        pickers = {
          -- Customize built-in pickers
          find_files = {
            theme = 'dropdown', -- Use a dropdown theme for find_files
            hidden = true, -- Include hidden files
          },
          live_grep = {
            theme = 'dropdown', -- Use a dropdown theme for live_grep
          },
          buffers = {
            theme = 'dropdown', -- Use a dropdown theme for buffers
            sort_lastused = true, -- Sort buffers by last used
          },
        },
        extensions = {
          -- Configure Telescope extensions
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(), -- Use a dropdown theme for ui-select
          },
        },
      }

      -- Load Telescope extensions
      telescope.load_extension 'fzf' -- Faster fuzzy finding
      telescope.load_extension 'ui-select' -- UI select for Telescope

      -- Keybindings for Telescope
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = '[F]ind [R]ecent Files' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = '[F]ind [S]ymbols' })
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
      vim.keymap.set('n', '<leader>fc', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[F]ind Neovim [C]onfig Files' })

      -- Advanced example: Fuzzy search in the current buffer
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzy search in current buffer' })

      -- Advanced example: Live grep in open files
      vim.keymap.set('n', '<leader>f/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[F]ind [/] in Open Files' })
    end,
  },
}

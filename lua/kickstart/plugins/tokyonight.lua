-- return {
--   { -- You can easily change to a different colorscheme.
--     -- Change the name of the colorscheme plugin below, and then
--     -- change the command in the config to whatever the name of that colorscheme is.
--     --
--     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--     'folke/tokyonight.nvim',
--     priority = 1000, -- Make sure to load this before all the other start plugins.
--     config = function()
--       ---@diagnostic disable-next-line: missing-fields
--       require('tokyonight').setup {
--         styles = {
--           comments = { italic = false }, -- Disable italics in comments
--         },
--       }
--
--       -- Load the colorscheme here.
--       -- Like many other themes, this one has different styles, and you could load
--       -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--       vim.cmd.colorscheme 'tokyonight-night'
--     end,
--   },
--   { -- Gruvbox colorscheme
--     'morhetz/gruvbox',
--     priority = 1000,
--   },
--   { -- Kanagawa colorscheme
--     'rebelot/kanagawa.nvim',
--     priority = 1000,
--     config = function()
--       require('kanagawa').setup {
--         commentStyle = { italic = false }, -- Disable italics in comments
--       }
--     end,
--   },
--   { -- Ayu colorscheme
--     'ayu-theme/ayu-vim',
--     priority = 1000,
--     config = function()
--       vim.g.ayu_mirage = false -- Use ayu-dark or ayu-light by default (not mirage)
--     end,
--   },
--   { -- Catppuccin colorscheme
--     'catppuccin/nvim',
--     name = 'catppuccin', -- Required for lazy.nvim to load correctly
--     priority = 1000,
--     config = function()
--       require('catppuccin').setup {
--         flavour = 'mocha', -- Default flavour
--         no_italic = true, -- Disable italics for comments and other elements
--       }
--     end,
--   },
-- }
-- -- vim: ts=2 sts=2 sw=2 et
return {
    { -- TokyoNight colorscheme
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('tokyonight').setup {
                styles = {
                    comments = { italic = false }, -- Disable italics in comments
                },
            }
        end,
    },
    { -- Gruvbox colorscheme
        'morhetz/gruvbox',
        priority = 1000,
    },
    { -- Kanagawa colorscheme
        'rebelot/kanagawa.nvim',
        priority = 1000,
        config = function()
            require('kanagawa').setup {
                commentStyle = { italic = false }, -- Disable italics in comments
            }
        end,
    },
    { -- Ayu colorscheme
        'ayu-theme/ayu-vim',
        priority = 1000,
        config = function()
            vim.g.ayu_mirage = false -- Use ayu-dark or ayu-light by default (not mirage)
        end,
    },
    { -- Catppuccin colorscheme
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup {
                flavour = 'mocha', -- Default flavour
                no_italic = true, -- Disable italics for comments and other elements
            }
        end,
    }, { -- Nightfox colorscheme
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
        require('nightfox').setup({
            options = {
                compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                compile_file_suffix = "_compiled",
                transparent = false,
                terminal_colors = true,
                dim_inactive = false,
                module_default = true,
                colorblind = {
                    enable = false,
                    simulate_only = false,
                    severity = {
                        protan = 0,
                        deutan = 0,
                        tritan = 0,
                    },
                },
                styles = {
                    comments = "NONE",
                    conditionals = "NONE",
                    constants = "NONE",
                    functions = "NONE",
                    keywords = "NONE",
                    numbers = "NONE",
                    operators = "NONE",
                    strings = "NONE",
                    types = "NONE",
                    variables = "NONE",
                },
                inverse = {
                    match_paren = false,
                    visual = false,
                    search = false,
                },
                modules = {},
            },
            palettes = {},
            specs = {},
            groups = {},
        })
    end,
},
    {                        -- Setup persistent colorscheme
        'nvim-lua/plenary.nvim', -- Dependency for file operations
        priority = 1000,
        config = function()
            local plenary_path = require 'plenary.path'
            local colorscheme_file = plenary_path:new(vim.fn.stdpath 'data' .. '/colorscheme.txt')

            -- Function to save the colorscheme
            local function save_colorscheme(colorscheme)
                colorscheme_file:write(colorscheme, 'w')
            end

            -- Function to load the colorscheme
            local function load_colorscheme()
                if colorscheme_file:exists() then
                    local colorscheme = colorscheme_file:read():gsub('%s+', '')
                    vim.cmd('colorscheme ' .. colorscheme)
                else
                    vim.cmd.colorscheme 'tokyonight-night' -- Default colorscheme
                end
            end

            -- Load the saved colorscheme on startup
            load_colorscheme()

            -- Create a command to save the current colorscheme
            vim.api.nvim_create_user_command('SaveColorscheme', function()
                local current_colorscheme = vim.g.colors_name or 'tokyonight-night'
                save_colorscheme(current_colorscheme)
                print('Colorscheme saved: ' .. current_colorscheme)
            end, {})

            -- Optional: Auto-save colorscheme when changed via Telescope
            vim.api.nvim_create_autocmd('ColorScheme', {
                pattern = '*',
                callback = function()
                    local current_colorscheme = vim.g.colors_name
                    save_colorscheme(current_colorscheme)
                end,
            })
        end,
    },
}


--{{ Sonokai Styles
--   'default'
--   'atlantis'
--   'andromeda'
--   'shusia'
--   'maia'
--   'espresso'
--}}


function ColorScheme(color, trans)

    color = color or "greenscreen"
    if color == "gruvbox-material" then
        vim.cmd[[
            let g:gruvbox_material_background = 'medium'
            let g:gruvbox_material_better_performance = 1
            ]]
    end
    if color == "everforest" then
        vim.cmd[[
            let g:everforest_background = 'hard'
            let g:everforest_better_performance = 1
            ]]
    end
    if color == "gruvbox" then
        vim.cmd[[
            set background=dark
            let g:gruvbox_contrast_dark = 'hard'
            let g:gruvbox_contrast_light = 'soft'
        ]]
    end
    vim.cmd.colorscheme(color)
    if trans == true then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

local color_chemes = {
    "greenscreen",      -- 1
    "everforest",       -- 2
    "solarized",        -- 3
    "gruvbox",          -- 4
    "gruvbox-material", -- 5
    "custom"
}

local transparent = true

ColorScheme(color_chemes[1], transparent)



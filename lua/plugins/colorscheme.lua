local function apply_transparent_background()
    local groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "SignColumn",
        "StatusLine",
        "StatusLineNC",
        "LineNr",
        "CursorLineNr",
        "EndOfBuffer",
        "Pmenu",
        "PmenuSel",
        "TelescopeNormal",
        "TelescopeBorder",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
    }
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end
end

return {
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,     -- load immediately
        priority = 1000,  -- ensure it loads before other plugins
        opts = {
            bold = false, -- example customization
            transparent = true,
            italic = {
                strings = false, -- disable italics for strings
            },
        },
        config = function(_, opts)
            require("gruber-darker").setup(opts)
            vim.cmd.colorscheme("gruber-darker")
            apply_transparent_background()
            vim.api.nvim_create_autocmd("ColorScheme", {
                group = vim.api.nvim_create_augroup("TransparentBackground", { clear = true }),
                callback = apply_transparent_background,
            })
        end,
    },
}

return {
    "tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            transparent = true,
            style = "night",
        })

        vim.cmd([[colorscheme tokyonight]])
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}

return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            local lualine = require("lualine")

            -- configure lualine with modified theme
            lualine.setup({
                options = {
                    icons_enabled = false,
                    theme = "tokyonight",
                    component_separators = "|",
                    section_separators = "",
                },
            })
        end,
    },
}

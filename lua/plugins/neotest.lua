return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "fredrikaverpil/neotest-golang", -- Installation
        },
        config = function()
            local config = { -- Specify configuration
                go_test_args = {
                    "-v",
                },
            }
            require("neotest").setup({
                adapters = {
                    require("neotest-golang")(config), -- Registration
                },
            })
        end,
    },
}

-- return {
--     { "haydenmeade/neotest-jest" },
--     { "rouge8/neotest-rust" },
--     { "fredrikaverpil/neotest-golang" },
--     {
--         "nvim-neotest/neotest",
--         opts = {
--             adapters = {
--                 ["neotest-golang"] = {},
--                 ["neotest-rust"] = {},
--                 ["neotest-jest"] = {
--                     args = {
--                         jestCommand = "npm test --",
--                         jestConfigFile = "custom.jest.config.ts",
--                         env = { CI = true },
--                         cwd = function(path)
--                             return vim.fn.getcwd()
--                         end,
--                     },
--                 },
--             },
--         },
--     },
-- }

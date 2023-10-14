return {
    { "haydenmeade/neotest-jest" },
    { "rouge8/neotest-rust" },
    {
        "nvim-neotest/neotest",
        opts = {
            adapters = {
                ["neotest-rust"] = {},
                ["neotest-jest"] = {
                    args = {
                        jestCommand = "npm test --",
                        jestConfigFile = "custom.jest.config.ts",
                        env = { CI = true },
                        cwd = function(path)
                            return vim.fn.getcwd()
                        end,
                    },
                },
            },
        },
    },
}

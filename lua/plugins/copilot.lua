return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = {
            suggestion = { enabled = false, auto_trigger = false },
            panel = {
                enabled = false,
                keymap = {
                    accept = "C-<CR>",
                },
            },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
    },
}

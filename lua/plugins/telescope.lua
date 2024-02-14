return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },

    keys = function()
        return {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
            { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
            { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List open buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "List available help tags" },

            -- telescope git commands
            {
                "<leader>gc",
                "<cmd>Telescope git_commits<cr>",
                desc = "List all git commits (use <cr> to checkout) ['gc' for git commits] ",
            },

            {
                "<leader>gfc",
                "<cmd>Telescope git_bcommits<cr>",
                desc = "list git commits for current file/buffer (use <cr> to checkout) ['gfc' for git file commits] ",
            },
            {
                "<leader>gb",
                "<cmd>Telescope git_branches<cr>",
                desc = "list git branches (use <cr> to checkout) ['gb' for git branch]",
            },
            {
                "<leader>gs",
                "<cmd>Telescope git_status<cr>",
                desc = "list current changes per file with diff preview ['gs' for git status]",
            },
        }
    end,
}

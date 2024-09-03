return {
    "nvimdev/lspsaga.nvim",
    branch = "main",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
        local saga = require("lspsaga")

        saga.setup({
            -- keybinds for navigation in lspsaga window
            -- scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
            -- use enter to open file with definition preview
            -- definition = {
            --   edit = "o",
            -- },
            ui = {
                colors = {
                    normal_bg = "#022746",
                },
            },
        })

        local keymap = vim.keymap

        keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", { desc = "Show definition, references" })
        keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Got to declaration" })
        keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { desc = "See definition and make edits in window" })
        keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "See available code actions" })
        keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Smart rename" })
        keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show  diagnostics for line" })
        -- keymap.set(
        --     "n",
        --     "<leader>d",
        --     "<cmd>Lspsaga show_cursor_diagnostics<CR>",
        --     { desc = "Show diagnostics for cursor" }
        -- )
        -- keymap.set(
        --     "n",
        --     "[d",
        --     "<cmd>Lspsaga diagnostic_jump_prev<CR>",
        --     { desc = "Jump to previous diagnostic in buffer" }
        -- )
        -- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Jump to next diagnostic in buffer" })
        keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Show documentation for what is under cursor" })
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
    end,
}

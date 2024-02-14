return {
    { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            -- set keybinds
            keys[#keys + 1] = { "gf", "<cmd>Lspsaga finder<CR>", desc = "Show definition, references" }
            keys[#keys + 1] = { "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Got to declaration" }
            keys[#keys + 1] = {
                "gd",
                "<cmd>Lspsaga peek_definition<CR>",
                desc = "See definition and make edits in window",
            }
            keys[#keys + 1] = { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" }
            keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "See available code actions" }
            keys[#keys + 1] = { "<leader>cr", "<cmd>RustRunnables<CR>", desc = "Code Action (Rust)" }
            keys[#keys + 1] = { "<leader>cd", "<cmd>RustDebuggables<CR>", desc = "Code Debuggables (Rust)" }

            keys[#keys + 1] = { "<leader>rn", "<cmd>Lspsaga rename<CR>", desc = "Smart rename" }
            keys[#keys + 1] = {
                "<leader>D",
                "<cmd>Lspsaga show_line_diagnostics<CR>",
                desc = "Show  diagnostics for line",
            }
            keys[#keys + 1] =
                { "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "Show diagnostics for cursor" }
            keys[#keys + 1] =
                { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump to previous diagnostic in buffer" }
            keys[#keys + 1] =
                { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump to next diagnostic in buffer" }
            keys[#keys + 1] =
                { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Show documentation for what is under cursor" }
            keys[#keys + 1] = { "<leader>rs", ":LspRestart<CR>", desc = "Restart LSP" }
        end,
    },
}

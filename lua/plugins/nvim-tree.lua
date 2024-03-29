return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- import nvim-tree plugin safely
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

        -- configure nvim-tree
        nvimtree.setup({
            -- change folder arrow icons
            renderer = {
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },
            update_focused_file = {
                enable = true,
                update_root = false,
                ignore_list = {},
            },
        })

        -- open nvim-tree on setup
        local function open_nvim_tree(data)
            -- buffer is a [No Name]
            local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

            -- buffer is a directory
            local directory = vim.fn.isdirectory(data.file) == 1

            if not no_name and not directory then
                return
            end

            -- change to the directory
            if directory then
                vim.cmd.cd(data.file)
            end

            -- open the tree
            require("nvim-tree.api").tree.open()
        end

        -- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

        -- nvim-tree keymaps
        local keymap = vim.keymap
        keymap.set("n", "<leader>et", ":NvimTreeToggle<CR>") -- toggle file explorer
        keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>") -- toggle file explorer on current file
        keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>") -- refresh file explorer
    end,
}

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>ex", ":!chmod +x %<CR>")

-- append next line and keep cursor position
keymap.set("n", "J", "mzJ`z")

-- key cursor posltion centered 1/2 page jumping
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor position centered when searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal width & height" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>so", ":only<CR>", { desc = "Close all other splits" })

keymap.set("n", "<leader>To", ":tabonly<CR>", { desc = "Close all other tabs" })
keymap.set("n", "<leader>Tx", ":tabclose<CR>", { desc = "Close curent tab" })
keymap.set("n", "<leader>Tn", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>Tp", ":tabp<CR>", { desc = "Go to prev tab" })

-- buffer management
keymap.set("n", "<leader><leader>", "<C-^>") -- switch between last two buffers

keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })

-- Netrw
keymap.set("n", "<leader>et", ":Vexplore<CR>")

-- ChatGPT
keymap.set("n", "<leader>pc", ":ChatGPT<CR>", { desc = "ChatGPT Query" })
keymap.set("n", "<leader>pe", ":ChatGPTEditWithInstruction<CR>", { desc = "Edit with Instruction" })
keymap.set("n", "<leader>pf", ":ChatGPTRun fix_bugs<CR>", { desc = "Fix Bugs" })
keymap.set("n", "<leader>pr", ":ChatGPTRun code_readbility_analysis<CR>", { desc = "Code Readability Analysis" })
keymap.set("n", "<leader>ps", ":ChatGPTRun summarize<CR>", { desc = "Summrize" })
keymap.set("n", "<leader>px", ":ChatGPTRun explain_code<CR>", { desc = "Explain Code" })

-- Obsidian
keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Open loc list of references to current buffer" })
keymap.set("n", "<leader>of", ":ObsidianFollowLink<CR>", { desc = "Follow the link under cursor" })
keymap.set("v", "<leader>ok", ":ObsidianLink<CR>", { desc = "Link the selected text" })
keymap.set("v", "<leader>ol", ":ObsidianLinkNew<CR>", { desc = "Link a new note of the selected text" })
keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "Open new note" })
keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { desc = "Searh Obsidian" })
keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Open today's note" })
keymap.set("n", "<leader>oy", ":ObsidianYesterday<CR>", { desc = "Open yesterday's note" })

-- jump to the next item, skipping the groups
keymap.set("n", "<leader>xn", function()
    require("trouble").next({ skip_groups = true, jump = true })
end, { desc = "Jump to next item" })
-- jump to the previous item, skipping the groups
keymap.set("n", "<leader>xp", function()
    require("trouble").previous({ skip_groups = true, jump = true })
end, { desc = "Jump to previous item" })

-- jump to the next item, skipping the groups
keymap.set("n", "[d", function()
    require("trouble").next({ skip_groups = true, jump = true })
end, { desc = "Trouble jump next" })
-- jump to the previous item, skipping the groups
keymap.set("n", "]d", function()
    require("trouble").previous({ skip_groups = true, jump = true })
end, { desc = "Trouble jump previous" })

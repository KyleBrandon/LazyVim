return {
    "christoomey/vim-tmux-navigator",
    cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight", "TmuxNavigatePrevious" },
    key = {
        { "c-h", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "c-j", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "c-k", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "c-l", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "c-\\", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        -- for Colemak
        { "c-m-Left", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "c-m-Down", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "c-m-Up", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "c-m-Right", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "c-m-\\", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
}

return {
    -- Copilot LSP (for Next Edit Suggestions)
    {
        "github/copilot.vim",
    },
    -- Sidekick (uses Copilot LSP for NES)
    {
        "folke/sidekick.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            nes = { enabled = true },
            cli = {
                mux = {
                    backend = "tmux",
                    enabled = true,
                },
            },
        },
        keys = {
            { "<leader>at", function() require("sidekick.nes").toggle() end,                      desc = "Toggle NES" },
            { "<leader>aa", function() require("sidekick.cli").toggle() end,                      desc = "Toggle AI CLI" },
            { "<leader>as", function() require("sidekick.cli").select() end,                      desc = "Select CLI" },
            { "<leader>ap", function() require("sidekick.cli").prompt() end,                      desc = "Prompt" },
            { "<leader>aj", function() require("sidekick.cli").focus() end,                       desc = "Toggle focus between code and Sidekick terminal" },
            { "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end,      desc = "Send File" },
            { "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, mode = "x",                                              desc = "Send Visual Selection" },
            { "<C-l>",      function() require("sidekick.cli").toggle() end,                      mode = { "n", "t", "i", "x" },                           desc = "Toggle Sidekick Terminal" },
        },
    },
}

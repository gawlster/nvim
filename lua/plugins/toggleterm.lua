return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        -- stuff in here
    },
    config = function()
        require("toggleterm").setup()

        -- Easy keybind for lazygit terminal
        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", dir =
            "git_dir", direction = "float", float_opts = { border =
                "double", },
            -- function to run on opening the terminal
            on_open = function(term) vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n",
                    "q", "<cmd>close<CR>", {noremap = true,
                        silent = true}) end,
            -- function to run on closing the terminal
            on_close = function(term) vim.cmd("startinsert!") end,
        })
        function _lazygit_toggle()
            lazygit:toggle()
        end
        vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, desc = "Toggle lazygit terminal"})

        -- Keybind for temporary floating terminal
        vim.keymap.set("n", "<leader>tt", function()
            Terminal:new({ direction = "float" }):toggle()
        end, { desc = "Temporary floating terminal" })

        -- Keybinds for persistent background terminals
        for i = 1, 5 do
            vim.keymap.set("n", "<leader>t" .. i, function()
                Terminal:new({ count = i }):toggle()
            end, { desc = "Toggle terminal " .. i })
        end

        -- Keymap to allow escape to enter normal mode in terminals
        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "*",
            callback = function()
                vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = true })
            end,
        })

        -- Keymap to hide all terminals
        vim.keymap.set("n", "<leader>th", function()
            require("toggleterm").toggle_all()
        end, { desc = "Hide all terminals" })
    end
}

vim.g.mapleader = " "

local keymap = vim.keymap 

--NvimTree
keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Toggle file explorer on current file" })

--Telescope
keymap.set('n', '<leader>ff', "<cmd> Telescope find_files <CR>", {})
keymap.set('n', 'gr', "<cmd>Telescope lsp_references<CR>", {})

--Terminal
keymap.set("n", "<C-t>", "<Cmd> ToggleTerm <CR>", {})
keymap.set("t", "<C-t>", "<Cmd> ToggleTerm <CR>", {})


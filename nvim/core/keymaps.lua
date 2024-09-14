-- Imports
local builtin = require("telescope.builtin")

-- Mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight
vim.keymap.set("n", "<ESC>", ":nohlsearch<CR>", {})

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>e", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>h", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>g", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>r", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>s", function()
	harpoon:list():select(4)
end)
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)

-- Reload config
vim.keymap.set("n", "<leader>rr", ":source ~/.config/nvim/init.lua<CR>", {})

-- Neotree
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", {})

-- Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>th", builtin.colorscheme, {})

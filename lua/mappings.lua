require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Outline keymap
map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

-- Live Preview keymaps
-- map("n", "<leader>lp", "<cmd>LivePreview start<cr>", { desc = "Live Preview Start" })
-- map("n", "<leader>lpp", "<cmd>LivePreview pick<cr>", { desc = "Live Preview Pick" })
-- map("n", "<leader>lpc", "<cmd>LivePreview close<cr>", { desc = "Live Preview Close" })

-- Peak keymap
-- map("n", "<leader>po", { desc = "PeakOpen" })
-- map("n", "<leader>pc", { desc = "PeakClose" })

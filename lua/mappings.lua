require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Outline keymap
map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Load session for current directory" })

-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select session to load" })

-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Load last session" })

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Cancel save for current session when exiting" })

-- Live Preview keymaps
-- map("n", "<leader>lp", "<cmd>LivePreview start<cr>", { desc = "Live Preview Start" })
-- map("n", "<leader>lpp", "<cmd>LivePreview pick<cr>", { desc = "Live Preview Pick" })
-- map("n", "<leader>lpc", "<cmd>LivePreview close<cr>", { desc = "Live Preview Close" })

-- Peak keymap
-- map("n", "<leader>po", { desc = "PeakOpen" })
-- map("n", "<leader>pc", { desc = "PeakClose" })

-- This file is for your own custom keymaps.
-- The "desc" key is used by which-key.nvim to show a description of the keymap.

local map = vim.keymap.set

-- [[ Editor Basics ]]

-- Escape from insert mode with jk or kj
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "kj", "<Esc>", { desc = "Exit insert mode" })

-- Save and Quit
map("n", "<leader>w", ":w<CR>", { desc = "[W]rite file" })
map("n", "<leader>q", ":q<CR>", { desc = "[Q]uit" })
-- Use CTRL-S for saving
map("n", "<C-s>", ":w<CR>", { desc = "Save file" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file" })

-- [[ Telescope ]]
-- Note: The require('telescope.builtin') is wrapped in a function,
-- so it is only called when you press the keymap.

-- telescope registers (yank delete paste registers)
map("n", "<leader>r", "<cmd>Telescope registers<cr>", { desc = "Show [R]egisters" })

-- Find files
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "[F]ind [F]iles" })

-- Find files in your Neovim config
map("n", "<leader>fc", function()
  require("telescope.builtin").find_files({
    search_dirs = { vim.fn.stdpath("config") },
    prompt_title = "Neovim Config Files",
  })
end, { desc = "[F]ind [C]onfig File" })

-- Grep for a string in the current project
map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "[F]ind by [G]rep" })

-- List open buffers
map("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "[F]ind [B]uffers" })

-- Search help tags
map("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, { desc = "[F]ind [H]elp Tags" })

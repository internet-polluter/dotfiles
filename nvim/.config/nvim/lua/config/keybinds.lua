local map = vim.keymap.set

-- Escape from insert mode with jk or kj
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode" })

-- Other useful keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })


map(
  "n",
  "<leader>fc",
  function()
    require("telescope.builtin").find_files({
      -- vim.fn.stdpath("config") gets the path to your nvim config directory
      search_dirs = { vim.fn.stdpath("config") },
      prompt_title = "Neovim Config Files",
    })
  end,
  { desc = "[F]ind [C]onfig File" }
)

-- ~/.config/nvim/lua/plugins/gitsigns.lua

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" }, -- Load when a buffer is read or a new file is created
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      follow_files = true,
    },
    auto_attach = true,
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    -- yadm_support = false, -- Enable if you use yadm

    -- You can override the default on_attach function here if needed
    -- on_attach = function(bufnr)
    --   print("Gitsigns attached to buffer: " .. bufnr)
    --   -- You can define buffer-local keymaps here if you prefer
    -- end,
  },
  -- Optional: Configure keymaps using lazy.nvim's `keys` table
  -- These keymaps will only be active when gitsigns is loaded.
  keys = {
    -- Hunk Navigation
    {
      "]c",
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      expr = true,
      mode = "n",
      desc = "Gitsigns: Next Hunk",
    },
    {
      "[c",
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      expr = true,
      mode = "n",
      desc = "Gitsigns: Previous Hunk",
    },
    -- Actions
    {
      "<leader>hs",
      function()
        require("gitsigns").stage_hunk()
      end,
      mode = { "n", "v" },
      desc = "Gitsigns: Stage Hunk",
    },
    {
      "<leader>hr",
      function()
        require("gitsigns").reset_hunk()
      end,
      mode = { "n", "v" },
      desc = "Gitsigns: Reset Hunk",
    },
    {
      "<leader>hS",
      "<cmd>Gitsigns stage_buffer<cr>",
      mode = "n",
      desc = "Gitsigns: Stage Buffer",
    },
    {
      "<leader>hu",
      "<cmd>Gitsigns undo_stage_hunk<cr>",
      mode = "n",
      desc = "Gitsigns: Undo Stage Hunk",
    },
    {
      "<leader>hR",
      "<cmd>Gitsigns reset_buffer<cr>",
      mode = "n",
      desc = "Gitsigns: Reset Buffer",
    },
    {
      "<leader>hp",
      "<cmd>Gitsigns preview_hunk<cr>",
      mode = "n",
      desc = "Gitsigns: Preview Hunk",
    },
    {
      "<leader>hb",
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      mode = "n",
      desc = "Gitsigns: Blame Line",
    },
    {
      "<leader>htb",
      "<cmd>Gitsigns toggle_current_line_blame<cr>",
      mode = "n",
      desc = "Gitsigns: Toggle Current Line Blame",
    },
    {
      "<leader>hd",
      "<cmd>Gitsigns diffthis<cr>",
      mode = "n",
      desc = "Gitsigns: Diff This",
    },
    {
      "<leader>hD",
      function()
        require("gitsigns").diffthis("~")
      end,
      mode = "n",
      desc = "Gitsigns: Diff This ~",
    },
    {
      "<leader>htd",
      "<cmd>Gitsigns toggle_deleted<cr>",
      mode = "n",
      desc = "Gitsigns: Toggle Deleted",
    },
    -- Text object
    {
      "ih",
      ":<C-U>Gitsigns select_hunk<CR>",
      mode = { "o", "x" },
      desc = "Gitsigns: Select Hunk (Text Object)",
    },
  },
}


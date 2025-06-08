-- lua/plugins/gitsigns.lua
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Load on file open
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "│" },
        untracked = { text = "┆" },
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
        delay = 500,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in bytes)
      preview_config = {
        -- Options passed to nvim_open_win
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },

      -- Keymaps
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          opts.noremap = true
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        -- Use default vim bindings for navigating hunks in diff mode
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to next git hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to previous git hunk" })

        -- Actions
        map(
          { "n", "v" },
          "<leader>hs",
          ":Gitsigns stage_hunk<CR>",
          { desc = "Stage git hunk" }
        )
        map(
          { "n", "v" },
          "<leader>hr",
          ":Gitsigns reset_hunk<CR>",
          { desc = "Reset git hunk" }
        )
        map(
          "n",
          "<leader>hS",
          gs.stage_buffer,
          { desc = "Stage entire buffer" }
        )
        map(
          "n",
          "<leader>hu",
          gs.undo_stage_hunk,
          { desc = "Undo last stage" }
        )
        map(
          "n",
          "<leader>hR",
          gs.reset_buffer,
          { desc = "Reset entire buffer" }
        )
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview git hunk" })
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, { desc = "Blame line (full)" })
        map(
          "n",
          "<leader>hB",
          gs.toggle_current_line_blame,
          { desc = "Toggle line blame" }
        )
        map(
          "n",
          "<leader>hd",
          gs.diffthis,
          { desc = "Diff against index" }
        )
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, { desc = "Diff against last commit" })

        -- Text object
        map(
          { "o", "x" },
          "ih",
          ":<C-U>Gitsigns select_hunk<CR>",
          { desc = "Select git hunk" }
        )
      end,
    })
  end,
}

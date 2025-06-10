return {
    "rachartier/tiny-glimmer.nvim",
    enabled = false,
    event = "VeryLazy",
    priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
    opts = {
      yank = {
	enabled = true,
	default_animation = "fade",
      },
      search = {
        enabled = false,
	default_animation = "pulse",
	next_mapping = "n",
	prev_mapping = "N",
      },
      paste = {
	enabled = true,
	default_animation = "reverse_fade",
	paste_mapping = "p",
	Paste_mapping = "P",
      },
      undo = {
	  enabled = true,
	  default_animation = {
	      name = "fade",
	      settings = {
		from_color = "DiffDelete",
		max_duration = 500,
		min_duration = 500,
	      },
	  },
	  undo_mapping = "u",
        },
        redo = {
            enabled = true,

            default_animation = {
                name = "fade",

                settings = {
                    from_color = "DiffAdd",
                    max_duration = 500,
                    min_duration = 500,
                },
            },
            redo_mapping = "<c-r>",
        },       -- your configuration
    },
}

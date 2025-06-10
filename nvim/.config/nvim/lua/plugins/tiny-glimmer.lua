return {    

"rachartier/tiny-glimmer.nvim",
    enabled = true,
    event = "VeryLazy",
    priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
    opts = {
overwrite = {
        -- Automatically map keys to overwrite operations
        -- If set to false, you will need to call the API functions to trigger the animations
        -- WARN: You should disable this if you have already mapped these keys
        --        or if you want to use the API functions to trigger the animations
        auto_map = true,

        -- For search and paste, you can easily modify the animation to suit your needs
        -- For example you can set a table to default_animation with custom parameters:
        -- default_animation = {
        --     name = "fade",
        --
        --     settings = {
        --         max_duration = 1000,
        --         min_duration = 1000,
        --
        --         from_color = "DiffDelete",
        --         to_color = "Normal",
        --     },
        -- },
        -- settings needs to respect the animation you choose settings
        --
        -- All "mapping" needs to have a correct lhs.
        -- It will try to automatically use what you already defined before.
        yank = {
              enabled = true,
              default_animation = "fade",
        },
        search = {
            enabled = false,
            default_animation = "pulse",

            -- Keys to navigate to the next match
            next_mapping = "n",

            -- Keys to navigate to the previous match
            prev_mapping = "N",
        },
        paste = {
            enabled = true,
            default_animation = "reverse_fade",

            -- Keys to paste
            paste_mapping = "p",

            -- Keys to paste above the cursor
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
        },
    },
    }
}

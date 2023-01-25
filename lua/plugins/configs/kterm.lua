local options = {
    terminals = {
        list = {},
        type_opts = {
            float = {
                relative = "editor",
                row = 0.3,
                col = 0.25,
                width = 0.5,
                height = 0.4,
                border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.4 },
            vertical = { location = "rightbelow", split_ratio = 0.5 },
        },
    },
    behavior = {
        close_on_exit = true,
        auto_insert = true,
    },
    enable_new_mappings = true,
}

require("kterm").setup(options)

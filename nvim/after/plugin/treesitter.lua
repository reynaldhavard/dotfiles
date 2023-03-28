require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    yati = {
        enable = true,


        -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
        default_lazy = true,

        -- Determine the fallback method used when we cannot calculate indent by tree-sitter
        --   "auto": fallback to vim auto indent
        --   "asis": use current indent as-is
        --   "cindent": see `:h cindent()`
        -- Or a custom function return the final indent result.
        default_fallback = "auto"
    },
    indent = {
        enable = false -- disable builtin indent module
    }
}


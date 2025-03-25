return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = { char = '│' },
    },
    scope = {
       enabled = true,
       show_start = false,
       show_end = false,
       injected_languages = false,
       highlight = { "Function", "Label" },
       priority = 500,
    },
  },
}

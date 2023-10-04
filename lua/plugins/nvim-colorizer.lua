return {
  "NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      user_default_options = {
        tailwind = true,
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,
        sass = { enable = true, parsers = { "css" } },
      },
    })
  end,
}

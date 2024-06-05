return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup()
    -- or setup with your own config
    --  -- require("gp").setup(config)
    --  -- you can set up shortcuts below
  end,
}

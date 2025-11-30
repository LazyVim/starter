return {
  -- Material Design 3 theme
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Puedes ajustar el estilo aquí (material, darker, lighter, oceanic, palenight, deep ocean)
      vim.g.material_style = "darker" -- estilo Material Design 3 más claro

      require("material").setup({
        lualine_style = "default",
        contrast = {
          terminal = false,
          sidebars = false,
          floating_windows = false,
          cursor_line = true,
          non_current_windows = false,
          filetypes = {},
        },
        styles = {
          comments = { italic = true },
          strings = {},
          keywords = { bold = true },
          functions = { bold = true },
          variables = {},
          operators = {},
          types = {},
        },
        -- Lista de integraciones opcionales de material.nvim.
        -- Solo dejamos las que realmente usamos para evitar advertencias.
        plugins = {
          "gitsigns",
          "nvim-cmp",
          "nvim-tree",
          "telescope",
          "nvim-web-devicons",
          "which-key",
          "nvim-notify",
          "indent-blankline",
        },
        disable = {
          borders = false,
          background = false, -- ← transparente si usas Kitty
          term_colors = false,
          eob_lines = false,
        },
      })

      -- ¡Aplicar el theme!
      vim.cmd.colorscheme("material")
    end,
  },

  -- 🔥 Si querés transparencia real en Kitty/HYPRLAND
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        extra_groups = { "NormalFloat", "NvimTreeNormal" },
      })
    end,
  },

  -- LazyVim declarando el theme final
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
  },
}

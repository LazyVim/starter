require("dap.ext.vscode").load_launchjs()
return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        documentation = {
          border = "rounded",
        },
        completion = {
          border = "rounded",
        },
      },
    },
  },
  -- {
  -- 	"nvimtools/none-ls.nvim",
  -- 	opts = {
  -- 		source = {
  -- 			builtins = {
  -- 				csharpier = {
  -- 					args = { "--write-stdout", "--no-cache", "$FILENAME" },
  -- 				},
  -- 			},
  -- 		},
  -- 	},
  -- },
  {
    "nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = {
      adapters = {
        godot = {
          type = "server",
          host = "127.0.0.1",
          port = 6006,
        },
      },
      configurations = {
        cs = {
          {
            type = "godot",
            request = "launch",
            name = "Launch Scene",
            project = "${workspaceFolder}",
            launch_scene = true,
          },
        },
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {
      expand_lines = true,
      icons = { expanded = "", collapsed = "", circular = "" },
      layouts = {
        {
          elements = {
            { id = "watches",     size = 0.24 },
            { id = "scopes",      size = 0.24 },
            { id = "breakpoints", size = 0.24 },
            { id = "stacks",      size = 0.28 },
          },
          size = 0.23,
          position = "right",
        },
        {
          elements = {
            { id = "repl",    size = 0.55 },
            { id = "console", size = 0.45 },
          },
          size = 0.27,
          position = "bottom",
        },
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5,
        border = "rounded",
      },
    },
  },
}

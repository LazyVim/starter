local dap = require("dap")
dap.adapters.c = {
  type = "executable",
  command = "gdb", -- Make sure GDB is accessible in your PATH or specify the full path
  args = { "--interpreter=mi" },
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "c",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

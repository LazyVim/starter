-- csearchpath.lua
local function script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match("(.*/)")
end

function CSearchPaths(args)
  args = args or {}
  args.cxx = args.cxx or os.getenv("CXX") or "/usr/bin/g++"
  args.cppflags = args.cppflags or os.getenv("CPPFLAGS") or ""
  args.paths = args.paths or {}

  local cmd = "bash -c 'export CXX=\""
    .. string.gsub(args.cxx, '"', '\\"')
    .. '";'
    .. 'export CPPFLAGS="'
    .. string.gsub(args.cppflags, '"', '\\"')
    .. '";'
    .. ". "
    .. script_path()
    .. "csearchpath.sh"
    .. ";"
    .. "csearchpaths'"

  local proc = io.popen(cmd)
  if proc == nil then
    return
  end

  local s = proc:read("*all")
  proc:close()

  if s == nil then
    return
  end

  -- Add Current working directory
  vim.opt.path = vim.fn.getcwd() .. "/**"

  -- Add user search paths
  for _, path in pairs(args.paths) do
    vim.opt.path = vim.opt.path + path
  end

  -- Add toolchain search path
  for path in string.gmatch(s, "[^\r\n]+") do
    if string.sub(path, 1, 1) ~= "#" then
      vim.opt.path = vim.opt.path + path
    end
  end

  -- Add system wide includes
  vim.opt.path = vim.opt.path + ".,/usr/include,,"
end

CSearchPaths()

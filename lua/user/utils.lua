local M = {}

function M.debug(...)
  print(...)
end

function M.dump(t)
  if type(t) == "table" then
    local str = "{ "
    for key, value in pairs(t) do
      if type(key) ~= "number" then
        key = '"' .. key .. '"'
      end
      str = str .. "[" .. key .. "] = " .. M.dump(value) .. ","
    end
    return str .. "} "
  else
    return tostring(t)
  end
end

function M.file_exists(path)
  local file = io.open(path, "r")
  if file ~= nil then
    io.close(file)
    return true
  else
    return false
  end
end

function M.script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match("(.*/)")
end

function M.get_keys(t)
  local keys = {}
  for key, _ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

function M.get_values(t, key)
  local values = {}
  for k, v in pairs(t) do
    if key == k then
      table.insert(values, v)
    end
  end
  return values
end

function M.contains(table, val)
  for i = 1, #table do
    if table[i] == val then
      return true
    end
  end
  return false
end

M.os = {}

function M.os.name()
  -- Unix, Linux variants
  local fh, err = assert(io.popen("uname -o 2>/dev/null", "r"))
  if err ~= nil and fh then
    return fh:read()
  end
  return "Windows"
end

function M.os.home()
  if M.os.name() == "Windows" then
    return os.getenv("UserProfile")
  elseif M.contains({ "Linux", "GNU/Linux", "Darwin" }, M.os.name()) then
    return os.getenv("HOME")
  else
    return "", false
  end
end

M.os.path = {}

function M.os.path.join(t)
  local sep = nil
  if M.os.name() == "Windows" then
    sep = "\\"
  else
    sep = "/"
  end
  return table.concat(t, sep)
end

return M

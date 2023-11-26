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

return M

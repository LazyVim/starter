local wezterm = require('wezterm')

local function is_found(str, pattern)
   return string.find(str, pattern) ~= nil
end

local function platform()
   local is_win = is_found(wezterm.target_triple, 'windows')
   local is_linux = is_found(wezterm.target_triple, 'linux')
   local is_mac = is_found(wezterm.target_triple, 'apple')
   local os = is_win and 'windows' or is_linux and 'linux' or is_mac and 'mac' or 'unknown'
   return {
      os = os,
      is_win = is_win,
      is_linux = is_linux,
      is_mac = is_mac,
   }
end

return platform

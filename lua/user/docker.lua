json = require("thirdparty.json.json")
utils = require("lua.user.utils")

local M = {}

function M.container(args)
  args = args or { cmd = "list" }

  function list()
    local proc = io.popen("docker ps -as  --no-trunc --format json", "r")
    if proc == nil then
      return false
    end

    lst = {}
    for line in proc:lines() do
      t = json.decode(line)
      lst[t.Image] = t
    end
    return true, lst
  end

  function start(cid)
    local suc, _, _ = os.execute("docker start " .. cid .. " > /dev/null 2>&1")
    return suc ~= nil and suc
  end

  function stop(cid)
    local suc, _, _ = os.execute("docker stop " .. cid .. " > /dev/null 2>&1")
    return suc ~= nil and suc
  end

  function restart(cid)
    stop(cid)
    return start(cid)
  end

  function attach(cid, callback)
    return start(cid) and callback(cid)
  end

  if args.cmd == "list" then
    return list()
  elseif args.cmd == "start" then
    return start(args.cid)
  elseif args.cmd == "stop" then
    return stop(args.cid)
  elseif args.cmd == "restart" then
    return restart(args.cid)
  elseif args.cmd == "attach" then
    return attach(args.cid, args.callback)
  else
    return list()
  end
end

return M

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require('config.go_keymaps')

function SaveHttpResp()
  -- 获取当前时间并格式化为时间戳
  local timestamp = os.date("%Y%m%d%H%M%S")

  -- 获取当前文件的目录路径
  local current_path = vim.fn.expand("%:p:h")

  -- 定位到 rest.nvim 的响应缓冲区
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[bufnr].filetype == "httpResult" then
      -- 设置保存文件的完整路径，包含时间戳
      local filename = current_path .. "/log/response_" .. timestamp .. ".txt"
      vim.api.nvim_buf_call(bufnr, function()
        vim.cmd("w " .. filename)
      end)
      print("Response saved to " .. filename)
      break
    end
  end
end

vim.api.nvim_set_keymap("n", "<leader>rr", "<cmd>Rest run<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>rs", ":lua SaveHttpResp()<CR>", { noremap = true, silent = true })

function GetLSPRootDir()
  local clients = vim.lsp.get_active_clients()
  for _, client in ipairs(clients) do
    if client.config.root_dir then
      return client.config.root_dir
    end
  end
  return nil -- 返回 nil 如果没有找到 gopls 或者 gopls 没有根目录
end

function GoToPathAndLine(input)
  if input == "" then
    return
  end
  local parts = vim.split(input, ":")
  local file = parts[1]
  local line = 1
  if #parts > 1 then
    line = parts[2]
  end
  -- 如果有工作路径，选第一个，否则选当前路径
  local pwd = vim.fn.getcwd()
  -- if vim.g.WorkspaceFolders and #vim.g.WorkspaceFolders > 0 then
  --     pwd = vim.g.WorkspaceFolders[1]
  -- end
  local goplsRootDir = GetLSPRootDir()
  if goplsRootDir then
    pwd = goplsRootDir
  end
  vim.cmd("edit +" .. line .. " " .. pwd .. "/" .. file)
end

vim.api.nvim_set_keymap(
  "n",
  "gto",
  ':lua GoToPathAndLine(vim.fn.input("Enter path and line: "))<CR>',
  { noremap = true }
)

function ExportExpandToClipboard()
  local pwd = vim.fn.getcwd()
  local goplsRootDir = GetLSPRootDir()
  if goplsRootDir then
    pwd = goplsRootDir
  end
  local rf = vim.fn.expand("%:p") .. ":" .. vim.fn.line(".")
  local expanded = string.sub(rf, string.len(pwd .. "/") + 1)
  vim.fn.setreg("+", expanded)
  print("Expanded path copied to clipboard: " .. expanded)
end

vim.api.nvim_set_keymap("n", "gcr", ":lua ExportExpandToClipboard()<CR>", { noremap = true })

local function check_spelling()
  -- 保存当前文件
  vim.cmd("write")

  -- 获取当前文件的路径
  local current_file = vim.fn.expand("%:p")
  print("Spell check in: " .. current_file)

  -- 构建CSpell命令
  local command = 'cspell --config /Users/onns/.onns/weiyun/code/config/vim/cspell.yaml -r "/Users/onns" '
      .. current_file

  -- 在新的终端窗口中执行CSpell
  vim.cmd("split | terminal " .. command)
end

-- 将Lua函数绑定到Neovim命令
vim.api.nvim_create_user_command("SpellCheck", check_spelling, {})

vim.api.nvim_set_keymap(
  "n",
  "<leader>pj",
  [[:.s/\v(\w+) \= (\d+).*;/\1 = \2 [(gogoproto.jsontag) = '\1', json_name = '\1'];<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>pf",
  [[:.s/\v(\w+) \= (\d+).*;/\1 = \2 [(gogoproto.moretags) = 'form:"\1"',(gogoproto.jsontag) = '\1', json_name = '\1'];<CR>]],
  { noremap = true, silent = true }
)

function InsertGitBranch()
  local cwd = vim.fn.getcwd()
  local git_branch_cmd = "git -C " .. cwd .. " branch --show-current"
  local handle = io.popen(git_branch_cmd)
  local git_branch = handle:read("*a")
  handle:close()
  git_branch = git_branch:gsub("%s+$", "")
  if git_branch ~= "" then
    -- vim.api.nvim_put({ git_branch }, "", false, true)
    local line_num = vim.api.nvim_win_get_cursor(0)[1]
    local todo_info = "TODO: onns " .. git_branch .. " "
    vim.api.nvim_buf_set_lines(0, line_num - 1, line_num - 1, false, { todo_info })
    require('mini.comment').toggle_lines(line_num, line_num)
    local buf = vim.api.nvim_get_current_buf() -- 获取当前缓冲区的句柄
    local lines = vim.api.nvim_buf_get_lines(buf, line_num - 1, line_num, false)
    if #lines > 0 then
      local line_length = #lines[1]
      vim.api.nvim_command("startinsert")
      vim.api.nvim_win_set_cursor(0, { line_num, line_length })
    end
  end
end

vim.api.nvim_set_keymap("n", "<leader>ig", ":lua InsertGitBranch()<CR>", { noremap = true })

local ts_utils = require("nvim-treesitter.ts_utils")

function JumpToFunctionName()
  -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('[f', true, true, true), 'm', true)
  local node = ts_utils.get_node_at_cursor()

  while node do
    -- print(node:type())
    if node:type() == "function_declaration" or node:type() == "method_declaration" then
      local child_count = node:child_count()
      for i = 0, child_count - 1 do
        local child = node:child(i)
        -- print("Child " .. i .. ": " .. child:type())
        if child then
          if node:type() == "function_declaration" and child:type() == "identifier" then
            local start_row, start_col, _, _ = child:range()
            vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
            return
          end
          if node:type() == "method_declaration" and child:type() == "field_identifier" then
            local start_row, start_col, _, _ = child:range()
            vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
            return
          end
        end
      end
    end
    node = node:parent()
  end
end

vim.api.nvim_set_keymap("n", "[n", "<cmd>lua JumpToFunctionName()<CR>", { noremap = true, silent = true })

function GetGoImportPath()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_path = vim.fn.fnamemodify(current_file, ":h")
  local go_mod_path = vim.fn.findfile("go.mod", current_path .. ";")
  if go_mod_path == "" then
    return
  end

  local go_mod_content = vim.fn.readfile(go_mod_path)
  local module_name = nil
  for _, line in ipairs(go_mod_content) do
    module_name = line:match("^module%s+(%S+)")
    if module_name then
      break
    end
  end
  if not module_name then
    return
  end

  local module_root = vim.fn.fnamemodify(go_mod_path, ":h")

  local package_path = string.sub(current_path, string.len(module_root .. "/") + 1)

  local import_package_name = module_name .. "/" .. package_path
  vim.fn.setreg("+", import_package_name)
  print("Import path copied to clipboard: " .. import_package_name)
end

vim.api.nvim_set_keymap("n", "gcp", ":lua GetGoImportPath()<CR>", { noremap = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>fm",
  ":lua require('bookmarks').toggle_bookmarks()<CR>",
  { noremap = true, silent = true }
)

local function get_child_index(node)
  local parent = node:parent()
  if not parent then
    return nil, 0
  end -- 如果没有父节点，则返回nil

  local child_count = parent:child_count()
  local index = 0
  -- 遍历父节点的所有子节点
  for child in parent:iter_children() do
    if child:id() == node:id() then
      return index, child_count -- 当找到匹配的子节点时，返回当前索引
    end
    index = index + 1
  end

  return nil, child_count -- 如果没有找到匹配的子节点，返回nil
end

-- TODO: onns main 待实现
function JumpToCall(direction)
  local node = ts_utils.get_node_at_cursor()
  local function search_upwards(current_node)
    if not current_node then
      return nil
    end
    print("Child " .. i .. ": " .. child:type())
    if current_node:type() == "call_expression" then
      return current_node
    else
      local node_index, _ = get_child_index(node)
      if node_index == 0 then
        return search_upwards(current_node:parent())
      else
        return search_upwards(current_node:parent():child(node_index - 1))
      end
    end
  end

  local function search_downwards(current_node, count)
    if count == 200 then
      return nil
    end
    if not current_node then
      return nil
    end
    if current_node:type() == "call_expression" then
      return current_node
    end
    for child in current_node:iter_children() do
      local found = search_downwards(child, count + 1)
      if found then
        return found
      end
    end

    while current_node do
      local parent = current_node:parent()
      local node_index, node_count = get_child_index(current_node)
      if node_count == 0 then
        return nil
      end
      if node_index < node_count - 1 then
        local child = parent:child(node_index + 1)
        local found = search_downwards(child, count + 1)
        if found then
          return found
        end
      end
      current_node = parent:parent()
    end
    return nil
  end

  local res_node = nil
  if direction == "up" then
    res_node = search_upwards(node:parent())
  elseif direction == "down" then
    res_node = search_downwards(node, 0)
  else
    error("Direction must be 'up' or 'down'.")
  end
  if res_node then
    print("Child count: ->" .. res_node:type())
    local start_row, start_col, _, _ = res_node:range()
    vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
  end
end

vim.api.nvim_set_keymap("n", "]od", '<cmd>lua JumpToCall("down")<CR>', { noremap = true, silent = true })

local function _set_cursor(node)
  -- TODO: check the validity of range
  local start_row, start_col, _, _ = node:range()
  vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
end

function JumpToNextFuncCall()
  local node = ts_utils.get_node_at_cursor()
  local ctr = 0 -- ugly prevention of endless loop

  while node do
    ctr = ctr + 1

    local sibling = node:next_sibling()
    print(sibling)
    -- if the current node does not have a leftmore sibling then we traverse its parent node
    if not sibling then
      node = node:parent()
      goto continue
    end

    node = sibling

    -- TODO: which kinds of nodes contain function_call? (for performance enhancement)
    -- currently, for all previous nodes we do a DFS traverse to find the first "function_call"
    local first_function_call_node = nil
    local stack = { node }

    while #stack > 0 do
      local current_node = table.remove(stack)

      if current_node:type() == "call_expression" then
        first_function_call_node = current_node
        break
      end

      local children = {}
      for child in current_node:iter_children() do
        table.insert(children, 1, child)
      end

      for _, child in ipairs(children) do
        table.insert(stack, child)
      end
    end

    if first_function_call_node then
      _set_cursor(first_function_call_node)
      return
    end

    if ctr > 1000 then
      print("endless loop...")
      break
    end

    ::continue::
  end
end

function JumpToLastFuncCall()
  local node = ts_utils.get_node_at_cursor()
  local ctr = 0 -- ugly prevention of endless loop

  while node do
    ctr = ctr + 1

    local sibling = node:prev_sibling()
    print(sibling)
    -- if the current node does not have a leftmore sibling then we traverse its parent node
    if not sibling then
      node = node:parent()
      goto continue
    end

    node = sibling

    -- TODO: which kinds of nodes contain function_call? (for performance enhancement)
    -- currently, for all previous nodes we do a DFS traverse to find the last "function_call"
    local last_function_call_node = nil
    local stack = { node }

    while #stack > 0 do
      local current_node = table.remove(stack)

      if current_node:type() == "call_expression" then
        last_function_call_node = current_node
      end

      local children = {}
      for child in current_node:iter_children() do
        table.insert(children, 1, child)
      end

      for _, child in ipairs(children) do
        table.insert(stack, child)
      end
    end

    if last_function_call_node then
      _set_cursor(last_function_call_node)
      return
    end

    if ctr > 1000 then
      print("endless loop...")
      break
    end

    ::continue::
  end
end

vim.api.nvim_set_keymap("n", "]oc", "<cmd>lua JumpToNextFuncCall()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[oc", "<cmd>lua JumpToLastFuncCall()<CR>", { noremap = true, silent = true })

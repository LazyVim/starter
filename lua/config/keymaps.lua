-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function SaveHttpResp()
    -- 获取当前时间并格式化为时间戳
    local timestamp = os.date("%Y%m%d%H%M%S")

    -- 获取当前文件的目录路径
    local current_path = vim.fn.expand('%:p:h')

    -- 定位到 rest.nvim 的响应缓冲区
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[bufnr].filetype == 'httpResult' then
            -- 设置保存文件的完整路径，包含时间戳
            local filename = current_path .. "/log/response_" .. timestamp .. ".txt"
            vim.api.nvim_buf_call(bufnr, function()
                vim.cmd('w ' .. filename)
            end)
            print("Response saved to " .. filename)
            break
        end
    end
end

vim.api.nvim_set_keymap('n', '<leader>rr',
    ":lua require('rest-nvim').run()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>rs',
    ":lua SaveHttpResp()<CR>",
    { noremap = true, silent = true })


function GetGoplsRootDir()
    local clients = vim.lsp.get_active_clients()
    for _, client in ipairs(clients) do
        if client.name == "gopls" and client.config.root_dir then
            return client.config.root_dir
        end
    end
    return nil -- 返回 nil 如果没有找到 gopls 或者 gopls 没有根目录
end

function GoToPathAndLine(input)
    if input == '' then
        return
    end
    local parts = vim.split(input, ':')
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
    local goplsRootDir = GetGoplsRootDir()
    if goplsRootDir then
        pwd = goplsRootDir
    end
    vim.cmd('edit +' .. line .. ' ' .. pwd .. '/' .. file)
end

vim.api.nvim_set_keymap('n', 'gto', ':lua GoToPathAndLine(vim.fn.input("Enter path and line: "))<CR>', { noremap = true })

function ExportExpandToClipboard()
    local pwd = vim.fn.getcwd()
    local goplsRootDir = GetGoplsRootDir()
    if goplsRootDir then
        pwd = goplsRootDir
    end
    local rf = vim.fn.expand('%:p') .. ':' .. vim.fn.line('.')
    local expanded = string.sub(rf, string.len(pwd .. '/') + 1)
    vim.fn.setreg('+', expanded)
    print('Expanded path copied to clipboard: ' .. expanded)
end

vim.api.nvim_set_keymap('n', 'gcr', ':lua ExportExpandToClipboard()<CR>', { noremap = true })


local function check_spelling()
    -- 保存当前文件
    vim.cmd('write')

    -- 获取当前文件的路径
    local current_file = vim.fn.expand('%:p')
    print('Spell check in: ' .. current_file)

    -- 构建CSpell命令
    local command = 'cspell --config /Users/onns/.onns/weiyun/code/config/vim/cspell.yaml -r "/Users/onns" ' ..
        current_file

    -- 在新的终端窗口中执行CSpell
    vim.cmd('split | terminal ' .. command)
end

-- 将Lua函数绑定到Neovim命令
vim.api.nvim_create_user_command('SpellCheck', check_spelling, {})

vim.api.nvim_set_keymap('n', '<leader>pj',
    [[:.s/\v(\w+) \= (\d+).*;/\1 = \2 [(gogoproto.jsontag) = '\1', json_name = '\1'];<CR>]],
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pf',
    [[:.s/\v(\w+) \= (\d+).*;/\1 = \2 [(gogoproto.moretags) = 'form:"\1"',(gogoproto.jsontag) = '\1', json_name = '\1'];<CR>]],
    { noremap = true, silent = true })

function TodoTelescopeWithCWD()
    local pwd = vim.fn.getcwd()
    local goplsRootDir = GetGoplsRootDir()
    if goplsRootDir then
        pwd = goplsRootDir
    end
    print('TodoTelescope at : ' .. pwd)
    vim.cmd("TodoTelescope cwd=" .. pwd)
end

vim.api.nvim_set_keymap('n', '<leader>fw', ':lua TodoTelescopeWithCWD()<CR>', { noremap = true })

-- 待定列表
local targets = { "cmd", "CHANGELOG.md", "go.mod", ".git" }

-- 检查文件或目录是否存在
local function file_exists(path)
    local ok, err, code = os.rename(path, path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

-- 从当前路径向上查找目标文件或目录
local function find_upwards()
    -- 获取当前文件的路径
    local path = vim.fn.expand('%:p:h')

    while path and path ~= '' do
        -- 检查目标文件或目录是否在当前路径
        for _, target in pairs(targets) do
            local fullpath = path .. '/' .. target
            if file_exists(fullpath) then
                return path
            end
        end

        -- 移动到上一级目录
        path = vim.fn.fnamemodify(path, ':h')
    end
    return nil
end

function TodoTelescopeWithProject()
    local pwd = vim.fn.getcwd()
    local projectDir = find_upwards()
    if projectDir then
        pwd = projectDir
    end
    print('TodoTelescope at : ' .. pwd)
    vim.cmd("TodoTelescope cwd=" .. pwd)
end

vim.api.nvim_set_keymap('n', '<leader>fp', ':lua TodoTelescopeWithProject()<CR>', { noremap = true })


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
        local todo_info = "// TODO: onns " .. git_branch .. " "
        vim.api.nvim_buf_set_lines(0, line_num - 1, line_num - 1, false, { todo_info })
        vim.api.nvim_command('startinsert')
        vim.api.nvim_win_set_cursor(0, { line_num, #todo_info })
    end
end

vim.api.nvim_set_keymap('n', '<leader>ig', ':lua InsertGitBranch()<CR>', { noremap = true })


local ts_utils = require 'nvim-treesitter.ts_utils'

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

vim.api.nvim_set_keymap('n', '[n', '<cmd>lua JumpToFunctionName()<CR>', { noremap = true, silent = true })

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

    local package_path = string.sub(current_path, string.len(module_root .. '/') + 1)

    local import_package_name = module_name .. "/" .. package_path
    vim.fn.setreg('+', import_package_name)
    print("Import path copied to clipboard: " .. import_package_name)
end

vim.api.nvim_set_keymap('n', 'gcp', ':lua GetGoImportPath()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>fm',
    ":lua require('bookmarks').toggle_bookmarks()<CR>",
    { noremap = true, silent = true })

function LiveGrepUp(n)
    -- 获取当前工作目录
    local cwd = vim.fn.getcwd()
    -- 用系统的路径分隔符分割路径
    local path_sep = package.config:sub(1, 1)
    local components = {}

    -- 分割路径到各个组件
    for component in string.gmatch(cwd, "[^" .. path_sep .. "]+") do
        table.insert(components, component)
    end

    -- 计算向上n级的路径
    local up_n = #components - n
    if up_n < 1 then up_n = 1 end -- 确保不会超出根目录
    local new_cwd = path_sep
    for i = 1, up_n do
        new_cwd = new_cwd .. components[i] .. (i < up_n and path_sep or "")
    end

    -- 使用新的目录执行Telescope live_grep
    require('telescope.builtin').live_grep({ cwd = new_cwd })
end

vim.api.nvim_create_user_command(
    'Lg',
    function(opts)
        local n = tonumber(opts.args) or 0
        LiveGrepUp(n)
    end,
    { nargs = 1 } -- 命令接受一个参数
)

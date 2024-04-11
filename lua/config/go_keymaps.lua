function LiveGrepWithExtension(extension)
    require('telescope.builtin').live_grep({
        additional_args = function(opts)
            return { "--glob", "*." .. extension }
        end
    })
end

vim.api.nvim_create_user_command(
    "LgExtension",
    function(opts)
        LiveGrepWithExtension(opts.args)
    end,
    { nargs = 1 }
)


function LiveGrepUp(n)
    local bufnr = vim.api.nvim_get_current_buf()
    local full_path = vim.api.nvim_buf_get_name(bufnr)
    local file_path = vim.fs.dirname(full_path)
    -- 用系统的路径分隔符分割路径
    local path_sep = package.config:sub(1, 1)
    local components = {}

    -- 分割路径到各个组件
    for component in string.gmatch(file_path, "[^" .. path_sep .. "]+") do
        table.insert(components, component)
    end

    -- 计算向上n级的路径
    local up_n = #components - n
    if up_n < 1 then
        up_n = 1
    end -- 确保不会超出根目录
    local new_cwd = path_sep
    for i = 1, up_n do
        new_cwd = new_cwd .. components[i] .. (i < up_n and path_sep or "")
    end

    print("search under:" .. new_cwd)
    -- 使用新的目录执行Telescope live_grep
    require("telescope.builtin").live_grep({ cwd = new_cwd })
end

vim.api.nvim_create_user_command(
    "LgUp",
    function(opts)
        local n = tonumber(opts.args) or 0
        LiveGrepUp(n)
    end,
    { nargs = 1 } -- 命令接受一个参数
)

function TodoTelescopeWithCWD()
    local pwd = vim.fn.getcwd()
    local goplsRootDir = GetGoplsRootDir()
    if goplsRootDir then
        pwd = goplsRootDir
    end
    print("TodoTelescope at : " .. pwd)
    vim.cmd("TodoTelescope cwd=" .. pwd)
end

vim.api.nvim_set_keymap("n", "<leader>fw", ":lua TodoTelescopeWithCWD()<CR>", { noremap = true })


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
    local path = vim.fn.expand("%:p:h")

    while path and path ~= "" do
        -- 检查目标文件或目录是否在当前路径
        for _, target in pairs(targets) do
            local fullpath = path .. "/" .. target
            if file_exists(fullpath) then
                return path
            end
        end

        -- 移动到上一级目录
        path = vim.fn.fnamemodify(path, ":h")
    end
    return nil
end

function TodoTelescopeWithProject()
    local pwd = vim.fn.getcwd()
    local projectDir = find_upwards()
    if projectDir then
        pwd = projectDir
    end
    print("TodoTelescope at : " .. pwd)
    vim.cmd("TodoTelescope cwd=" .. pwd)
end

vim.api.nvim_set_keymap("n", "<leader>fp", ":lua TodoTelescopeWithProject()<CR>", { noremap = true })

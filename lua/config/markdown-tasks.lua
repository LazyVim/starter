-- Markdown task management
-- Keymaps are registered only in markdown buffers via FileType autocmd.
--
-- File structure expected:
--   # TODO Lists
--   ## General Section  📜 1/2 📜
--   - [ ] undated task
--   - [x] done task
--   ## DD-MM-YYYY  ⏳ 0/2 ⏳      (date sections sorted newest first)
--   - [ ] task
--   - [ ] another task
--
-- Section stat icons (auto-updated on toggle and InsertLeave):
--   ✅  all tasks done (any section)
--   🚨  today, 0 done, ≥2 total
--   ⏳  today (default)
--   📅  future date
--   ❌  past date
--   📜  general (non-date heading)
--
-- Features:
--   Toggle cascades to children; unchecking a child unchecks parent,
--   checking last sibling checks parent. Spacing is auto-normalized
--   (blank lines around headings, none between sibling tasks).
--   Tasks can be moved between date sections and a general section.

local M = {}

-- ── Core task operations ─────────────────────────────────────────────────────

local function new_task()
  local line = vim.api.nvim_get_current_line()
  if line:match("^%s*$") then
    vim.api.nvim_set_current_line("- [ ] ")
    vim.cmd("startinsert!")
  else
    vim.cmd("normal! o- [ ] ")
    vim.cmd("startinsert!")
  end
end

local function toggle_task()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = lines[row]
  if not line:find("%[[ x]%]") then return end

  -- Toggle current line
  local new_state
  if line:find("%[ %]") then
    lines[row] = line:gsub("%[ %]", "[x]", 1)
    new_state = "[x]"
  else
    lines[row] = line:gsub("%[x%]", "[ ]", 1)
    new_state = "[ ]"
  end

  local cur_indent = #(line:match("^(%s*)") or "")

  -- Cascade down: set all deeper-indented children to same state
  for i = row + 1, #lines do
    local l = lines[i]
    if not l:match("^%s*%-") then break end
    local indent = #(l:match("^(%s*)") or "")
    if indent <= cur_indent then break end
    if new_state == "[x]" then
      lines[i] = l:gsub("%[ %]", "[x]", 1)
    else
      lines[i] = l:gsub("%[x%]", "[ ]", 1)
    end
  end

  -- Cascade up: find parent (less indent, is a task)
  local parent_row
  for i = row - 1, 1, -1 do
    local l = lines[i]
    if not l:match("^%s*%-") then break end
    local indent = #(l:match("^(%s*)") or "")
    if indent < cur_indent and l:find("%[[ x]%]") then
      parent_row = i
      break
    end
  end

  if parent_row then
    if new_state == "[ ]" and lines[parent_row]:find("%[x%]") then
      -- Unchecking child: uncheck parent
      lines[parent_row] = lines[parent_row]:gsub("%[x%]", "[ ]", 1)
    elseif new_state == "[x]" then
      -- Checking child: check parent if all siblings are now done
      local parent_indent = #(lines[parent_row]:match("^(%s*)") or "")
      local all_done = true
      for i = parent_row + 1, #lines do
        local l = lines[i]
        if not l:match("^%s*%-") then break end
        local indent = #(l:match("^(%s*)") or "")
        if indent <= parent_indent then break end
        if indent == cur_indent and l:find("%[ %]") then
          all_done = false
          break
        end
      end
      if all_done then
        lines[parent_row] = lines[parent_row]:gsub("%[ %]", "[x]", 1)
      end
    end
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.api.nvim_win_set_cursor(0, { row, vim.api.nvim_win_get_cursor(0)[2] })
  local update = require("config.markdown-tasks")._update_stats
  if update then update() end
end

local function toggle_task_format()
  local line = vim.api.nvim_get_current_line()
  if line:find("^%s*%- %[.%] ") then
    -- "- [ ] text" → "- text"
    vim.api.nvim_set_current_line((line:gsub("^(%s*)%- %[.%] ", "%1- ", 1)))
  elseif line:find("^%s*%- ") then
    -- "- text" → "- [ ] text"
    vim.api.nvim_set_current_line((line:gsub("^(%s*)%- ", "%1- [ ] ", 1)))
  end
end

local function jump_next_task() vim.fn.search("- \\[ \\]", "W") end
local function jump_prev_task() vim.fn.search("- \\[ \\]", "bW") end

local function list_tasks_in_file()
  require("snacks").picker.grep({ search = "- \\[ \\]", buffers = true })
end

local function search_all_tasks()
  require("snacks").picker.grep({ search = "- \\[ \\]" })
end

-- ── Section task stats ────────────────────────────────────────────────────────

-- Parses a "DD-MM-YYYY" string into a Unix timestamp for comparison.
local function date_to_time(s)
  local d, m, y = s:match("(%d+)-(%d+)-(%d+)")
  if not d then return 0 end
  return os.time({ year = tonumber(y), month = tonumber(m), day = tonumber(d) })
end

-- Strips the stats suffix from a heading line, returning the bare heading.
local function strip_stats(line)
  return (line
    :gsub("%s+✅ ?%d+/%d+ ?✅%s*$", "")
    :gsub("%s+❌ ?%d+/%d+ ?❌%s*$", "")
    :gsub("%s+📜 ?%d+/%d+ ?📜%s*$", "")
    :gsub("%s+⏳ ?%d+/%d+ ?⏳%s*$", "")
    :gsub("%s+📅 ?%d+/%d+ ?📅%s*$", "")
    :gsub("%s+🚨 ?%d+/%d+ ?🚨%s*$", ""))
end

-- Counts [x] and [ ] tasks in a section starting at header_line (1-indexed).
local function count_section_tasks(lines, header_line)
  local done, todo = 0, 0
  for i = header_line + 1, #lines do
    if lines[i]:match("^## ") then break end
    if lines[i]:match("^%s*%- %[x%]") then
      done = done + 1
    elseif lines[i]:match("^%s*%- %[ %]") then
      todo = todo + 1
    end
  end
  return done, todo
end

local function classify_section(base)
  local date_str = base:match("^## (%d%d%-%d%d%-%d%d%d%d)$")
  if not date_str then return "general" end
  local section_time = date_to_time(date_str)
  local today_start = date_to_time(os.date("%d-%m-%Y"))
  if section_time == today_start then return "today" end
  return section_time > today_start and "future" or "past"
end

local section_icons = {
  general = "📜", today = "⏳", future = "📅", past = "❌",
}

-- Updates every ## heading with a live task count suffix.
local function update_section_stats()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local changed = false
  for i, line in ipairs(lines) do
    if line:match("^## ") then
      local base = strip_stats(line)
      local done, todo = count_section_tasks(lines, i)
      local total = done + todo
      local kind = classify_section(base)
      local icon
      if total > 0 and done == total then
        icon = "✅"
      elseif kind == "today" and done == 0 and total >= 2 then
        icon = "🚨"
      else
        icon = section_icons[kind]
      end
      local new_line = base .. "  " .. icon .. " " .. done .. "/" .. total .. " " .. icon
      if new_line ~= line then
        lines[i] = new_line
        changed = true
      end
    end
  end
  if changed then
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.api.nvim_win_set_cursor(0, cursor)
  end
end

-- Expose so toggle_task can call it without a forward-ref issue.
M._update_stats = update_section_stats

-- ── Spacing normalizer ───────────────────────────────────────────────────────

-- Enforces: one blank line before and after every heading line, no consecutive
-- blank lines, no blank lines between sibling task lines.
local function normalize_spacing()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Strip all blank lines first so we can re-insert them deterministically.
  local stripped = {}
  for _, l in ipairs(lines) do
    if not l:match("^%s*$") then table.insert(stripped, l) end
  end

  local result = {}

  local function ensure_blank()
    if #result > 0 and not result[#result]:match("^%s*$") then
      table.insert(result, "")
    end
  end

  for i, l in ipairs(stripped) do
    local is_heading = l:match("^#")
    if is_heading and #result > 0 then ensure_blank() end
    table.insert(result, l)
    if is_heading and i < #stripped then ensure_blank() end
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, result)
  update_section_stats()
end

-- ── Date helpers ─────────────────────────────────────────────────────────────

-- Returns date string "DD-MM-YYYY" with an optional day offset.
local function date_string(offset_days)
  local t = os.time() + (offset_days or 0) * 86400
  return os.date("%d-%m-%Y", t)
end

-- Returns 1-indexed line number of the "## DD-MM-YYYY" header, or nil.
local function find_date_section(date_str)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  for i, line in ipairs(lines) do
    if strip_stats(line) == "## " .. date_str then return i end
  end
end

-- Returns the 1-indexed line of the last non-empty content line within a
-- section (from header_line until the next ## header or EOF).
local function section_end(header_line)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local last = header_line
  for i = header_line + 1, #lines do
    if lines[i]:match("^## ") then return i - 1 end
    if not lines[i]:match("^%s*$") then last = i end
  end
  return last
end

-- Inserts a new "## date_str" line in descending date order (newest first).
-- Blank lines are left to normalize_spacing.
local function insert_date_section(date_str)
  local new_time = date_to_time(date_str)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  -- Find the first existing date header that is strictly older → insert before it.
  for i, line in ipairs(lines) do
    local existing = strip_stats(line):match("^## (%d%d%-%d%d%-%d%d%d%d)$")
    if existing and date_to_time(existing) < new_time then
      vim.api.nvim_buf_set_lines(0, i - 1, i - 1, false, { "## " .. date_str })
      return
    end
  end
  -- All existing dates are newer (or there are none) → append at end.
  vim.api.nvim_buf_set_lines(0, #lines, #lines, false, { "## " .. date_str })
end

-- ── Insert today's date header ────────────────────────────────────────────────

local function insert_date()
  local header = "## " .. date_string(0)
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_get_current_line()
  if line:match("^%s*$") then
    vim.api.nvim_set_current_line(header)
  else
    vim.api.nvim_buf_set_lines(0, row, row, false, { header })
    vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
  end
  normalize_spacing()
end


-- ── Move task helpers ─────────────────────────────────────────────────────────

-- Removes the task at row (1-indexed), then deletes the owning date header if
-- it is now empty. Returns the task text.
local function remove_task(row)
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]

  -- Find the ## header that owns this task before deleting it.
  local all = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local src_hdr = nil
  for i = row, 1, -1 do
    if all[i] and all[i]:match("^##") then
      src_hdr = i; break
    end
  end

  vim.api.nvim_buf_set_lines(0, row - 1, row, false, {})

  -- If the source was a date section that is now empty, remove its header.
  if src_hdr then
    local updated = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local hdr = updated[src_hdr]
    if hdr and strip_stats(hdr):match("^## %d%d%-%d%d%-%d%d%d%d$") then
      local empty = true
      for i = src_hdr + 1, #updated do
        if updated[i]:match("^## ") then break end
        if not updated[i]:match("^%s*$") then
          empty = false; break
        end
      end
      if empty then
        vim.api.nvim_buf_set_lines(0, src_hdr - 1, src_hdr, false, {})
      end
    end
  end

  return line
end

-- ── Move task to a date section ───────────────────────────────────────────────

local function move_task_to(date_str)
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_get_current_line()

  if not line:match("^%s*%- %[") then
    vim.notify("Not on a task line", vim.log.levels.WARN)
    return
  end

  remove_task(row)

  local target = find_date_section(date_str)
  if not target then
    insert_date_section(date_str)
    target = find_date_section(date_str)
  end

  local insert_at = section_end(target)
  vim.api.nvim_buf_set_lines(0, insert_at, insert_at, false, { line })

  normalize_spacing()
end

local function move_to_general()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_get_current_line()

  if not line:match("^%s*%- %[") then
    vim.notify("Not on a task line", vim.log.levels.WARN)
    return
  end

  remove_task(row)

  -- The general section is the first ## heading that isn't a date heading.
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local general = nil
  for i, l in ipairs(lines) do
    local base = strip_stats(l)
    if base:match("^## ") and not base:match("^## %d%d%-%d%d%-%d%d%d%d$") then
      general = i; break
    end
  end

  if not general then
    vim.notify("No general section found", vim.log.levels.WARN)
    return
  end

  local insert_at = section_end(general)
  vim.api.nvim_buf_set_lines(0, insert_at, insert_at, false, { line })

  normalize_spacing()
end

local function move_to_today() move_task_to(date_string(0)) end
local function move_to_tomorrow() move_task_to(date_string(1)) end
local function move_to_yesterday() move_task_to(date_string(-1)) end

-- Parses flexible date input into "DD-MM-YYYY". Accepts separators - / or none.
-- If the year is omitted (DDMM or DD-MM or DD/MM), assumes the current year.
local function parse_date_input(input)
  if not input or input == "" then return nil end
  input = input:match("^%s*(.-)%s*$") -- trim

  local current_year = tonumber(os.date("%Y"))
  local d, m, y

  -- With separator: DD-MM-YYYY or DD/MM/YYYY (year optional)
  d, m, y = input:match("^(%d%d?)[%-%/](%d%d?)[%-%/](%d%d%d%d)$")
  if d then
    return string.format("%02d-%02d-%04d", tonumber(d), tonumber(m), tonumber(y))
  end

  d, m = input:match("^(%d%d?)[%-%/](%d%d?)$")
  if d then
    return string.format("%02d-%02d-%04d", tonumber(d), tonumber(m), current_year)
  end

  -- No separator: DDMMYYYY or DDMM
  d, m, y = input:match("^(%d%d)(%d%d)(%d%d%d%d)$")
  if d then
    return string.format("%02d-%02d-%04d", tonumber(d), tonumber(m), tonumber(y))
  end

  d, m = input:match("^(%d%d)(%d%d)$")
  if d then
    return string.format("%02d-%02d-%04d", tonumber(d), tonumber(m), current_year)
  end

  return nil
end

local function move_to_date()
  vim.ui.input({ prompt = "Date (DD-MM-YYYY): " }, function(input)
    local parsed = parse_date_input(input)
    if parsed then
      move_task_to(parsed)
    elseif input and input ~= "" then
      vim.notify("Unrecognised date: " .. input, vim.log.levels.WARN)
    end
  end)
end

-- ── Setup ────────────────────────────────────────────────────────────────────

function M.setup()
  local group = vim.api.nvim_create_augroup("MarkdownTasks", { clear = true })

  local function setup_buf(buf)
    local o = function(desc) return { buffer = buf, desc = desc } end
    vim.keymap.set("n", "<leader>mn", new_task, o("New task"))
    vim.keymap.set("n", "<leader>mx", toggle_task, o("Toggle done"))
    vim.keymap.set("n", "<leader>mf", toggle_task_format, o("Toggle task format"))
    vim.keymap.set("n", "<leader>mj", jump_next_task, o("Next task"))
    vim.keymap.set("n", "<leader>mk", jump_prev_task, o("Prev task"))
    vim.keymap.set("n", "<leader>ml", list_tasks_in_file, o("List tasks (file)"))
    vim.keymap.set("n", "<leader>ms", search_all_tasks, o("Search all tasks"))
    vim.keymap.set("n", "<leader>mt", insert_date, o("Insert date header"))
    vim.keymap.set("n", "<leader>mmg", move_to_general, o("Move → general"))
    vim.keymap.set("n", "<leader>mmt", move_to_today, o("Move → today"))
    vim.keymap.set("n", "<leader>mmT", move_to_tomorrow, o("Move → tomorrow"))
    vim.keymap.set("n", "<leader>mmy", move_to_yesterday, o("Move → yesterday"))
    vim.keymap.set("n", "<leader>mmd", move_to_date, o("Move → date…"))
    -- Update stats after leaving insert mode (covers new_task completions).
    vim.api.nvim_create_autocmd("InsertLeave", {
      buffer = buf,
      group = group,
      callback = update_section_stats,
    })
  end

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    group = group,
    callback = function(ev) setup_buf(ev.buf) end,
  })

  -- VeryLazy fires after the initial buffer's FileType event, so apply
  -- keymaps to any markdown buffers that are already open.
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == "markdown" then
      setup_buf(buf)
    end
  end
end

return M

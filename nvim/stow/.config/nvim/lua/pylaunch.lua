local M = {}

-- State keyed by absolute filepath
local STATE = {}

local function create_buffer(filepath)
	local buf = vim.api.nvim_create_buf(false, true)

	local name = "pylaunch://" .. filepath
	vim.api.nvim_buf_set_name(buf, name)

	vim.bo[buf].bufhidden = "hide"
	vim.bo[buf].filetype = "python"
	vim.bo[buf].modifiable = false

	return buf
end

local function open_window(buf)
	local percent_of_win = 0.4
	local curr_win_height = vim.api.nvim_win_get_height(0)          -- Current window height
	local term_height = math.floor(curr_win_height * percent_of_win) -- Terminal height

	vim.cmd("belowright" .. term_height .. "split")
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(win, buf)
	return win
end

local function append_lines(buf, win, data)
	if not data then return end
	if #data == 1 and data[1] == "" then return end

	if not (buf and vim.api.nvim_buf_is_valid(buf)) or not (win and vim.api.nvim_win_is_valid(win)) then
		return
	end

	vim.bo[buf].modifiable = true
	vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
	vim.bo[buf].modifiable = false

	-- auto-scroll
	if win and vim.api.nvim_win_is_valid(win) then
		vim.api.nvim_win_set_cursor(win, {
			vim.api.nvim_buf_line_count(buf),
			0,
		})
	end
end

function M.list_state()
	print(vim.print(STATE))
end

function M.stop_current_file()
	local filepath = vim.api.nvim_buf_get_name(0)
	if filepath == "" then
		vim.notify("Buffer has no file", vim.log.levels.WARN)
		return
	end

	local res = filepath:match("^pylaunch://(.*)")
	if res then
		filepath = res
	else
		filepath = vim.fn.fnamemodify(filepath, ":p")
	end

	if STATE[filepath] then
		local entry = STATE[filepath]

		if entry.job then
			vim.fn.jobstop(entry.job)
		end
		if entry.win and vim.api.nvim_win_is_valid(entry.win) then
			vim.api.nvim_win_close(entry.win, true)
		end
		if entry.buf and vim.api.nvim_buf_is_valid(entry.buf) then
			vim.api.nvim_buf_delete(entry.buf, { force = true })
		end

		entry.buf = nil
		entry.job = nil
		entry.win = nil
		STATE[filepath] = nil
	end
end

function M.show_screen()
	local filepath = vim.api.nvim_buf_get_name(0)
	if filepath == "" then
		vim.notify("Buffer has no file", vim.log.levels.WARN)
		return
	end

	filepath = vim.fn.fnamemodify(filepath, ":p")

	if not STATE[filepath] then
		vim.notify("No pylaunch associated with this file", vim.log.levels.WARN)
		return
	end

	local entry = STATE[filepath]

	if not (entry.win and vim.api.nvim_win_is_valid(entry.win)) then
		entry.win = open_window(entry.buf)
	else
		vim.api.nvim_set_current_win(entry.win)
	end
end

function M.run_current_file(opts)
	local filepath = vim.api.nvim_buf_get_name(0)
	if filepath == "" then
		vim.notify("Buffer has no file", vim.log.levels.WARN)
		return
	end

	filepath = vim.fn.fnamemodify(filepath, ":p")

	-- Initialize state entry
	if not STATE[filepath] then
		STATE[filepath] = {}
	end

	local entry = STATE[filepath]

	-- Create buffer if needed
	if not (entry.buf and vim.api.nvim_buf_is_valid(entry.buf)) then
		entry.buf = create_buffer(filepath)
	end

	if opts["hidden"] ~= true then
		-- Ensure visible window
		if not (entry.win and vim.api.nvim_win_is_valid(entry.win)) then
			entry.win = open_window(entry.buf)
		else
			vim.api.nvim_set_current_win(entry.win)
		end
	end

	-- Stop previous job if running
	if entry.job then
		vim.fn.jobstop(entry.job)
		entry.job = nil
	end

	-- Clear buffer
	vim.bo[entry.buf].modifiable = true
	vim.api.nvim_buf_set_lines(entry.buf, 0, -1, false, {})
	vim.bo[entry.buf].modifiable = false

	-- Start Python job
	entry.job = vim.fn.jobstart(
		{ "python", filepath },
		{
			stdout_buffered = false,
			stderr_buffered = false,

			on_stdout = function(_, data)
				vim.schedule(function()
					append_lines(entry.buf, entry.win, data)
				end)
			end,

			on_stderr = function(_, data)
				vim.schedule(function()
					append_lines(entry.buf, entry.win, data)
				end)
			end,

			on_exit = function(_, code)
				vim.schedule(function()
					append_lines(entry.buf, entry.win, {
						"",
						"[Process exited with code " .. code .. "]",
					})
				end)
			end,
		}
	)
end

function M.setup()
	vim.api.nvim_create_user_command("PyLaunchStart", M.run_current_file, {})
	vim.api.nvim_create_user_command("PyLaunchShow", M.show_screen, {})
	vim.api.nvim_create_user_command("PyLaunchStop", M.stop_current_file, {})
end

return M

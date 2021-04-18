local M = {}

-- http://lua-users.org/wiki/FileInputOutput
-- see if the file exists
function M.file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
function M.lines_from(file)
  if not M.file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

-- Read file and output as string
function M.read_file(file)

	local lines = M.lines_from(file)
	local contents = ""

	for _,v in pairs(lines) do
		contents = contents .. v .. "\n"
	end

	return contents
end

return M

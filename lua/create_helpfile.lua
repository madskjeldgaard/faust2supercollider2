local fileutils = require"lua/file-utils"
local dspjson = require"lua/dsp-json"
local json = require"lua/lib/json/json"
local schelp = require"lua/schelp"

local M = {}

function M.create_help_file(json_file, debug)
	if json_file ~= nil then
		local file = json_file

		if fileutils.file_exists(file) then
			-- Decode json to a parsed lua table
			local metadata = json.decode(fileutils.read_file(file))
			local parsed = dspjson.parse_dsp_json(metadata)

			-- Helpfile contents
			local helpClass = schelp.class_help(parsed)

			-- Debug
			if debug then
				dspjson.print_dsp_json(parsed)
			end

			-- Create helpfile
			local helpfileName = string.format("%s.schelp", parsed.name)
			local helpfile = io.open(helpfileName, "w")
			print(string.format("Creating SuperCollider helpfile %s", helpfileName))

			helpfile:write(helpClass)
			helpfile:close()
		else
			print(string.format("File %s does not exist", file))
		end
	else
		print("Pass in a .dsp file as first argument...")
	end
end

return M

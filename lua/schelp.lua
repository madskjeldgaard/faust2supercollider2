local M = {}

function M.argument_list(parsed_metadata) 
	local params = parsed_metadata.params
	local argList = ""

	for paramName,paramContents in pairs(params) do
		argList = argList .. "ARGUMENT::" .. paramContents.label .. "\n"
		argList = argList .. paramContents.min .. " to " .. paramContents.max .. ".\n\n"
	end

	return argList
end

function M.class_help(parsed_metadata)
local args = M.argument_list(parsed_metadata)
local ins = parsed_metadata.numInputs
local outs = parsed_metadata.numOutputs

local name = parsed_metadata.name 
local author = parsed_metadata.author
local help = string.format([[CLASS:: %s
SUMMARY:: A faust plugin
RELATED::TODO
CATEGORIES::TODO

DESCRIPTION::

A Faust plugin written by %s.

This plugin has %d inputs and %d outputs.

CLASSMETHODS::

METHOD::ar
%s

EXAMPLES::

code::
// TODO
::
]], name, author, ins, outs, args
)

return help
end

return M

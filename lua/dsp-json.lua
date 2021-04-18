local M = {}

-- Takes decoded json from a .dsp file as a table, organizes it in a new, slightly easier to use table
function M.parse_dsp_json(metadata)

	local D = {}
	D.name = metadata.name;
	D.filename = metadata.filename;
	D.version = metadata.version;
	D.numInputs = metadata.inputs;
	D.numOutputs = metadata.outputs;

	-- Unpack metadata
	for _,v in ipairs(metadata.meta) do
		-- print(k, v)
		for metaname, metacontents in pairs(v) do
			D[metaname] = metacontents
		end
	end

	-- Unpack UI
	local Params = {}
	for _,v in ipairs(metadata.ui) do
		for _, itemContents in pairs(v.items) do
			Params[itemContents.label] = {}
			for itemContentName, itemContentContents in pairs(itemContents) do
				Params[itemContents.label][itemContentName] = itemContentContents
			end
		end
	end

	D.params = Params

	return D
end

function M.print_dsp_json(parsed)
	for k,v in pairs(parsed) do
		if k == "params" then
			for _,param in pairs(v) do
				print("Param: ")
				for paramLabel, paramContents in pairs(param) do
					print("\t" .. paramLabel .. ": " .. paramContents)
				end
			end
		else
			print(k,v)
		end

	end
end

return M

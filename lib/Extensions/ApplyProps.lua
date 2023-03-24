local Types = require(script.Parent.Parent.Types)

return function(props: Types.Props, PropNames: {string})
	return function(Object: Instance)
		for _, PropName: string in PropNames do
			local Ok: boolean = pcall(function()
				Object[PropName] = props[PropName]
			end)
			-- Object[PropName] = props[PropName]
		end
	end
end
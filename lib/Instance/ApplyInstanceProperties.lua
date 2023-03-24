local Types = require(script.Parent.Parent.Types)
local Children = require(script.Parent.Children)
local Extensions = require(script.Parent.Parent.Extensions)

local Special = {
	[Children] = function(Object: Instance, ChildrenTable: any)
		Children.__set(ChildrenTable,Object)
	end;
	[Extensions] = function(Object: Instance, ExtensionsTable: any)
		Extensions.__set(ExtensionsTable,Object)
	end;
}

return function(Object: Instance, props: Types.Props)
	for Property: string, Value: any in props do
		if not (type(Property) == "string") then
			if (Special[Property]) then
				Special[Property](Object, Value)
			end

			continue
		end

		Object[Property] = Value
	end
end
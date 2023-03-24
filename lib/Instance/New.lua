local ApplyInstanceProperties = require(script.Parent.ApplyInstanceProperties)
local DefaultProps = require(script.Parent.Parent.Other.DefaultProps)
local Types = require(script.Parent.Parent.Types)

return function(ClassName: string): Types.Dependency
	return function(props: Types.Props): Instance
		local Ok: boolean, Object: Instance = pcall(Instance.new, ClassName)

		if not (Ok) then
			error(`Could not create an Instance with the ClassName {ClassName}!`)
		end

		ApplyInstanceProperties(Object,DefaultProps[ClassName] or {})
		ApplyInstanceProperties(Object,props)

		return Object
	end
end
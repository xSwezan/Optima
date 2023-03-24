local Types = require(script.Parent.Parent.Types)
local Util = require(script.Parent.Parent.Util)

return function(StateObject: Types.CanBeState<any>)
	return if (Util:IsState(StateObject)) then StateObject.__value else StateObject
end
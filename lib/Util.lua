local Types = require(script.Parent.Types)

local Util = {}

function Util:IsState(State: Types.StateObject<any>?): boolean
	return (type(State) == "table") and (State.__isState == true)
end

return Util
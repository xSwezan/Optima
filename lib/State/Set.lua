local Util = require(script.Parent.Parent.Util)
local Types = require(script.Parent.Parent.Types)
local PrivTypes = require(script.Parent.Parent.PrivTypes)

return function(StateObject: Types.StateObject<any>, NewState: any)
	assert(Util:IsState(StateObject),"Expected a StateObject as first parameter in Set function!")
	
	StateObject = (StateObject :: PrivTypes.StateObject)

	local OldState: any = StateObject.__value
	StateObject.__value = NewState
	StateObject.__changed:Fire(OldState,NewState)
end
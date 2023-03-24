local Util = require(script.Parent.Parent.Util)
local Get = require(script.Parent.Parent.State.Get)
local Symbol = require(script.Parent.Parent.Symbol)

return Symbol("Children",{
	__set = function(KeyValue: any, Parent: Instance)
		local function ProcessChild(Child: any, Name: string?)
			local Type: string = typeof(Child)

			if (Type == "Instance") then
				Child.Parent = Parent
			elseif (Type == "table") then
				for _, TableChild: any in Child do
					ProcessChild(TableChild,Name)
				end
			elseif (Util:IsState(Child)) then
				ProcessChild(Get(Child),Name)
			end
		end

		ProcessChild(KeyValue)
	end;
})
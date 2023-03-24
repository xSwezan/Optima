local Util = require(script.Parent.Util)
local Get = require(script.Parent.State.Get)
local Symbol = require(script.Parent.Symbol)

return Symbol("Extensions",{
	ApplyProps = require(script.ApplyProps);

	__set = function(KeyValue: any, Parent: Instance)
		local function ProcessExtension(Extension: any, Name: string?)
			local Type: string = typeof(Extension)

			if (Type == "function") then
				Extension(Parent)
			elseif (Type == "table") then
				for _, TableChild: any in Extension do
					ProcessExtension(TableChild,Name)
				end
			elseif (Util:IsState(Extension)) then
				ProcessExtension(Get(Extension),Name)
			end
		end

		ProcessExtension(KeyValue)
	end;
})
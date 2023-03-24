local Optima = require()

-- Variables

type ComponentInstance = {}

type PropsTable = {[string]: any}

type Value = (DefaultValue: any) -> {}

local e = Optima.New

local OnEvent: (Event: string) -> string = Optima.OnEvent
local OnChange: (Property: string) -> string = Optima.OnChange

local Bind: (Property: string) -> string = Optima.Bind -- Binds property to Value
local Map = Optima.Map

local Children: string = Optima.Children

local Value: Value = Optima.Value
local Set = Optima.Set -- Set Value
local Get = Optima.Get -- Return Value / Passed argument

-- local x = Value(false)
-- Set(x,true)
-- Get(x) -- true
-- Get(false) -- false

local Extensions = Optima.Extensions
local Component: (Constructor: (props: PropsTable, children: {ComponentInstance}) -> ComponentInstance) -> (props: PropsTable) -> ComponentInstance = Optima.Component

-- Component

return Component(function(props, children)
	local AbsoluteSize = Value(Vector2.new())
	local Clicks = Value(0)

	return e("TextButton"){
		Size = UDim2.fromScale(.5,.5); -- Default

		Position = UDim2.fromScale(.5,.5); -- Default
		AnchorPoint = Vector2.new(.5,.5); -- Default

		Text = Map(function()
			return `Clicks: {Get(Clicks)}`
		end);

		[Bind("AbsoluteSize")] = AbsoluteSize;

		[OnEvent("Activated")] = function()
			Set(Clicks,(Get(Clicks) + 1))
		end;

		[Children] = {
			e("UIAspectRatioConstraint"){};
			children;
		};

		[Extensions] = {
			Extensions.ApplyProps(props,{"Size","Position","AnchorPoint"}); -- Applies props automatically
		};
	}
end)
local Types = require(script.Types)

local Optima: Types.Optima = {
	-- Instance
	New = require(script.Instance.New);

	-- Value
	Value = require(script.State.Value);
	Get = require(script.State.Get);
	Set = require(script.State.Set);

	-- Keys
	Children = require(script.Instance.Children);
	Extensions = require(script.Extensions);
}

return Optima
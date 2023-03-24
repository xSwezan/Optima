return function(DefaultValue: any)
	local ValueObject = {}

	return setmetatable({
		__value = DefaultValue;
	},ValueObject)
end
return function(Name: string, Table: table?)
	assert(type(Name) == "string", "Name of symbol expected string!")

	local self = newproxy(true)

	local Metatable = getmetatable(self)

	Metatable.__tostring = function()
		return Name
	end

	if (type(Table) == "table") then
		Metatable.__index = function(self, Key: any)
			return Table[Key]
		end
	end

	return self
end
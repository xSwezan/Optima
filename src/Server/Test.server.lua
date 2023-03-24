local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Optima = require(ReplicatedStorage.lib)

local New = Optima.New

local Extensions = Optima.Extensions
local Children = Optima.Children

print(Extensions)

New("Part"){
	Name = "Cube";

	Size = Vector3.new(3,3,3);

	Parent = workspace;

	[Children] = {
		New("Decal"){
			Texture = "rbxassetid://29867246";

			Face = Enum.NormalId.Front;

			[Children] = {
				New("UIAspectRatioConstraint"){};
			};
		};
	};

	[Extensions] = {
		Extensions.ApplyProps({Name = "Block"},{"Name"});
	};
}